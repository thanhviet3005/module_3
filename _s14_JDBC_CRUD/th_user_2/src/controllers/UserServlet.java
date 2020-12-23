package controllers;

import models.User;
import services.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/user")
public class UserServlet extends HttpServlet {
    UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        System.out.println("+__+__+__+__+ "+ action);
        switch (action){
            case "create":
                saveUser(request, response);
                break;
            case "edit":
                updateUser(request, response);
                break;
            case "find":
                findUserById(request, response);
                break;

        }

    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if(action== null){
            action = "";
        }
        System.out.println("+__+__+__+__+ "+ action);
        switch (action){
            case "create":
                getPageCreateUser(request, response);
                break;
            case "edit":
                getPageEditUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                getPageListUser(request, response);
                break;
        }

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void findUserById(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectById(id);
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/find.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.deleteUser(id);
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        System.out.println(request.getParameter("id"));
        int id = Integer.parseInt(request.getParameter("id"));
        User user = new User(id, name, age, gender, email, country);
        userService.updateUser(user);
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageEditUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectById(id);
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void saveUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, age, gender, email, country);
        userService.insertUser(user);
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageCreateUser(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageListUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.selectAllUser();
        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__

    

    //__+__+__+__+__+__+__+__+__+__+__+__+__
}
