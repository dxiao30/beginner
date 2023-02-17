<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客房管家</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/roomtype/roomtypeEdit.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".dropdownMenu").dropdown();
            $(".nav-left-dropdown>a").click(function () {


                if ($(this).attr("d") != 1 && $(this).attr("d") != undefined) {
                    $(this).removeClass("nav-left-dropdown-a");
                    $this = $(this);
                    $(this).next("ul").slideUp(300, function () { $this.removeClass("nav-left-bottrom-border"); $this.removeClass("nav-left-dropdown-ul") });

                    $(this).attr("d", "1");

                } else {	
                    $(this).addClass("nav-left-dropdown-a");
                    $(this).addClass("nav-left-bottrom-border");
                    $(this).next("ul").addClass("nav-left-dropdown-ul").slideDown(300);
                    $(this).attr("d", "2");

                }
            })
            var i = 2;
            $(".openNav").click(function(){
            	if(i % 2 ==0){
            		$(".navbtn").css("display","none");
                	$(".navbtns").css("display","block");
                	            	
            	}else{
            		$(".navbtns").css("display","none");
                	$(".navbtn").css("display","block");
            	}  
            	i++;  
            })
            var a = 2;
            $(".openNav1").click(function(){
            	if(a % 2 ==0){
            		$(".navbtn1").css("display","none");
                	$(".navbtns1").css("display","block");
                	            	
            	}else{
            		$(".navbtns1").css("display","none");
                	$(".navbtn1").css("display","block");
            	}  
            	a++;  
            })
            $(".openDeleteRoomType").click(function(){
            	var v_id = $(this).attr("id");
            	$("#okDeleteRoomType").attr('href',"/deleteRoomType?roomTypeId="+v_id);
            	$(".deleteRoomType").css("display","block");
            })
            $(".closeDeleteRoomType").click(function(){
            	$(".deleteRoomType").css("display","none");
            })        
            $(".openUpdateRoomType").click(function(){
            	var updateid = $(this).attr("id");
            	$(".updateRoomTypeIdInp").val(updateid);
            	$.post("/showRoomType/"+updateid,function(data){
            		$(".roomTypeNameInp").val(data.roomTypeName); 
            		$(".roomTypeAreaInp").val(data.roomTypeArea); 
            		$(".roomTypeStatusInp").val(data.roomTypeStatus); 
            		$(".roomTypeTimingModeInp").val(data.roomTypeTimingMode); 
            		$(".listPriceInp").val(data.listPrice); 
            		$(".individualPriceInp").val(data.individualPrice); 
            		$(".vipPriceInp").val(data.vipPrice); 
				})
            	$(".updateRoomType").css("display","block");
            })
            $(".closeUpdateRoomType").click(function(){
            	$(".updateRoomType").css("display","none");
            })
            $(".openNewRoomType").click(function(){
                console.log("111")
                $(".newRoomType").css("display","block");
            })
            $(".closeNewRoomType").click(function(){
                $(".newRoomType").css("display","none");
            })
        });
    </script>
