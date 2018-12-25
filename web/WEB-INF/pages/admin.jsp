<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2018/12/25
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>管理员登录</title>
    <script  src="../../js/jquery.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../css/admin.css">
    <script type="text/javascript">
        function login() {
            var user = $('#adminUsername').val();
            var password = $('#adminPassword').val();
            if(user==""||password=="") {
                $("#failregist3").show().fadeOut(3000);
                return false;
            }
            $.ajax({
                url:".././admin/adminAccess.do",
                async:false,
                type:"POST",
                data:{
                    adminUsername:user,
                    adminPassword:password
                },
                success:function (res) {
                    if(res=='OK'){
                       alert("登录成功，点击跳转");
                        window.location.href="${pageContext.request.contextPath}/admin/toAdminHomePage.do";
                    }else{
                        $("#failregist1").show().fadeOut(3000);
                    }
                }
            });
        }
    </script>
</head>
<body>
<div class="loginpane">
    <h3>管理员登录</h3>
    <hr class="bg-primary">
    <div class="login">
        <div class="form-group panel">
            <div class="form-control" style="margin-bottom: 30px;">
                <label stype="display:inline;">账&emsp;号:</label>
                <input type="text" id="adminUsername" placeholder="请输入管理员账号"
                       autocomplete="off" style="display:inline;width:200px;border: 0px;outline:none;cursor: pointer;">
            </div>
            <div class="form-control" style="margin-bottom: 30px;">
                <label stype="display:inline;">密&emsp;码:</label>
                <input type="password" id="adminPassword" placeholder="请输入管理员密码"
                       autocomplete="off" style="display:inline;width:200px;border: 0px;outline:none;cursor: pointer;">
            </div>
        </div>
        <button  class="btn btn-primary" onclick="login()">登录</button>
    </div>
</div>
<div id="failregist3" class="alert alert-success alert-dismissable" style="width:50%;margin-left:40%;display:none;">
    <strong>提示！</strong> 请完整填写表单！！！
</div>
<div id="failregist1" class="alert alert-success alert-dismissable" style="width:50%;margin-left:40%;display:none;">
    <strong>登录失败</strong> 请检查您的账号密码是否一致！！！
</div>
</body>
</html>
