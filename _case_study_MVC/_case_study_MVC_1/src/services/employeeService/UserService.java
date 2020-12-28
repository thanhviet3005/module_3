package services.employeeService;

import common.Lib;
import models.employee.User;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    private static final String SELECT_ALL_USER =
            "{CALL getAllUser}";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public List<User> selectAllUser(){
        List<User> userList = new ArrayList<>();

        System.out.println(SELECT_ALL_USER);
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_USER)
        ){
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            String nameU;
            String pass;

            User user;
            while (rs.next()){
                nameU =rs.getString("userName");
                pass = rs.getString("passWord");
                user = new User(nameU, pass);
                userList.add(user);
            }
        }catch (SQLException e){
            System.out.println("method= selectAllDivision, occur error= SQLException ");
            e.printStackTrace();
        }
        return userList;
    }

//__+__+__+__+__+__+__+__+__+__+__+__+__
//__+__+__+__+__+__+__+__+__+__+__+__+__
}
