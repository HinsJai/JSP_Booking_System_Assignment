package ict.itp4511_assignment.bean;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/4/8 - 04 - 08 - 下午 02:29
 * @Description: ict.itp4511_assignment.bean
 * @version: 1.0
 */
public class BookingNotificationBean {
    private int bookingID;

    public BookingNotificationBean() {

    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    private int userID;

}
