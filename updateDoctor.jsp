<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="DAO.DoctorDAO"%>
<%@ page import="POJO.Doctor"%>
<%
int drId = Integer.parseInt(request.getParameter("dr_id"));
DoctorDAO dao = new DoctorDAO();
Doctor doctor = dao.getDoctorById(drId); // Ensure this DAO method exists
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Doctor</title>
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
form input[type="text"], form input[type="email"] {
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    width: 100%;
}

/* Buttons */
button, input[type="submit"] {
    padding: 12px 20px;
    border: none;
    border-radius: 5px;
    background: #4a148c;
    color: white;
    font-size: 16px;
    cursor: pointer;
    margin-top: 15px;
}
button:hover, input[type="submit"]:hover {
    background: #6a1b9a;
}

/* Button container to separate Update and Back */
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
        <li><a href="doctor.jsp">Doctors</a></li>
        <li><a href="patient.jsp">Patients</a></li>
        <li><a href="appointment.jsp">Appointments</a></li>
        <li><a href="contact.jsp">Contact</a></li>
    </ul>
</div>

<!-- Main Container -->
<div class="container">
    <h2>Update Doctor</h2>
    <form action="DoctorServlet" method="post">
        <input type="hidden" name="dr_id" value="<%=doctor.getDr_id()%>">

        <label for="dr_name">Name:</label>
        <input type="text" name="dr_name" id="dr_name" value="<%=doctor.getDr_name()%>" required>

        <label for="education">Education:</label>
        <input type="text" name="education" id="education" value="<%=doctor.getEducation()%>" required>

        <label for="phone">Phone:</label>
        <input type="text" name="phone" id="phone" value="<%=doctor.getPhone()%>" required>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" value="<%=doctor.getEmail()%>" required>

        <div class="btn-container">
            <input type="submit" name="action" value="Update">
            <button type="button" onclick="window.location.href='doctorList.jsp'">Back to List</button>
        </div>
    </form>
</div>

<!-- Footer -->
<div class="footer">
    &copy; 2025 Clinic Manager | Designed by <strong>Prathamesh Raut</strong>
</div>

</body>
</html>
