<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clinic Manager</title>
<!-- Font Awesome for Icons -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
    width:100%;
    min-height:100vh;
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f3f6fa;
    padding-top: 70px; /* space for navbar */
}

/* Navbar */
.navbar {
    background: #4a148c;
    color: white;
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: fixed;
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

/* Video Section */
.video-container {
    width: 100%;
    height: 100vh;
    overflow: hidden;
}

.video-container video {
    width: 100%;
    height: 100vh;
    object-fit: cover;
}


/*Image Section*/
.image-container {
    width: 100%;
    max-height: 800px;
    overflow: hidden;
}

.image {
    width: 100%;
    height: auto;
    background-size: cover; 
    background-position: center; 
    background-repeat: no-repeat;
}
/*Image Side Content*/
.image-with-content {
    position: relative;
    width: 100%;
    max-height: 500px;
    overflow: hidden;
}

.image-with-content img {
    width: 100%;
    height: auto;
}

.overlay-content {
    position: absolute;
    top: 20%;
    left: 10%;
    color: white;
    background-color: rgba(0,0,0,0.5); 
    padding: 20px;
    border-radius: 10px;
    margin-right: 800px;
}

.overlay-content h2 {
    font-size: 28px;
    margin-bottom: 10px;
}

.overlay-content p {
    font-size: 16px;
    margin-bottom: 15px;
}


.overlay-content button {
    
    padding: 10px 20px;
    background-color: #4a148c;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    
}

.overlay-content button:hover {
    background-color: #6a1b9a;
}


/* Footer */
.footer {
    background: #1A2C31;
    color: white;
    width: 100%;
    font-size: 14px;
    padding: 30px 20px;
    margin-top: 20px;
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
        <a href="home.jsp">Home</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
        <a href="about.jsp">About</a>
    </div>
</div>

<!-- Video Section -->
<div class="video-container">
    <video autoplay muted loop>
        <source src="v1/video.mp4">
    </video>
</div>


<!-- Image Section -->
<div class="image-with-content">
    <img src="Img/img3.jpg" alt="Doctor Image">
    <div class="overlay-content">
        <h2>Welcome to Our Clinic</h2>
        <p>Our clinic provides quality healthcare services with experienced doctors, advanced facilities, and personalized patient care</p>
        <a href="about.jsp"><button class="btn">View More Details</button></a>
    </div>
</div>




<!-- Footer -->
<div class="footer">
    <div class="footer-container">
        <!-- About -->
        <div class="footer-column">
            <h3>About Us</h3>
            <p>Clinic Manager is a modern solution to manage appointments, doctors, and patients efficiently. We provide an easy-to-use platform for clinics and hospitals.</p>
        </div>

        <!-- Quick Links -->
        <div class="footer-column">
            <h3>Quick Links</h3>
            <a href="home.jsp">Home</a>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
            <a href="about.jsp">About</a>
        </div>

        <!-- Contact & Social -->
        <div class="footer-column">
            <h3>Contact Us</h3>
            <p><a href="tel:+918010807122"><i class="fas fa-phone"></i> +91 8010807122</a></p>
            <p><a href="mailto:clinicmanager@example.com"><i class="fas fa-envelope"></i> clinicmanager@example.com</a></p>
            <div class="social-icons">
                <a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
                <a href="https://t.me/" target="_blank"><i class="fab fa-telegram"></i></a>
                <a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
                <a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
                <a href="https://www.linkedin.com" target="_blank"><i class="fab fa-linkedin"></i></a>
            </div>
        </div>
    </div>

    <!-- Bottom -->
    <div class="footer-bottom">
        &copy; 2025 Clinic Manager | Designed by <strong>Prathamesh Raut</strong>
    </div>
</div>

</body>
</html>
