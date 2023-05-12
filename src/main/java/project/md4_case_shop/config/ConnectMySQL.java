package project.md4_case_shop.config;

import sun.dc.pr.PRError;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectMySQL {
    private static Connection connection;
    private static final String URL = System.getenv("URL");
    private static final String USER = System.getenv("USER");
    private static final String PASS = System.getenv("PASS");
    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL,USER,PASS);
            System.out.println("Kết nối thành công");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Kết nối thất bại");
            throw new RuntimeException(e);
        }
        return connection;
    }
}
