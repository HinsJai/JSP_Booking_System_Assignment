package ict.itp4511_assignment.bean;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/4/11 - 04 - 11 - 下午 09:39
 * @Description: ict.itp4511_assignment.bean
 * @version: 1.0
 */
public class DeliveryBean {
    private int deliveryID;
    private String createDate;
    private int courierID = -1;
    private int bookingID;
    private String userPickupDate;
    private String deliveryAddress;
    private String status;

    public DeliveryBean() {
    }

    public int getDeliveryID() {
        return deliveryID;
    }

    public void setDeliveryID(int deliveryID) {
        this.deliveryID = deliveryID;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public int getCourierID() {
        return courierID;
    }

    public void setCourierID(int courierID) {
        this.courierID = courierID;
    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public String getUserPickupDate() {
        return userPickupDate;
    }

    public void setUserPickupDate(String userPickupDate) {
        this.userPickupDate = userPickupDate;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
