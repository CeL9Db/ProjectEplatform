package connectionDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
    
    private static final String URL = "jdbc:postgresql://localhost:5432/register";
    private static final String USER = "postgres";
    private static final String PASSWORD = "1234";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("org.postgresql.Driver");

            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            
            System.out.println("!--- Connection to DB is successful ---!");
            
        } catch (ClassNotFoundException e) {
            System.err.println("Error - driver is not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Error: not possible to connect to the DB.");
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Message: " + e.getMessage());
        }
        return connection;
    }
}