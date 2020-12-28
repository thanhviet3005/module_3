package services.employeeService;

import common.Lib;
import models.employee.Division;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DivisionService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudymvc?useSSL=false";
    private String jdbcACC = "root";
    private String jdbcPASS= "cuchinhlan";

    private static final String SELECT_ALL_DIVISION =
            "{CALL getAllDivision}";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public List<Division> selectAllDivision(){
        List<Division> divisionList = new ArrayList<>();

        System.out.println(SELECT_ALL_DIVISION);
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_DIVISION)
        ){
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            int id;
            String divName;

            Division division;
            while (rs.next()){
                id =rs.getInt("division_id");
                divName = rs.getString("division_name");

                division = new Division(id, divName);
                divisionList.add(division);
            }
        }catch (SQLException e){
            System.out.println("method= selectAllDivision, occur error= SQLException ");
            e.printStackTrace();
        }
        return divisionList;
    }

//__+__+__+__+__+__+__+__+__+__+__+__+__
}
