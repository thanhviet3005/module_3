package services.employeeService;

import common.Lib;
import models.employee.Degree;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DegreeService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudymvc?useSSL=false";
    private String jdbcACC = "root";
    private String jdbcPASS= "cuchinhlan";

    private static final String SELECT_ALL_DEGREE =
            "{CALL getAllDegree}";


    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public List<Degree> selectAllDegree(){
        List<Degree> degreeList = new ArrayList<>();

        System.out.println(SELECT_ALL_DEGREE);
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_DEGREE)
        ){
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            int id;
            String degreeName;

            Degree degree;
            while (rs.next()){
                id =rs.getInt("education_degree_id");
                degreeName = rs.getString("education_degree_name");

                degree = new Degree(id, degreeName);
                degreeList.add(degree);
            }
        }catch (SQLException e){
            System.out.println("method= selectAllPosition, occur error= SQLException ");
            e.printStackTrace();
        }
        return degreeList;
    }


//__+__+__+__+__+__+__+__+__+__+__+__+__
}
