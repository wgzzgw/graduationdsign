package com.design.renthouse.entity;
/*
* 查询条件
* */
public class Page {
    private int page;//第几页开始
    private int limit;//限制几个
    private int userId;//用户Id
    private String publisher;//发布者

    public Page(int limit, int userId, String publisher) {
        this.limit = limit;
        this.userId = userId;
        this.publisher = publisher;
    }

    public Page(int page, int limit, int userId, String publisher) {
        this.page = page;
        this.limit = limit;
        this.userId = userId;
        this.publisher = publisher;
    }

    public Page() {
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
}
