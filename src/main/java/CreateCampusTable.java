import ict.itp4511_assignment.db.CampusDB;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/27 - 03 - 27 - 上午 02:34
 * @Description: PACKAGE_NAME
 * @version: 1.0
 */
public class CreateCampusTable {

    public static void main(String[] args) {
        String dbUrl = "jdbc:mysql://localhost:3306/ITP4511_DB?allowPublicKeyRetrieval=true&useSSL=false";
        String dbUser = "root";
        String dbPassword = "";
        CampusDB campusDB = new CampusDB(dbUrl, dbUser, dbPassword);
        campusDB.createCampusTable();
        campusDB.insertCampusRecord();
    }
}
