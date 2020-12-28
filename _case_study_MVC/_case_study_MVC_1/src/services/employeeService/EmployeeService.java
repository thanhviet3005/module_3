package services.employeeService;

import common.Lib;
import models.employee.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudymvc?useSSL=false";
    private String jdbcACC = "root";
    private String jdbcPASS= "cuchinhlan";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private static final String SELECT_ALL_EMPLOYEE =
            "{CALL getAllEmployee}";
    private static final String INSERT_EMPLOYEE_SQL =
            "{CALL insertEmployee(?,?,?,?,?,?,?,?,?,?,?,?)}";
    private static final String DELETE_EMPLOYEE_SQL =
            "{CALL deleteEmployeeById(?)}";
    private static final String UPDATE_EMPLOYEE_SQL =
            "{CALL updateEmployee(?,?,?,?,?,?,?,?,?,?,?,?)}";
    private static final String SELECT_EMPLOYEE_BY_ID_SQL =
            "{CALL getEmployeeById(?)}";
    private static final String SELECT_EMPLOYEE_BY_NAME_SQL =
            "{CALL searchByName(?)}";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void addUpdateEmployeeSQL(String statementCallProcedure, Employee employee){
        System.out.println(statementCallProcedure);
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(statementCallProcedure))
        {
            callableStatement.setInt(1, employee.getId());
            callableStatement.setString(2, employee.getName());
            callableStatement.setString(3, employee.getBirthday());
            callableStatement.setString(4, employee.getIdCard());
            callableStatement.setDouble(5, employee.getSalary());
            callableStatement.setString(6, employee.getPhone());
            callableStatement.setString(7, employee.getEmail());
            callableStatement.setString(8, employee.getAddress());
            callableStatement.setInt(9, employee.getPositionId());
            callableStatement.setInt(10, employee.getDegreeId());
            callableStatement.setInt(11, employee.getDivisionId());
            callableStatement.setString(12, employee.getUserName());

            System.out.println(callableStatement);
            boolean updateStatus = callableStatement.executeUpdate() >0;
            System.out.println("Status update = " + updateStatus);
        }catch (SQLException e){
            System.out.println("method= updateEmployeeSQL, occur error= SQLException ");
            e.printStackTrace();
        }

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public List<Employee> returnListEmployee(String statementCallProcedure){
        List<Employee> employeeList = new ArrayList<>();
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(statementCallProcedure)
        ){
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            int employee_id;
            String employee_name;
            String employee_birthday;
            String employee_id_card;
            Double employee_salary;
            String employee_phone;
            String employee_email;
            String employee_address;
            String position_name;
            String education_degree_name;
            String division_name;
            String userName;

            Employee employee;
            while(rs.next()){
                employee_id = rs.getInt("employee_id");
                employee_name = rs.getString("employee_name");
                employee_birthday = rs.getString("employee_birthday");
                employee_id_card = rs.getString("employee_id_card");
                employee_salary = rs.getDouble("employee_salary");
                employee_phone = rs.getString("employee_phone");
                employee_email = rs.getString("employee_email");
                employee_address = rs.getString("employee_address");
                position_name = rs.getString("position_name");
                education_degree_name = rs.getString("education_degree_name");
                division_name = rs.getString("division_name");
                userName = rs.getString("userName");
                employee = new Employee(employee_id, employee_name, employee_birthday, employee_id_card
                        , employee_salary, employee_phone, employee_email, employee_address
                        , position_name, education_degree_name, division_name, userName);
                employeeList.add(employee);
            }
        }catch (SQLException e){
            System.out.println("method= returnListService, occur error= SQLException ");
            e.printStackTrace();
        }
        return employeeList;

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public Employee selectEmployeeById(int id){
        Employee employee = new Employee();
        System.out.println(SELECT_EMPLOYEE_BY_ID_SQL);
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(SELECT_EMPLOYEE_BY_ID_SQL)
        ){
            callableStatement.setInt(1, id);
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()){
                employee.setId(rs.getInt("employee_id"));
                employee.setName(rs.getString("employee_name"));
                employee.setBirthday(rs.getString("employee_birthday"));
                employee.setIdCard(rs.getString("employee_id_card"));
                employee.setSalary(rs.getDouble("employee_salary"));
                employee.setPhone(rs.getString("employee_phone"));
                employee.setEmail(rs.getString("employee_email"));
                employee.setAddress(rs.getString("employee_phone"));
                employee.setPosName(rs.getString("position_name"));
                employee.setDegName(rs.getString("education_degree_name"));
                employee.setDivName(rs.getString("division_name"));
                employee.setUserName(rs.getString("userName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("method= selectEmployeeById, occur error= SQLException ");
        }
        return employee;
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public List<Employee> searchEmployeeByName(String subName){
        List<Employee> employeeList = new ArrayList<>();
        System.out.println(SELECT_EMPLOYEE_BY_NAME_SQL);
        employeeList = returnListEmployee(SELECT_EMPLOYEE_BY_NAME_SQL);
        return employeeList;
    }

//
//        try(Connection connection = Lib.getConnection();
//            CallableStatement callableStatement = connection.prepareCall(SELECT_EMPLOYEE_BY_NAME_SQL)
//        ){
//            System.out.println(callableStatement);
//            callableStatement.setString(1, subName);
//            ResultSet rs = callableStatement.executeQuery();
//            int id;
//            String name;
//            String birthday;
//            String idCard;
//            Double salary;
//            String phone;
//            String email;
//            String address;
//            String positionName;
//            String degreeName;
//            String divisionName;
//            String userName;
//
//            Employee employee;
//            while (rs.next()){
//                id =rs.getInt("employee_id");
//                name = rs.getString("employee_name");
//                birthday = rs.getString("employee_birthday");
//                idCard = rs.getString("employee_id_card");
//                salary = rs.getDouble("employee_salary");
//                phone = rs.getString("employee_phone");
//                email = rs.getString("employee_email");
//                address = rs.getString("employee_address");
//                positionName = rs.getString("position_name");
//                degreeName = rs.getString("education_degree_name");
//                divisionName = rs.getString("division_name");
//                userName = rs.getString("userName");
//                employee = new Employee(id, name, birthday, idCard, salary, phone, email, address,
//                        positionName, degreeName, divisionName, userName);
//                employeeList.add(employee);
//            }
//        }catch (SQLException e){
//            System.out.println("method= selectAllUser, occur error= SQLException ");
//            e.printStackTrace();
//        }
//        return employeeList;






    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void updateEmployeeSQL(Employee employee){
        System.out.println("Method: updateEmployeeSQL: " + UPDATE_EMPLOYEE_SQL);
        addUpdateEmployeeSQL(UPDATE_EMPLOYEE_SQL, employee);
    }

//
//
//        try(Connection connection = Lib.getConnection();
//            CallableStatement callableStatement = connection.prepareCall(UPDATE_EMPLOYEE_SQL))
//        {
//            callableStatement.setInt(1, employee.getId());
//            callableStatement.setString(2, employee.getName());
//            callableStatement.setString(3, employee.getBirthday());
//            callableStatement.setString(4, employee.getIdCard());
//            callableStatement.setDouble(5, employee.getSalary());
//            callableStatement.setString(6, employee.getPhone());
//            callableStatement.setString(7, employee.getEmail());
//            callableStatement.setString(8, employee.getAddress());
//            callableStatement.setInt(9, employee.getPositionId());
//            callableStatement.setInt(10, employee.getDegreeId());
//            callableStatement.setInt(11, employee.getDivisionId());
//            callableStatement.setString(12, employee.getUserName());
//
//            System.out.println(callableStatement);
//            boolean updateStatus = callableStatement.executeUpdate() >0;
//            System.out.println("Status update = " + updateStatus);
//        }catch (SQLException e){
//            System.out.println("method= updateEmployeeSQL, occur error= SQLException ");
//            e.printStackTrace();
//        }






    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void removeEmployeeById(int id){
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(DELETE_EMPLOYEE_SQL);
        ){
            callableStatement.setInt(1, id);
            System.out.println(callableStatement);
            boolean removeStatus = callableStatement.executeUpdate() >0;
            System.out.println("Status update = " + removeStatus);
        }
        catch (SQLException e){
            System.out.println("method= removeEmployeeById, occur error= SQLException ");
            e.printStackTrace();
        }

    }


    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void insertEmployeeSql(Employee employee){
        System.out.println(INSERT_EMPLOYEE_SQL);
        addUpdateEmployeeSQL(INSERT_EMPLOYEE_SQL, employee);
    }

//        try(Connection connection = Lib.getConnection();
//            CallableStatement callableStatement = connection.prepareCall(INSERT_EMPLOYEE_SQL)
//        ){
//            callableStatement.setInt(1,employee.getId());
//            callableStatement.setString(2,employee.getName());
//            callableStatement.setString(3,employee.getBirthday());
//            callableStatement.setString(4,employee.getIdCard());
//            callableStatement.setDouble(5,employee.getSalary());
//            callableStatement.setString(6,employee.getPhone());
//            callableStatement.setString(7,employee.getEmail());
//            callableStatement.setString(8,employee.getAddress());
//            callableStatement.setInt(9,employee.getPositionId());
//            callableStatement.setInt(10,employee.getDegreeId());
//            callableStatement.setInt(11,employee.getDivisionId());
//            callableStatement.setString(12,employee.getUserName());
//
//            System.out.println(callableStatement);
//            callableStatement.executeUpdate();
//        }catch (SQLException e){
//            System.out.println("method= insertEmployeeSql, occur error= SQLException ");
//            e.printStackTrace();
//            e.getErrorCode();
//        }


    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public List<Employee> selectAllEmployee(){
        List<Employee> employeeList = new ArrayList<>();
        System.out.println(SELECT_ALL_EMPLOYEE);
        employeeList = returnListEmployee(SELECT_ALL_EMPLOYEE);
        return employeeList;
    }




//        try(Connection connection = Lib.getConnection();
//    CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_EMPLOYEE)
//        ){
//        System.out.println(callableStatement);
//        ResultSet rs = callableStatement.executeQuery();
//        int id;
//        String name;
//        String birthday;
//        String idCard;
//        Double salary;
//        String phone;
//        String email;
//        String address;
//        String posName;
//        String degName;
//        String divName;
//        String userName;
//
//        Employee employee;
//        while (rs.next()){
//            id =rs.getInt("employee_id");
//            name = rs.getString("employee_name");
//            birthday = rs.getString("employee_birthday");
//            idCard = rs.getString("employee_id_card");
//            salary = rs.getDouble("employee_salary");
//            phone = rs.getString("employee_phone");
//            email = rs.getString("employee_email");
//            address = rs.getString("employee_address");
//            posName = rs.getString("position_name");
//            degName = rs.getString("education_degree_name");
//            divName = rs.getString("division_name");
//            userName = rs.getString("userName");
//            employee = new Employee(id, name, birthday, idCard, salary, phone, email, address,
//                    posName, degName, divName, userName);
//
//            employeeList.add(employee);
//        }
//    }catch (SQLException e){
//        System.out.println("method= selectAllUser, occur error= SQLException ");
//        e.printStackTrace();
//    }

//__+__+__+__+__+__+__+__+__+__+__+__+__
//__+__+__+__+__+__+__+__+__+__+__+__+__
}
