package com.design.renthouse.entity;
/*
* 查询条件
* */
public class Page {
    private int page;//第几页开始
    private int limit;//限制几个
    private int userId;//用户Id
    private String publisher;//发布者
    private String sortOrder;//排序方式
    private String sortName;//排序字段
    private String searchkey;//查询字段（只支持对小区查询)

    public Page(int limit, int userId, String publisher, String sortOrder, String sortName, String searchkey) {
        this.limit = limit;
        this.userId = userId;
        this.publisher = publisher;
        this.sortOrder = sortOrder;
        this.sortName = sortName;
        this.searchkey = searchkey;
    }

    public Page(int page, int limit, int userId, String publisher, String sortOrder, String sortName, String searchkey) {
        this.page = page;
        this.limit = limit;
        this.userId = userId;
        this.publisher = publisher;
        this.sortOrder = sortOrder;
        this.sortName = sortName;
        this.searchkey = searchkey;
    }

    public String getSearchkey() {
        return searchkey;
    }

    public void setSearchkey(String searchkey) {
        this.searchkey = searchkey;
    }

    public Page(int limit, int userId, String publisher, String sortOrder, String sortname) {
        this.limit = limit;
        this.userId = userId;
        this.publisher = publisher;
        this.sortOrder = sortOrder;
        this.sortName = sortname;
    }

    public Page(int page, int limit, int userId, String publisher, String sortOrder, String sortname) {
        this.page = page;
        this.limit = limit;
        this.userId = userId;
        this.publisher = publisher;
        this.sortOrder = sortOrder;
        this.sortName = sortname;
    }

    public String getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(String sortOrder) {
        this.sortOrder = sortOrder;
    }

    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortname) {
        this.sortName = sortname;
    }

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
