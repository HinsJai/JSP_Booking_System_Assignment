import ict.itp4511_assignment.db.WishListDB;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/30 - 03 - 30 - 上午 01:32
 * @Description: ict.itp4511_assignment
 * @version: 1.0
 */
public class CreateWishListTable {
    public static void main(String[] args) {
        String dbUrl = "jdbc:mysql://localhost:3306/ITP4511_DB?useSSL=false";
        String dbUser = "root";
        String dbPassword = "root";
        WishListDB db = new WishListDB(dbUrl, dbUser, dbPassword);
        db.createWishListTable();
    }
}
