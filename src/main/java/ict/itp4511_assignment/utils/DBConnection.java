package ict.itp4511_assignment.utils;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/4/3 - 04 - 03 - 下午 06:01
 * @Description: ict.itp4511_assignment.utils
 * @version: 1.0
 */
public class DBConnection {

    private final String DB_USER = "root";
    private final String DB_PASSWORD = "root";
    private final String DB_URL = "jdbc:mysql://localhost:3306/ITP4511_DB?useSSL=false";

    public DBConnection() {

    }

    public String getDbUser() {
        return DB_USER;
    }

    public String getDbPassword() {
        return DB_PASSWORD;
    }

    public String getDbUrl() {
        return DB_URL;
    }
}
