package UserServlet;

import DAO.UserDAO;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")

public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init(){
        userDAO = new UserDAO();
    }

//+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                insertUser(request, response);
                break;
            case "edit":
                updateUser(request,response);
                break;
        }

    }

    //+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+
    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User book = new User(id, name, email, country);

        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
        try {
            userDAO.updateUser(book);
            dispatcher.forward(request, response);
        } catch (ServletException | SQLException |IOException e) {
            e.printStackTrace();
        }

    }

    //+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+
    private void insertUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(name, email, country);
        try {
            userDAO.insertUser(newUser);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    //+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action== null){
            action = "";
        }

        switch (action){
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request,response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                listUser(request,response);
                break;
        }

    }

    //+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            userDAO.deleteUser(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        List<User> listUser = userDAO.selectAllUser();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    //+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDAO.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
        request.setAttribute("user",existingUser);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }    }

    //+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            System.out.println("error occur");
            e.printStackTrace();
        }

    }

    //+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+
    private void listUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> listUser = userDAO.selectAllUser();
        request.setAttribute("listUser",listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    //+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+



//+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_

}
