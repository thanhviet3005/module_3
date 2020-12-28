package services.resortService;


import common.Lib;
import models.service.ServiceTypeModel;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudymvc?useSSL=false";
    private String jdbcACC = "root";
    private String jdbcPASS= "cuchinhlan";

    private static final String SELECT_ALL_SERVICE_TYPE =
            "{CALL getAllServiceType}";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public List<ServiceTypeModel> selectAllServiceType(){
        List<ServiceTypeModel> serviceTypeList = new ArrayList<>();
        int serviceTypeId;
        String serviceTypeName;

        ServiceTypeModel serviceTypeModel;
        System.out.println(SELECT_ALL_SERVICE_TYPE);
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_SERVICE_TYPE)
        ){
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()){
                serviceTypeId =rs.getInt("service_type_id");
                serviceTypeName = rs.getString("service_type_name");
                serviceTypeModel = new ServiceTypeModel(serviceTypeId,serviceTypeName);
                serviceTypeList.add(serviceTypeModel);
            }
        }catch (SQLException e){
            System.out.println("method= selectAllServiceType, occur error= SQLException ");
            e.printStackTrace();
        }
        return serviceTypeList;
    }

//__+__+__+__+__+__+__+__+__+__+__+__+__
}
