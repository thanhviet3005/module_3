package controllers;

import models.Customer;
import services.CustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println("+__+__+__+__+ " + action);
        switch (action) {
            case "create":
                saveUser(request, response);
                break;
            default:
                getPageListUser(request, response);
                break;

        }

    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println("+__+__+__+__+ " + action);
        switch (action) {
            case "create":
                getPageCreateCustomer(request, response);
                break;
            case "update":

                break;
            default:
                getPageListUser(request, response);
                break;

        }
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void saveUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int typeId =  Integer.parseInt(request.getParameter("typeId"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Customer customer = new Customer(id, typeId, name, birthday,
                gender, idCard, phone, email, address);
        customerService.insertCustomer(customer);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageListUser(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.selectAllUser();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/listCustomer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageCreateCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

//__+__+__+__+__+__+__+__+__+__+__+__+__
}
