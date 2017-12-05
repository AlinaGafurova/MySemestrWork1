package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//singleton
public class DbConnector {
    private static Connection conn;

    private DbConnector() {
    }

    public static Connection getConnection() {
        if (conn == null) {
            try {
                //загрузка класса, чтобы Томкат увидел его
                Class.forName("org.postgresql.Driver");
                conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/enzhe",
                        "postgres", "lolxaxlol");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return conn;
    }
}
