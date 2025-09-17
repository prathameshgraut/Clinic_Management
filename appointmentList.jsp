<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="POJO.Appointment"%>
<%@ page import="DAO.AppointmentDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Appointments</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: url("Img/BGimg.png") no-repeat center center fixed;
        background-size: cover;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    /* Navbar */
    .navbar {
        background: #1A2C31;
        padding: 15px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: white;
    }

    .navbar h2 {
        color:white;
        margin: 0;
        font-size: 22px;
    }

    .navbar ul {
        list-style: none;
        margin: 0;
        padding: 0;
        display: flex;
    }

    .navbar ul li {
        margin-left: 20px;
    }

    .navbar ul li a {
        text-decoration: none;
        color: white;
        font-size: 16px;
    }

    .navbar ul li a:hover {
        color: #ff9800;
    }

    /* Main Content */
    .container {
        flex: 1;
        padding: 30px;
        max-width: 1000px;
        margin: auto;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #4a148c;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    table th, table td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: center;
    }

    table th {
        background: #4a148c;
        color: white;
    }

    table tr:nth-child(even) {
        background: #f2f2f2;
    }

    .actions form {
        display: inline-block;
    }

    .actions input[type="submit"] {
        background: #4a148c;
        color: white;
        border: none;
        padding: 8px 14px;
        border-radius: 5px;
        cursor: pointer;
        margin: 2px;
    }

    .actions input[type="submit"]:hover {
        background: #6a1b9a;
    }

    .back-btn {
        display: block;
        width: 200px;
        margin: 10px auto;
        padding: 12px;
        background: #1A2C31;
        color: white;
        text-align: center;
        text-decoration: none;
        border-radius: 6px;
        font-size: 16px;
    }

    .back-btn:hover {
        background: #333;
    }

    .message {
        text-align: center;
        color: green;
        font-weight: bold;
        margin-bottom: 10px;
    }

    /* Footer */ 
    .footer {
        background: #1A2C31;
        color: white;
        text-align: center;
        padding: 15px;
        font-size: 14px;
        margin-top: auto;
    }
</style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <h2>CLINIC MANAGER</h2>
    <ul>
        <li><a href="dashboard.jsp">Dashboard</a></li>
        <li><a href="appointment.jsp">Book Appointment</a></li>
        <li><a href="patient.jsp">Patients</a></li>
        <li><a href="contact.jsp">Contact</a></li>
    </ul>
</div>

<!-- Main Content -->
<div class="container">
    <h2>Appointment List</h2>

    <!-- Messages -->
    <%
        String deleteMsg = (String) session.getAttribute("deleteMessage");
        String updateMsg = (String) session.getAttribute("updateMessage");
        if (deleteMsg != null) {
    %>
        <p class="message"><%= deleteMsg %></p>
    <%
        session.removeAttribute("deleteMessage");
        }
        if (updateMsg != null) {
    %>
        <p class="message"><%= updateMsg %></p>
    <%
        session.removeAttribute("updateMessage");
        }
    %>

    <!-- Appointment Table -->
    <table>
        <tr>
            <th>ID</th>
            <th>Date & Time</th>
            <th>Reason</th>
            <th>Doctor</th>
            <th>Patient</th>
            <th>Actions</th>
        </tr>

        <%
            AppointmentDAO dao = new AppointmentDAO();
            List<Appointment> appointments = dao.getAllAppointments();

            if (appointments != null && !appointments.isEmpty()) {
                for (Appointment appo : appointments) {
        %>
        <tr>
            <td><%= appo.getAppointment_id() %></td>
            <td><%= appo.getAppointment_date() %></td>
            <td><%= appo.getReason() %></td>
            <td><%= (appo.getDoctor() != null) ? appo.getDoctor().getDr_name() : "N/A" %></td>
            <td><%= (appo.getPatient() != null) ? appo.getPatient().getPatient_name() : "N/A" %></td>
            <td class="actions">
                <form action="updateAppointmentList.jsp" method="post">
                    <input type="hidden" name="appointment_id" value="<%=appo.getAppointment_id()%>">
                    <input type="submit" value="Edit">
                </form>
                <form action="AppointmentServlet" method="post">
                    <input type="hidden" name="appointment_id" value="<%=appo.getAppointment_id()%>">
                    <input type="hidden" name="action" value="Delete">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6" style="text-align:center;">No Appointments Found</td>
        </tr>
        <%
            }
        %>
    </table>

    <!-- Back Button -->
    <a href="appointment.jsp" class="back-btn">Back to Appointment</a>
</div>

<!-- Footer -->
<div class="footer">
    &copy; 2025 Clinic Manager | Designed by <strong>Prathamesh Raut</strong>
</div>

</body>
</html>
