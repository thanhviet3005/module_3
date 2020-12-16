import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProductDiscount", urlPatterns ="/display-discount")

public class ProductDiscount extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter output = response.getWriter();
        String description = request.getParameter("description");
        Integer price = Integer.parseInt(request.getParameter("price"));
        Integer percent= Integer.parseInt(request.getParameter("percent"));

        Double discountAmount = price * percent * 0.01;
        Double priceAfterDiscount = price - discountAmount;

        output.write("<html>");
        output.println("Description = "+ description +"<br>"
                + "Price = "+ price +"<br>"
                + "Percent = "+ percent +"<br>"
                + "Discount amount = "+ discountAmount +"<br>"
                + "Discount Price = "+ priceAfterDiscount
        );
        output.write("</html>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
