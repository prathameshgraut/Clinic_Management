<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="POJO.Doctor"%>
<%@ page import="DAO.DoctorDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Management</title>
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
        margin: 0;
        font-size: 22px;
        color:white;
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

    /* Container */
    .container {
        flex: 1;
        padding: 30px;
        max-width: 600px;
        margin: 30px auto;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        color: #4a148c;
        margin-bottom: 20px;
    }

    form input[type="text"], form input[type="email"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    form input[type="submit"], form input[type="button"] {
        background: #4a148c;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        margin: 5px 0;
    }

    form input[type="submit"]:hover, form input[type="button"]:hover {
        background: #6a1b9a;
    }

    .message {
        text-align: center;
        color: green;
        font-weight: bold;
        margin-top: 10px;
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
        <li><a href="doctor.jsp">Add Doctor</a></li>
        <li><a href="patient.jsp">Patients</a></li>
        <li><a href="contact.jsp">Contact</a></li>
    </ul>
</div>

<!-- Container -->
<div class="container">
    <h2>Add New Doctor</h2>
    <form action="DoctorServlet" method="post">
        Name: <input type="text" name="dr_name" required><br>
        Education: <input type="text" name="education" required><br>
        Phone: <input type="text" name="phone" required><br>
        Email: <input type="email" name="email" required><br>
        
        <input type="submit" value="Add Doctor">
        <input type="button" value="Show Doctor List" onclick="window.location.href='doctorList.jsp'">
        <input type="button" value="Show Appointment" onclick="window.location.href='appointmentList.jsp'"><br>
        <input type="button" value="Back" onclick="window.location.href='login.jsp'">
    </form>

    <%
        String message = (String) session.getAttribute("saveDoctor");
        if (message != null) {
    %>
        <p class="message"><%=message%></p>
    <%
        session.removeAttribute("saveDoctor");
        }
    %>
</div>

<!-- Footer -->
<div class="footer">
    &copy; 2025 Clinic Manager | Designed by <strong>Prathamesh Raut</strong>
</div>

</body>
</html>
