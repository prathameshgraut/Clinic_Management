package Controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import DAO.AppointmentDAO;
import DAO.DoctorDAO;
import DAO.PatientDAO;
import POJO.Appointment;
import POJO.Doctor;
import POJO.Patient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {

    private AppointmentDAO appointmentDAO = new AppointmentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
        	if ("Delete".equals(action)) {
        	    int appoId = Integer.parseInt(request.getParameter("appointment_id"));
        	    appointmentDAO.deleteAppointment(appoId);
        	    request.getSession().setAttribute("message", "Appointment deleted successfully!");
        	    response.sendRedirect("appointmentList.jsp");
        	}


        	else if ("Update".equals(action)) {
                int appoId = Integer.parseInt(request.getParameter("appointment_id"));
                Appointment appointment = appointmentDAO.getAppointmentById(appoId);

                if (appointment != null) {
                    String date = request.getParameter("date");
                    String time = request.getParameter("time");
                    String reason = request.getParameter("reason");

                    LocalDateTime appointmentDate = LocalDateTime.parse(date + " T " + time, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
                    appointment.setAppointment_date(appointmentDate);
                    appointment.setReason(reason);

                    int doctorId = Integer.parseInt(request.getParameter("doctor_id"));
                    int patientId = Integer.parseInt(request.getParameter("patient_id"));
                    appointment.setDoctor(new DoctorDAO().getDoctorById(doctorId));
                    appointment.setPatient(new PatientDAO().getPatientById(patientId));

                    appointmentDAO.updateAppointment(appointment);

                    request.getSession().setAttribute("message", "Appointment updated successfully!");
                    response.sendRedirect("appointmentList.jsp");
                    return;
                }
        	}else if ("Book".equals(action)) {
                // New appointment booking
                int patientId = Integer.parseInt(request.getParameter("patientId"));
                int doctorId = Integer.parseInt(request.getParameter("doctorId"));
                String date = request.getParameter("date");
                String time = request.getParameter("time");
                String reason = request.getParameter("reason");

                LocalDateTime appointmentDate = LocalDateTime.parse(date + "T" + time, DateTimeFormatter.ISO_LOCAL_DATE_TIME);

                Patient patient = new PatientDAO().getPatientById(patientId);
                Doctor doctor = new DoctorDAO().getDoctorById(doctorId);

                Appointment appointment = new Appointment();
                appointment.setPatient(patient);
                appointment.setDoctor(doctor);
                appointment.setAppointment_date(appointmentDate);
                appointment.setReason(reason);

                appointmentDAO.saveAppointment(appointment);
                request.getSession().setAttribute("message", "Appointment booked successfully!");
                response.sendRedirect("appointment.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error occurred!");
            response.sendRedirect("appointmentList.jsp");
        }
    }
}
