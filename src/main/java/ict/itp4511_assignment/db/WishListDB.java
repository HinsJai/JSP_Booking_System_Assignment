package ict.itp4511_assignment.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/30 - 03 - 30 - 上午 01:28
 * @Description: ict.itp4511_assignment.db
 * @version: 1.0
 */
public class WishListDB {
    private String dbUser;
    private String dbPassword;
    private String dbUrl;

    public WishListDB(String dbUrl, String dbUser, String dbPassword) {
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

    public void createWishListTable() {
        Statement stmnt = null;
        Connection conn = null;
        try {
            conn = getConnection();
            stmnt = conn.createStatement();
            String sql = "Create table if not exists wishList (" + "wishID int(5) AUTO_INCREMENT PRIMARY KEY ," + "userID int(5) not null," + "equipmentID int(5) not null," + "FOREIGN KEY (userID) REFERENCES userInfo(userID)," + "FOREIGN KEY (equipmentID) REFERENCES equipment(equipmentID))";
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

    public boolean addWishList(int userID, int equipmentID) {
        boolean result = false;
        Statement stmnt = null;
        Connection conn = null;
        try {
            conn = getConnection();
            String sql = "INSERT INTO wishList (userID, equipmentID) VALUES (" + userID + ", " + equipmentID + ")";
            stmnt = conn.createStatement();
            int count = stmnt.executeUpdate(sql);
            if (count > 0) {
                result = true;
            }
            conn.close();
        } catch (SQLException e) {
            while (e != null) {
                e.printStackTrace();
                e = e.getNextException();
            }
            return false;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return result;
    }
}
