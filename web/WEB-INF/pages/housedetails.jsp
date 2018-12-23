<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2018/12/23
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>详情</title>
    <script src="../../js/jquery.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_848666_pri5cwk3xde.css"/>
    <link rel="stylesheet" href="../../css/details.css">
</head>
<body>
<nav class="top">
    <a href="/login/indexx.do">
        <span class="glyphicon glyphicon-home redColor"></span>
        <img src="../../img/logo.png" id="logo" name="logo">
    </a>
    <c:if test="${empty loginUser}">
        <a href="/login/loginn.do">请登录</a>
        <a href="/login/registn.do">免费注册</a>
    </c:if>
    <c:if test="${not empty loginUser}">
        <a href="/user/toUserSystem.do" target="_blank"><i class="glyphicon glyphicon-user redColor"></i> 个人中心</a>
        <a href="/login/signout.do">退出登录</a>
    </c:if>
</nav>
<div class="details-head">
    <!-- title -->
    <div class="title-wrapper">
        <div class="left-con">
            <h2 class="house-title">${Details.houseDesc}</h2>
            <p class="tags">
                <span>户型方正，采光好，格局好。</span>
            </p>
        </div>
    </div>
</div>
</body>
</html>
