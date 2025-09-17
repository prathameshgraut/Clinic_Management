package Controller;

import java.io.IOException;

import DAO.DoctorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import POJO.Doctor;


@WebServlet("/DoctorServlet") 
public class DoctorServlet extends HttpServlet {
    // DAO object to handle DB operations
    private DoctorDAO doctorDAO = new DoctorDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	//Deleted Data in Doctor filed
        String action = request.getParameter("action");
        DoctorDAO doctorDAO = new DoctorDAO();
        if ("Delete".equals(action)) {
            int drId = Integer.parseInt(request.getParameter("dr_id"));
            doctorDAO.deleteDoctor(drId);
            request.getSession().setAttribute("deleteMessage", "Doctor deleted successfully!");
            response.sendRedirect("doctorList.jsp");
            return;
        }

        
        //updated data in doctor field
        if ("Update".equals(action)) {
            int drId = Integer.parseInt(request.getParameter("dr_id"));
            Doctor doctor = new Doctor();
            doctor.setDr_id(drId);
            doctor.setDr_name(request.getParameter("dr_name"));
            doctor.setEducation(request.getParameter("education"));
            doctor.setPhone(request.getParameter("phone"));
            doctor.setEmail(request.getParameter("email"));
            doctorDAO.updateDoctor(doctor);
            request.getSession().setAttribute("updateMessage", "Doctor updated successfully!");
            response.sendRedirect("doctorList.jsp");
            return;
        }

        // Add data 
        String name = request.getParameter("dr_name");
        String education = request.getParameter("education");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        Doctor doctor = new Doctor();
        doctor.setDr_name(name);
        doctor.setEducation(education);
        doctor.setPhone(phone);
        doctor.setEmail(email);
        doctorDAO.saveDoctor(doctor);

        request.getSession().setAttribute("saveDoctor", "Doctor added successfully!");
        response.sendRedirect("doctor.jsp");
    }


    // Optional: Handle GET request to display form directly
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("doctor.jsp");
    }
}
