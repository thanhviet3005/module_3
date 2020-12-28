package controllers;

import common.Lib;
import common.Validate;
import models.customer.Customer;
import models.customer.CustomerType;
import services.customerService.CustomerService;
import services.customerService.CustomerTypeService;

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
    CustomerTypeService customerTypeService = new CustomerTypeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println("+__+__+__+__+ " + action);
        switch (action) {
            case "create":
                saveCustomer(request, response);
                break;
            case "update":
                updateCustomer(request, response);
                break;
            case "search":
                searchCustomer(request, response);
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
                getPageUpdateCustomer(request, response);
                break;
            case "remove":
                removeCustomer(request, response);
                break;
            default:
                getPageListUser(request, response);
                break;

        }
    }



    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("customerName");
        List<Customer> customerList = customerService.searchCustomerByName(name);
        request.setAttribute("customerList", customerList);

        Lib.forwardToJSP(request, response,"view/listSearchCustomer.jsp" );

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
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
        customerService.updateCustomer(customer);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void removeCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.removeCustomerById(id);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageUpdateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.selectCustomerById(id);
        request.setAttribute("customer", customer);

        List<CustomerType> customerTypeList = customerTypeService.selectAllCustomerType();//
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/update.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void saveCustomer(HttpServletRequest request, HttpServletResponse response) {
        boolean isMatch = true;
        String massageIdCard = null;
        String massagePhone = null;
        int id = Integer.parseInt(request.getParameter("id"));
        int typeId =  Integer.parseInt(request.getParameter("typeId"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        isMatch = Validate.checkCustomerIDCard(idCard);
        if(!isMatch){
            massageIdCard = "wrong format, re_input = (vd: XXXXXXXXX or XXXXXXXXXXXX)";
        }

        isMatch = Validate.checkPhoneNumber(phone);
        if(!isMatch){
            massagePhone = "wrong format, re_input = " +
                    " (vd: 090xxxxxxx or 091xxxxxxx or (84)+90xxxxxxx or (84)+91xxxxxxx)";
        }

        if(massageIdCard != null || massagePhone != null){
            request.setAttribute("massageIdCard", massageIdCard);
            request.setAttribute("massagePhone", massagePhone);
            Lib.forwardToJSP(request, response,"view/create.jsp");
        }else{
            Customer customer = new Customer(id, typeId, name, birthday,
                    gender, idCard, phone, email, address);
            customerService.insertCustomer(customer);
            Lib.responseSenDirect(response,"/customer");

        }

    }

//        try {
//            response.sendRedirect("/customer");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageListUser(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.selectAllCustomer();
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
        List<CustomerType> customerTypeList = customerTypeService.selectAllCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

//__+__+__+__+__+__+__+__+__+__+__+__+__
}
