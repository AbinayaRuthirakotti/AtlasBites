<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Updated data array with image paths (items[i][3])
    String[][] items = {
        {"1","Pizza","250","images/pizza.jpg"},
        {"2","Burger","120","images/burger.jpg"},
        {"3","Pasta","180","images/pasta.jpg"},
        {"4","Sandwich","100","images/sandwich.jpg"}
    };
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>AtlasBites - Menu</title>
  <link rel="stylesheet" href="style/menu.css">
</head>
<body>
  <div class="header-nav">
    <div class="logo">AtlasBites</div>
    <div class="nav-links">
      <a href="welcome.jsp">Home</a>
      <a href="order-history.jsp">Order History</a>
      <a href="index.html">Logout</a> 
    </div>
  </div>
  
  <h1>Our Delicious Menu</h1>
  
  <div class="menu-grid">
    <% for(int i=0;i<items.length;i++){ %>
      <div class="menu-card">
        <img src="<%= items[i][3] %>" alt="<%= items[i][1] %>" class="food-image">
        
        <div class="card-content">
          <h3><%= items[i][1] %></h3>
          <p>Price: ₹<%= items[i][2] %></p>
          
          <form action="OrderServlet" method="post">
            <input type="hidden" name="item_id" value="<%= items[i][0] %>">
            
            <div class="quantity-selector">
                <label for="quantity_<%= items[i][0] %>">Quantity:</label>
                <input type="number" id="quantity_<%= items[i][0] %>" name="quantity" value="1" min="1" max="10">
            </div>
            
            <button type="submit">Order Now</button>
          </form>
        </div>
      </div>
    <% } %>
  </div>
  
  <script src="script/menu.js"></script>
</body>
</html>