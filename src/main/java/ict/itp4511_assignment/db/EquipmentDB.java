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
                    "brand varchar(50) not null," +
                    "model varchar(50) not null," +
                    "serialNumber varchar(50) not null," +
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
            String sql = "INSERT INTO equipment (equipmentName, equipmentType, brand, model, serialNumber, purchaseDate, warrantyPeriod, status, campusID) " +
                    "VALUES ('MacBook Pro 16-inch', 'Laptop', 'Apple', 'MacBook Pro', 'SN001', '2024-01-10', 12, 'Available', 'CW')," +
                    "('MacBook Air 13-inch', 'Laptop', 'Apple', 'MacBook Air', 'SN002', '2024-01-15', 12, 'Available', 'LWL')," +
                    "('iPad Pro 12.9-inch', 'Tablet', 'Apple', 'iPad Pro', 'SN003', '2024-02-01', 12, 'Available', 'ST')," +
                    "('iPad mini 8.3-inch', 'Tablet', 'Apple', 'iPad mini', 'SN004', '2024-02-05', 12, 'Available', 'TM')," +
                    "('Canon PIXMA MG3620', 'Printer and Scanner', 'Canon', 'PIXMA MG3620', 'SN005', '2024-03-01', 24, 'Available', 'TY')," +
                    "('Canon imageCLASS MF743Cdw', 'Printer and Scanner', 'Canon', 'imageCLASS MF743Cdw', 'SN006', '2024-03-05', 24, 'Available', 'CW')," +
                    "('iPhone 13 Pro Max', 'Smartphone', 'Apple', 'iPhone 13 Pro Max', 'SN007', '2024-04-01', 12, 'Available', 'LWL')," +
                    " ('iPhone SE', 'Smartphone', 'Apple', 'iPhone SE', 'SN008', '2024-04-05', 12, 'Available', 'ST')," +
                    "('Dell UltraSharp 27', 'Monitor', 'Dell', 'UltraSharp U2719D', 'SN011', '2024-06-01', 36, 'Available', 'CW')," +
                    " ('Dell P Series 24', 'Monitor', 'Dell', 'P2419H', 'SN012', '2024-06-05', 36, 'Available', 'LWL')," +
                    "('LEGO Mindstorms EV3', 'Robot', 'LEGO', 'Mindstorms EV3', 'SN013', '2024-07-01', 24, 'Available', 'ST')," +
                    "('LEGO Boost Creative Toolbox', 'Robot', 'LEGO', 'Boost 17101', 'SN014', '2024-07-05', 24, 'Available', 'TM')," +
                    "('HP ProLiant DL380 Gen10', 'Server', 'HP', 'ProLiant DL380', 'SN015', '2024-08-01', 36, 'Available', 'TY')," +
                    "('HP ProLiant ML350 Gen10', 'Server', 'HP', 'ProLiant ML350', 'SN016', '2024-08-05', 36, 'Available', 'CW')," +
                    "('Cisco 4000 Series Integrated Services Router', 'Networking', 'Cisco', 'ISR 4000', 'SN017', '2024-09-01', 48, 'Available', 'LWL')," +
                    "('Cisco Catalyst 2960-X Series Switches', 'Networking', 'Cisco', 'Catalyst 2960-X', 'SN018', '2024-09-05', 48, 'Available', 'ST')," +
                    "('Bose L1 Compact Portable Line Array System', 'Audio-Visual', 'Bose', 'L1 Compact', 'SN019', '2024-10-01', 24, 'Available', 'TM')," +
                    " ('Bose S1 Pro Multi-Position PA System', 'Audio-Visual', 'Bose', 'S1 Pro', 'SN020', '2024-10-05', 24, 'Available', 'TY')," +
                    "('Wacom Intuos Pro', 'Others', 'Wacom', 'Intuos Pro', 'SN021', '2024-11-01', 24, 'Available', 'CW')," +
                    "('Wacom Cintiq 22', 'Others', 'Wacom', 'Cintiq 22', 'SN022', '2024-11-05', 24, 'Available', 'LWL');";

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

