import ict.itp4511_assignment.db.BookingEquipmentDB;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/31 - 03 - 31 - 下午 04:47
 * @Description: PACKAGE_NAME
 * @version: 1.0
 */
public class CreatBookingEquipmentTable {
    public static void main(String[] args) {
        String dbUrl = "jdbc:mysql://localhost:3306/ITP4511_DB?allowPublicKeyRetrieval=true&useSSL=false";
        String dbUser = "root";
        String dbPassword = "root";
        BookingEquipmentDB db = new BookingEquipmentDB(dbUrl, dbUser, dbPassword);
        db.createBookingEquipmentTable();
    }

}
