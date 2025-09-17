package Controller;

import java.io.IOException;
import DAO.PatientDAO;
import POJO.Patient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PatientServlet")
public class PatientServlet extends HttpServlet {

    private PatientDAO patientDAO = new PatientDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        HttpSession session = request.getSession();

        String name = request.getParameter("patient_name");
        String ageStr = request.getParameter("age");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        int age = Integer.parseInt(ageStr);

        // Create Patient object
        Patient patient = new Patient();
        patient.setPatient_name(name);
        patient.setAge(age);
        patient.setGender(gender);
        patient.setPhone(phone);
        patient.setEmail(email);

        // Save to DB
        patientDAO.savePatient(patient);

        // Confirmation message
        session.setAttribute("message", "Patient added successfully!");
        response.sendRedirect("appointment.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("patient.jsp");
    }
}
