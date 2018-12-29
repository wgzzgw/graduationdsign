<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2018/12/21
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>修改房源信息</title>
    <script  src="../../js/jquery.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/bootstrap-table.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap-table.js"></script>
    <link type="text/css" rel="stylesheet" href="../../css/fileinput.css" />
    <script type="text/javascript" src="../../js/fileinput.js"></script>
    <script type="text/javascript" src="../../js/zh.js"></script>
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
            var error4 = false;
            var error5 = false;
            var error6 = false;
            var error7 = false;
            $("#houseDesc").blur(function(){
                var houseDesc = $("#houseDesc").val();
                if(houseDesc =='') {
                    showError('houseDesc', '房屋描述不能为空');
                    error1 = true;
                }else{
                    $("#houseDesc").css({"border-color":"green"});
                    $("#houseDescTip").css({"display":"none"});
                    error1 = false;
                }
            });
            $("#houseModel").blur(function(){
                var houseModel = $("#houseModel").val();
                if(houseModel =='') {
                    showError('houseModel', '房屋类型不能为空');
                    error2 = true;
                }else{
                    $("#houseModel").css({"border-color":"green"});
                    $("#houseModelTip").css({"display":"none"});
                    error2 = false;
                }
            });
            $("#houseArea").blur(function(){
                var houseArea = $("#houseArea").val();
                var re = /^[0-9]*[1-9][0-9]*$/;
                if(houseArea =='') {
                    showError('houseArea', '房屋面积不能为空');
                    error3 = true;
                }else if(!re.test(houseArea)){
                    showError('houseArea', '请输入正确的整数');
                    error3 = true;
                }else{
                    $("#houseArea").css({"border-color":"green"});
                    $("#houseAreaTip").css({"display":"none"});
                    error3 = false;
                }
            });
            $("#houseFloor").blur(function(){
                var houseFloor = $("#houseFloor").val();
                if(houseFloor =='') {
                    showError('houseFloor', '房屋楼层不能为空');
                    error4 = true;
                }else{
                    $("#houseFloor").css({"border-color":"green"});
                    $("#houseFloorTip").css({"display":"none"});
                    error4 = false;
                }
            });
            $("#houseAddress").blur(function(){
                var houseAddress = $("#houseAddress").val();
                if(houseAddress =='') {
                    showError('houseAddress', '房屋地址不能为空');
                    error5 = true;
                }else{
                    $("#houseAddress").css({"border-color":"green"});
                    $("#houseAddressTip").css({"display":"none"});
                    error5 = false;
                }
            });
            $("#housePrice").blur(function(){
                var housePrice = $("#housePrice").val();
                var re = /^[0-9]*[1-9][0-9]*$/;
                if(housePrice =='') {
                    showError('housePrice', '房屋价格不能为空');
                    error6 = true;
                }else if(!re.test(housePrice)){
                    showError('housePrice', '请输入正确的价格');
                    error6 = true;
                } else{
                    $("#housePrice").css({"border-color":"green"});
                    $("#housePriceTip").css({"display":"none"});
                    error6 = false;
                }
            });
            $("#houseLinkMan").blur(function(){
                var houseLinkMan = $("#houseLinkMan").val();
                var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
                if(houseLinkMan =='') {
                    showError('houseLinkMan', '联系电话不能为空');
                    error7 = true;
                }else if(!myreg.test(houseLinkMan)){
                    showError('houseLinkMan', '请输入有效的电话号码');
                    error7 = true;
                }else{
                    $("#houseLinkMan").css({"border-color":"green"});
                    $("#houseLinkManTip").css({"display":"none"});
                    error7 = false;
                }
            });
            $("#updateHouse-btn").click(function(event) {
                $("#houseDesc").blur();
                $("#houseModel").blur();
                $("#houseArea").blur();
                $("#houseFloor").blur();
                $("#housePrice").blur();
                $("#houseAddress").blur();
                $("#communityName").blur();
                $("#houseLinkMan").blur();
                if(!error1&&!error2&&!error3&&!error4&&!error5&&!error6&&!error7){
                    var houseDesc= $("#houseDesc").val();
                    var houseModel=$("#houseModel").val();
                    var houseArea=$("#houseArea").val();
                    var houseFloor=$("#houseFloor").val();
                    var houseType=$("#houseType").val();
                    var housePrice=$("#housePrice").val();
                    var houseAddress=$("#houseAddress").val();
                    var communityName=$("#communityName").val();
                    var houseLinkMan=$("#houseLinkMan").val();
                    var houseOriented=$("#houseOriented").val();
                    var publisher=$("#publisher").val();
                    var data={
                        houseId:${House.houseId },
                        houseDesc:houseDesc,
                        houseModel:houseModel,
                        houseArea:houseArea,
                        houseFloor:houseFloor,
                        houseType:houseType,
                        housePrice:parseInt(housePrice),
                        houseAddress:houseAddress,
                        houseImage:"",
                        communityName:communityName,
                        houseLinkMan:houseLinkMan,
                        houseOriented:houseOriented,
                        houseDetailsImg:"",
                        publisher:publisher,
                        publishTime:new Date()
                    };
                    $.ajax({
                        url:".././house/updateHouse.do",
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
            size: 14px;
        }
    </style>
</head>
<body>
<div  style="width: 900px;margin-top: 40px">
    <fieldset>
        <legend style="font-size: 26px">修改我发布的房源信息</legend>
    </fieldset>
    <form id="updateHouse"  class="form-horizontal" role="form">
        <div class="form-group">
            <label class="col-sm-2 control-label">房源描述</label>
            <div class="col-sm-10">
                <input type="hidden" id="houseId" name="houseId" value="${House.houseId }">
                <textarea class="form-control" id="houseDesc"  placeholder="请输入内容">${House.houseDesc }</textarea><span id="houseDescTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">房屋类型</label>
            <div class="col-sm-10">
                <input type="text" id="houseModel"  placeholder="几室几厅"
                       autocomplete="off" class="form-control" value="${House.houseModel}"><span id="houseModelTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">房屋面积</label>
            <div class="col-sm-10">
                <input type="text" id="houseArea"  placeholder="**平方米"
                       autocomplete="off" class="form-control" value="${House.houseArea }"><span id="houseAreaTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">房屋楼层</label>
            <div class="col-sm-10">
                <input type="text" id="houseFloor"  placeholder="高层/低层/几楼"
                       autocomplete="off" class="form-control" value="${House.houseFloor}"><span id="houseFloorTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">出租方式</label>
            <div class="col-sm-10">
                <select id="houseType" class="form-control">
                    <option value="整租"<c:if test="${House.houseType == '整租'}"> selected</c:if>>整租</option>
                    <option value="合租"<c:if test="${House.houseType == '合租'}"> selected</c:if>>合租</option>
                    <option value="单间"<c:if test="${House.houseType == '单间'}"> selected</c:if>>单间</option>
                </select>
            </div><span id="houseTypeTip" style="display:none;color:red;"></span>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">租房价格</label>
            <div class="col-sm-10">
                <input type="text" id="housePrice"  placeholder="请输入整数即可（单位：元）"
                       autocomplete="off" class="form-control" value="${House.housePrice}"><span id="housePriceTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">地&emsp;&emsp;址</label>
            <div class="col-sm-10">
                <input type="text" id="houseAddress"  placeholder=""
                       autocomplete="off" class="form-control" value="${House.houseAddress}"><span id="houseAddressTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">小区名字</label>
            <div class="col-sm-10">
                <input type="text" id="communityName"  placeholder=""
                       autocomplete="off" class="form-control" value="${House.communityName}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">联系电话</label>
            <div class="col-sm-10">
                <input type="text" id="houseLinkMan"  placeholder="请输入11位手机号码"
                       autocomplete="off" class="form-control" value="${House.houseLinkMan}"><span id="houseLinkManTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">房屋朝向</label>
            <div class="col-sm-10">
                <select id="houseOriented" class="form-control">
                    <option value="南"<c:if test="${House.houseOriented == '南'}"> selected</c:if>>南</option>
                    <option value="东"<c:if test="${House.houseOriented == '东'}"> selected</c:if>>东</option>
                    <option value="北"<c:if test="${House.houseOriented == '北'}"> selected</c:if>>北</option>
                    <option value="西"<c:if test="${House.houseOriented == '西'}"> selected</c:if>>西</option>
                </select>
            </div><span id="houseOrientedTip" style="display:none;color:red;"></span>
        </div>
        <div class="form-group">
            <div class="input-group" style="padding-left: 250px">
                <button class="btn"  id="updateHouse-btn"  type="submit">立即修改</button>
                <span>&emsp;&emsp;</span>
                <c:if test="${not empty loginUser}">
                    <a href="/user/toUserRentalPage.do" class="btn-primary btn">返回</a>
                </c:if>
                <c:if test="${empty loginUser}">
                    <a href="/admin/toAllHousePage.do" class="btn-primary btn">返回</a>
                </c:if>
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
