<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2018/12/16
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script src="../../js/jquery.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../css/login.css">
    <title>房屋租赁网</title>
    <script type="text/javascript">
        $(function () {
            $('#find').click(function(event) {
                $.ajax({
                    url:".././homepage/findHouseByLike.do?keywords="+$('#keywords').val(),
                    async:false,
                    type:"POST",
                    success:function (res) {
                           if(res=='OK'){
                               window.location.href="${pageContext.request.contextPath}/homepage/toindex.do";
                           }
                    }
                });
            });
        });
    </script>
</head>
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
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <div class="input-group col-md-6" style="z-index: 9999;position:absolute;overflow: hidden;left:25%;padding: 100px 0px;">
        <input type="text" class="form-control"  placeholder="请输入房源特征、房型、小区名..." id="keywords"/>
        <span class="input-group-btn">
         <button class="btn btn-info btn-search" type="button" id="find"><i
                 class="glyphicon glyphicon-search redColor"></i></button>
    </span>
    </div>
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" style="max-height: 450px;">
       <%-- <div class="item active">
            <img src="../../img/banner1.jpg">
        </div>
        <div class="item">
            <img src="../../img/banner2.jpg">
        </div>
        <div class="item">
            <img src="../../img/banner3.jpg">
        </div>
        <div class="item">
            <img src="../../img/banner4.jpg">
        </div>--%>
           <div class="item active" style="background-image: url('../../img/banner1.jpg')"></div>
           <div class="item" style="background-image: url('../../img/banner2.jpg')"></div>
           <div class="item" style="background-image: url('../../img/banner3.jpg')"></div>
           <div class="item" style="background-image: url('../../img/banner4.jpg')"></div>
    </div>
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    </a>
</div>
<!--内容开始-->
<div class="list_control_bar" style="width: 80%">
    <div>
        <div class="list_title l"><span>全部房源</span></div>
        <div class="list-group r">
            <ul class="list-group-item" style="border-color:white;list-style: none;">
                <li><a href="/homepage/toIndexPage.do">默认排序</a></li>
                <li><a href="/homepage/findHousrOrderByAsc.do">价格升序</a></li>
                <li><a href="/homepage/findHousrOrderByDesc.do">价格降序</a></li>
            </ul>
        </div>
    </div>
</div>
    <section style="width: 80%;margin: 40px auto;
    padding-left: 0px;">
        <hr>
        <h2>共找到<span style="color: #ffc601;margin: 0 5px;">${House.size()}</span>套出租房源</h2>
        <div class="house-detail">
            <ul style="list-style: none">
              <%--  <li>
                    <a href="" class="show-image">
                        <img src="../../img/banner1.jpg" width="240px" height="180px">
                    </a>
                    <div class="show-details">
                        <p class="house-title">
                            <a href="">测试</a>
                        </p>
                        <p class="house-about">
                            <span class="glyphicon glyphicon-home"></span>
                            <span>1室1厅</span>
                            <span class="flag-line">|</span>
                            <span>80 m<sup>2</sup></span>
                            <span class="flag-line">|</span>
                            <span>普通装修</span>
                            <span class="flag-line">|</span>
                            <span>9楼</span>
                            <span class="flag-line">|</span>
                            <span>整租</span>
                        </p>
                        <p class="house-address clearfix">
                            <span class="glyphicon glyphicon-map-marker"></span>
                            <span>
			    		        <span>天河客运站</span>
					        </span>
                        </p>
                        <div class="show-price">
                            <span class="sale-price">4000</span>
                            <span class="sale-unit">元/月</span>
                        </div>
                    </div>
                </li>--%>
                  <c:forEach items="${House}" var="h">
                      <li>
                          <a href="/detail/toDetailsPage.do?id=${h.houseId}" class="show-image">
                              <img src="${h.houseImage }" width="240px" height="180px">
                          </a>
                          <div class="show-details">
                              <p class="house-title">
                                  <a href="/detail/toDetailsPage.do?id=${h.houseId}">${h.houseDesc }</a>
                              </p>
                              <p class="house-about">
                                  <span class="glyphicon glyphicon-home"></span>
                                  <span>${h.houseModel}</span>
                                  <span class="flag-line">|</span>
                                  <span>${h.houseArea} m<sup>2</sup></span>
                                  <span class="flag-line">|</span>
                                  <span>普通装修</span>
                                  <span class="flag-line">|</span>
                                  <span>${h.houseFloor}</span>
                                  <span class="flag-line">|</span>
                                  <span>${h.houseType }</span>
                              </p>
                              <p class="house-address clearfix">
                                  <span class="glyphicon glyphicon-map-marker"></span>
			    		        <span>${h.houseAddress}</span>
                              </p>
                              <div class="show-price">
                                  <span class="sale-price">${h.housePrice}</span>
                                  <span class="sale-unit">元/月</span>
                              </div>
                          </div>
                      </li>
                  </c:forEach>
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
