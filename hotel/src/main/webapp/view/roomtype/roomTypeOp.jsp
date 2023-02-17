<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客房管家</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/roomtype/roomtypeOp.css" rel="stylesheet" />
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
            var countCheckin = $(".countCheckin").attr("id");
            var countRoom = $(".countRoom").attr("id");
            $(".span1").html("入住率<br/>("+(countCheckin/countRoom*100).toFixed(1)+"%)");
            
            
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
            $(".openNewRoomType").click(function(){
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
                <div class="collapse navbar-collapse pull-right" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-bell"><i class="label label-warning label-nav">${requestScope.countNowCheckOut}</i></i></a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="${pageContext.request.contextPath}/showRoomNowCheckOut" title="查看详情">今日退房数：${requestScope.countNowCheckOut}</a></li>
                            </ul>
                        </li>
                        <li><a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-envelope"><i class="label label-success label-nav">${requestScope.countUserReservation}</i></i></a>

                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="${pageContext.request.contextPath}/showUserReservation/1">未处理预订订单：${requestScope.countUserReservation}</a></li>
                            </ul>
                        </li>
                        <li><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="height: 50px">
                            <img class="img-circle pull-left img-responsive nav-user-img" src="${pageContext.request.contextPath}/img/userimg.jpg" /><span class="pull-left nav-username">管理员</span></a>

                            <ul class="dropdown-menu dropdown-menu-right clearfix" style="padding-top: 0px">
                                <li class="user-li-head"><span>
                                    <img class="img-circle nav-user-img-xiala center-block" src="${pageContext.request.contextPath}/img/userimg.jpg" /></span>
                                    <p></p>
                                    <p class="text-center"><span>${sessionScope.staff.staffName}</span></p>
                                    <p class="text-center"><span>管理员</span> </p>
                                   
                                </li>
                                <li style="padding: 10px 20px; padding-bottom: 20px">
                                    <div class="pull-right">
                                        <a href="${pageContext.request.contextPath}/staffCancellation" class="btn btn-default btn-flat no-yj">注销</a>
                                    </div>
                                </li>
                                </ul>
                        </li>
                    </ul>
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
                        <li class="nav-left-dropdown">
                            <a href="#" class="openNav1">
                            	&nbsp&nbsp&nbsp&nbsp预订记录管理
                            <span class="glyphicon glyphicon-option-horizontal navbtn1"></span>
                            <span class="glyphicon glyphicon-option-vertical navbtns1"></span>
                            </a>
                            <ul class="nav-left-dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/showAllReservation/1">所有预订记录</a></li>
                                <li><a href="${pageContext.request.contextPath}/showUserReservation/1">未处理预订订单</a></li>
                                <li><a href="${pageContext.request.contextPath}/showAllCheckInReservation/1">已入住预订记录</a></li>
                                <li><a href="${pageContext.request.contextPath}/showAllNoCheckInReservation/1">预订中记录</a></li>
                                <li><a href="${pageContext.request.contextPath}/showAllUnsubscribeReservation/1">退订记录</a></li>
                            </ul>
                        </li>
                        <li class="nav-left-dropdown">
                            <a href="#" class="openNav1">
                            	&nbsp&nbsp&nbsp&nbsp入住记录管理
                            <span class="glyphicon glyphicon-option-horizontal navbtn1"></span>
                            <span class="glyphicon glyphicon-option-vertical navbtns1"></span>
                            </a>
                            <ul class="nav-left-dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/showAllUsersCheckIn/1">会员客户记录</a></li>
                                <li><a href="${pageContext.request.contextPath}/showAllClientCheckIn/1">普通客户记录</a></li>                             
                            </ul>
                        </li>
                        <li class="nav-left-dropdown">
                            <a href="#" class="openNav1">
                            	&nbsp&nbsp&nbsp&nbsp退房记录管理
                            <span class="glyphicon glyphicon-option-horizontal navbtn1"></span>
                            <span class="glyphicon glyphicon-option-vertical navbtns1"></span>
                            </a>
                            <ul class="nav-left-dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/showAllUserCheckOut/1">会员客户记录</a></li>
                                <li><a href="${pageContext.request.contextPath}/showAllClientCheckOut/1">普通客户记录</a></li>                             
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
                            </ol>
                        </div>                     
                                <form action="${pageContext.request.contextPath}/inputShowRoom">     
                                <div class="input-group showRoomInp">                                                             
                                    <input type="text" class="form-control" name="roomNumber" placeholder="请输入房间号..." />
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="submit">搜索房间</button>
                                    </span>                                  
                                </div>  
                                 </form>
                        <!--房间类型列表-->
                        <div class="romTypeList">
                        	 <c:forEach items="${requestScope.roomTypes}" var="roomTypes">
                        	<a class="romTypeList_a" href="${pageContext.request.contextPath}/showAllRoom/${roomTypes.roomTypeId}">
                        	<p>${roomTypes.roomTypeName}</p>
                        	<img class="romTypeList_img" src="${pageContext.request.contextPath}/img/${roomTypes.roomTypeImage}">
                        	</a>                       	
                        	</c:forEach> 
                        	<a class="romTypeList_a openNewRoomType" href="#">                        	
                        	<span>新增房型</span>
                        	</a>
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
                 <div class="footer"> 
                <p class="countRoom" id="${requestScope.countRoom}">全部<br/>(${requestScope.countRoom})</p>
				<a href="${pageContext.request.contextPath}/showRoomStruts/0/0"/><p style="color: #000" class="span2">预订<br/>(${requestScope.countReservation})</p></a>
				<a href="${pageContext.request.contextPath}/showRoomStruts/1/0"/><p class="countCheckin" id="${requestScope.countCheckin}">在住<br/>(${requestScope.countCheckin})</p></a>
				<a href="${pageContext.request.contextPath}/showRoomStruts/2/0"/><p class="span4">空闲<br/>(${requestScope.countFree})</p></a>
				<a href="${pageContext.request.contextPath}/showRoomStruts/3/0"/><p class="span5">脏房<br/>(${requestScope.countNotCleaned})</p></a>
				<a href="${pageContext.request.contextPath}/showRoomStruts/4/0"/><p class="span6">维修<br/>(${requestScope.countRepair})</p></a>
				<p class="span1"></p>
			</div>
            </div>
         </div>
    </div>
    
</body>
</html>