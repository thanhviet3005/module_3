import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "TranslationServlet", urlPatterns = "/translate")
public class TranslationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello guy","xin chao");
        dictionary.put("how","the nao");
        dictionary.put("book","quyen sach");
        dictionary.put("computer","may tinh");

        String search= request.getParameter("txtSearch");
        PrintWriter output = response.getWriter();
        output.println("<html>");
        String result = dictionary.get(search);
        if(result!=null){
            output.println("Word = "+ search);
            output.println("<br>");
            output.println(", Result = "+ result);
        }else{
            output.println("Not found");
        }
        output.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
