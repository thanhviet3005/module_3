package services;

import models.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private String jdbcACC = "root";
    private String jdbcPASS= "cuchinhlan";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private static final String SELECT_ALL_USER = "SELECT * FROM users;";
    private static final String SELECT_USER_BY_ID =
            "SELECT id, `name`, email, country FROM users WHERE id=?;";
    private static final String INSERT_USER_SQL =
            "INSERT INTO users (`name`, email, country) VALUE (?, ?, ?);";
    private static final String UPDATE_USER =
            "UPDATE users SET `name` = ?, email = ?, country = ? WHERE id = ?;";
    private static final String DELETE_USER_SQL = "DELETE FROM users WHERE id = ?;";


    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public UserService() {
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    protected Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcACC, jdbcPASS);
        } catch (ClassNotFoundException |SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void deleteUser(int id){
//        boolean rowDelete = false;
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_SQL);
        ){
            System.out.println(preparedStatement);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e){
            printSQLException(e);
        }

//        return rowDelete;
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public User selectById(int id){
        User user = null;
        String name;
        String email;
        String country;
        System.out.println(SELECT_USER_BY_ID);

        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)
        ){
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                name = rs.getString("name");
                email = rs.getString("email");
                country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void updateUser(User user){
//        boolean rowUpdate = false;
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER))
        {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, user.getId());
            System.out.println(preparedStatement);
//            rowUpdate=
            preparedStatement.executeUpdate();

        }catch (SQLException e){
            printSQLException(e);
        }
//        return rowUpdate;
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public List<User> selectAllUser(){
        List<User> userList = new ArrayList<>();
        System.out.println(SELECT_ALL_USER);
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER)
        ){
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            int id;
            String name;
            String email;
            String address;
            while (rs.next()){
                id = rs.getInt("id");
                name = rs.getString("name");
                email = rs.getString("email");
                address = rs.getString("country");
                userList.add(new User(id, name, email, address));
            }

        }catch (SQLException e){
            printSQLException(e);
        }
        return userList;
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void insertUser(User user){
        System.out.println(INSERT_USER_SQL);
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL))
        {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);  // sao phai co lenh nay
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            printSQLException(e);
        }
    }




    //__+__+__+__+__+__+__+__+__+__+__+__+__
    private void printSQLException(SQLException ex) {
        for(Throwable e: ex ){
            if(e instanceof SQLException){
                e.printStackTrace(System.err);
                System.err.println("SQLState "+ ((SQLException) e).getSQLState());
                System.err.println("Error code "+ ((SQLException) e).getErrorCode());
                System.err.println("Message "+ e.getMessage());
                Throwable t = ex.getCause();
                while (t!=null){
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

//__+__+__+__+__+__+__+__+__+__+__+__+__




//__+__+__+__+__+__+__+__+__+__+__+__+__
}
