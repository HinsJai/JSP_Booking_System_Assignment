package ict.itp4511_assignment.bean;

import java.io.Serializable;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/28 - 03 - 28 - 下午 06:20
 * @Description: ict.itp4511_assignment.bean
 * @version: 1.0
 */
public class EquipmentBean implements Serializable {
    private int equipmentID;
    private String equipmentName;
    private String equipmentType;
    private String serialNumber;
    private String purchaseDate;
    private int warrantyPeriod;
    private String status;
    private String campusID;

    public EquipmentBean() {
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

}
