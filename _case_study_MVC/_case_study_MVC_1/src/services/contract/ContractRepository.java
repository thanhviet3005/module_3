package services.contract;

import common.Lib;
import models.contract.Contract;
import repository.RepositoryCRUDF;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements RepositoryCRUDF<Contract> {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudymvc?useSSL=false";
    private String jdbcACC = "root";
    private String jdbcPASS= "cuchinhlan";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private static final String SELECT_ALL_CONTRACT =
            "{CALL getAllContract}";
    private static final String INSERT_CONTRACT_SQL =
            "{CALL insertContract(?,?,?,?,?,?,?,?)}";

    private static final String INSERT_CONTRACT_PSTMT =
            "INSERT INTO contract VALUES (?,?,?,?,?,?,?,?);";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void addUpdateContractPSTMT(String statementCallProcedure, Contract contract){
        System.out.println(statementCallProcedure);
        try(Connection connection = Lib.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(statementCallProcedure))
        {
            preparedStatement.setInt(1, contract.getContract_id());
            preparedStatement.setString(2, contract.getContract_start_date());
            preparedStatement.setString(3, contract.getContract_end_date());
            preparedStatement.setDouble(4, contract.getContract_deposition());

            preparedStatement.setDouble(5, contract.getContract_total_money());
            preparedStatement.setInt(6, contract.getEmployee_id());
            preparedStatement.setInt(7, contract.getCustomer_id());
            preparedStatement.setInt(8, contract.getService_id());

            System.out.println(preparedStatement);
            boolean updateStatus = preparedStatement.executeUpdate() > 0;
            System.out.println("Status update = " + updateStatus);
        }catch (SQLException e){
            System.out.println("method= addUpdateContractSQL, occur error= SQLException ");
            e.printStackTrace();
        }

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private List<Contract> returnListContract(String statementCallProcedure){
        List<Contract> contractList = new ArrayList<>();
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(statementCallProcedure)
        ){
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            int contract_id;
            String contract_start_date;
            String contract_end_date;
            double contract_deposition;
            double contract_total_money;
            String employee_name;
            String customer_name;
            String service_name;

            Contract contract;
            while(rs.next()){
                contract_id = rs.getInt("contract_id");
                contract_start_date = rs.getString("contract_start_date");
                contract_end_date = rs.getString("contract_end_date");
                contract_deposition = rs.getDouble("contract_deposition");

                contract_total_money = rs.getDouble("contract_total_money");
                employee_name = rs.getString("employee_name");
                customer_name = rs.getString("customer_name");
                service_name = rs.getString("service_name");

                contract = new Contract(contract_id, contract_start_date, contract_end_date, contract_deposition
                        , contract_total_money, employee_name, customer_name, service_name);

                contractList.add(contract);
            }
        }catch (SQLException e){
            System.out.println("method= returnListContract, occur error= SQLException ");
            e.printStackTrace();
        }
        return contractList;

    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void addUpdateContractSQL(String statementCallProcedure, Contract contract){
        System.out.println(statementCallProcedure);
        try(Connection connection = Lib.getConnection();
            CallableStatement callableStatement = connection.prepareCall(statementCallProcedure))
        {
            callableStatement.setInt(1, contract.getContract_id());
            callableStatement.setString(2, contract.getContract_start_date());
            callableStatement.setString(3, contract.getContract_end_date());
            callableStatement.setDouble(4, contract.getContract_deposition());

            callableStatement.setDouble(5, contract.getContract_total_money());
            callableStatement.setInt(6, contract.getEmployee_id());
            callableStatement.setInt(7, contract.getCustomer_id());
            callableStatement.setInt(8, contract.getService_id());

            System.out.println(callableStatement);
            boolean updateStatus = callableStatement.executeUpdate() > 0;
            System.out.println("Status update = " + updateStatus);
        }catch (SQLException e){
            System.out.println("method= addUpdateContractSQL, occur error= SQLException ");
            e.printStackTrace();
        }

    }




    //__+__+__+__+__+__+__+__+__+__+__+__+__
    @Override
    public List<Contract> getAll() {
        System.out.println(SELECT_ALL_CONTRACT);
        List<Contract> contractList = returnListContract(SELECT_ALL_CONTRACT);
        return contractList;
    }

    @Override
    public void insertNew(Contract contract) {
        addUpdateContractPSTMT(INSERT_CONTRACT_PSTMT, contract);
    }

    @Override
    public void update(Contract contract) {

    }

    @Override
    public void removeById(Contract contract) {

    }

    @Override
    public Contract getById(int id) {
        return null;
    }

    @Override
    public List<Contract> searchByName(String subName) {
        return null;
    }


//__+__+__+__+__+__+__+__+__+__+__+__+__
//__+__+__+__+__+__+__+__+__+__+__+__+__
}
