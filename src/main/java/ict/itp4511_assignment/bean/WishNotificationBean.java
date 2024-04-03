package ict.itp4511_assignment.bean;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/4/3 - 04 - 03 - 下午 05:26
 * @Description: ict.itp4511_assignment.bean
 * @version: 1.0
 */
public class WishNotificationBean {
    private int equipmentID;
    private int userID;
    private int wishID;
    private String equipmentName;
    private String equipmentType;
    boolean isDismissed = false;

    public WishNotificationBean() {

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

    public int getEquipmentID() {
        return equipmentID;
    }

    public void setEquipmentID(int equipmentID) {
        this.equipmentID = equipmentID;
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

    public boolean getIsDismissed() {
        return isDismissed;
    }

    public void setIsDismissed(boolean dismissed) {
        isDismissed = dismissed;
    }
}
