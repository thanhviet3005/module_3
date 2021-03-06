package controllers;

import common.Lib;
import models.employee.*;
import services.employeeService.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {

    PositionService positionService = new PositionService();
    DegreeService degreeService = new DegreeService();
    DivisionService divisionService = new DivisionService();
    EmployeeService employeeService = new EmployeeService();
    UserService userService = new UserService();

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println("+__+__+__+__+ " + action);
        switch (action) {
            case "create":
                saveEmployee(request, response);
                break;
            case "update":
                updateEmployee(request, response);
                break;
            case "search":
                searchEmployee(request, response);
                break;

            default:
//                getPageListUser(request, response);
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
                getPageCreateEmployee(request, response);
                break;
            case "update":
                getPageUpdateEmployee(request, response);
                break;
            case "remove":
                removeEmployee(request, response);
                break;
            default:
                getPageListEmployee(request, response);
                break;
        }

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Employee> employeeList = employeeService.searchEmployeeByName(name);
        request.setAttribute("employeeList", employeeList);

        Lib.forwardToJSP(request, response,"view/listSearchEmployee.jsp" );
    }


    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        Employee employee = new Employee();
        employee.setId(Integer.parseInt(request.getParameter("id")));
        employee.setName(request.getParameter("name"));
        employee.setBirthday(request.getParameter("birthday"));
        employee.setIdCard(request.getParameter("idCard"));
        employee.setSalary(Double.parseDouble(request.getParameter("salary")));
        employee.setPhone(request.getParameter("phone"));
        employee.setEmail(request.getParameter("email"));
        employee.setAddress(request.getParameter("address"));
        employee.setPositionId(Integer.parseInt(request.getParameter("positionId")));
        employee.setDegreeId(Integer.parseInt(request.getParameter("degreeId")));
        employee.setDivisionId(Integer.parseInt(request.getParameter("divisionId")));
        employee.setUserName(request.getParameter("userName"));

        employeeService.updateEmployeeSQL(employee);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void removeEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.removeEmployeeById(id);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageUpdateEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.selectEmployeeById(id);
        request.setAttribute("employee", employee);

        List<Position> positionList = positionService.selectAllPosition();
        request.setAttribute("positionList", positionList);

        List<Degree> degreeList = degreeService.selectAllDegree();
        request.setAttribute("degreeList", degreeList);

        List<Division> divisionList = divisionService.selectAllDivision();
        request.setAttribute("divisionList", divisionList);

        List<User> userList = userService.selectAllUser();
        request.setAttribute("userList", userList);

        Lib.forwardToJSP(request,response,"view/updateEmployee.jsp" );

    }

    //        RequestDispatcher dispatcher = request.getRequestDispatcher();
//        try {
//            dispatcher.forward(request, response);
//        } catch (ServletException | IOException e) {
//            e.printStackTrace();
//        }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void saveEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int degreeId = Integer.parseInt(request.getParameter("degreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String userName = request.getParameter("userName");

        Employee employee = new Employee(id, name, birthday, idCard, salary, phone,
                email, address, positionId, degreeId, divisionId, userName);
        employeeService.insertEmployeeSql(employee);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("method saveEmployee; occur error");
        }

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageCreateEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Position> positionList = positionService.selectAllPosition();
        request.setAttribute("positionList", positionList);

        List<Degree> degreeList = degreeService.selectAllDegree();
        request.setAttribute("degreeList", degreeList);

        List<Division> divisionList = divisionService.selectAllDivision();
        request.setAttribute("divisionList", divisionList);

        List<User> userList = userService.selectAllUser();
        request.setAttribute("userList", userList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/createEmployee.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void getPageListEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/listEmployee.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


//__+__+__+__+__+__+__+__+__+__+__+__+__
//__+__+__+__+__+__+__+__+__+__+__+__+__
}
