<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clinic Services</title>
<style>
    html, body {
        margin: 0;
        padding: 0;
        height: 100%;
        font-family: Arial, sans-serif;
        background: #f9f9f9;
    }

    /* Flex layout for sticky footer */
    body {
        display: flex;
        flex-direction: column;
        background-image: url('Img/bgservice.png'); 
    }

    .content {
        flex: 1;
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

    /* Container */
    .container {
        max-width: 1200px;
        margin: 40px auto;
        padding: 20px;
        background: #E0EA8D;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    h1 {
        text-align: center;
        color: #4a148c;
        margin-bottom: 30px;
    }

    .features {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
    }

    .feature-box {
        background: #f1f1f1;
        padding: 50px;
        border-radius: 10px;
        text-align: center;
        transition: transform 0.3s ease;
    }

    .feature-box:hover {
        transform: translateY(-8px);
        background: #e1d7f2;
    }

    .feature-box h3 {
        margin-bottom: 10px;
        color: #4a148c;
    }

    .feature-box p {
        color: #333;
        font-size: 14px;
    }

    /* ✅ Footer Sticky at Bottom */
    .footer {
        background: #4a148c;
        color: white;
        text-align: center;
        padding: 15px;
        margin-top: auto;
    }
</style>
</head>
<body>

<!-- ✅ Navbar -->
<div class="navbar">
    <h2>CLINIC MANAGER</h2>
    <div>
        <a href="home.jsp">Home</a>
        <a href="about.jsp">About</a>
        <a href="service.jsp">Services</a>
        <a href="contact.jsp">Contact</a>
    </div>
</div>

<!-- ✅ Main Content -->
<div class="content">
    <div class="container">
        <h1>Our Clinic Services</h1>
        <div class="features">
            <div class="feature-box">
                <h3>Book Appointment</h3>
                <p>Schedule your appointment online easily and quickly.</p>
            </div>

            <div class="feature-box">
                <h3>Add Patient</h3>
                <p>Register new patients in the system for better care.</p>
            </div>

            <div class="feature-box">
                <h3>Add New Doctor</h3>
                <p>Add new doctors to provide the best healthcare services.</p>
            </div>

            <div class="feature-box">
                <h3>Our Facilities</h3>
                <p>We provide modern diagnostic tools and comfortable environment.</p>
            </div>
        </div>
    </div>
</div>

<!-- ✅ Footer Always at Bottom -->
<div class="footer">
    &copy; 2025 Clinic Manager | Designed by <strong>Prathamesh Raut</strong>
</div>

</body>
</html>
