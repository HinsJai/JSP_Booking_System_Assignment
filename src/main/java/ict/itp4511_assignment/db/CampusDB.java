package ict.itp4511_assignment.db;

import java.io.IOException;
import java.sql.*;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/27 - 03 - 27 - 上午 02:06
 * @Description: ict.itp4511_assignment.db
 * @version: 1.0
 */
public class CampusDB {
    private String dbUser;
    private String dbPassword;
    private String dbUrl;

    public CampusDB(String dbUrl, String dbUser, String dbPassword) {
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

    public void createCampusTable() {
        Statement stmnt = null;
        Connection conn = null;
        try {
            conn = getConnection();
            stmnt = conn.createStatement();
            String sql = "Create table if not exists campus (" + "campusID ENUM('CW','LWL','ST','TM','TY') NOT NULL PRIMARY KEY ," + "campusName varchar(50) not null," + "location varchar(255) not null," + "contact int(8) not null," + "email varchar(50) not null)";
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

    public void insertCampusRecord() {
        Statement stmnt = null;
        Connection conn = null;
        try {
            conn = getConnection();
            stmnt = conn.createStatement();
            String sql = "INSERT INTO campus (campusID, campusName, location,contact,email) VALUES " + "('CW', 'Chai Wan IVE', '30 Shing Tai Rd, Chai Wan',25054200,'cw-cs@vtc.edu.hk')," + "('LWL', 'Lee Wai Lee IVE', '3 King Ling Rd, Tseung Kwan O',39282200,'dilwl-sdo@vtc.edu.hk')," + "('ST', 'Sha Tin IVE', '21 Yuen Wo Rd, Sha Tin',26066227,'stcampus@vtc.edu.hk')," + "('TM', 'Tuen Mun IVE', '18 Tsing Wun Road, Tuen Mun, New Territories',24630066,'tm-cs@vtc.edu.hk')," + "('TY', 'Tsing Yi IVE', '20 Tsing Yi Road, · Tsing Yi Island, New Territories',24368404,'ty-lc@vtc.edu.hk')";
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

    public String getCampusAddress(String campusID) {
        String address = "";
        String sql = "";
        Connection conn = null;
        PreparedStatement pStmnt = null;
        try {
            conn = getConnection();
            sql = "SELECT location FROM campus WHERE campusID = ?";
            pStmnt = conn.prepareStatement(sql);
            pStmnt.setString(1, campusID);
            ResultSet rs = pStmnt.executeQuery();
            if (rs.next()) {
                address = rs.getString("location");
            }
            pStmnt.close();
            conn.close();
        } catch (SQLException e) {
            while (e != null) {
                e.printStackTrace();
                e = e.getNextException();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return address;
    }
}
