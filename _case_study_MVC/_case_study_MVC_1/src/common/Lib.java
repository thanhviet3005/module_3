package common;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Lib {
    private static String jdbcURL= "jdbc:mysql://localhost:3306/casestudymvc?useSSL=false";
    private static String jdbcACC = "root";
    private static String jdbcPASS= "cuchinhlan";



    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public static void forwardToJSP(HttpServletRequest request, HttpServletResponse response, String pathJSP){
        Connection connection = getConnection();
        RequestDispatcher dispatcher = request.getRequestDispatcher(pathJSP);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcACC, jdbcPASS);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public static void responseSenDirect(HttpServletResponse response, String path){
        try {
            response.sendRedirect(path);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


//__+__+__+__+__+__+__+__+__+__+__+__+__
}
