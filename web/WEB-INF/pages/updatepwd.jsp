<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2018/12/17
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <script  src="../../js/jquery.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            var error1 = false;
            var error2=false;
            var error3=false;
            $("#oldpass").blur(function(){
                var oldpass = $("#oldpass").val();
                if(oldpass =='') {
                    showError('oldpass', '密码不能为空');
                    error1 = true;
                }else{
                    $("#oldpass").css({"border-color":"green"});
                    $("#oldpassTip").css({"display":"none"});
                    error1 = false;
                }
            });
            $("#newpass").blur(function(){
                var newpass = $("#newpass").val();
                if(newpass == '') {
                    showError('newpass', '新密码不能为空');
                    error2 = true;
                }
                else {
                    $("#newpass").css({"border-color":"green"});
                    $("#newpassTip").css({"display":"none"});
                    error2 = false;
                }
            });
            $("#newpassAgain").blur(function(){
                var newpass = $("#newpass").val();
                if(newpass == '') {
                    showError('newpass', '新密码不能为空');
                    error = true;
                    return;
                }
                var newpassAgain = $("#newpassAgain").val();
                if(newpassAgain != newpass) {
                    showError('newpassAgain', '与输入的新密码不一致');
                    error3 = true;
                }
                else {
                    $("#newpassAgain").css({"border-color":"green"});
                    $("#newpassAgainTip").css({"display":"none"});
                    error3 = false;
                }
            });
            $("#submit").click(function(event){
                    $("#oldpass").blur();
                    $("#newpass").blur();
                    $("#newpassAgain").blur();
                if(!error1&&!error2&&!error3) {
                    var oldpass = $("#oldpass").val();
                    var newpass = $("#newpass").val();
                    $.ajax({
                        url:".././user/updateUserPwd.do",
                        async:false,
                        type:"POST",
                        data:{
                            id:${loginUser.userId},
                            newPwd:newpass,
                            oldPwd:oldpass
                        },
                        success:function (res) {
                            if(res=='OK'){
                               /* $("#modifySuccess").css({'display':'inline'});*/
                                $("#modifySuccess").show().fadeOut(3000);
                                $("#oldpass").prop("value","");
                                $("#newpass").prop("value","");
                                $("#newpassAgain").prop("value","");
                            }else{
                                $("#failregist1").show().fadeOut(3000);
                            }
                        }
                    });
                }
                event.preventDefault();
                return false;
            });
        });
        function showError(formSpan, errorText) {
            $("#" + formSpan).css({"border-color":"red"});
            $("#" + formSpan + "Tip").empty();
            $("#" + formSpan + "Tip").append(errorText);
            $("#" + formSpan + "Tip").css({"display":"inline"});
        }
    </script>
</head>
<body>
<div  style="margin-top:100px;width:120%;">
    <form  role="form">
        <div class="form-group">
            <label for="oldpass" class="col-sm-2 control-label">旧密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" style="width:250px;" id="oldpass" placeholder="Old Password"><span id="oldpassTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="newpass" class="col-sm-2 control-label">新密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" style="width:250px;" id="newpass" placeholder="New Password"><span id="newpassTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="newpassAgain" class="col-sm-2 control-label">再次确认新密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" style="width:250px;" id="newpassAgain" placeholder="Again New Password"><span id="newpassAgainTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2">  </label>
            <button type="submit" class="btn btn-primary" id="submit" style="text-align:center;">确认修改</button>
            <button type="reset"  class="btn btn-primary" id="reset" style="text-align:center;">重置输入</button>
        </div>
    </form>
</div>
<div id="modifySuccess" class="alert alert-success alert-dismissable" style="width:50%;margin-left:40%;display:none;">
    <strong>Success!</strong> 你已成功修改密码！
</div>
<div id="failregist1" class="alert alert-success alert-dismissable" style="width:50%;margin-left:40%;display:none;">
    <strong>修改失败！</strong> 请检查您的旧密码是否正确！！！
</div>
</body>
</html>
