<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="POJO.Patient"%>
<%@ page import="POJO.Doctor"%>
<%@ page import="DAO.PatientDAO"%>
<%@ page import="DAO.DoctorDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Appointment</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: url("Img/BGimg.png") no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
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

    /* Main content */
    .container {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }

    .form-box {
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        width: 450px;
    }

    .form-box h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #4a148c;
    }

    .form-box select,
    .form-box input[type="date"],
    .form-box input[type="time"],
    .form-box input[type="text"] {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
    }

    .form-box input[type="submit"],
    .form-box input[type="button"] {
        padding: 12px 20px;
        margin: 10px 5px 0 0;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
    }

    .form-box input[type="submit"] {
        background: #4a148c;
        color: white;
        width: 100%;
    }

    .form-box input[type="submit"]:hover {
        background: #6a1b9a;
    }

    .form-box .secondary-btn {
        background: #ccc;
        color: #333;
        width: 48%;
    }

    .form-box .secondary-btn:hover {
        background: #bbb;
    }

    .message {
        text-align: center;
        color: green;
        margin-top: 10px;
        font-weight: bold;
    }

    /* Footer */
    .footer {
        background: #1A2C31;
        color: white;
        text-align: center;
        padding: 15px;
        font-size: 14px;
    }
</style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <h2>CLINIC MANAGER</h2>
    <ul>
        <li><a href="dashboard.jsp">Dashboard</a></li>
        <li><a href="patient.jsp">Add Patient</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="contact.jsp">Contact</a></li>
    </ul>
</div>

<!-- Main Content -->
<div class="container">
    <div class="form-box">
        <h2>Book an Appointment</h2>
        <form action="AppointmentServlet" method="post">
            <input type="hidden" name="action" value="Book">

            <!-- Patient Dropdown -->
            <select name="patientId" required>
                <option value="">Select Patient</option>
                <%
                    PatientDAO patientDAO = new PatientDAO();
                    List<Patient> patientList = patientDAO.getAllPatients();
                    for (Patient p : patientList) {
                %>
                <option value="<%=p.getPatient_id()%>"><%=p.getPatient_name()%> - <%=p.getPhone()%></option>
                <%
                    }
                %>
            </select>

            <!-- Doctor Dropdown -->
            <select name="doctorId" required>
                <option value="">Select Doctor</option>
                <%
                    DoctorDAO doctorDAO = new DoctorDAO();
                    List<Doctor> doctorList = doctorDAO.getAllDoctors();
                    for (Doctor d : doctorList) {
                %>
                <option value="<%=d.getDr_id()%>"><%=d.getDr_name()%> - <%=d.getEducation()%></option>
                <%
                    }
                %>
            </select>

            <!-- Appointment Details -->
            <input type="date" name="date" required>
            <input type="time" name="time" required>
            <input type="text" name="reason" placeholder="Reason (Optional)">

            <input type="submit" value="Book Appointment">

            <div style="display:flex; justify-content:space-between;">
                <input type="button" class="secondary-btn" value="Appointment History" onclick="window.location.href='appointmentList.jsp'">
                <input type="button" class="secondary-btn" value="Back" onclick="window.location.href='patient.jsp'">
            </div>
        </form>

        <!-- Success Message -->
        <p class="message">
            <%
                String message = (String) session.getAttribute("message");
                if (message != null) {
                    out.print(message);
                    session.removeAttribute("message");
                }
            %>
        </p>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    &copy; 2025 Clinic Manager | Designed by <strong>Prathamesh Raut</strong>
</div>

</body>
</html>
