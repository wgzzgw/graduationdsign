<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2018/12/19
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我发布的租房信息</title>
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap-table.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap-table.css">
    <script src="../../js/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript">
        $(function () {
            console.log(1);
            $("#tablee").bootstrapTable('destroy');
            $('#tablee').bootstrapTable(
                {
                    url : '.././house/findUserHouse.do',  //数据请求路径
                    dataType : "json",  //后端数据传递类型
                    striped: true,                      //是否显示行间隔色
                    cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                    pagination: true,                   //是否显示分页（*）
                    sortable: true,                     //是否启用排序
                    sortOrder: "asc",                   //排序方式
                    sortName:'houseId',
                    pageSize : 2,
                    pageList : [ 2, 10, 20 ],
                    search:true,
                    pageNumber:1,
                    sidePagination: "server",
                    showColumns: true,                  //是否显示所有的列
                    showRefresh: true,                  //是否显示刷新按钮
                    height: 500,
                    showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                    cardView: false,                    //是否显示详细视图
                    detailView: false,                   //是否显示父子表
                    // contentType : "application/x-www-form-urlencoded",
                    method : 'post',   //请求类型
                    contentType:"application/x-www-form-urlencoded;charset=UTF-8",
                    dataField : "data", //很重要，这是后端返回的实体数据！
                    //是否显示详细视图和列表视图的切换按钮
                    queryParams : function(params) {//自定义参数，这里的参数是传给后台的，我这是是分页用的
                        console.log(11);
                        console.log(this.sortName);
                        return {//这里的params是table提供的
                            page : params.offset,//从数据库第几条记录开始
                            limit : params.limit,//找多少条
                            sortOrder: params.order,//排序
                            sortName:this.sortName,//排序字段
                            keyword:params.search
                        };
                    },
                    responseHandler : function(res) {
                        //在ajax获取到数据，渲染表格之前，修改数据源
                        console.log(22);
                        return res;
                    },
                    formatSearch:function(){
                        return '输入小区名进行模糊搜索';
                    },
                    uniqueId:"no",
                    columns: [
                        {
                            title: '发布ID',
                            field: 'houseId',
                            align: 'center',
                            sortable : true
                        },
                        {
                            title: '房屋详情',
                            field: 'houseDesc',
                            align: 'center'
                        },
                        {
                            title: '几室几厅',
                            field: 'houseModel',
                            align: 'center'
                        },
                        {
                            title: '面积',
                            field: 'houseArea',
                            align: 'center',
                            sortable : true
                        },
                        {
                            title: '楼层',
                            field: 'houseFloor',
                            align: 'center'
                        },
                        {
                            title: '出租方式',
                            field: 'houseType',
                            align: 'center'
                        },
                        {
                            title: '价格',
                            field: 'housePrice',
                            align: 'center',
                            sortable : true
                        },
                        {
                            title: '地址',
                            field: 'houseAddress',
                            align: 'center'
                        },
                        {
                            title: '小区名',
                            field: 'communityName',
                            align: 'center',
                            search:true
                        },
                        {
                            title: '联系人',
                            field: 'houseLinkMan',
                            align: 'center'
                        },
                        {
                            title: '朝向',
                            field: 'houseOriented',
                            align: 'center'
                        },
                        {
                            title: '发布者',
                            field: 'publisher',
                            align: 'center'
                        },
                        {
                            title: '发布时间',
                            field: 'publishTime',
                            align: 'center',
                            sortable : true
                        },
                        {
                            field: 'operate',
                            title: '操作',
                            formatter: operateFormatter
                        }
                    ]
                });
            console.log(2);
        });
        function operateFormatter(value, row, index) {//赋予的参数
            return [
                '<a class="btn active " href="http://localhost:8088/user/toUpdateHousePage.do?houseId='+row.houseId+'">修改</a>',
                '<a class="btn active" href="javacript:;" onclick="onRemove('+row.houseId+')">删除</a>',
            ].join('');
        }
        function onRemove(houseId) {
            if(confirm('确定要删除吗？')) {
                console.log("111"+houseId);
                $.ajax({
                    url: ".././house/deleteUserHouse.do?houseId="+houseId,
                    async: false,
                    type: "POST",
                    data: houseId,
                    success: function (res) {
                        if (res == 'OK') {
                            $("#success").show().fadeOut(3000);
                        } else {
                            $("#fail").show().fadeOut(3000);
                        }
                    }
                });
            }
        }
    </script>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title text-center">我发布的房源信息</h3>
    </div>
    <div id="fail" class="alert alert-success alert-dismissable" style="width:50%;margin-left:40%;display:none;">
        <strong>Fail！</strong> 删除中遇到未知问题
    </div>
    <div id="success" class="alert alert-success alert-dismissable" style="width:50%;margin-left:40%;display:none;">
        <strong>Success！</strong> 房源已成功删除
    </div>
    <div class="panel-body">
        <%--<table data-toggle="table" id="tablee" data-height="400"
               data-classes="table table-hover" data-striped="true"
               data-pagination="true" data-side-pagination="server"
               data-search="true" data-show-refresh="true" data-show-toggle="true"
               data-show-columns="true">--%>
            <table id="tablee"  data-classes="table table-hover">
            <thead>
            <tr>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            </thead>
        </table>
    </div>
</div>
</body>
</html>
