<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2018/12/17
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <script  src="../../js/jquery.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="#" />
    <title>登录页面</title>
    <script type="text/javascript">
        function login() {
            //jQuery写法
            var user = $('#userName').val();
            var password = $('#userPassword').val();
            //JavaScript原生写法
            //var user = document.getElementById('user').value;
            //var password = document.getElementById('password').value;
            if(user==""||password=="") {
                $("#failregist3").show().fadeOut(3000);
                return false;
            }
            $.ajax({
                url:".././login/login.do",
                async:false,
                type:"POST",
                data:{
                    userName:user,
                    userPassword:password
                },
                success:function (res) {
                    if(res=='OK'){
                        popupDiv("pop-div");
                    }else{
                        $("#failregist1").show().fadeOut(3000);
                    }
                }
            });
        }
        function popupDiv(div_id) {
            var div_obj = $("#"+div_id);
            var windowWidth = document.documentElement.clientWidth;
            var windowHeight = document.documentElement.clientHeight;
            var popupHeight = div_obj.height();
            var popupWidth = div_obj.width();
            div_obj.css({"position": "absolute"})
                .animate({left: windowWidth/2-popupWidth/2,
                    top: windowHeight/2-popupHeight/2, opacity: "show" }, "slow");
        }

        function hideDiv(div_id) {
            $("#" + div_id).animate({left: 0, top: 0, opacity: "hide" }, "slow");
            window.location.href="${pageContext.request.contextPath}/login/indexx.do";
        }
    </script>
    <style>
        .pop-box {
            z-index: 9999; /*这个数值要足够大，才能够显示在最上层*/
            margin-bottom: 3px;
            display: none;
            position: absolute;
            background: #FFF;
            border:solid 1px #6e8bde;
        }
        .pop-box h4 {
            color: #FFF;
            cursor:default;
            height: 18px;
            font-size: 14px;
            font-weight:bold;
            text-align: left;
            padding-left: 8px;
            padding-top: 4px;
            padding-bottom: 2px;
            background: url("../../img/headeralter.jpg") ;
        }
        .pop-box-body {
            clear: both;
            margin: 4px;
            padding: 2px;
        }
    </style>
</head>
<body>
<!-- 注册表单 -->
<form style="margin-left:500px;margin-top:200px;">
    <div class="form-group">
        <label  stype="display:inline;">账户：</label>
        <input type="text" class="form-control" id="userName" style="display:inline;width:200px;" autocomplete="off"  placeholder="请输入您的账号名"  />
    </div>
    <div class="form-group">
        <label  style="display:inline;">密码：</label>
        <input type="text" class="form-control" id="userPassword" style="display:inline;width:200px;" autocomplete="off"  placeholder="请输入您的密码" />
    </div>
    <button type="button" class="btn btn-primary" onclick="login()">立即登录</button>
</form>
<div id="failregist1" class="alert alert-success alert-dismissable" style="width:50%;margin-left:40%;display:none;">
    <strong>登录失败</strong> 请检查您的账号密码是否一致！！！
</div>
<div id='pop-div' style="width: 300px" class="pop-box" >
    <h4>登录提示</h4>
    <div class="pop-box-body" >
        <p>
            登录成功，点击即可跳转首页
        </p>
    </div>
    <div  style="text-align: right">
        <input value="确定" id="btn1"  onclick="hideDiv('pop-div');"  type="button"  />
    </div>
</div>
<div id="failregist3" class="alert alert-success alert-dismissable" style="width:50%;margin-left:40%;display:none;">
    <strong>提示！</strong> 请完整填写表单！！！
</div>
</body>
</html>
