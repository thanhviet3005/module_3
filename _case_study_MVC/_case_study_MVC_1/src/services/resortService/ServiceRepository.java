package services.resortService;

import common.Lib;
import models.service.ServiceModel;
import repository.RepositoryCRUDF;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepository implements RepositoryCRUDF<ServiceModel> {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudymvc?useSSL=false";
    private String jdbcACC = "root";
    private String jdbcPASS= "cuchinhlan";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private static final String SELECT_ALL_SERVICE =
            "{CALL getAllService}";
    private static final String INSERT_SERVICE_SQL =
            "{CALL insertService(?,?,?,?,?,?,?,?,?,?,?)}";
//    private static final String DELETE_EMPLOYEE_SQL =
//            "{CALL deleteEmployeeById(?)}";
//    private static final String UPDATE_EMPLOYEE_SQL =
//            "{CALL updateEmployee(?,?,?,?,?,?,?,?,?,?,?,?)}";
//    private static final String SELECT_EMPLOYEE_BY_ID_SQL =
//            "{CALL getEmployeeById(?)}";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void addUpdateServiceSQL(String statementCallProcedure, ServiceModel serviceModel){
        System.out.println(statementCallProcedure);
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(statementCallProcedure)
        ){
            callableStatement.setInt(1, serviceModel.getServiceId());
            callableStatement.setString(2, serviceModel.getServiceName());
            callableStatement.setDouble(3, serviceModel.getServiceArea());
            callableStatement.setDouble(4, serviceModel.getServiceCost());
            callableStatement.setInt(5, serviceModel.getServiceMaxPeople());

            callableStatement.setInt(6, serviceModel.getRentTypeId());
            callableStatement.setInt(7, serviceModel.getServiceTypeId());
            callableStatement.setString(8, serviceModel.getStandardRoom());
            callableStatement.setString(9, serviceModel.getOtherConvenient());
            callableStatement.setDouble(10, serviceModel.getPoolArea());

            callableStatement.setInt(11, serviceModel.getNumberOfFloor());

            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        }catch (SQLException e){
            System.out.println("method= insertNew(ServiceModel serviceModel), " +
                    "occur error= SQLException ");
            e.printStackTrace();
            e.getErrorCode();
        }

    }


    public List<ServiceModel> returnListService(String statementCallProcedure){
        List<ServiceModel> serviceModelList = new ArrayList<>();
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(statementCallProcedure)
        ){
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            int serviceId;
            String serviceName;
            int serviceArea;
            double serviceCost;
            int serviceMaxPeople;
            String rentTypeName;
            double rentTypeCost;
            String serviceTypeName;
            String standardRoom;
            String otherConvenient;
            double poolArea;
            int numberOfFloor;

            ServiceModel serviceModel;
            while (rs.next()){
                serviceId = rs.getInt("service_id");
                serviceName = rs.getString("service_name");
                serviceArea = rs.getInt("service_area");
                serviceCost = rs.getDouble("service_cost");
                serviceMaxPeople = rs.getInt("service_max_people");
                rentTypeName = rs.getString("rent_type_name");
                rentTypeCost = rs.getDouble("rent_type_cost");
                serviceTypeName = rs.getString("service_type_name");
                standardRoom = rs.getString("standard_room");
                otherConvenient = rs.getString("description_other_convenient");
                poolArea = rs.getDouble("pool_area");
                numberOfFloor = rs.getInt("number_of_floors");

                serviceModel = new ServiceModel(serviceId, serviceName, serviceArea, serviceCost
                        , serviceMaxPeople, rentTypeName, rentTypeCost, serviceTypeName
                        , standardRoom, otherConvenient, poolArea, numberOfFloor);

                serviceModelList.add(serviceModel);
            }
        }catch (SQLException e){
            System.out.println("method= returnListService, occur error= SQLException ");
            e.printStackTrace();
        }
        return serviceModelList;
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    @Override
    public List<ServiceModel> getAll() {
        List<ServiceModel> serviceModelList = new ArrayList<>();
        System.out.println(SELECT_ALL_SERVICE);
        return serviceModelList = returnListService(SELECT_ALL_SERVICE);
    }

    @Override
    public void insertNew(ServiceModel serviceModel) {
        addUpdateServiceSQL(INSERT_SERVICE_SQL, serviceModel);

    }


    @Override
    public void update(ServiceModel serviceModel) {

    }

    @Override
    public void removeById(ServiceModel serviceModel) {

    }

    @Override
    public ServiceModel getById(int id) {
        return null;
    }

    @Override
    public List<ServiceModel> searchByName(String subName) {

        return null;
    }




//__+__+__+__+__+__+__+__+__+__+__+__+__
//__+__+__+__+__+__+__+__+__+__+__+__+__
}
