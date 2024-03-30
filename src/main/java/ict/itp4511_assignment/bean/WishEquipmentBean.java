package ict.itp4511_assignment.bean;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/30 - 03 - 30 - 下午 04:06
 * @Description: ict.itp4511_assignment.bean
 * @version: 1.0
 */
public class WishEquipmentBean {

    private int e_equipmentID;
    private String equipmentName;
    private String equipmentType;
    private String serialNumber;
    private String purchaseDate;
    private int warrantyPeriod;
    private String status;
    private String campusID;
    private int userID;
    private int wishID;
    private int w_equipmentID;

    public WishEquipmentBean() {
    }

    public int getE_equipmentID() {
        return e_equipmentID;
    }

    public void setE_equipmentID(int e_equipmentID) {
        this.e_equipmentID = e_equipmentID;
    }


    public String getEquipmentName() {
        return equipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public String getEquipmentType() {
        return equipmentType;
    }

    public void setEquipmentType(String equipmentType) {
        this.equipmentType = equipmentType;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public int getWarrantyPeriod() {
        return warrantyPeriod;
    }

    public void setWarrantyPeriod(int warrantyPeriod) {
        this.warrantyPeriod = warrantyPeriod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCampusID() {
        return campusID;
    }

    public void setCampusID(String campusID) {
        this.campusID = campusID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getWishID() {
        return wishID;
    }

    public void setWishID(int wishID) {
        this.wishID = wishID;
    }

    public int getW_equipmentID() {
        return w_equipmentID;
    }

    public void setW_equipmentID(int w_equipmentID) {
        this.w_equipmentID = w_equipmentID;
    }

}
