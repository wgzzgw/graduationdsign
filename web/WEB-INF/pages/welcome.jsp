<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2018/12/22
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎回来</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <style>
        body {
            margin: 0px;
            padding: 0px;
        }

        .welcome {
            position: absolute;
            top: 0px;
            left: 0px;
            bottom: 0px;
            right: 0px;
            margin: auto;
            width: 800px;
            height: 200px;
            text-align: center;
        }

        .welcome span {
            font-size: 90px;
            color: #009688;
        }

        .wel-world {
            font-size: 34px;
            color: #009688;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="welcome">
    <p><span class="glyphicon glyphicon-tree-conifer"></span></p>
    <p class="wel-world">欢迎访问后台管理系统！</p>
</div>
</body>
</html>