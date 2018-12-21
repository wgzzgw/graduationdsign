package com.design.renthouse.entity;

import java.util.List;

/*
* 用户房源信息
* */
public class UserHouseData {
    private int code;//状态吗
    private String msg;//状态短语
    private int total;//房子数量
    private List<House> data;//房源具体数据

    public UserHouseData(String msg, int total, List<House> data) {
        this.msg = msg;
        this.total = total;
        this.data = data;
    }

    public UserHouseData(int code, String msg, int total, List<House> data) {
        this.code = code;
        this.msg = msg;
        this.total = total;
        this.data = data;
    }

    public UserHouseData() {
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<House> getData() {
        return data;
    }

    public void setData(List<House> data) {
        this.data = data;
    }
}
