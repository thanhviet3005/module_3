package controller;

import models.Customer;
import service.CustomerService;

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
        if(action== null){
            action = "";
        }
        switch (action){
            case "create":
                //phuong thuc luu customer form vao list
                saveCustomer(request, response);
                break;
            case "edit":
                saveCustomer(request, response);
                break;
            case "search":
                searchCustomer(request, response);
                break;
            default:
                getPageListCustomer(request, response);
                break;

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        System.out.println("+++++++++++++++" + action);
        switch (action){
            case "create":
                // phuong thuc tao customer moi
                getPageCreateCustomer(request, response);
                break;
            case "edit":
                // phuong thuc update thong tin customer
                getPageEditCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                // hien ra list customer ban dau:
                getPageListCustomer(request, response);
                break;
        }
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        request.setAttribute("customer", customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/search.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.removeById(id);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageEditCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id= Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        request.setAttribute("customer", customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void saveCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id, name, email, address);
        customerService.saveCustomer(customer);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
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
    private void getPageListCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.getPageArrList();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

//__+__+__+__+__+__+__+__+__+__+__+__+__

}
