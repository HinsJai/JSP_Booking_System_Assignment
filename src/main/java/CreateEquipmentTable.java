import ict.itp4511_assignment.db.EquipmentDB;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/27 - 03 - 27 - 上午 03:52
 * @Description: PACKAGE_NAME
 * @version: 1.0
 */
public class CreateEquipmentTable {
    public static void main(String[] args) {
        String dbUrl = "jdbc:mysql://localhost:3306/ITP4511_DB?useSSL=false";
        String dbUser = "root";
        String dbPassword = "root";
        EquipmentDB equipmentDB = new EquipmentDB(dbUrl, dbUser, dbPassword);
        equipmentDB.createEquipmentTable();
        equipmentDB.insertEquipmentRecord();
    }
}
