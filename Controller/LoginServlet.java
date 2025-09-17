package Controller;

import java.io.IOException;
import DAO.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Get username and password from request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        try {
            // 2️⃣ Validate user in DB
            boolean isValid = userDAO.validateUser(username, password);

            if (isValid) {
                // 3️⃣ Get role from DB
                String role = userDAO.getUserRole(username);

                // 4️⃣ Save session attributes
                session.setAttribute("patient_name", username);   // important: this "name" will be used in appointment history
                session.setAttribute("role", role);

                // 5️⃣ Redirect based on role
                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect("doctor.jsp");
                } else if ("user".equalsIgnoreCase(role)) {
                    response.sendRedirect("patient.jsp");
                } else {
                    session.setAttribute("loginError", "Unknown role!");
                    response.sendRedirect("login.jsp");
                }
            } else {
                // Invalid credentials
                session.setAttribute("loginError", "Invalid username or password!");
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("loginError", "Something went wrong. Try again!");
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to login page if accessed directly
        response.sendRedirect("login.jsp");
    }
}
