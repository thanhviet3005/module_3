import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CurrencyServlet", urlPatterns = "/converter")
public class CurrencyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        float rate = Float.parseFloat(request.getParameter("rate"));
//        float usd = Float.parseFloat(request.getParameter("usd"));
//        float vnd = rate * usd;
//
//        PrintWriter out = response.getWriter();
//        out.println("<html>");
//        out.println("<h1> rate = "+rate+"</h1>");
//        out.println("<h1> usd = "+usd+"</h1>");
//        out.println("<h1> vnd = "+vnd+"</h1>");
//        out.println("</html>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float rate = Float.parseFloat(request.getParameter("rate"));
        float usd = Float.parseFloat(request.getParameter("usd"));
        float vnd = rate * usd;

        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<h1> rate = "+rate+"</h1>");
        out.println("<h1> usd = "+usd+"</h1>");
        out.println("<h1> vnd = "+vnd+"</h1>");
        out.println("</html>");
    }
}
