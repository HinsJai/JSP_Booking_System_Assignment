import ict.itp4511_assignment.db.UserDB;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/25 - 03 - 25 - 下午 09:48
 * @Description: PACKAGE_NAME
 * @version: 1.0
 */
public class CreateTable {
    public static void main(String[] args) {
        String dbUrl = "jdbc:mysql://localhost:3306/ITP4511_DB?useSSL=false";
        String dbUser = "root";
        String dbPassword = "";
        UserDB userDb = new UserDB(dbUrl, dbUser, dbPassword);
        userDb.createUserTable();
    }
}
