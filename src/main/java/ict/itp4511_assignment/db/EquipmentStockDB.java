package ict.itp4511_assignment.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/27 - 03 - 27 - 上午 04:07
 * @Description: ict.itp4511_assignment.db
 * @version: 1.0
 */
public class EquipmentStockDB {
    private String dbUrl;
    private String dbUser;
    private String dbPassword;

    public EquipmentStockDB(String dbUrl, String dbUser, String dbPassword) {
        this.dbUrl = dbUrl;
        this.dbUser = dbUser;
        this.dbPassword = dbPassword;
    }

    public void createEquipmentStockTable() {
        try {
            Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            Statement statement = connection.createStatement();
            String sql = "CREATE TABLE if not exists EquipmentStock (" +
                    "equipmentID INT NOT NULL," +
                    "quantity INT NOT NULL," +
                    "PRIMARY KEY (equipmentID)," +
                    "FOREIGN KEY (equipmentID) REFERENCES Equipment(equipmentID)" +
                    ")";
            statement.executeUpdate(sql);
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertEquipmentStockRecord() {
        try {
            Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            Statement statement = connection.createStatement();
            String sql = "INSERT INTO EquipmentStock VALUES (1, 10)," +
                    "(2, 10)," +
                    "(3, 10)," +
                    "(4, 8)," +
                    "(5, 6)," +
                    "(6, 12)," +
                    "(7,5)," +
                    "(8, 4)," +
                    "(9, 2)," +
                    "(10, 4)," +
                    "(11, 7)," +
                    "(12, 1)," +
                    "(13, 3)," +
                    "(14, 2)," +
                    "(15, 10)," +
                    "(16, 15)," +
                    "(17, 30)," +
                    "(18, 32)," +
                    "(19,2)," +
                    "(20, 1)";

            statement.executeUpdate(sql);
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