</head>
<body style="min-height:635px;">
<div class="container-fluid">

        <nav class="navbar navbar-default row no-yj  navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-list-left" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
                    <a class="navbar-brand" href="#">warada酒店管理系统</a>
                </div>
                
            </div>
        </nav>
        <div class="row" style="margin-top:70px">
            <div class="  nav-left col-md-2 no-padding" id="nav-list-left">
                <div class="user-panel">
                    <img src="${pageContext.request.contextPath}/img/userimg.jpg" class="img-circle center-block" />
                </div>

                <div class="nav-list" >
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath}/toPage/index/index">首页</a>
                        </li>
                        <li class="nav-left-dropdown">
                            <a href="#" class="openNav">
                            	&nbsp&nbsp&nbsp&nbsp房间类型管理
                            	<span class="glyphicon glyphicon-option-horizontal navbtn"></span>
                            	<span class="glyphicon glyphicon-option-vertical navbtns"></span>
                            </a>
                            <ul class="nav-left-dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/showAllRoomType/0">房间类型列表</a></li>
                                <li><a href="${pageContext.request.contextPath}/showAllRoomType/1">编辑房型</a></li>
                                <li><a href="#" class="openNewRoomType">新增房型</a></li>
                            </ul>
                        </li>
                        
                    </ul>
                </div>
            </div>
            <div class="main-right  col-md-10 col-md-offset-2 bodys">
                        <div class="panel-body navs">
                            <ol class="breadcrumb">
                                <li><a href="${pageContext.request.contextPath}/toPage/index/index">首页</a></li>
                                <li><a href="${pageContext.request.contextPath}/showAllRoomType/0">房间类型列表</a></li>
                                <li><a href="${pageContext.request.contextPath}/showAllRoomType/1">编辑房间类型</a></li>
                            </ol>
                        </div>
                        <div class="romTypeList">
                        	 <c:forEach items="${requestScope.roomTypes}" var="roomTypes">
                        	<div class="romTypeList_a" href="#">
                                <a href="${pageContext.request.contextPath}/showAllRoomEdit/${roomTypes.roomTypeId}">
                        	<p>${roomTypes.roomTypeName}</p>
                        	<img class="romTypeList_img" src="${pageContext.request.contextPath}/img/${roomTypes.roomTypeImage}">
                                </a>
                        	<span class="editRoomType">
                        	<a href="#" class="openUpdateRoomType" id="${roomTypes.roomTypeId}"><b>修改</b></a>
                        	<a href="#" class="openDeleteRoomType" id="${roomTypes.roomTypeId}"><b>删除</b></a>
                        	</span>
                        	</div>                       	
                        	</c:forEach>
                        </div>
                <!-- 删除房型 -->
                <div class="col-md-6 deleteRoomType" >
               	<div class="panel panel-default deleteRoomTypeBody">
                   <div class="panel-heading">系统提示</div>
                   <div class="panel-body">
                           <div class="form-group tips">
                               <label for="exampleInputEmail1">是否删除该房间类型？</label>
                           </div>                       
                           	<div class="deleteRoomTypeFooter">
                           	<a  href="#" id="okDeleteRoomType" class="btn btn-default btns">确认</a>
                           <span class="btn btn-default closeDeleteRoomType btns">取消</span>
                           </div>
		                   </div>
		               </div>
		           </div>
		           <!-- 修改房间类型 -->
                        <div class="col-md-6 updateRoomType">
                    	<div class="panel panel-default ">
                        <div class="panel-heading " style="text-align: center;">修改房间类型</div>
                        <div class="panel-body">
                            <form action="${pageContext.request.contextPath}/updateRoomType" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="roomTypeId" class="updateRoomTypeIdInp">
                                <div class="form-group updateRoomTypeInp">
                                    <label for="exampleInputEmail1">类型名</label>
                                    <input type="text" name="roomTypeName" class="form-control roomTypeNameInp" id="exampleInputEmail1" placeholder="请输入房间类型名..." />
                                </div>
                                <div class="form-group updateRoomTypeInp">
                                    <label for="exampleInputEmail1">面积</label>
                                    <input type="text" name="roomTypeArea" class="form-control roomTypeAreaInp" id="exampleInputEmail1" placeholder="请输入房间类型面积..." />
                                </div>
                                <div class="form-group updateRoomTypeInp">
                                    <label for="exampleInputEmail1">状态</label>
                                    <select name="roomTypeStatus" class="form-control roomTypeStatusInp">
                                    	<option value="0">有房</option>
                                    	<option value="1">房源紧张</option>
                                    	<option value="1">已住满</option>
                                    </select>
                                </div>
                                <div class="form-group updateRoomTypeInp">
                                    <label for="exampleInputEmail1">计时方式</label>
                                    <select name="roomTypeTimingMode" class="form-control roomTypeTimingModeInp">
                                    	<option value="0">按天计时</option>
                                    	<option value="1">小时计时</option>
                                    </select>
                                    
                                </div>
                                <div class="form-group updateRoomTypeInp">
                                    <label for="exampleInputEmail1">挂牌价</label>
                                    <input type="text" name="listPrice" class="form-control listPriceInp" id="exampleInputEmail1" placeholder="请输入房间类型挂牌价..." />
                                </div>
                                <div class="form-group updateRoomTypeInp">
                                    <label for="exampleInputEmail1">散客价</label>
                                    <input type="text" name="individualPrice" class="form-control individualPriceInp" id="exampleInputEmail1" placeholder="请输入房间类型散客价..." />
                                </div>
                                <div class="form-group updateRoomTypeInp">
                                    <label for="exampleInputEmail1">会员价</label>
                                    <input type="text" name="vipPrice" class="form-control vipPriceInp" id="exampleInputEmail1" placeholder="请输入房间类型会员价..." />
                                </div>
                                <div class="form-group updateRoomTypeInp">
                                    <label for="exampleInputFile">房间类型图片</label>
                                    <input type="file" id="exampleInputFile" name="file"/>
                                </div>
                                <div class="updateRoomTypeFooter">
                                <button type="submit" class="btn btn-default btns">提交</button>
                                <button type="button" class="btn btn-default btns closeUpdateRoomType">取消</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div> 
                 <div class="footer"> 
                <p class="span1">全部<br/>(300)</p>
				<a href="${pageContext.request.contextPath}/roomServer?op=showAllRooms&showDate=${6}"/><p style="color: #000" class="span2">预订<br/>(10)</p></a>
				<a href="${pageContext.request.contextPath}/roomServer?op=showAllRooms&showDate=${7}"/><p class="span3">在住<br/>(50)</p></a>
				<a href="${pageContext.request.contextPath}/roomServer?op=showAllRooms&showDate=${8}"/><p class="span4">空闲<br/>(75)</p></a>
				<a href="${pageContext.request.contextPath}/roomServer?op=showAllRooms&showDate=${9}"/><p class="span5">脏房<br/>(88)</p></a>
				<a href="${pageContext.request.contextPath}/roomServer?op=showAllRooms&showDate=${10}"/><p class="span6">维修<br/>(102)</p></a>
				<p class="span1">入住率<br/>(50%)</p>
			</div>
            </div>
            <!-- 新增房间类型 -->
            <div class="col-md-6 newRoomType">
                <div class="panel panel-default ">
                    <div class="panel-heading " style="text-align: center;">新增房间类型</div>
                    <div class="panel-body">
                        <form action="${pageContext.request.contextPath}/newRoomType" method="post" enctype="multipart/form-data">
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">类型名</label>
                                <input type="text" name="roomTypeName" class="form-control" id="exampleInputEmail1" placeholder="请输入房间类型名..." />
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">面积</label>
                                <input type="text" name="roomTypeArea" class="form-control" id="exampleInputEmail1" placeholder="请输入房间类型面积..." />
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">状态</label>
                                <select name="roomTypeStatus" class="form-control">
                                    <option value="0">有房</option>
                                    <option value="1">房源紧张</option>
                                    <option value="1">已住满</option>
                                </select>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">计时方式</label>
                                <select name="roomTypeTimingMode" class="form-control">
                                    <option value="0">按天计时</option>
                                    <option value="1">小时计时</option>
                                </select>

                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">挂牌价</label>
                                <input type="text" name="listPrice" class="form-control" id="exampleInputEmail1" placeholder="请输入房间类型挂牌价..." />
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">散客价</label>
                                <input type="text" name="individualPrice" class="form-control" id="exampleInputEmail1" placeholder="请输入房间类型散客价..." />
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">会员价</label>
                                <input type="text" name="vipPrice" class="form-control" id="exampleInputEmail1" placeholder="请输入房间类型会员价..." />
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputFile">房间类型图片</label>
                                <input type="file" id="exampleInputFile" name="file"/>
                            </div>
                            <div class="newRoomTypeFooter">
                                <button type="submit" class="btn btn-default btns">提交</button>
                                <button type="button" class="btn btn-default btns closeNewRoomType">取消</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
         </div>

    </div>
    
</body>
</html>