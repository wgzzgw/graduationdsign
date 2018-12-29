<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2018/12/28
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>修改用户信息</title>
    <script  src="../../js/jquery.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function showError(formSpan, errorText) {
            $("#" + formSpan).css({"border-color":"red"});
            $("#" + formSpan + "Tip").empty();
            $("#" + formSpan + "Tip").append(errorText);
            $("#" + formSpan + "Tip").css({"display":"inline"});
        }
        $(document).ready(function() {
            var error1 = false;
            var error2 = false;
            var error3 = false;
            $("#userPassword").blur(function(){
                var userPassword = $("#userPassword").val();
                if(userPassword =='') {
                    showError('userPassword', '账号密码不能为空');
                    error1 = true;
                }else{
                    $("#userPassword").css({"border-color":"green"});
                    $("#userPasswordTip").css({"display":"none"});
                    error1 = false;
                }
            });
            $("#userPhone").blur(function(){
                var userPhone = $("#userPhone").val();
                var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
                if(userPhone =='') {
                    showError('userPhone', '电话号码不能为空');
                    error2 = true;
                }else if(!myreg.test(userPhone)){
                    showError('userPhone', '请输入有效的电话号码');
                    error2 = true;
                }else{
                    $("#userPhone").css({"border-color":"green"});
                    $("#userPhoneTip").css({"display":"none"});
                    error2 = false;
                }
            });
            $("#userNickname").blur(function(){
                var userNickname = $("#userNickname").val();
                if(userNickname =='') {
                    showError('userNickname', '用户昵称不能为空');
                    error3 = true;
                }else{
                    $("#userNickname").css({"border-color":"green"});
                    $("#userNicknameTip").css({"display":"none"});
                    error3 = false;
                }
            });
            $("#updateUser-btn").click(function(event) {
                $("#userName").blur();
                $("#userPassword").blur();
                $("#userPhone").blur();
                $("#userNickname").blur();
                if(!error1&&!error2&&!error3){
                    var userName= $("#userName").val();
                    var userPassword=$("#userPassword").val();
                    var userPhone=$("#userPhone").val();
                    var userNickname=$("#userNickname").val();
                    var data={
                        userId:${User.userId },
                        userName:userName,
                        userPassword:userPassword,
                        userPhone:userPhone,
                        userNickname:userNickname
                    };
                    $.ajax({
                        url:".././admin/editUser.do",
                        async:false,
                        type:"POST",
                        contentType:"application/json",
                        data:JSON.stringify(data),
                        success:function (res) {
                            if(res=='OK'){
                                $("p").show().fadeOut(3000);
                            }else{
                                alert("修改失败！！！");
                            }
                        }
                    });
                }else{
                    $("h5").show().fadeOut(3000);
                }
                event.preventDefault();
                return false;
            });
        });
    </script>
    <style>
        p,h5{
            color: #761c19;
            size: 15px;
        }
    </style>
</head>
<body>
<div  style="width: 500px;margin-top: 40px">
    <fieldset>
        <legend style="font-size: 26px">修改用户信息</legend>
    </fieldset>
    <form id="updateUser"  class="form-horizontal" role="form">
        <div class="form-group">
            <label class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-7">
                <input type="hidden" id="userId" name="userId" value="${User.userId}">
                <input class="form-control" id="userName"  placeholder="用户姓名不可更改" value="${User.userName}" disabled>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">密&emsp;码</label>
            <div class="col-sm-7">
                <input type="text" id="userPassword"  placeholder="请输入账号密码"
                       autocomplete="off" class="form-control" value="${User.userPassword}"><span id="userPasswordTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">电&emsp;话</label>
            <div class="col-sm-7">
                <input type="text" id="userPhone"  placeholder="请输入11位手机号码"
                       autocomplete="off" class="form-control" value="${User.userPhone }"><span id="userPhoneTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">昵&emsp;称</label>
            <div class="col-sm-7">
                <input type="text" id="userNickname"  placeholder="请输入用户昵称"
                       autocomplete="off" class="form-control" value="${User.userNickname}"><span id="userNicknameTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <div class="input-group" style="padding-left: 250px">
                <button class="btn"  id="updateUser-btn"  type="submit">立即修改</button>
                <span>&emsp;&emsp;</span>
                <a href="/admin/toAllUserPage.do" class="btn-primary btn">返回</a>
                <span>
                    <p style="display:none;margin-left:40%;">修改成功！！</p>
                    <h5 style="display: none;margin-left:40%;">请修改表单数据为正确再发布！</h5>
                </span>
            </div>
        </div>
    </form>
</div>
</body>
</html>
