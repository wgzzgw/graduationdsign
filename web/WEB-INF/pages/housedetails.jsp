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
    <script type="text/javascript">
        $(function () {
            console.log($(".HID").val());
            $(".order-btn").click(function(){
                if($(".uName").val()==""){
                    alert("您还没登录，请先登录再操作");
                    return;
                }
                $.ajax({
                    url:".././order/addOrder.do?id="+$(".HID").val(),
                    async:false,
                    type:"POST",
                    success:function (res) {
                        if(res=='OK'){
                            alert("恭喜你，预定成功！");
                            $(".order-btn").addClass("disabled");
                            $(".order-btn").html("你已成功预定");
                            $(".order-btn").off("click");
                        }else{
                            alert("抱歉，此房源已被他人预定");
                        }
                    }
                });
            });
           for(var i=0;i<${DetailsImg.size()}+1;i++){
               if(i == 0){
                   $("#olnum").append("<li data-target='#carousel-example-generic' data-slide-to='0'  class='active'></li>")
               }else{
                   $("#olnum").append("<li data-target='#carousel-example-generic' data-slide-to='"+i+"'></li>")
               }
            }
            <c:forEach items="${DetailsImg}" var="d">
            $("#details-image").append("<div class='item' style=\"background-image: url('${d}')\"></div>");
            </c:forEach>
        });
    </script>
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
<section class="wrapper" style="width: 80%;margin: 40px auto;
    padding-left: 0px;">
    <p class="breadcrumbb">
        <span class="breadcrumb">
          <a href="/homepage/toIndexPage.do">首页</a>
            <span class="divider">&gt;</span>
          <a href="javascript:;">房屋详情</a>
        </span>
    </p>
    <div class="carousel-image l col-xs-7">
        <div id="carousel-example-generic" class="carousel slide l" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators" id="olnum">
                <!--填充到这里-->
            </ol>
            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox" id="details-image" style="max-height: 450px;max-width: 600px">
                <!--填充到这里-->
                <div class="item active" style="background-image: url('../../img/timg.jpg')"></div>
            </div>
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            </a>
        </div>
    </div>
    <div class="details-info r col-xs-5 ">
        <div class="show-price">
            <span class="sale-price">${Details.housePrice }</span>
            <span class="sale-unit">元/月</span>
            <span class="area">${Details.houseType}  押一付三</span>
        </div>
        <hr>
        <div class="show-house-name">
            <p><span class="field">小区名称：</span><span class="name">${Details.communityName }</span></p>
            <p><span class="field">小区地址：</span><span class="name">${Details.houseAddress }</span></p>
            <p><span class="field">周边学校：</span><span class="name">请联系经纪人</span></p>
            <p><span class="field">联系电话：</span><span class="name">${Details.houseLinkMan }</span></p>
        </div>
        <hr>
        <div class="house-model">
            <ul style="list-style: none">
                <li>
                    <p>${Details.houseModel }</p>
                    <span>规模</span>
                </li>
                <li>
                    <p>${Details.houseArea }平米</p>
                    <span>建筑面积</span>
                </li>
                <li>
                    <p>${Details.houseOriented}</p>
                    <span>朝向</span>
                </li>
            </ul>
        </div>
        <hr>
        <div class="order-btn-container">
            <input type="hidden" class="HID" value="${Details.houseId}">
            <input type="hidden" class="uName" value="${loginUser.userNickname}">
            <button class="order-btn">现在预定</button>
        </div>
    </div>
    <div class="anchor-title">
        <h3>房屋配置</h3>
    </div>
    <div class="household-appliances">
        <ul style="list-style: none">
            <li>
                <i class="iconfont icon-chuang"></i>
                <span>床</span>
            </li>
            <li>
                <i class="iconfont icon-kongtiao"></i>
                <span>空调</span>
            </li>
            <li>
                <i class="iconfont icon-yigui"></i>
                <span>衣柜</span>
            </li>
            <li>
                <i class="iconfont icon-iconyihuifu-"></i>
                <span>桌椅</span>
            </li>
            <li>
                <i class="iconfont icon-xiyiji"></i>
                <span>洗衣机</span>
            </li>
            <li>
                <i class="iconfont icon-shafa"></i>
                <span>沙发</span>
            </li>
            <li>
                <i class="iconfont icon-xiaodugui"></i>
                <span>消毒柜</span>
            </li>
            <li>
                <i class="iconfont icon-weibolu"></i>
                <span>微波炉</span>
            </li>
            <li>
                <i class="iconfont icon-chouyouyanji"></i>
                <span>抽油烟机</span>
            </li>
            <li>
                <i class="iconfont icon-dianshi"></i>
                <span>电视</span>
            </li>
            <li>
                <i class="iconfont icon-meiqitianranqi"></i>
                <span>天然气</span>
            </li>
            <li>
                <i class="iconfont icon-kuandai"></i>
                <span>宽带</span>
            </li>
            <li>
                <i class="iconfont icon-reshuiqianzhuang"></i>
                <span>热水器</span>
            </li>
            <li>
                <i class="iconfont icon-bingxiang"></i>
                <span>冰箱</span>
            </li>
        </ul>
    </div>
</section>
<div style="height: 50px;clear: both"></div>
<!-- 底部页脚部分 -->
<div class="footer">
    <p class="text-center">
        2019 &copy; 吴桂镇.
    </p>
</div>
</body>
</html>
