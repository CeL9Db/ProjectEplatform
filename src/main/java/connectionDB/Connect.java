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
            
            System.out.println("--- Подключение к БД выполнено успешно ---");
            
        } catch (ClassNotFoundException e) {
            System.err.println("Ошибка: Драйвер PostgreSQL не найден в библиотеках проекта.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Ошибка: Не удалось подключиться к БД (проверьте URL, логин или пароль).");
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Message: " + e.getMessage());
        }
        return connection;
    }
}