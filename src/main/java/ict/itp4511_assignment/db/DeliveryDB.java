package ict.itp4511_assignment.db;

import java.io.IOException;
import java.sql.*;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/27 - 03 - 27 - 上午 04:17
 * @Description: ict.itp4511_assignment.db
 * @version: 1.0
 */
public class DeliveryDB {
    private String dbUrl;
    private String dbUser;
    private String dbPassword;

    public DeliveryDB(String dbUrl, String dbUser, String dbPassword) {
        this.dbUrl = dbUrl;
        this.dbUser = dbUser;
        this.dbPassword = dbPassword;
    }

    public Connection getConnection() throws SQLException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    }

    public void createDeliveryTable() {

        Statement stmnt = null;
        Connection conn = null;
        try {
            conn = getConnection();
            stmnt = conn.createStatement();
            String sql = "Create table if not exists delivery (" + "deliveryID int(5) AUTO_INCREMENT PRIMARY KEY ," + "createDate date not null  DEFAULT (CURRENT_DATE)," + "courierID int(5)  null," + "bookingID int(5) not null," + "userPickupDate date not null," + "deliveryAddress varchar(255) not null," + "status ENUM('Pending', 'InTransit', 'Delivered', 'Cancelled') not null default 'Pending'," + "FOREIGN KEY (bookingID) REFERENCES booking(bookingID)," + "FOREIGN KEY (courierID) REFERENCES userInfo(userID))";
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

    public boolean generateDeliveryNote(int deliveryID, int bookingID, String userPickupDate, String deliveryAddress) {
        PreparedStatement pStmt = null;
        Connection conn = null;
        boolean result = false;
        String sql = "";
        try {
            conn = getConnection();
            sql = "insert into delivery (deliveryID, bookingID, userPickupDate, deliveryAddress) values (?,?,?,?)";
            pStmt = conn.prepareStatement(sql);
            pStmt.setInt(1, deliveryID);
            pStmt.setInt(2, bookingID);
            pStmt.setString(3, userPickupDate);
            pStmt.setString(4, deliveryAddress);
            int count = pStmt.executeUpdate();
            if (count > 0) {
                result = true;
            }
            pStmt.close();
            conn.close();

        } catch (SQLException e) {
            while (e != null) {
                e.printStackTrace();
                e = e.getNextException();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }
}
