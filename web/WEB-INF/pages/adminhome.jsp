<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2018/12/25
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台管理系统</title>
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
            <a class="navbar-brand" title="logoTitle" href="/user/welcome.do" target="mainFrame">后台管理系统</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li role="presentation">
                    <a href="/user/welcome.do" target="mainFrame"><cite>超级管理员</cite></a>
                </li>
                <li class="na">
                    <a href="/admin/toUpdateAdminPwdPage.do" target="mainFrame">修改密码</a>
                </li>
                <li class="na">
                    <a href="/admin/adminSingnout.do">
                        <span class="glyphicon glyphicon-lock"></span>退出</a>
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
            <li role="presentation">
                <a href="/admin/toAllUserPage.do" target="mainFrame" >查看所有用户</a>
            </li>
            <li role="presentation">
                <a href="" target="mainFrame" >所有房源信息</a>
            </li>
            <li role="presentation">
                <a href="" target="mainFrame" >添加房源信息</a>
            </li>
        </ul>
    </div>
    <!-- 左侧导航和正文内容的分隔线 -->
    <div class="splitter"></div>
    <!-- 正文内容部分 -->
    <div class="pageContent">
        <iframe src="/user/welcome.do" id="mainFrame" name="mainFrame"
                frameborder="0" width="100%"  height="100%" frameBorder="0" seamless scrolling="auto">
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
