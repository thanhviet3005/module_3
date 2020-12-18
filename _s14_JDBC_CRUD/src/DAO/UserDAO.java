package DAO;

import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "cuchinhlan";

    private static final String INSERT_USERS_SQL = "insert into users"
            + "  (name, email, country) VALUES "
            + " (?, ?, ?);";
    private static final String SELECT_ALL_USER_BY_ID = "select id, name, email, country" +
            "from users where id = ?";
    private static final String SELECT_ALL_USER = "select * from users";
    private static final String DELETE_USER = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users " +
            "set name = ?, email =?, country=?, where id=?;";

    //+++++++++++++++++++++++++++++++
    public UserDAO() {
    }

//+++++++++++++++++++++++++++++++
    protected Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    //+++++++++++++++++++++++++++++++
    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try(Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)
        ){
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            printSQLException(e);    //???
        }

    }

    //+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_
    private void printSQLException(SQLException e) {
        for(Throwable e: ex){                                       //???
            if(e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());    //???
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();                                       //???
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }

        }

    }

    //+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_
    @Override
    public User selectUser(int id) {
        User user = null;
        // Step 1: Establishing a Connection
        try(Connection connection = getConnection();
        // Step 2: Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER_BY_ID);
        ){
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
        // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
        // Step 4: Process the ResultSet object
            while (rs.next()){
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        }catch(SQLException e){
            printSQLException(e);
        }
        return  user;
    }

    //+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_
    @Override
    public List<User> selectAllUser() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List<User> users = new ArrayList<>();
        // Step 1: Establishing a Connection
        try(Connection connection = getConnection();
        // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER);
        ){
            System.out.println(preparedStatement);
        // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

        // Step 4: Process the ResultSet object.
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        }catch (SQLException e){
            printSQLException(e);
        }
        return users;
    }

    //+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_
    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try(
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER);

        ){

        }catch(SQLException e){
            printSQLException(e);
        }



        return false;
    }
    //+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_
    @Override
    public boolean updateUser(User user) throws SQLException {
        return false;
    }
    //+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_
}
