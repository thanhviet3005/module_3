package controllers;

import common.Lib;
import models.contract.Contract;
import models.customer.Customer;
import models.employee.Employee;
import models.service.ServiceModel;
import services.contract.ContractRepository;
import services.customerService.CustomerService;
import services.employeeService.EmployeeService;
import services.resortService.ServiceRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractServlet", urlPatterns = "/contract")
public class ContractServlet extends HttpServlet {
    ContractRepository contractRepository = new ContractRepository();
    EmployeeService employeeService = new EmployeeService();
    CustomerService customerService = new CustomerService();
    ServiceRepository serviceRepository = new ServiceRepository();


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println("+__+__+__+__+ " + action);
        switch (action) {
            case "create":
                saveContract(request, response);
                break;
//            case "update":
//                updateEmployee(request, response);
//                break;
//            case "search":
//                searchEmployee(request, response);
//                break;

            default:
                getPageListContract(request, response);
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
                getPageCreateContract(request, response);
                break;
//            case "update":
//                getPageUpdateEmployee(request, response);
//                break;
//            case "remove":
//                removeEmployee(request, response);
//                break;
            default:
                getPageListContract(request, response);
                break;
        }

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void saveContract(HttpServletRequest request, HttpServletResponse response) {
        int contract_id = Integer.parseInt(request.getParameter("contract_id"));
        String contract_start_date = request.getParameter("contract_start_date");
        String contract_end_date = request.getParameter("contract_end_date");
        double contract_deposition = Double.parseDouble(request.getParameter("contract_deposition"));

        double contract_total_money = Double.parseDouble(request.getParameter("contract_total_money"));
        int employee_id = Integer.parseInt(request.getParameter("employee_id"));
        int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        int service_id = Integer.parseInt(request.getParameter("service_id"));

        Contract contract = new Contract(contract_id, contract_start_date, contract_end_date
                , contract_deposition, contract_total_money, employee_id
                , customer_id, service_id);

        contractRepository.insertNew(contract);
        Lib.responseSenDirect(response, "/contract");

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageCreateContract(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.selectAllCustomer();
        request.setAttribute("customerList", customerList);

        List<Employee> employeeList = employeeService.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);

        List<ServiceModel> serviceModelList = serviceRepository.getAll();
        request.setAttribute("serviceModelList", serviceModelList);
//
//        List<Contract> contractList = contractRepository.getAll();
//        request.setAttribute("contractList", contractList);
        Lib.forwardToJSP(request, response, "view/contract/createContract.jsp");
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageListContract(HttpServletRequest request, HttpServletResponse response) {
        List<Contract> contractList = contractRepository.getAll();
        request.setAttribute("contractList", contractList);
        Lib.forwardToJSP(request, response, "view/contract/listContract.jsp");
    }




//__+__+__+__+__+__+__+__+__+__+__+__+__
//__+__+__+__+__+__+__+__+__+__+__+__+__
}
