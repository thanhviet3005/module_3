package services.customerService;

import common.Lib;
import models.customer.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudymvc?useSSL=false";
    private String jdbcACC = "root";
    private String jdbcPASS= "cuchinhlan";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private static final String SELECT_ALL_CUSTOMER =
            "{CALL getAllCustomer}";
    private static final String SELECT_CUSTOMER_BY_ID_SQL =
            "{CALL getCustomerById(?)}";
    private static final String INSERT_CUSTOMER_SQL =
            "{CALL insertCustomer(?,?,?,?,?,?,?,?,?)}";
    private static final String UPDATE_CUSTOMER_SQL =
            "{CALL updateCustomer(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
    private static final String DELETE_CUSTOMER_SQL =
            "{CALL deleteCustomerById(?)}";
    private static final String SELECT_CUSTOMER_BY_NAME_SQL =
            "{CALL searchCustomerByName(?)}";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public List<Customer> searchCustomerByName(String subName){
        List<Customer> customerList = new ArrayList<>();
        System.out.println(SELECT_CUSTOMER_BY_NAME_SQL);
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(SELECT_CUSTOMER_BY_NAME_SQL)
        ){
            System.out.println(callableStatement);
            callableStatement.setString(1, subName);
            ResultSet rs = callableStatement.executeQuery();
            int id;
            int typeId;
            String typeName;
            String name;
            String birthday;
            String gender;
            String phone;
            String idCard;
            String email;
            String address;

            Customer customer;
            while (rs.next()){
                id =rs.getInt("customer_id");
                typeId = rs.getInt("customer_type_id");
                typeName = rs.getString("customer_type_name");
                name = rs.getString("customer_name");
                birthday = rs.getString("customer_birthday");
                gender = rs.getString("customer_gender");
                idCard = rs.getString("customer_id_card");
                phone = rs.getString("customer_phone");
                email = rs.getString("customer_email");
                address = rs.getString("customer_address");
                customer = new Customer(id, typeId, typeName ,name, birthday, gender,
                        idCard, phone, email, address);
                customerList.add(customer);
            }
        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("method= searchCustomerByName, occur error= SQLException ");
        }
        return customerList;

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void removeCustomerById(int id){
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(DELETE_CUSTOMER_SQL);
        ){
            callableStatement.setInt(1, id);
            System.out.println(callableStatement);
            boolean removeStatus = callableStatement.executeUpdate() >0;
            System.out.println("Status update = " + removeStatus);
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("method= updateCustomerById, occur error= SQLException ");

        }

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void updateCustomer(Customer customer){
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(UPDATE_CUSTOMER_SQL))
        {
            callableStatement.setInt(1, customer.getId());
            callableStatement.setInt(2, customer.getTypeId());
            callableStatement.setString(3, customer.getName());
            callableStatement.setString(4, customer.getBirthday());
            callableStatement.setString(5, customer.getGender());
            callableStatement.setString(6, customer.getIdCard());
            callableStatement.setString(7, customer.getPhone());
            callableStatement.setString(8,customer.getEmail());
            callableStatement.setString(9, customer.getAddress());

            System.out.println(callableStatement);
            boolean updateStatus = callableStatement.executeUpdate() >0;
            System.out.println("Status update = " + updateStatus);
        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("method= updateCustomerById, occur error= SQLException ");
        }
//        return rowUpdate;
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public Customer selectCustomerById(int id){
        Customer customer = null;
//        int id;
        int typeId;
        String typeName;
        String name;
        String birthday;
        String gender;
        String phone;
        String idCard;
        String email;
        String address;

        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(SELECT_CUSTOMER_BY_ID_SQL)
        ){
            callableStatement.setInt(1, id);
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()){
                typeId = rs.getInt("customer_type_id");
                typeName = rs.getString("customer_type_name");
                name = rs.getString("customer_name");
                birthday = rs.getString("customer_birthday");
                gender = rs.getString("customer_gender");
                phone = rs.getString("customer_phone");
                idCard= rs.getString("customer_id_card");
                email = rs.getString("customer_email");
                address = rs.getString("customer_address");

                customer = new Customer(id, typeId, typeName, name, birthday,
                        gender, phone, idCard, email, address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("method= selectCustomerById, occur error= SQLException ");
        }
        return customer;
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public List<Customer> selectAllCustomer(){
        List<Customer> customerList = new ArrayList<>();
        System.out.println(SELECT_ALL_CUSTOMER);
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_CUSTOMER)
        ){
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            int id;
            int typeId;
            String typeName;
            String name;
            String birthday;
            String gender;
            String phone;
            String idCard;
            String email;
            String address;

            Customer customer;
            while (rs.next()){
                id =rs.getInt("customer_id");
                typeId = rs.getInt("customer_type_id");
                typeName = rs.getString("customer_type_name");
                name = rs.getString("customer_name");
                birthday = rs.getString("customer_birthday");
                gender = rs.getString("customer_gender");
                idCard = rs.getString("customer_id_card");
                phone = rs.getString("customer_phone");
                email = rs.getString("customer_email");
                address = rs.getString("customer_address");
                customer = new Customer(id, typeId, typeName ,name, birthday, gender,
                        idCard, phone, email, address);

                customerList.add(customer);
            }
        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("method= selectAllUser, occur error= SQLException ");
        }
        return customerList;
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void insertCustomer(Customer customer){
        System.out.println(INSERT_CUSTOMER_SQL);
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(INSERT_CUSTOMER_SQL)
        ){
            callableStatement.setInt(1, customer.getId());
            callableStatement.setInt(2, customer.getTypeId());
            callableStatement.setString(3, customer.getName());
            callableStatement.setString(4, customer.getBirthday());
            callableStatement.setString(5, customer.getGender());
            callableStatement.setString(6, customer.getIdCard());
            callableStatement.setString(7, customer.getPhone());
            callableStatement.setString(8, customer.getEmail());
            callableStatement.setString(9, customer.getAddress());

            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        }catch (SQLException e){
            e.getSQLState();
            System.out.println("method= insertUser, occur error= SQLException ");
            e.getErrorCode();
        }
    }

//__+__+__+__+__+__+__+__+__+__+__+__+__
}
