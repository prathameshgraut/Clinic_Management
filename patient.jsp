<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Dashboard</title>
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
	width: 400px;
}

.form-box h3 {
	text-align: center;
	margin-bottom: 20px;
	color: #4a148c;
}

.form-box input[type="text"], .form-box input[type="number"], .form-box input[type="email"],
	.form-box select {
	width: 100%;
	padding: 12px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
}

.form-box input[type="submit"], .form-box input[type="button"] {
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

.form-box .logout-btn {
	background: #e53935;
	color: white;
	width: 100%;
	margin-top: 10px;
}

.form-box .logout-btn:hover {
	background: #c62828;
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
			<li><a href="appointment.jsp">Book Appointment</a></li>
			<li><a href="about.jsp">About</a></li>
			<li><a href="contact.jsp">Contact</a></li>
		</ul>
	</div>

	<!-- Main Content -->
	<div class="container">
		<div class="form-box">
			<h3>Add Patient Details</h3>
			<form action="PatientServlet" method="post">
				<input type="text" name="patient_name" placeholder="Patient Name"
					required> <input type="number" name="age" placeholder="Age"
					required> <select name="gender" required>
					<option value="">Select Gender</option>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
				</select> <input type="text" name="phone" placeholder="Phone" required>
				<input type="email" name="email" placeholder="Email" required>

				<input type="submit" value="Add Patient">
			</form>

			<input type="button" value="LogOut" class="logout-btn"
				onclick="window.location.href='dashboard.jsp'">
		</div>
	</div>

	<!-- Footer -->
	<div class="footer">
		&copy; 2025 Clinic Manager | Designed by <strong>Prathamesh
			Raut</strong>
	</div>

</body>
</html>
