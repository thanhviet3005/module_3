package services;

import models.Customer;

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
            "{CALL updateCustomer(?,?,?,?,?,?,?,?,?)}";
    private static final String DELETE_CUSTOMER_SQL =
            "{CALL deleteCustomerById(?)}";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    protected Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcACC, jdbcPASS);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }


    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public List<Customer> selectAllUser(){
        List<Customer> customerList = new ArrayList<>();
        System.out.println(SELECT_ALL_CUSTOMER);
        try(Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_CUSTOMER)
        ){
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            int id;
            int typeId;
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
                name = rs.getString("customer_name");
                birthday = rs.getString("customer_birthday");
                gender = rs.getString("customer_gender");
                idCard = rs.getString("customer_id_card");
                phone = rs.getString("customer_phone");
                email = rs.getString("customer_email");
                address = rs.getString("customer_address");
//                customer = new Customer(id, typeId, name, birthday, gender,
//                        idCard, phone, email, address);

                customerList.add(new Customer(id, typeId, name, birthday, gender,
                        idCard, phone, email, address));
            }
        }catch (SQLException e){
            System.out.println("method= selectAllUser, occur error= SQLException ");
            e.getSQLState();
            e.getErrorCode();
        }
        return customerList;
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void insertCustomer(Customer customer){
        System.out.println(INSERT_CUSTOMER_SQL);
        try(Connection connection = getConnection();
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
            System.out.println("method= insertUser, occur error= SQLException ");
            e.getSQLState();
            e.getErrorCode();
        }
    }


}
