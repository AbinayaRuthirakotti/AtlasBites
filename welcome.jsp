<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    String username = (String) session.getAttribute("username");
    
    // Logic to ensure "Abinaya" is displayed
    if(username == null || username.isEmpty() || "admin".equalsIgnoreCase(username)){
        username = "Abinaya"; 
    }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>AtlasBites - Welcome</title>
  <link rel="stylesheet" href="style/menu.css"> 
  <style>
    /* ----------------------------------------------------------------- */
    /* WELCOME PAGE SPECIFIC STYLES */
    /* ----------------------------------------------------------------- */
    
    .welcome-container {
      text-align: center;
      padding-top: 50px; 
    }
    .hero-section {
        background-color: #f8f9fa; 
        padding: 40px 0;
    }
    .main-welcome-heading {
      color: #1f4287; 
      font-size: 3em; 
      margin-bottom: 10px;
      font-weight: 800; 
    }
    .welcome-sub-text {
        color: #555; 
        font-size: 1.4em;
        margin-bottom: 40px;
    }
    .hero-image-container {
      /* Final Reduced Size */
      width: 40%; 
      max-width: 450px; 
      margin: 30px auto; 
      border-radius: 15px; 
      overflow: hidden; 
      box-shadow: 0 15px 40px rgba(0,0,0,0.2); 
    }
    .hero-image-container img {
      width: 100%;
      height: auto;
      display: block; 
    }

    /* --- FEATURE/INFO SECTION --- */
    .info-section {
        max-width: 1100px;
        margin: 80px auto;
        padding: 0 20px;
        text-align: left;
        display: grid;
        grid-template-columns: repeat(3, 1fr); 
        gap: 40px;
    }
    .feature-block {
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        background: white;
        transition: transform 0.3s ease;
    }
    .feature-block:hover {
        transform: translateY(-5px);
    }
    .feature-block h3 {
        color: #00BCD4; 
        font-size: 1.5em;
        margin-bottom: 10px;
    }
    .feature-block p {
        color: #555;
        line-height: 1.6;
    }
    .feature-icon {
        font-size: 1.5em;
        font-weight: bold; 
        color: #1f4287; 
        margin-bottom: 15px;
        display: block;
    }

    /* --- CALL TO ACTION BUTTON --- */
    .go-to-menu-button {
      display: inline-block;
      padding: 18px 50px; 
      margin-top: 10px;
      background-color: #00BCD4; 
      color: white;
      text-decoration: none;
      border-radius: 10px;
      font-size: 1.5em;
      font-weight: bold;
      letter-spacing: 1px;
      transition: background-color 0.3s ease, transform 0.2s ease;
      box-shadow: 0 8px 20px rgba(0, 188, 212, 0.5); 
    }
    .go-to-menu-button:hover {
      background-color: #0097A7; 
      transform: translateY(-3px);
    }
  </style>
</head>
<body>
  <div class="header-nav">
    <div class="logo">AtlasBites</div>
    <div class="nav-links">
      <a href="menu.jsp">Menu</a>
      <a href="order-history.jsp">Order History</a>
      <a href="index.html" class="logout-link">Logout</a> 
    </div>
  </div>
  
  <div class="welcome-container">
    
    <div class="hero-section">
        <h1 class="main-welcome-heading">Welcome to AtlasBites, <%= username %>!</h1>
        <p class="welcome-sub-text">Your Culinary Journey, Delivered Fresh & Fast.</p>

        <div class="hero-image-container">
          <img src="images/atlasbites_hero.png" alt="AtlasBites - Your Culinary Journey, Delivered">
        </div>
        
        <a href="menu.jsp" class="go-to-menu-button">View Full Menu & Order Now</a>
    </div>
    
    <div class="info-section">
        <div class="feature-block">
            <span class="feature-icon">SPEED</span>
            <h3>Fast Delivery</h3>
            <p>Average delivery time of **only 30 minutes**. Our dedicated fleet ensures your food arrives hot, fresh, and on time, every time.</p>
        </div>
        
        <div class="feature-block">
            <span class="feature-icon">QUALITY</span>
            <h3>Quality Guaranteed</h3>
            <p>We partner exclusively with top-rated local restaurants committed to using the finest ingredients. Your satisfaction is our priority.</p>
        </div>
        
        <div class="feature-block">
            <span class="feature-icon">CHOICE</span>
            <h3>Explore & Discover</h3>
            <p>From gourmet pizza to healthy salads and decadent desserts, AtlasBites offers an unparalleled selection of global and local flavors.</p>
        </div>
    </div>
    
    <a href="menu.jsp" class="go-to-menu-button" style="margin-bottom: 80px;">Order Now</a>
    
  </div>
</body>
</html>