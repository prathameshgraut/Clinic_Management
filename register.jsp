<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
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

/* Center the form */
.container {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

.register-box {
	background: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	width: 400px;
}

.register-box h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #4a148c;
}

.register-box input, .register-box select {
	width: 100%;
	padding: 12px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
}

.register-box input[type="submit"] {
	background: #4a148c;
	color: white;
	border: none;
	cursor: pointer;
	font-size: 16px;
}

.register-box input[type="submit"]:hover {
	background: #6a1b9a;
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

	<!-- Registration Form -->
	<div class="container">
		<div class="register-box">
			<h2>User Registration</h2>
			<form action="RegisterServlet" method="post">
				<input type="text" name="username" placeholder="Username" required>
				<input type="password" name="password" placeholder="Password"
					required> <input type="email" name="email"
					placeholder="Email" required> <select name="role" required>
					<option value="">Select Role</option>
					<option value="User">User</option>
					<option value="Admin">Admin</option>
				</select> <input type="submit" value="Register">
			</form>

			<p class="message">
				<%
				String msg = (String) session.getAttribute("registerMessage");
				if (msg != null) {
					out.print(msg);
					session.removeAttribute("registerMessage");
				}
				%>
			</p>
		</div>
	</div>

	<!-- Footer -->
	<div class="footer">
		&copy; 2025 Clinic Manager | Designed by <strong>Prathamesh
			Raut</strong>
	</div>

</body>
</html>
