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

    public UserDB(String dbUrl, String dbUser, String dbPassword) {
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

    public void createUserTable() {
        Statement stmnt = null;
        Connection conn = null;

        try {
            conn = getConnection();
            stmnt = conn.createStatement();
            String sql = "Create table if not exists userInfo (" + "userID int(5) AUTO_INCREMENT PRIMARY KEY ," + "email varchar(50) not null," + "password varchar(50) not null," + "fName varchar(25) not null," + "lName varchar(25) not null," + "gender ENUM('M', 'F') not null," + "contact int(8) not null," + "root ENUM('User', 'Staff', 'Technician', 'Technician_admin', 'Courier') NOT NULL," + "campusID ENUM('CW','LWL','ST','TM','TY') not null," + "isLocked tinyint(1) default 0 not null" + "FOREIGN KEY (campusID) REFERENCES campus(campusID))";
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

    public void insertUserRecord() {
        Statement stmnt = null;
        Connection conn = null;
        try {
            conn = getConnection();
            stmnt = conn.createStatement();
            String sql = "Insert into userInfo (email, password, fName,lName,gender, contact, root, campusID) values" + " ('jason199794@gmail.com', " + "'Bb123456'," + " 'Jason', " + "'Kong', " + "'M', " + "53283616, " + "'Technician_admin', " + "'TY')";
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
            String sql = "Select * From userInfo WHERE email=? and password=? and isLocked = 0";
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
                userBean.setGender(rs.getString("gender"));
                userBean.setUserID(rs.getInt("userID"));
                userBean.setContact(rs.getInt("contact"));
                userBean.setCampus(rs.getString("campusID"));
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

    public boolean updateUserProfile(String userID, String email, int phone) {
        Connection conn = null;
        PreparedStatement pStmnt = null;
        boolean result = false;
        try {
            conn = getConnection();
            String sql = "Update userInfo set email=?, contact=? where userID=?";
            pStmnt = conn.prepareStatement(sql);
            pStmnt.setString(1, email);
            pStmnt.setInt(2, phone);
            pStmnt.setString(3, userID);
            int count = pStmnt.executeUpdate();
            if (count > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            while (e != null) {
                e = e.getNextException();
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean updateUserPassword(int userID, String password) {
        Connection conn = null;
        PreparedStatement pStmnt = null;
        boolean result = false;
        try {
            conn = getConnection();
            String sql = "Update userInfo set password=? where userID=?";
            pStmnt = conn.prepareStatement(sql);
            pStmnt.setString(1, password);
            pStmnt.setInt(2, userID);
            int count = pStmnt.executeUpdate();
            if (count > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            while (e != null) {
                e = e.getNextException();
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean updateUser(int userID, String root, String campus) {
        Connection conn = null;
        PreparedStatement pStmnt = null;
        boolean result = false;
        try {
            conn = getConnection();
            String sql = "Update userInfo set root=?,campusID =?  where userID=?";
            pStmnt = conn.prepareStatement(sql);
            pStmnt.setString(1, root);
            pStmnt.setString(2, campus);
            pStmnt.setInt(3, userID);
            int count = pStmnt.executeUpdate();
            if (count > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            while (e != null) {
                e = e.getNextException();
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean lockUser(int userID) {
        Connection conn = null;
        PreparedStatement pStmnt = null;
        boolean result = false;
        try {
            conn = getConnection();
            String sql = "Update userInfo  set isLocked = 1 where userID=?";
            pStmnt = conn.prepareStatement(sql);
            pStmnt.setInt(1, userID);
            int count = pStmnt.executeUpdate();
            if (count > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            while (e != null) {
                e = e.getNextException();
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean unlockUser(int userID) {
        Connection conn = null;
        PreparedStatement pStmnt = null;
        boolean result = false;
        try {
            conn = getConnection();
            String sql = "Update userInfo  set isLocked = 0 where userID=?";
            pStmnt = conn.prepareStatement(sql);
            pStmnt.setInt(1, userID);
            int count = pStmnt.executeUpdate();
            if (count > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            while (e != null) {
                e = e.getNextException();
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

//    public boolean deleteUser(int userID) {
//        Connection conn = null;
//        PreparedStatement pStmnt = null;
//        boolean result = false;
//        try {
//            conn = getConnection();
//            String sql = "Delete from userInfo where userID=?";
//            pStmnt = conn.prepareStatement(sql);
//            pStmnt.setInt(1, userID);
//            int count = pStmnt.executeUpdate();
//            if (count > 0) {
//                result = true;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            while (e != null) {
//                e = e.getNextException();
//                e.printStackTrace();
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        return result;
//    }

    public int getMaxID() {
        boolean result = false;
        PreparedStatement pStmt = null;
        Connection conn = null;
        int maxID = -1;
        try {
            conn = getConnection();
            String sql = "SELECT MAX(userID) FROM userInfo";
            pStmt = conn.prepareStatement(sql);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                maxID = rs.getInt(1);
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
        return maxID;
    }

    public boolean insertBatchUsers(UserInfoBean user) {
        Connection conn = null;
        PreparedStatement pStmnt = null;
        boolean result = false;
        try {
            conn = getConnection();
            String sql = "Insert into userInfo (userID, email, password, fName, lName,gender, contact, root, campusID) values(?,?,?,?,?,?,?,?,?)";
            pStmnt = conn.prepareStatement(sql);
            pStmnt.setInt(1, user.getUserID());
            pStmnt.setString(2, user.getEmail());
            pStmnt.setString(3, user.getPassword());
            pStmnt.setString(4, user.getfName());
            pStmnt.setString(5, user.getlName());
            pStmnt.setString(6, user.getGender());
            pStmnt.setInt(7, user.getContact());
            pStmnt.setString(8, user.getRoot());
            pStmnt.setString(9, user.getCampus());
            int count = pStmnt.executeUpdate();
            if (count > 0) {
                result = true;
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            while (e != null) {
                e = e.getNextException();
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }
}
