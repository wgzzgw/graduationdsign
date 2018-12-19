<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2018/12/17
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>用户个人中心</title>
    <script  src="../../js/jquery.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../css/customer.css">
</head>
<body>
<!--顶部导航栏部分-->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" title="logoTitle" href="javascript:;">用户个人中心</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li role="presentation">
                    <a href="javascript:;">当前用户：<span class="badge">${loginUser.userName}</span></a>
                </li>
                <li class="na">
                    <a href="/login/signout.do">
                        <span class="glyphicon glyphicon-lock"></span>退出登录</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- 中间主体内容部分 -->
<div class="pageContainer">
    <!-- 左侧导航栏 -->
    <div class="pageSidebar">
        <ul class="nav nav-stacked nav-pills">
            <!-- 开始 -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:;" target="mainFrame">
                    用户信息管理<span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="/user/updaten.do" target="mainFrame">我的租房信息</a>
                    </li>
                    <li>
                        <a href="/user/updaten.do" target="mainFrame">修改我的密码</a>
                    </li>
                </ul>
            </li>
            <li role="presentation">
                <a href="/house/addhouse.do" target="mainFrame" >发布房源信息</a>
            </li>
            <li role="presentation">
                <a href="/user/toUserRentalPage.do" target="mainFrame" >我发布的信息</a>
            </li>
        </ul>
    </div>

    <!-- 左侧导航和正文内容的分隔线 -->
    <div class="splitter"></div>
    <!-- 正文内容部分 -->
    <div class="pageContent">
        <iframe src="index.jsp" id="mainFrame" name="mainFrame"
                frameborder="0" width="100%"  height="100%" frameBorder="0">
        </iframe>
    </div>

</div>
<!-- 底部页脚部分 -->
<div class="footer">
    <p class="text-center">
        2019 &copy; 吴桂镇.
    </p>
</div>
<script type="text/javascript">
    $(".nav li").click(function() {
        $(".active").removeClass('active');
        $(this).addClass("active");
    });
</script>
</body>
</html>
