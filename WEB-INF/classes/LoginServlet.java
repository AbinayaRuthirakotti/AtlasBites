import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if("admin".equals(username) && "1234".equals(password)){
            request.getSession().setAttribute("username", username);
            // SUCCESS: Redirect to authenticated dashboard
            response.sendRedirect("welcome.jsp"); 
        } else {
            // FAILURE: Send back to the public home page with an error message in the URL (optional)
            response.getWriter().println("Invalid login. <a href='home.html'>Try again</a>"); 
        }
    }
}