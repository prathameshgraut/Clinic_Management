package Controller;

import java.io.IOException;
import DAO.UserDAO;
import POJO.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        User user = new User();
        user.setName(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setRole(role);

        userDAO.saveUser(user);

        HttpSession session = request.getSession();
        session.setAttribute("registerMessage", "Registration successful! Please login.");
        response.sendRedirect("login.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }
}
