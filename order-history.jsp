<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
    String path = getServletContext().getRealPath("/") + "data/orders.txt";
    File file = new File(path);
    String[] orders = {};
    if(file.exists()){
        BufferedReader br = new BufferedReader(new FileReader(file));
        orders = br.lines().toArray(String[]::new);
        br.close();
    }
%>
<!DOCTYPE html>
<html>
<head>
  <title>AtlasBites - Order History</title>
  <link rel="stylesheet" href="style/menu.css"> 
</head>
<body>
  <div class="header-nav">
    <div class="logo">AtlasBites</div>
    <div class="nav-links">
      <a href="welcome.jsp">Home</a>
      <a href="menu.jsp">Menu</a>
      <a href="index.html">Logout</a>
    </div>
  </div>
  <h1>AtlasBites - All Orders</h1>
  
  <% if(orders.length > 0) { %>
    <table>
      <thead>
        <tr>
          <th>User</th>
          <th>Item</th>
          <th>Time Stamp</th>
        </tr>
      </thead>
      <tbody>
        <% for(String order : orders) { 
            String[] parts = order.split(", ");
            String user = parts.length > 0 ? parts[0].replace("User: ", "") : "N/A";
            String item = parts.length > 1 ? parts[1].replace("Item: ", "") : "N/A";
            String time = parts.length > 2 ? parts[2].replace("Time: ", "") : "N/A";
        %>
          <tr>
            <td><%= user %></td>
            <td><%= item %></td>
            <td><%= time %></td>
          </tr>
        <% } %>
      </tbody>
    </table>
  <% } else { %>
    <p style="text-align: center; margin-top: 50px; font-size: 1.2em; color: #555;">No orders have been placed yet.</p>
  <% } %>
  
  <a href="menu.jsp" class="back-link">Back to Menu</a>
</body>
</html>