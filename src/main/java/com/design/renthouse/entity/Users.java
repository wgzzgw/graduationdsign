package com.design.renthouse.entity;

/*
* 租客
* */
public class Users {
    private int userId;//租客ID
    private String userName;//租客姓名
    private String userPassword;//租客密码
    private String userPhone;//租客电话号码
    private String userNickname;//租客昵称

    public Users(String userName, String userPassword, String userPhone, String userNickname) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userNickname = userNickname;
    }

    public Users(int userId, String userName, String userPassword, String userPhone, String userNickname) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userNickname = userNickname;
    }

    public Users() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }
}
