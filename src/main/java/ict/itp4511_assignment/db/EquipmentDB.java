package ict.itp4511_assignment.db;

import ict.itp4511_assignment.bean.WishCartEquipmentBean;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Objects;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/27 - 03 - 27 - 上午 03:19
 * @Description: ict.itp4511_assignment.db
 * @version: 1.0
 */
public class EquipmentDB {
    private final String dbUser;
    private final String dbPassword;
    private final String dbUrl;

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
            String sql = "Create table if not exists equipment (" + "equipmentID int(5) AUTO_INCREMENT PRIMARY KEY ," +
                    "equipmentName varchar(50) not null," +
                    "equipmentType ENUM('Laptop', 'Tablet', 'Printer and Scanner','Smartphone', 'Projector', 'Monitor', 'robot','Server', 'Networking', 'Audio-Visual', 'Others') not null," +
                    "serialNumber varchar(50) not null UNIQUE," + "purchaseDate date not null," + "warrantyPeriod int(3) not null," +
                    "status ENUM('Available', 'CheckedOut', 'UnderMaintenance', 'Damaged') not null," +
                    " isPrivate TINYINT(1) not null," +
                    "campusID ENUM('CW','LWL','ST','TM','TY') not null," + "FOREIGN KEY (campusID) REFERENCES campus(campusID))";
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
            String sql = "INSERT INTO equipment (equipmentName, equipmentType ,serialNumber, purchaseDate, warrantyPeriod, status,isPrivate, campusID) " +
                    "VALUES ('MacBook Pro 16-inch', 'Laptop',  'SN001', '2024-01-10', 12, 'Available',0, 'TY')," +
                    "('MacBook Air 13-inch', 'Laptop', 'SN002', '2024-01-15', 12, 'CheckedOut',0, 'TY')," +
                    "('iPad Pro 12.9-inch', 'Tablet','SN003', '2024-02-01', 12, 'Available',0, 'TY')," +
                    "('iPad mini 8.3-inch', 'Tablet',  'SN004', '2024-02-05', 12, 'CheckedOut',0, 'TY')," +
                    "('Canon PIXMA MG3620', 'Printer and Scanner',  'SN005', '2024-03-01', 24, 'Available',0, 'TY')," +
                    "('Canon imageCLASS MF743Cdw', 'Printer and Scanner',  'SN006', '2024-03-05', 24, 'Available', 0,'CW')," +
                    "('iPhone 13 Pro Max', 'Smartphone',  'SN007', '2024-04-01', 12, 'Available', 0,'TY')," +
                    " ('iPhone SE', 'Smartphone',  'SN008', '2024-04-05', 12, 'Available', 0,'TY')," +
                    "('Dell UltraSharp 27', 'Monitor','SN011', '2024-06-01', 36, 'Available',1, 'CW')," +
                    " ('Dell P Series 24', 'Monitor',  'SN012', '2024-06-05', 36, 'Available', 0,'TY')," +
                    "('LEGO Mindstorms EV3', 'Robot',  'SN013', '2024-07-01', 24, 'Available', 1,'TY')," +
                    "('LEGO Boost Creative Toolbox', 'Robot', 'SN014', '2024-07-05', 24, 'Available',0, 'TM')," +
                    "('HP ProLiant DL380 Gen10', 'Server',  'SN015', '2024-08-01', 36, 'Available',1, 'TY')," +
                    "('HP ProLiant ML350 Gen10', 'Server',  'SN016', '2024-08-05', 36, 'Available', 1,'CW')," +
                    "('Cisco 4000 Series Integrated Services Router', 'Networking', 'SN017', '2024-09-01', 48, 'Available', 1,'TY')," +
                    "('Cisco Catalyst 2960-X Series Switches', 'Networking', 'SN018', '2024-09-05', 48, 'Available', 0,'TY')," +
                    "('Bose L1 Compact Portable Line Array System', 'Audio-Visual', 'SN019', '2024-10-01', 24, 'Available',0, 'TY')," +
                    " ('Bose S1 Pro Multi-Position PA System', 'Audio-Visual',   'SN020','2024-10-05', 24, 'Available', 0,'TY')," +
                    "('Wacom Intuos Pro', 'Others','SN021', '2024-11-01', 24, 'Available', 0,'TY')," +
                    "('Wacom Cintiq 22', 'Others','SN022', '2024-11-05', 24, 'Available', 0,'LWL');";

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

