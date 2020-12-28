package services.employeeService;

import common.Lib;
import models.employee.Position;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PositionService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudymvc?useSSL=false";
    private String jdbcACC = "root";
    private String jdbcPASS= "cuchinhlan";

    private static final String SELECT_ALL_POSITION =
            "{CALL getAllPosition}";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    protected Connection getConnection() {
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
    public List<Position> selectAllPosition(){
        List<Position> empPositionList = new ArrayList<>();

        System.out.println(SELECT_ALL_POSITION);
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_POSITION)
        ){
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            int id;
            String posName;
            Position employeePosition;
            while (rs.next()){
                id =rs.getInt("position_id");
                posName = rs.getString("position_name");

                employeePosition = new Position(id, posName);
                empPositionList.add(employeePosition);
            }
        }catch (SQLException e){
            System.out.println("method= selectAllPosition, occur error= SQLException ");
            e.printStackTrace();
        }
        return empPositionList;
    }

//__+__+__+__+__+__+__+__+__+__+__+__+__
}
