package com.design.renthouse.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/*
* 房屋
* */
public class House {
    private int houseId;//房屋ID
    private String houseDesc;//房屋描述
    private String houseModel;//房屋规模
    private String houseArea;//房屋面积
    private String houseFloor;//房屋楼层
    private String houseType;//房屋类型
    private int housePrice;//房屋价格
    private String houseAddress;//房屋地址
    private String houseImage;//房屋图片
    private String communityName;//房屋所在小区
    private String houseLinkMan;//房屋经纪人
    private String houseOriented;//房屋朝向
    private String houseDetailsImg;//房屋详细图片
    private String publisher;//房屋发布人
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date publishTime;//房屋发布时间

    public House() {
    }

    public House(String houseDesc, String houseModel, String houseArea, String houseFloor, String houseType, int housePrice, String houseAddress, String houseImage, String communityName, String houseLinkMan, String houseOriented, String houseDetailsImg, String publisher, Date publishTime) {
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
        this.houseDetailsImg = houseDetailsImg;
        this.publisher = publisher;
        this.publishTime = publishTime;
    }

    public House(int houseId, String houseDesc, String houseModel, String houseArea, String houseFloor, String houseType, int housePrice, String houseAddress, String houseImage, String communityName, String houseLinkMan, String houseOriented, String houseDetailsImg, String publisher, Date publishTime) {
        this.houseId = houseId;
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
        this.houseDetailsImg = houseDetailsImg;
        this.publisher = publisher;
        this.publishTime = publishTime;
    }

    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
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

    public String getHouseDetailsImg() {
        return houseDetailsImg;
    }

    public void setHouseDetailsImg(String houseDetailsImg) {
        this.houseDetailsImg = houseDetailsImg;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }
}
