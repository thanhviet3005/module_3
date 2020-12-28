package services.customerService;

import common.Lib;
import models.customer.CustomerType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudymvc?useSSL=false";
    private String jdbcACC = "root";
    private String jdbcPASS= "cuchinhlan";

    private static final String SELECT_ALL_CUSTOMER_TYPE =
            "{CALL getAllCustomerType}";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public List<CustomerType> selectAllCustomerType(){
        List<CustomerType> customerTypeList = new ArrayList<>();
        System.out.println(SELECT_ALL_CUSTOMER_TYPE);
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_CUSTOMER_TYPE)
        ){
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            int id;
            String typeName;

            CustomerType customerType;
            while (rs.next()){
                id =rs.getInt("customer_type_id");
                typeName = rs.getString("customer_type_name");

                customerType = new CustomerType(id, typeName);
                customerTypeList.add(customerType);
            }
        }catch (SQLException e){
            System.out.println("method= selectAllUser, occur error= SQLException ");
            e.printStackTrace();
        }
        return customerTypeList;
    }




    //__+__+__+__+__+__+__+__+__+__+__+__+__
}
