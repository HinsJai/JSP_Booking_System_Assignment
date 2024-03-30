import ict.itp4511_assignment.db.ReserveCartDB;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/30 - 03 - 30 - 下午 10:53
 * @Description: PACKAGE_NAME
 * @version: 1.0
 */
public class CreateReserveCartTable {
    public static void main(String[] args) {
        String dbUrl = "jdbc:mysql://localhost:3306/ITP4511_DB?useSSL=false";
        String dbUser = "root";
        String dbPassword = "root";
        ReserveCartDB db = new ReserveCartDB(dbUrl, dbUser, dbPassword);
        db.createReserveCartTable();
    }
}
