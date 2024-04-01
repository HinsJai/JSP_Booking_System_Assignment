package ict.itp4511_assignment.db;

import ict.itp4511_assignment.bean.EquipmentBean;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/31 - 03 - 31 - 下午 04:29
 * @Description: ict.itp4511_assignment.db
 * @version: 1.0
 */
public class BookingEquipmentDB {
    private String dbUser;
    private String dbPassword;
    private String dbUrl;

    public BookingEquipmentDB(String dbUrl, String dbUser, String dbPassword) {
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

    public void createBookingEquipmentTable() {
        try {
            Connection conn = getConnection();
            String sql = "Create table if not exists bookingEquipment (" + "bookingEquipmentID int(5) AUTO_INCREMENT PRIMARY KEY ," + "bookingID int(5) not null  ," + "equipmentID int(5) not null," + "FOREIGN KEY (bookingID) REFERENCES booking(bookingID)," + "FOREIGN KEY (equipmentID) REFERENCES equipment(equipmentID))";
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

    public boolean addBookingEquipment(int bookID, ArrayList<EquipmentBean> cardList) {
        boolean result = false;
        PreparedStatement pStmt = null;
        Connection conn = null;
        try {
            for (EquipmentBean item : cardList) {
                conn = getConnection();
                String sql = "INSERT INTO  bookingEquipment (bookingID,equipmentID) values (?,?)";
                pStmt = conn.prepareStatement(sql);
                pStmt.setInt(1, bookID);
                pStmt.setInt(2, item.getEquipmentID());
                int rowCount = pStmt.executeUpdate();
                if (rowCount > 0) {
                    result = true;
                } else {
                    result = false;
                    break;
                }
                conn.close();
            }

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
