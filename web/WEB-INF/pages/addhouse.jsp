<%--
  Created by IntelliJ IDEA.
  User: yy
  Date: 2018/12/18
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>添加房屋信息</title>
    <script  src="../../js/jquery.min.js"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/bootstrap-table.css">
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/bootstrap-table.js"></script>
    <link type="text/css" rel="stylesheet" href="../../css/fileinput.css" />
    <script type="text/javascript" src="../../js/fileinput.js"></script>
    <script type="text/javascript" src="../../js/zh.js"></script>
    <script type="text/javascript">
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
            $("#addHouseRecord-btn").click(function(event) {
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
                            houseId:0,
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
                        url:".././addHouse/addHouseRecord.do",
                        async:false,
                        type:"POST",
                        contentType:"application/json",
                        data:JSON.stringify(data),
                        success:function (res) {
                            if(res=='OK'){
                                $("#modifySuccess").css({'display':'inline'});
                                $("#houseDesc").prop("value","");
                                $("#houseModel").prop("value","");
                                $("#houseArea").prop("value","");
                                $("#houseFloor").prop("value","");
                                $("#housePrice").prop("value","");
                                $("#houseAddress").prop("value","");
                                $("#communityName").prop("value","");
                                $("#houseLinkMan").prop("value","");
                                $("p").show().fadeOut(3000);
                            }else{
                                alert("发布失败！！！");
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
        function showError(formSpan, errorText) {
            $("#" + formSpan).css({"border-color":"red"});
            $("#" + formSpan + "Tip").empty();
            $("#" + formSpan + "Tip").append(errorText);
            $("#" + formSpan + "Tip").css({"display":"inline"});
        }
        $(function () {
            initFileInput("input-id");
            initSingleInput("SingleUpload");
            $('#reeset').click(function(){
                $("#houseDesc").prop("value","");
                $("#houseModel").prop("value","");
                $("#houseArea").prop("value","");
                $("#houseFloor").prop("value","");
                $("#housePrice").prop("value","");
                $("#houseAddress").prop("value","");
                $("#communityName").prop("value","");
                $("#houseLinkMan").prop("value","");
            });
        })
        function initSingleInput(ctrlName){
            var control = $('#' + ctrlName);
            control.fileinput({
                uploadUrl: ".././addHouse/insert.do", //上传的地址
                allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
                //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
                uploadAsync: true, //默认异步上传
                showUpload: true, //是否显示上传按钮
                showRemove : true, //显示移除按钮
                showPreview : true, //是否显示预览
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                //dropZoneEnabled: true,//是否显示拖拽区域
                //minImageWidth: 50, //图片的最小宽度
                //minImageHeight: 50,//图片的最小高度
                //maxImageWidth: 1000,//图片的最大宽度
                //maxImageHeight: 1000,//图片的最大高度
                maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
                //minFileCount: 0,
                maxFileCount: 1, //表示允许同时上传的最大文件个数
                enctype: 'multipart/form-data',
                validateInitialCount:true,
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            }).on('filepreupload', function(event, data, previewId, index) {     //上传中
                var form = data.form, files = data.files, extra = data.extra,
                    response = data.response, reader = data.reader;
                console.log('文件正在上传');
            }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
                console.log('文件上传成功！'+data.id);
            }).on('fileerror', function(event, data, msg) {  //一个文件上传失败
                console.log('文件上传失败！'+data.id);
            })
        }
        function initFileInput(ctrlName) {
            var control = $('#' + ctrlName);
            control.fileinput({
                language: 'zh', //设置语言
                uploadUrl: ".././addHouse/insert2.do", //上传的地址
                allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
                //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
                uploadAsync: true, //默认异步上传
                showUpload: true, //是否显示上传按钮
                showRemove : true, //显示移除按钮
                showPreview : true, //是否显示预览
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                //dropZoneEnabled: true,//是否显示拖拽区域
                //minImageWidth: 50, //图片的最小宽度
                //minImageHeight: 50,//图片的最小高度
                //maxImageWidth: 1000,//图片的最大宽度
                //maxImageHeight: 1000,//图片的最大高度
                maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
                //minFileCount: 0,
                maxFileCount: 10, //表示允许同时上传的最大文件个数
                enctype: 'multipart/form-data',
                validateInitialCount:true,
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            }).on('filepreupload', function(event, data, previewId, index) {     //上传中
                var form = data.form, files = data.files, extra = data.extra,
                    response = data.response, reader = data.reader;
                console.log('文件正在上传');
            }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
                console.log('文件上传成功！'+data.id);
            }).on('fileerror', function(event, data, msg) {  //一个文件上传失败
                console.log('文件上传失败！'+data.id);
            })
        }
    </script>
    <style>
        p,h5{
            color: #761c19;
        }
    </style>
</head>
<body>
<div  style="width: 900px;margin-top: 40px">
    <fieldset>
        <legend style="font-size: 26px">发布房源信息</legend>
    </fieldset>
    <form id="addHouseForm" class="form-horizontal" role="form">
        <div class="form-group">
            <label class="col-sm-2 control-label">房源描述</label>
            <div class="col-sm-10">
                <input type="hidden" id="publisher" value="${loginUser.userNickname }">
                <textarea class="form-control" id="houseDesc"  placeholder="请输入内容"></textarea><span id="houseDescTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">房屋类型</label>
            <div class="col-sm-10">
                <input type="text" id="houseModel"  placeholder="几室几厅"
                       autocomplete="off" class="form-control"><span id="houseModelTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">房屋面积</label>
            <div class="col-sm-10">
                <input type="text" id="houseArea"  placeholder="**平方米"
                       autocomplete="off" class="form-control"><span id="houseAreaTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">房屋楼层</label>
            <div class="col-sm-10">
                <input type="text" id="houseFloor"  placeholder="高层/低层/几楼"
                       autocomplete="off" class="form-control"><span id="houseFloorTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">出租方式</label>
            <div class="col-sm-10">
                <select id="houseType" class="form-control">
                    <option value="单间">单间</option>
                    <option value="整租">整租</option>
                    <option value="合租">合租</option>
                </select>
            </div><span id="houseTypeTip" style="display:none;color:red;"></span>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">地&emsp;&emsp;址</label>
            <div class="col-sm-10">
                <input type="text" id="houseAddress"  placeholder=""
                       autocomplete="off" class="form-control"><span id="houseAddressTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">小区名字</label>
            <div class="col-sm-10">
                <input type="text" id="communityName"  placeholder=""
                       autocomplete="off" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">租房价格</label>
            <div class="col-sm-10">
                <input type="text" id="housePrice"  placeholder="请输入整数即可（单位：元）"
                       autocomplete="off" class="form-control"><span id="housePriceTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">联系电话</label>
            <div class="col-sm-10">
                <input type="text" id="houseLinkMan"  placeholder="请输入11位手机号码"
                       autocomplete="off" class="form-control"><span id="houseLinkManTip" style="display:none;color:red;"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">房屋朝向</label>
            <div class="col-sm-10">
                <select id="houseOriented" class="form-control">
                    <option value="南">南</option>
                    <option value="东">东</option>
                    <option value="北">北</option>
                    <option value="西">西</option>
                </select>
            </div><span id="houseOrientedTip" style="display:none;color:red;"></span>
        </div>
        <fieldset  style="margin-top: 30px;">
            <legend>&emsp;&emsp;&emsp;&emsp;上传简介图片</legend>
        </fieldset>
        <div class="form-group">
            <label class="col-sm-2 control-label">简介图片</label>
            <div class="input-group" style="width: 566px; margin-top: 10px;">
                <span style="white-space:pre"> </span>
                <input id="SingleUpload" type="file" name="file" data-browse-on-zone-click ="true"/>
                <span style="white-space:pre"> </span>
            </div>
        </div>
        <fieldset style="margin-top: 30px;">
            <legend>&emsp;&emsp;&emsp;&emsp;上传多张详细图片</legend>
        </fieldset>
        <div class="form-group">
            <div class="container-fluid" style="padding-left: 100px">
                <form id="form" action="" method="post" enctype="multipart/form-data">
                    <div class="row form-group">
                        <div class="panel panel-primary">
                            <div class="panel-heading" align="center">
                                <label style="text-align: center;font-size: 18px;">文 件 上 传</label>
                            </div>
                            <div class="panel-body">
                                <div class="col-sm-12">
                                    <input id="input-id" name="file" multiple type="file" data-show-caption="true">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <p style="display:none;margin-left:40%;" >发布成功！！前往我的房源信息可查看</p>
            <h5 style="display: none;margin-left:40%;">请修改表单数据为正确再发布！</h5>
        <div class="form-group">
            <div class="input-group" style="padding-left: 250px">
                <button class="btn"  id="addHouseRecord-btn"  type="submit">现在发布</button>
                <span>&emsp;&emsp;</span>
                <button id="reeset" class="btn-primary btn">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
