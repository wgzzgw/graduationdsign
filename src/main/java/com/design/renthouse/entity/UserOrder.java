package com.design.renthouse.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class UserOrder {
    private int orderId;//订单ID
    private int houseId;//房屋ID
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date orderTime;//订单时间
    private String orderUser;//房东姓名
    private String houseDesc;//房源描述
    private String houseModel;//房源规模
    private String houseArea;//房源面积
    private String houseFloor;//房源楼层
    private String houseType;//出租方式
    private int housePrice;//房源价格
    private String houseAddress;//房源地址
    private String houseImage;//房源简介图
    private String communityName;//小区名
    private String houseLinkMan;//联系电话
    private String houseOriented;//房屋朝向

    public UserOrder(int houseId, Date orderTime, String orderUser, String houseDesc, String houseModel, String houseArea, String houseFloor, String houseType, int housePrice, String houseAddress, String houseImage, String communityName, String houseLinkMan, String houseOriented) {
        this.houseId = houseId;
        this.orderTime = orderTime;
        this.orderUser = orderUser;
        this.houseDesc = houseDesc;
        this.houseModel = houseModel;
        this.houseArea = houseArea;
        this.houseFloor = houseFloor;
        this.houseType = houseType;
        this.housePrice = housePrice;
        this.houseAddress = houseAddress;
        this.houseImage = houseImage;
        this.communityName = communityName;
        this.houseLinkMan = houseLinkMan;
        this.houseOriented = houseOriented;
    }

    public UserOrder(Date orderTime, String orderUser, String houseDesc, String houseModel, String houseArea, String houseFloor, String houseType, int housePrice, String houseAddress, String houseImage, String communityName, String houseLinkMan, String houseOriented) {
        this.orderTime = orderTime;
        this.orderUser = orderUser;
        this.houseDesc = houseDesc;
        this.houseModel = houseModel;
        this.houseArea = houseArea;
        this.houseFloor = houseFloor;
        this.houseType = houseType;
        this.housePrice = housePrice;
        this.houseAddress = houseAddress;
        this.houseImage = houseImage;
        this.communityName = communityName;
        this.houseLinkMan = houseLinkMan;
        this.houseOriented = houseOriented;
    }

    public UserOrder(int orderId, int houseId, Date orderTime, String orderUser, String houseDesc, String houseModel, String houseArea, String houseFloor, String houseType, int housePrice, String houseAddress, String houseImage, String communityName, String houseLinkMan, String houseOriented) {
        this.orderId = orderId;
        this.houseId = houseId;
        this.orderTime = orderTime;
        this.orderUser = orderUser;
        this.houseDesc = houseDesc;
        this.houseModel = houseModel;
        this.houseArea = houseArea;
        this.houseFloor = houseFloor;
        this.houseType = houseType;
        this.housePrice = housePrice;
        this.houseAddress = houseAddress;
        this.houseImage = houseImage;
        this.communityName = communityName;
        this.houseLinkMan = houseLinkMan;
        this.houseOriented = houseOriented;
    }

    public UserOrder() {
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

    public String getHouseDesc() {
        return houseDesc;
    }

    public void setHouseDesc(String houseDesc) {
        this.houseDesc = houseDesc;
    }

    public String getHouseModel() {
        return houseModel;
    }

    public void setHouseModel(String houseModel) {
        this.houseModel = houseModel;
    }

    public String getHouseArea() {
        return houseArea;
    }

    public void setHouseArea(String houseArea) {
        this.houseArea = houseArea;
    }

    public String getHouseFloor() {
        return houseFloor;
    }

    public void setHouseFloor(String houseFloor) {
        this.houseFloor = houseFloor;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }

    public int getHousePrice() {
        return housePrice;
    }

    public void setHousePrice(int housePrice) {
        this.housePrice = housePrice;
    }

    public String getHouseAddress() {
        return houseAddress;
    }

    public void setHouseAddress(String houseAddress) {
        this.houseAddress = houseAddress;
    }

    public String getHouseImage() {
        return houseImage;
    }

    public void setHouseImage(String houseImage) {
        this.houseImage = houseImage;
    }

    public String getCommunityName() {
        return communityName;
    }

    public void setCommunityName(String communityName) {
        this.communityName = communityName;
    }

    public String getHouseLinkMan() {
        return houseLinkMan;
    }

    public void setHouseLinkMan(String houseLinkMan) {
        this.houseLinkMan = houseLinkMan;
    }

    public String getHouseOriented() {
        return houseOriented;
    }

    public void setHouseOriented(String houseOriented) {
        this.houseOriented = houseOriented;
    }
}
