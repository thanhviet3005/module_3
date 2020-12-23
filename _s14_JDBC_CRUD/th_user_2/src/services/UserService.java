package services;

import models.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo2?useSSL=false";
    private String jdbcACC = "root";
    private String jdbcPASS= "cuchinhlan";

//__+__+__+__+__+__+__+__+__+__+__
    private static final String SELECT_ALL_USER = "SELECT * FROM users;";
    private static final String SELECT_USER_BY_ID =
            "SELECT id, `name`, age, gender, email, country FROM users WHERE id=?;";
    private static final String INSERT_USER_SQL =
            "{call insertUser(?,?,?,?,?)}";
//                "INSERT INTO users (`name`, email, country) VALUE (?, ?, ?);";
    private static final String UPDATE_USER =
            "UPDATE users SET `name` = ?, age = ?, gender = ?, email = ?, country = ? " +
                    "WHERE id = ?;";
    private static final String DELETE_USER_SQL = "DELETE FROM users WHERE id = ?;";

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    protected Connection getConnection(){
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
    public User selectById(int id){
        User user = null;
        String name;
        int age;
        String gender;
        String email;
        String country;
        String query = "{CALL get_user_by_id(?)}";
        try(Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(query);
        ){
            callableStatement.setInt(1, id);
            System.out.println("__+__+__+__"+ callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()){
                name = rs.getString("name");
                age = rs.getInt("age");
                gender = rs.getString("gender");
                email = rs.getString("email");
                country = rs.getString("country");
                user = new User(id, name, age, gender, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }

        return user;
    }
//
//        User user = null;
//        String name;
//        int age;
//        String gender;
//        String email;
//        String country;
//        System.out.println(SELECT_USER_BY_ID);
//
//        try(Connection connection = getConnection();
//            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)
//        ){
//            preparedStatement.setInt(1, id);
//            System.out.println(preparedStatement);
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()){
//                name = rs.getString("name");
//                age = rs.getInt("age");
//                gender = rs.getString("gender");
//                email = rs.getString("email");
//                country = rs.getString("country");
//                user = new User(id, name, age, gender, email, country);
//            }
//        } catch (SQLException e) {
//            printSQLException(e);
//        }


    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void deleteUser(int id){
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_SQL);
        ){
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e){
            printSQLException(e);
        }
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
            int age;
            String gender;
            String email;
            String address;
            while (rs.next()){
                id = rs.getInt("id");
                name = rs.getString("name");
                age = rs.getInt("age");
                gender = rs.getString("gender");
                email = rs.getString("email");
                address = rs.getString("country");
                userList.add(new User(id, name, age, gender, email, address));
            }

        }catch (SQLException e){
            printSQLException(e);
        }
        return userList;
    }

    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void insertUser(User user){
//        String query = "{call insertUser(?,?,?,?,?)}";
        try(Connection connection = getConnection();
            CallableStatement callableStatement = connection.prepareCall(INSERT_USER_SQL)
        ){
            callableStatement.setString(1, user.getName());
            callableStatement.setInt(2, user.getAge());
            callableStatement.setString(3, user.getGender());
            callableStatement.setString(4, user.getEmail());
            callableStatement.setString(5, user.getCountry());
            System.out.println("__+__+__+__+__ "+ callableStatement);
            callableStatement.executeUpdate();
        }catch (SQLException e){
        printSQLException(e);
        }
    }
//            System.out.println(INSERT_USER_SQL);
//        try(Connection connection = getConnection();
//    PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL))
//    {
//        preparedStatement.setString(1, user.getName());
//        preparedStatement.setInt(2, user.getAge());
//        preparedStatement.setString(3, user.getGender());
//        preparedStatement.setString(4, user.getEmail());
//        preparedStatement.setString(5, user.getCountry());
//        System.out.println(preparedStatement);
//        preparedStatement.executeUpdate();
//    }catch (SQLException e){
//        printSQLException(e);
//    }


    //__+__+__+__+__+__+__+__+__+__+__+__+__
    public void updateUser(User user){

        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER))
        {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setInt(2, user.getAge());
            preparedStatement.setString(3, user.getGender());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getCountry());
            preparedStatement.setInt(6, user.getId());

            System.out.println(preparedStatement);
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



//__+__+__+__+__+__+__+__+__+__+__
}
