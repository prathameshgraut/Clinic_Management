<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
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

/* Center Content */
.container {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

.login-box {
	background: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	width: 400px;
}

.login-box h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #4a148c;
}

.login-box input[type="text"], .login-box input[type="password"] {
	width: 100%;
	padding: 12px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
}

.login-box input[type="submit"], .login-box input[type="button"] {
	padding: 12px 20px;
	margin: 10px 5px 0 0;
	border: none;
	border-radius: 6px;
	font-size: 16px;
	cursor: pointer;
}

.login-box input[type="submit"] {
	background: #4a148c;
	color: white;
}

.login-box input[type="submit"]:hover {
	background: #6a1b9a;
}

.login-box input[type="button"] {
	background: #ccc;
	color: #333;
}

.login-box input[type="button"]:hover {
	background: #bbb;
}

.message {
	text-align: center;
	color: red;
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

	<!-- Main Content -->
	<div class="container">
		<div class="login-box">
			<h2>Login</h2>
			<form action="LoginServlet" method="post">
				<input type="text" name="username" placeholder="Username" required>
				<input type="password" name="password" placeholder="Password"
					required>

				<div style="text-align: center;">
					<input type="submit" value="Login"> <input type="button"
						value="Register" onclick="window.location.href='register.jsp'">
					<input type="button" value="Dashboard"
						onclick="window.location.href='dashboard.jsp'">
				</div>
			</form>

			<p class="message">
				<%
				String error = (String) session.getAttribute("loginError");
				if (error != null) {
					out.print(error);
					session.removeAttribute("loginError");
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
