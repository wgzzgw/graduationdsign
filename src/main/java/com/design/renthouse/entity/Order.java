package com.design.renthouse.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/*
* 订单（总）
* */
public class Order {
    private int orderId;//订单ID
    private int houseId;//订单房屋ID
    private int userId;//订单租客ID
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date orderTime;//订单时间
    private String orderUser;//订单租客姓名

    public Order(int houseId, int userId, Date orderTime, String orderUser) {
        this.houseId = houseId;
        this.userId = userId;
        this.orderTime = orderTime;
        this.orderUser = orderUser;
    }

    public Order(int orderId, int houseId, int userId, Date orderTime, String orderUser) {
        this.orderId = orderId;
        this.houseId = houseId;
        this.userId = userId;
        this.orderTime = orderTime;
        this.orderUser = orderUser;
    }

    public Order() {
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public String getOrderUser() {
        return orderUser;
    }

    public void setOrderUser(String orderUser) {
        this.orderUser = orderUser;
    }
}
