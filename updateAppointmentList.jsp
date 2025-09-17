<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DAO.AppointmentDAO"%>
<%@ page import="POJO.Appointment"%>
<%@ page import="POJO.Doctor"%>
<%@ page import="POJO.Patient"%>
<%@ page import="DAO.DoctorDAO"%>
<%@ page import="DAO.PatientDAO"%>
<%
int id = Integer.parseInt(request.getParameter("appointment_id"));
AppointmentDAO dao = new AppointmentDAO();
Appointment appo = dao.getAppointmentById(id);
int doctorId = appo.getDoctor().getDr_id();
int patientId = appo.getPatient().getPatient_id();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Appointment</title>
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
    max-width: 700px;
    margin: 30px auto;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

/* Header */
h2 {
    text-align: center;
    color: #4a148c;
    margin-bottom: 20px;
}

/* Form Styles */
form {
    display: flex;
    flex-direction: column;
}
form label {
    margin: 10px 0 5px;
    font-weight: bold;
}
form input[type="text"], form input[type="date"], form input[type="time"] {
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    width: 100%;
}

/* Buttons */
button, input[type="submit"], input[type="button"] {
    padding: 12px 20px;
    border: none;
    border-radius: 5px;
    background: #4a148c;
    color: white;
    font-size: 16px;
    cursor: pointer;
    margin-top: 15px;
}
button:hover, input[type="submit"]:hover, input[type="button"]:hover {
    background: #6a1b9a;
}

/* Button container */
.btn-container {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
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
        <li><a href="appointment.jsp">Appointments</a></li>
        <li><a href="contact.jsp">Contact</a></li>
    </ul>
</div>

<!-- Main Container -->
<div class="container">
    <h2>Update Appointment</h2>

    <form action="AppointmentServlet" method="post">
        <input type="hidden" name="appointment_id" value="<%=appo.getAppointment_id()%>">
        <input type="hidden" name="doctor_id" value="<%=doctorId%>">
        <input type="hidden" name="patient_id" value="<%=patientId%>">

        <label for="date">Date:</label>
        <input type="date" name="date" id="date" value="<%=appo.getAppointment_date().toLocalDate()%>" required>

        <label for="time">Time:</label>
        <input type="time" name="time" id="time" value="<%=appo.getAppointment_date().toLocalTime()%>" required>

        <label for="reason">Reason:</label>
        <input type="text" name="reason" id="reason" value="<%=appo.getReason()%>" required>

        <div class="btn-container">
            <input type="submit" name="action" value="Update">
            <input type="button" value="Back to List" onclick="window.location.href='appointmentList.jsp'">
        </div>
    </form>
</div>

<!-- Footer -->
<div class="footer">
    &copy; 2025 Clinic Manager | Designed by <strong>Prathamesh Raut</strong>
</div>

</body>
</html>