    public ArrayList<WishCartEquipmentBean> getEquipmentList(int userId, String userType, String campus) {
        ArrayList<WishCartEquipmentBean> equipmentList = new ArrayList<>();
        String sql = "";

        try {
            Connection conn = getConnection();
            if (Objects.equals(userType, "User")) {
                sql = "SELECT * " +
                        "FROM wishlist\n" +
                        "         RIGHT JOIN equipment\n" +
                        "                    ON wishlist.equipmentID = equipment.equipmentID " +
                        "         LEFT JOIN reserveCart" +
                        "                   ON equipment.equipmentID = reserveCart.equipmentID " +
                        "WHERE (equipment.status = 'Available' OR equipment.status = 'CheckedOut') " +
                        "and isPrivate = 0 ";
//                        "  AND equipment.campusID = ?";
//                sql = "SELECT * FROM wishlist right join   equipment ON wishlist.equipmentID = equipment.equipmentID " + "where (status = 'Available' or status =  'CheckedOut') and (userID = ? or userID is null) and private = 0 AND campusID=? ";
            } else {
//                sql = "SELECT   * FROM wishlist" + " RIGHT JOIN " + "equipment" + " ON" + " equipment.equipmentID = wishlist.equipmentID" + " WHERE (status = 'Available' OR status = 'CheckedOut')" + " AND (userID = ? OR userID IS NULL) AND campusID=?";
                sql = "SELECT * " +
                        "FROM wishlist\n" +
                        "         RIGHT JOIN equipment\n" +
                        "                    ON wishlist.equipmentID = equipment.equipmentID " +
                        "         LEFT JOIN reserveCart" +
                        "                   ON equipment.equipmentID = reserveCart.equipmentID " +
                        "WHERE (equipment.status = 'Available' OR equipment.status = 'CheckedOut') ";
//                        "  AND (wishlist.userID = ? OR wishlist.userID IS NULL)" +
//                        "  AND equipment.campusID = ?";
            }
            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, userId);
//            ps.setString(1, campus);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//                EquipmentBean equipment = new EquipmentBean();
                WishCartEquipmentBean equipment = new WishCartEquipmentBean();
                equipment.setE_equipmentID(rs.getInt("equipment.equipmentID"));
                equipment.setEquipmentName(rs.getString("equipmentName"));
                equipment.setEquipmentType(rs.getString("equipmentType"));
                equipment.setSerialNumber(rs.getString("serialNumber"));
                equipment.setPurchaseDate(rs.getString("purchaseDate"));
                equipment.setWarrantyPeriod(rs.getInt("warrantyPeriod"));
                equipment.setStatus(rs.getString("status"));
                equipment.setCampusID(rs.getString("campusID"));
                equipment.setWishID(rs.getInt("wishID"));
                equipment.setUserID(rs.getInt("wishlist.userID"));
                equipment.setW_equipmentID(rs.getInt("wishlist.equipmentID"));
                equipment.setR_equipmentID(rs.getInt("reservecart.equipmentID"));
                equipment.setR_userID(rs.getInt("reservecart.userID"));
                equipment.setCartID(rs.getInt("cartID"));
                equipmentList.add(equipment);
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
        return equipmentList;
    }

    public ArrayList<WishCartEquipmentBean> getEquipmentListByType(String type, int userID, String userType, String campus) {
        ArrayList<WishCartEquipmentBean> equipmentList = new ArrayList<>();
        String sql = "";
        try {
            Connection conn = getConnection();
            if (Objects.equals(userType, "User")) {
//                sql = "SELECT * " + "FROM wishlist" + " RIGHT JOIN" + "  equipment" + "     ON" + " wishlist.equipmentID = equipment.equipmentID " + "WHERE (status = 'Available' OR status = 'CheckedOut')" + "  AND equipmentType = ?" + "  AND (userID = ? OR userID IS NULL) and private = 0 and campusID=?";
                sql = "SELECT * " +
                        "FROM wishlist\n" +
                        "         RIGHT JOIN equipment" +
                        "                    ON wishlist.equipmentID = equipment.equipmentID " +
                        "         LEFT JOIN reserveCart" +
                        "                   ON equipment.equipmentID = reserveCart.equipmentID " +
                        "WHERE (equipment.status = 'Available' OR equipment.status = 'CheckedOut') " +
                        "  AND equipmentType = ?" +
                        " AND isPrivate = 0 ";
//                        "  AND equipment.campusID = ?";
            } else {
//                sql = "SELECT * " + "FROM wishlist" + " RIGHT JOIN" + "  equipment" + "     ON" + " wishlist.equipmentID = equipment.equipmentID " + "WHERE (status = 'Available' OR status = 'CheckedOut')" + "  AND equipmentType = ?" + "  AND (userID = ? OR userID IS NULL) and campusID=?";
                sql = "SELECT * " +
                        "FROM wishlist" +
                        "         RIGHT JOIN equipment" +
                        "                    ON wishlist.equipmentID = equipment.equipmentID " +
                        "         LEFT JOIN reserveCart" +
                        "                   ON equipment.equipmentID = reserveCart.equipmentID " +
                        "WHERE (equipment.status = 'Available' OR equipment.status = 'CheckedOut') " +
                        "  AND equipmentType = ?";
//                        "  AND (wishlist.userID = ? OR wishlist.userID IS NULL)" +
//                        "  AND equipment.campusID = ?";

            }

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, type);
//            ps.setInt(2, userID);
//            ps.setString(2, campus);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                WishCartEquipmentBean equipment = new WishCartEquipmentBean();
                equipment.setE_equipmentID(rs.getInt("equipment.equipmentID"));
                equipment.setEquipmentName(rs.getString("equipmentName"));
                equipment.setEquipmentType(rs.getString("equipmentType"));
                equipment.setSerialNumber(rs.getString("serialNumber"));
                equipment.setPurchaseDate(rs.getString("purchaseDate"));
                equipment.setWarrantyPeriod(rs.getInt("warrantyPeriod"));
                equipment.setStatus(rs.getString("status"));
                equipment.setCampusID(rs.getString("campusID"));
                equipment.setWishID(rs.getInt("wishID"));
                equipment.setUserID(rs.getInt("userID"));
                equipment.setW_equipmentID(rs.getInt("equipmentID"));
                equipment.setR_equipmentID(rs.getInt("reservecart.equipmentID"));
                equipment.setR_userID(rs.getInt("reservecart.userID"));
                equipment.setCartID(rs.getInt("cartID"));
                equipmentList.add(equipment);
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
        return equipmentList;
    }

    public boolean updateStatus(String status, int equipmentID) {
        boolean result = false;
        PreparedStatement pStmt = null;
        Connection conn = null;
        try {
            conn = getConnection();
            String sql = "UPDATE equipment SET status = ? WHERE equipmentID = ?";
            pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, status);
            pStmt.setInt(2, equipmentID);
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
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

}