package ict.itp4511_assignment.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/27 - 03 - 27 - 上午 03:19
 * @Description: ict.itp4511_assignment.db
 * @version: 1.0
 */
public class EquipmentDB {
    private String dbUser;
    private String dbPassword;
    private String dbUrl;

    public EquipmentDB(String dbUrl, String dbUser, String dbPassword) {
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

    public void createEquipmentTable() {
        try {
            Connection conn = getConnection();
            String sql = "Create table if not exists equipment (" +
                    "equipmentID int(5) AUTO_INCREMENT PRIMARY KEY ," +
                    "equipmentName varchar(50) not null," +
                    "equipmentType ENUM('Laptop', 'Tablet', 'Printer and Scanner','Smartphone', 'Projector', 'Monitor', 'robot','Server', 'Networking', 'Audio-Visual', 'Others') not null," +
                    "serialNumber varchar(50) not null UNIQUE," +
                    "purchaseDate date not null," +
                    "warrantyPeriod int(3) not null," +
                    "status ENUM('Available', 'CheckedOut', 'UnderMaintenance', 'Damaged') not null," +
                    "campusID ENUM('CW','LWL','ST','TM','TY') not null," +
                    "FOREIGN KEY (campusID) REFERENCES campus(campusID))";
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

    public void insertEquipmentRecord() {
        Statement stmnt = null;
        Connection conn = null;
        try {
            conn = getConnection();
            stmnt = conn.createStatement();
            String sql = "INSERT INTO equipment (equipmentName, equipmentType ,serialNumber, purchaseDate, warrantyPeriod, status, campusID) " +
                    "VALUES ('MacBook Pro 16-inch', 'Laptop',  'SN001', '2024-01-10', 12, 'Available', 'CW')," +
                    "('MacBook Air 13-inch', 'Laptop', 'SN002', '2024-01-15', 12, 'Available', 'LWL')," +
                    "('iPad Pro 12.9-inch', 'Tablet','SN003', '2024-02-01', 12, 'Available', 'ST')," +
                    "('iPad mini 8.3-inch', 'Tablet',  'SN004', '2024-02-05', 12, 'Available', 'TM')," +
                    "('Canon PIXMA MG3620', 'Printer and Scanner',  'SN005', '2024-03-01', 24, 'Available', 'TY')," +
                    "('Canon imageCLASS MF743Cdw', 'Printer and Scanner',  'SN006', '2024-03-05', 24, 'Available', 'CW')," +
                    "('iPhone 13 Pro Max', 'Smartphone',  'SN007', '2024-04-01', 12, 'Available', 'LWL')," +
                    " ('iPhone SE', 'Smartphone',  'SN008', '2024-04-05', 12, 'Available', 'ST')," +
                    "('Dell UltraSharp 27', 'Monitor','SN011', '2024-06-01', 36, 'Available', 'CW')," +
                    " ('Dell P Series 24', 'Monitor',  'SN012', '2024-06-05', 36, 'Available', 'LWL')," +
                    "('LEGO Mindstorms EV3', 'Robot',  'SN013', '2024-07-01', 24, 'Available', 'ST')," +
                    "('LEGO Boost Creative Toolbox', 'Robot', 'SN014', '2024-07-05', 24, 'Available', 'TM')," +
                    "('HP ProLiant DL380 Gen10', 'Server',  'SN015', '2024-08-01', 36, 'Available', 'TY')," +
                    "('HP ProLiant ML350 Gen10', 'Server',  'SN016', '2024-08-05', 36, 'Available', 'CW')," +
                    "('Cisco 4000 Series Integrated Services Router', 'Networking', 'SN017', '2024-09-01', 48, 'Available', 'LWL')," +
                    "('Cisco Catalyst 2960-X Series Switches', 'Networking', 'SN018', '2024-09-05', 48, 'Available', 'ST')," +
                    "('Bose L1 Compact Portable Line Array System', 'Audio-Visual', 'SN019', '2024-10-01', 24, 'Available', 'TM')," +
                    " ('Bose S1 Pro Multi-Position PA System', 'Audio-Visual',   'SN020','2024-10-05', 24, 'Available', 'TY')," +
                    "('Wacom Intuos Pro', 'Others','SN021', '2024-11-01', 24, 'Available', 'CW')," +
                    "('Wacom Cintiq 22', 'Others','SN022', '2024-11-05', 24, 'Available', 'LWL');";

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
}

