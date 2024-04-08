import ict.itp4511_assignment.db.DeliveryDB;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/27 - 03 - 27 - 上午 04:21
 * @Description: PACKAGE_NAME
 * @version: 1.0
 */
public class CreateDeliveryTable {
    public static void main(String[] args) {
        String dbUrl = "jdbc:mysql://localhost:3306/ITP4511_DB?useSSL=false";
        String dbUser = "root";
        String dbPassword = "root";
        DeliveryDB deliveryDB = new DeliveryDB(dbUrl, dbUser, dbPassword);
        deliveryDB.createDeliveryTable();
    }
}
