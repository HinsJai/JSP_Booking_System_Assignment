package ict.itp4511_assignment.db;

import ict.itp4511_assignment.bean.UserInfoBean;

import java.io.IOException;
import java.sql.*;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/25 - 03 - 25 - 下午 09:36
 * @Description: ict.itp4511_assignment.Tables
 * @version: 1.0
 */
public class UserDB {

    private String dbUser;
    private String dbPassword;
    private String dbUrl;

    public UserDB(String dbUser, String dbPassword, String dbUrl) {
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
        return DriverManager.getConnection(dbUser, dbPassword, dbUrl);
    }

    public void createUserTable() {
        Statement stmnt = null;
        Connection conn = null;

        try {
            conn = getConnection();
            stmnt = conn.createStatement();
            String sql = "Create table if not exists userInfo (" + "userID int(5) AUTO_INCREMENT PRIMARY KEY ," + "email varchar(50) not null," + "password varchar(50) not null," + "fName varchar(25) not null," + "lName varchar(25) not null," + "gender ENUM('M', 'F') not null," + "contact int(8) not null," + "root ENUM('User', 'Staff', 'Technician', 'Technician_admin', 'Courier') NOT NULL)";
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

    public UserInfoBean isValidUser(String email, String password) {
        Connection conn = null;
        PreparedStatement pStmnt = null;
        ResultSet rs = null;
        UserInfoBean userBean = null;
        try {
            conn = getConnection();
            String sql = "Select * From userInfo WHERE email=? and password=?";
            pStmnt = conn.prepareStatement(sql);
            pStmnt.setString(1, email);
            pStmnt.setString(2, password);
            pStmnt.execute();

            rs = pStmnt.getResultSet();
            if (rs.next()) {
                userBean = new UserInfoBean();
                userBean.setIsValidUser(true);
                userBean.setEmail(rs.getString("email"));
                userBean.setRoot(rs.getString("root"));
                userBean.setfName(rs.getString("fName"));
                userBean.setlName(rs.getString("lName"));
                userBean.setUserID(rs.getInt("userID"));
            } else {
                userBean = new UserInfoBean();
                userBean.setIsValidUser(false);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            while (e != null) {
                e = e.getNextException();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return userBean;
    }
}
