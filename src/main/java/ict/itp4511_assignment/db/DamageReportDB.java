package ict.itp4511_assignment.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/27 - 03 - 27 - 上午 04:25
 * @Description: ict.itp4511_assignment.db
 * @version: 1.0
 */
public class DamageReportDB {

    private String dbUser;
    private String dbPassword;
    private String dbUrl;

    public DamageReportDB(String dbUrl, String dbUser, String dbPassword) {
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

    public void createDamageReportTable() {
        try {
            Connection conn = getConnection();
            String sql = "Create table if not exists damageReport (" +
                    "reportID int(5) AUTO_INCREMENT PRIMARY KEY ," +
                    "equipmentID int(5) not null," +
                    "reportedBy int(5) not null," +
                    "reportDate date not null DEFAULT (CURRENT_DATE)," +
                    "damageDescription varchar(255) not null," +
                    "imageLength int(5) not null," +
                    "status ENUM('Pending', 'Resolved') not null DEFAULT 'Pending'," +
                    "FOREIGN KEY (equipmentID) REFERENCES equipment(equipmentID)," +
                    "FOREIGN KEY (reportedBy) REFERENCES userInfo(userID))";
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

    public boolean createDamageReport(int equipmentID, int reportedBy, String damageDescription, int imageLength) {
        boolean result = false;
        PreparedStatement pStmt = null;
        Connection conn = null;
        try {
            conn = getConnection();
            String sql = "INSERT INTO damageReport (equipmentID, reportedBy,damageDescription, imageLength) values (?, ?, ?, ?)";
            pStmt = conn.prepareStatement(sql);
            pStmt.setInt(1, equipmentID);
            pStmt.setInt(2, reportedBy);
            pStmt.setString(3, damageDescription);
            pStmt.setInt(4, imageLength);
            int count = pStmt.executeUpdate();
            if (count > 0) {
                result = true;
            }
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
