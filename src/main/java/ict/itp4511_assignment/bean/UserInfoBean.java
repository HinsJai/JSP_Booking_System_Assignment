package ict.itp4511_assignment.bean;

import java.io.Serializable;

/**
 * @Author: Kong Kwok Hin
 * @Date: 2024/3/25 - 03 - 25 - 下午 11:30
 * @Description: ict.itp4511_assignment.bean
 * @version: 1.0
 */
public class UserInfoBean implements Serializable {

    private String email;
    private String root;
    private String password;
    private String fName;
    private String lName;
    private String gender;
    private int contact;
    private String campus;
    private boolean isValidUser = false;
    private int userID;

    public UserInfoBean() {
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRoot() {
        return root;
    }

    public void setRoot(String root) {
        this.root = root;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getGender() {
        return this.gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getContact() {
        return contact;
    }

    public void setContact(int contact) {
        this.contact = contact;
    }

    public String getCampus() {
        return campus;
    }

    public void setCampus(String campus) {
        this.campus = campus;
    }

    public boolean getIsValidUser() {
        return isValidUser;
    }

    public void setIsValidUser(boolean isValidUser) {
        this.isValidUser = isValidUser;
    }
}
