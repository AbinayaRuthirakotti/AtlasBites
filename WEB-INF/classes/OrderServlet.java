import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.time.LocalDateTime;

public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String itemId = request.getParameter("item_id");
        
        // Get quantity parameter
        String quantityStr = request.getParameter("quantity");
        int quantity = 1; 
        try {
            quantity = Integer.parseInt(quantityStr);
        } catch (NumberFormatException e) {
            System.err.println("Invalid quantity: " + quantityStr);
        }

        String username = (String) request.getSession().getAttribute("username");
        
        if(username == null) {
            username = "Guest";
        }
        
        // FIX: Replaces 'admin' with 'Abinaya' for order history logging
        if ("admin".equalsIgnoreCase(username)) {
            username = "Abinaya";
        }

        // Save orders.txt inside data folder
        String path = getServletContext().getRealPath("/") + "data/orders.txt";
        File file = new File(path);
        if(!file.exists()) {
            file.getParentFile().mkdirs(); 
            file.createNewFile();
        }

        String itemName = switch(itemId){
            case "1" -> "Pizza";
            case "2" -> "Burger";
            case "3" -> "Pasta";
            case "4" -> "Sandwich";
            default -> "Unknown";
        };

        FileWriter fw = new FileWriter(file,true);
        // UPDATED: Writes multiple lines based on quantity
        for (int i = 0; i < quantity; i++) { 
            fw.write("User: " + username + ", Item: " + itemName + ", Time: " + LocalDateTime.now() + "\n");
        }
        fw.close();

        PrintWriter out = response.getWriter();
        out.println("<h2>Order Placed Successfully!</h2>");
        out.println("<a href='menu.jsp'>Back to Menu</a><br>");
        out.println("<a href='order-history.jsp'>View Orders</a>");
    }
}