package com.design.renthouse.entity;

import java.util.List;

public class UserOrderData {
    private int code;

    private String msg;

    private int total;

    private List<UserOrder> data;

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

    public List<UserOrder> getData() {
        return data;
    }

    public void setData(List<UserOrder> data) {
        this.data = data;
    }
}
