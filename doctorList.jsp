<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="POJO.Doctor"%>
<%@ page import="DAO.DoctorDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor List</title>
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
    max-width: 1200px;
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

/* Table Styles */
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
.actions input[type="submit"], .back-btn {
    background: #4a148c;
    color: white;
    border: none;
    padding: 8px 14px;
    border-radius: 5px;
    cursor: pointer;
    margin: 2px;
}
.actions input[type="submit"]:hover, .back-btn:hover {
    background: #6a1b9a;
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
        <li><a href="doctor.jsp">Doctors</a></li>
        <li><a href="patient.jsp">Patients</a></li>
        <li><a href="appointment.jsp">Appointments</a></li>
        <li><a href="contact.jsp">Contact</a></li>
    </ul>
</div>

<!-- Main Container -->
<div class="container">

    <h2>Doctor List</h2>

    <%
        DoctorDAO dao = new DoctorDAO();
        List<Doctor> doctors = dao.getAllDoctors();
        String delMsg = (String) session.getAttribute("deleteMessage");
        if(delMsg != null) {
    %>
        <p class="message"><%= delMsg %></p>
    <%
        session.removeAttribute("deleteMessage");
        }
    %>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Education</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        <%
            for(Doctor doc : doctors){
        %>
        <tr>
            <td><%= doc.getDr_id() %></td>
            <td><%= doc.getDr_name() %></td>
            <td><%= doc.getEducation() %></td>
            <td><%= doc.getPhone() %></td>
            <td><%= doc.getEmail() %></td>
            <td class="actions">
                <form action="DoctorServlet" method="post">
                    <input type="hidden" name="dr_id" value="<%=doc.getDr_id()%>">
                    <input type="submit" name="action" value="Delete">
                </form>
                <form action="updateDoctor.jsp" method="get">
                    <input type="hidden" name="dr_id" value="<%=doc.getDr_id()%>">
                    <input type="submit" value="Edit">
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>

    <!-- Back Button -->
    <a class="back-btn" href="doctor.jsp">Back</a>

</div>

<!-- Footer -->
<div class="footer">
    &copy; 2025 Clinic Manager | Designed by <strong>Prathamesh Raut</strong>
</div>

</body>
</html>
