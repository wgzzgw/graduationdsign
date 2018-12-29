<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2018/12/25
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>查看所有用户</title>
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
                    url : '.././admin/AllUsers.do',  //数据请求路径
                    dataType : "json",  //后端数据传递类型
                    striped: true,                      //是否显示行间隔色
                    cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                    pagination: false,                   //是否显示分页（*）
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
                    responseHandler : function(res) {
                        return res;
                    },
                    uniqueId:"no",
                    columns: [
                        {
                            title: '用户ID',
                            field: 'userId',
                            align: 'center'
                        },
                        {
                            title: '用户姓名',
                            field: 'userName',
                            align: 'center'
                        },
                        {
                            title: '用户密码',
                            field: 'userPassword',
                            align: 'center'
                        },
                        {
                            title: '电话号码',
                            field: 'userPhone',
                            align: 'center'
                        },
                        {
                            title: '用户昵称',
                            field: 'userNickname',
                            align: 'center'
                        },
                        {
                            field: 'operate',
                            title: '操作',
                            formatter: operateFormatter
                        }
                    ]
                });
            console.log(2);
            function operateFormatter(value, row, index) {//赋予的参数
                return [
                    '<a class="btn active " href="http://localhost:8088/admin/toEditUserPage.do?userId='+row.userId+'">修改</a>',
                    '<a class="btn active" href="javacript:;" onclick="onRemove('+row.userId+')">删除</a>',
                ].join('');
            }
        });
        function onRemove(userId) {
            if(confirm('确定要删除吗？')) {
                console.log("111"+userId);
                $.ajax({
                    url: ".././admin/deleteUser.do?userId="+userId,
                    async: false,
                    type: "POST",
                    data: userId,
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
        <h3 class="panel-title text-center">所有注册用户</h3>
    </div>
    <div id="fail" class="alert alert-success alert-dismissable" style="width:50%;margin-left:40%;display:none;">
        <strong>Fail！</strong> 删除中遇到未知问题
    </div>
    <div id="success" class="alert alert-success alert-dismissable" style="width:50%;margin-left:40%;display:none;">
        <strong>Success！</strong> 用户已成功删除
    </div>
    <div class="panel-body">
        <table id="tablee"  data-classes="table table-hover">
            <thead>
            <tr>
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
