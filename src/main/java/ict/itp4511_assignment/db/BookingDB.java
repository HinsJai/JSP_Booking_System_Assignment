package ict.itp4511_assignment.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/27 - 03 - 27 - 上午 03:57
 * @Description: ict.itp4511_assignment.db
 * @version: 1.0
 */
public class BookingDB {
    private String dbUser;
    private String dbPassword;
    private String dbUrl;

    public BookingDB(String dbUrl, String dbUser, String dbPassword) {
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

    public void createBookingTable() {
        try {
            Connection conn = getConnection();
            String sql = "Create table if not exists booking (" + "bookingID int(5) AUTO_INCREMENT PRIMARY KEY ," + "userID int(5) not null," + "bookingDate date not null," + "pickupDate date not null," + "returnDate date not null," + "status ENUM('Pending', 'Approved', 'Declined', 'Completed', 'Cancelled') not null default 'Pending'," + "rejectReason varchar(255)," + "FOREIGN KEY (userID) REFERENCES userInfo(userID))";
//                    "FOREIGN KEY (equipmentID) REFERENCES equipment(equipmentID))";
            conn.createStatement().execute(sql);
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

    public boolean createBooking(int bookingID, int userID, String bookingDate, String pickupDate, String returnDate) {
        boolean result = false;
        PreparedStatement pStmt = null;
        Connection conn = null;
        try {
            conn = getConnection();
            String sql = "INSERT INTO  booking (bookingID,userID,bookingDate,pickupDate,returnDate) values (?,?,?,?,?)";
            pStmt = conn.prepareStatement(sql);
            pStmt.setInt(1, bookingID);
            pStmt.setInt(2, userID);
            pStmt.setString(3, bookingDate);
            pStmt.setString(4, pickupDate);
            pStmt.setString(5, returnDate);
            int rowCount = pStmt.executeUpdate();
            if (rowCount > 0) {
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
