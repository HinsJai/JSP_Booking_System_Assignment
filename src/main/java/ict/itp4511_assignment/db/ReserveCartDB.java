package ict.itp4511_assignment.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/30 - 03 - 30 - 下午 10:50
 * @Description: ict.itp4511_assignment.db
 * @version: 1.0
 */
public class ReserveCartDB {
    private String dbUser;
    private String dbPassword;
    private String dbUrl;

    public ReserveCartDB(String dbUrl, String dbUser, String dbPassword) {
        this.dbUser = dbUser;
        this.dbPassword = dbPassword;
        this.dbUrl = dbUrl;
    }

    public Connection getConnection() throws SQLException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    }

    public void createReserveCartTable() {
        Statement stmnt = null;
        Connection conn = null;
        try {
            conn = getConnection();
            stmnt = conn.createStatement();
            String sql = "Create table if not exists ReserveCart (" +
                    "cartID int(5) AUTO_INCREMENT PRIMARY KEY ," +
                    "userID int(5) not null," +
                    "equipmentID int(5) not null," +
                    "FOREIGN KEY (userID) REFERENCES userInfo(userID)," +
                    "FOREIGN KEY (equipmentID) REFERENCES equipment(equipmentID))";
            stmnt.execute(sql);
            stmnt.close();
            conn.close();

        } catch (SQLException e) {
            while (e != null) {
                e.printStackTrace();
                e = e.getNextException();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public boolean addToCart(int userID, int equipmentID) {
        boolean result = false;
        Statement stmnt = null;
        Connection conn = null;
        try {
            conn = getConnection();
            stmnt = conn.createStatement();
            String sql = "Insert into ReserveCart (userID, equipmentID) values " +
                    "(" + userID + ", " + equipmentID + ")";
            int count = stmnt.executeUpdate(sql);
            if (count > 0) {
                result = true;
            }
            stmnt.close();
            conn.close();
        } catch (SQLException e) {
            while (e != null) {
                e.printStackTrace();
                e = e.getNextException();
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return result;
    }
}
