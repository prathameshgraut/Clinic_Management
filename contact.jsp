<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<style>
/* Reset */
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: url("Img/BGimg.png") no-repeat center center fixed;
	background-size: cover;
}

/* Navbar */
.navbar {
	background: #4a148c;
	color: white;
	padding: 15px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.navbar h2 {
	margin: 0;
	font-size: 24px;
}

.navbar a {
	color: white;
	text-decoration: none;
	margin-left: 15px;
	font-size: 16px;
}

.navbar a:hover {
	text-decoration: underline;
}

/* Contact Section */
.contact-container {
	max-width: 900px;
	margin: 40px auto;
	background-image: url('Img/contact.jpg');
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

h1, h2 {
	text-align: center;
	color: #4a148c;
}

p {
	font-size: 18px;
	margin: 10px 0;
	text-align: center;
}

iframe {
	display: block;
	margin: 20px auto;
	border-radius: 10px;
}

/* Footer */
.footer {
	background: #4a148c;
	color: white;
	text-align: center;
	padding: 15px;
	margin-top: 40px;
}
</style>
</head>
<body>

	<!-- ✅ Navbar -->
	<div class="navbar">
		<h2>CLINIC MANAGER</h2>
		<div>
			<a href="home.jsp">Home</a> <a href="about.jsp">About</a> <a
				href="contact.jsp">Contact</a>
		</div>
	</div>

	<!-- ✅ Contact Details -->
	<div class="contact-container">
		<h1>Contact Us</h1>
		<p>
			<strong>Clinic Address:</strong> G H Raisoni Complex, Jalgaon,
			Maharashtra, India
		</p>
		<p>
			<strong>Phone:</strong> +91 8010807122
		</p>
		<p>
			<strong>Email:</strong> clinicmanager@example.com
		</p>

		<h2>Find Us on Map</h2>
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3719.0999999999995!2d75.56399999999999!3d21.007999999999996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMjHCsDAwJzI4LjgiTiA3NcKwMzMnNDkuNCJF!5e0!3m2!1sen!2sin!4v1700000000000"
			width="600" height="450" style="border: 0;" allowfullscreen=""
			loading="lazy"> </iframe>
	</div>

	<!-- ✅ Footer -->
	<div class="footer">
		&copy; 2025 Clinic Manager | Designed by <strong>Prathamesh
			Raut</strong>
	</div>

</body>
</html>
