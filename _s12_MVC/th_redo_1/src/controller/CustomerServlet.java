package controller;

import model.Customer;
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

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "create":
                // tra ve giao dien form them moi
                break;
            case "edit":
                // tra ve giao dien form edit
                break;
            case "delete":
                // goi phuong thuc delete
                break;
            default:
                // tra ve danh sach form customer
                getPageListCustomer(request, response);
                break;
        }

    }

    //+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageListCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.getCustomerList();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            System.out.println("Error at getPageListCustomer");
            e.printStackTrace();
        }

    }

    //+__+__+__+__+__+__+__+__+__+__+__+__
}
