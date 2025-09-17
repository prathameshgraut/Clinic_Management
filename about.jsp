<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - Clinic Manager</title>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	background: #FBC4ED;
}

/* Navbar */
.navbar {
	background: #4a148c;
	color: white;
	padding: 15px 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	position: sticky;
	top: 0;
	width: 100%;
	z-index: 1000;
}

.navbar h2 {
	margin: 0;
	font-size: 24px;
}

.navbar a {
	color: white;
	text-decoration: none;
	margin-right: 50px;
	font-size: 15px;
}

.navbar a:hover {
	text-decoration: underline;
}

/* Page Header */
.header {
	width: 100%;
	background: #FBC4ED;
	color: #4a148c;
	text-align: center;
	padding: 50px 30px;
}

.header h1 {
	margin: 0;
	font-size: 36px;
}

.header p {
	font-size: 18px;
	margin-top: 10px;
}

/* Features Section */
.features-section {
	padding: 40px 20px;
	text-align: center;
}

.features-section h2 {
	font-size: 28px;
	color: #4a148c;
	margin-bottom: 20px;
}

.features-container {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 20px;
	max-width: 1200px;
	margin: auto;
}

.feature-card {
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
}

.feature-card:hover {
	transform: translateY(-8px);
}

.feature-card i {
	font-size: 40px;
	color: #4a148c;
	margin-bottom: 10px;
}

.feature-card h3 {
	margin-bottom: 10px;
	font-size: 20px;
	color: #333;
}

.feature-card p {
	font-size: 14px;
	color: #555;
}

/* Terms & Policies Section */
.terms-section {
	background: #AECECA;
	padding: 40px 20px;
	margin-top: 30px;
	border-top: 1px solid #ddd;
}

.terms-section h2 {
	text-align: center;
	font-size: 26px;
	color: #4a148c;
	margin-bottom: 20px;
}

.terms-section ul {
	max-width: 800px;
	margin: auto;
	list-style: none;
	padding: 0;
}

.terms-section li:hover {
	transform: scale(1.05);
    box-shadow: 0 8px 20px rgba(0,0,0,0.4);
}

.terms-section li {
	background: #f3f6fa;
	margin-bottom: 10px;
	padding: 15px;
	border-radius: 8px;
	font-size: 15px;
	color: #333;
	position: relative;
	padding-left: 30px;
}

.terms-section li::before {
	content: "\f00c";
	font-family: "Font Awesome 6 Free";
	font-weight: 900;
	position: absolute;
	left: 10px;
	color: #4a148c;
}

/* Footer */
.footer {
	background: #1A2C31;
	color: white;
	width: 100%;
	font-size: 14px;
	padding: 30px 20px;
	margin-top: 30px;
}

.footer .footer-container {
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	max-width: 1200px;
	margin: auto;
}

.footer-column {
	width: 30%;
	min-width: 250px;
	margin-bottom: 20px;
}

.footer-column h3 {
	margin-bottom: 10px;
	font-size: 18px;
	border-bottom: 2px solid #ffd700;
	display: inline-block;
	padding-bottom: 5px;
}

.footer-column p, .footer-column a {
	color: #ddd;
	font-size: 14px;
	text-decoration: none;
	display: block;
	margin-bottom: 8px;
}

.footer-column a:hover {
	color: #ffd700;
}

/* Social Icons */
.social-icons {
	display: flex;
	justify-content: flex-start;
	gap: 15px;
	margin-top: 10px;
	font-size: 24px;
}

.social-icons a {
	color: white;
	text-decoration: none;
	transition: transform 0.3s ease, color 0.3s ease;
}

.social-icons a:hover {
	color: #ffcc00;
	transform: scale(1.2);
}

/* Footer Bottom */
.footer-bottom {
	text-align: center;
	border-top: 1px solid #666;
	margin-top: 20px;
	padding-top: 10px;
	font-size: 13px;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<div class="navbar">
		<h2>CLINIC MANAGER</h2>
		<div>
			<a href="home.jsp">Home</a> <a href="service.jsp">Services</a> <a
				href="about.jsp">About</a> <a href="contact.jsp">Contact</a>
		</div>
	</div>

	<!-- Header -->
	<div class="header">
		<h1>About Clinic Manager</h1>
		<p>Your trusted partner in healthcare management</p>
	</div>

	<!-- Features Section -->
	<div class="features-section">
		<h2>Our Key Features</h2>
		<div class="features-container">
			<div class="feature-card">
				<i class="fas fa-calendar-check"></i>
				<h3>Book Appointments</h3>
				<p>Easy and quick appointment booking system for patients and
					doctors.</p>
			</div>
			<div class="feature-card">
				<i class="fas fa-user-plus"></i>
				<h3>Add Patients</h3>
				<p>Register and manage patient details securely with our system.</p>
			</div>
			<div class="feature-card">
				<i class="fas fa-hospital"></i>
				<h3>Clinic Management</h3>
				<p>Handle doctors, patients, schedules, and billing in one
					platform.</p>
			</div>
			<div class="feature-card">
				<i class="fas fa-file-medical"></i>
				<h3>Health Records</h3>
				<p>Maintain patient history and medical records digitally and
					securely.</p>
			</div>
		</div>
	</div>

	<!-- Terms & Policies Section -->
	<div class="terms-section">
		<h2>Terms & Policies</h2>
		<ul>
			<li>Patients must book appointments in advance to avoid delays.</li>
			<li>All personal and medical data is stored securely and
				confidentially.</li>
			<li>Cancellation of appointments should be done 24 hours prior.</li>
			<li>Clinic Manager does not share data with third parties
				without consent.</li>
			<li>Payments and billing must comply with clinic terms and
				conditions.</li>
		</ul>
	</div>

	<!-- Footer -->
	<div class="footer">
		<div class="footer-container">
			<!-- About -->
			<div class="footer-column">
				<h3>About Us</h3>
				<p>Clinic Manager helps clinics manage appointments, doctors,
					and patients efficiently. Easy to use & secure platform for
					healthcare.</p>
			</div>

			<!-- Quick Links -->
			<div class="footer-column">
				<h3>Quick Links</h3>
				<a href="home.jsp">Home</a> <a href="login.jsp">Login</a> <a
					href="register.jsp">Register</a> <a href="about.jsp">About</a>
			</div>

			<!-- Contact & Social -->
			<div class="footer-column">
				<h3>Contact Us</h3>
				<p>
					<a href="tel:+918010807122"><i class="fas fa-phone"></i> +91
						8010807122</a>
				</p>
				<p>
					<a href="mailto:clinicmanager@example.com"><i
						class="fas fa-envelope"></i> clinicmanager@example.com</a>
				</p>
				<div class="social-icons">
					<a href="https://www.instagram.com" target="_blank"><i
						class="fab fa-instagram"></i></a> <a href="https://t.me/"
						target="_blank"><i class="fab fa-telegram"></i></a> <a
						href="https://www.facebook.com" target="_blank"><i
						class="fab fa-facebook"></i></a> <a href="https://twitter.com"
						target="_blank"><i class="fab fa-twitter"></i></a> <a
						href="https://www.linkedin.com" target="_blank"><i
						class="fab fa-linkedin"></i></a>
				</div>
			</div>
		</div>

		<!-- Bottom -->
		<div class="footer-bottom">
			&copy; 2025 Clinic Manager | Designed by <strong>Prathamesh
				Raut</strong>
		</div>
	</div>

</body>
</html>
