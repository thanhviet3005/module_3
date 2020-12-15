import javafx.print.Printer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Servlet_simple_login", urlPatterns="/Servlet_simple_login")
public class Servlet_simple_login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String userName = request.getParameter("username");
//        String password = request.getParameter("password");
//
//        PrintWriter writer = response.getWriter();
//        writer.println("<html>");
//        if("admin".equals(userName) && "admin".equals(password)){
//            writer.println("<h1>Welcome "+ userName +" </h1>");
//        }else{
//            writer.println("<h1>LOGIN EROR</h1>");
//        }
//        writer.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        if("admin".equals(userName) && "admin".equals(password)){
            writer.println("<h1>Welcome "+ userName +" </h1>");
        }else{
            writer.println("<h1>LOGIN EROR</h1>");
        }
        writer.println("</html>");
    }
}
