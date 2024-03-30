package ict.itp4511_assignment.bean;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/30 - 03 - 30 - 下午 04:06
 * @Description: ict.itp4511_assignment.bean
 * @version: 1.0
 */
public class WishCartEquipmentBean {

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
    private int cartID;
    private int r_userID;
    private int r_equipmentID;

    public WishCartEquipmentBean() {
    }

    public int getE_equipmentID() {
        return e_equipmentID;
    }

    public void setE_equipmentID(int e_equipmentID) {
        this.e_equipmentID = e_equipmentID;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public int getR_userID() {
        return r_userID;
    }

    public void setR_userID(int r_userID) {
        this.r_userID = r_userID;
    }

    public int getR_equipmentID() {
        return r_equipmentID;
    }

    public void setR_equipmentID(int r_equipmentID) {
        this.r_equipmentID = r_equipmentID;
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
