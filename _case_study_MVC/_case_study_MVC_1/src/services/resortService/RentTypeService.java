package services.resortService;

import common.Lib;
import models.service.RentTypeModel;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudymvc?useSSL=false";
    private String jdbcACC = "root";
    private String jdbcPASS= "cuchinhlan";

    private static final String SELECT_ALL_RENT_TYPE =
            "{CALL getAllRentType}";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public List<RentTypeModel> selectAllRentType(){
        List<RentTypeModel> rentTypeModelList = new ArrayList<>();

        System.out.println(SELECT_ALL_RENT_TYPE);
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_RENT_TYPE)
        ){
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            int rentTypeId;
            String rentTypeName;
            Double rentTypeCost;

            RentTypeModel rentTypeModel;
            while (rs.next()){
                rentTypeId =rs.getInt("rent_type_id");
                rentTypeName = rs.getString("rent_type_name");
                rentTypeCost = rs.getDouble("rent_type_cost");

                rentTypeModel = new RentTypeModel(rentTypeId, rentTypeName, rentTypeCost);
                rentTypeModelList.add(rentTypeModel);
            }
        }catch (SQLException e){
            System.out.println("method= selectAllPosition, occur error= SQLException ");
            e.printStackTrace();
        }
        return rentTypeModelList;
    }




}
