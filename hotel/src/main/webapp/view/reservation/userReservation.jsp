<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>未处理预订订单</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/reservation/userReservation.css" rel="stylesheet" />
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
            $(".openReservationDetail").click(function(){
            	var roomTypeId = $(this).attr("id");
            	$(".reservationNameDetail").val($(".reservationName").html());
            	$(".reservationIdCardDetail").val($(".reservationIdCard").html());
            	$(".reservationPhoneNumberDetail").val($(".reservationPhoneNumber").html());
            	$(".expectedTimeOfArrivalDetail").val($(".expectedTimeOfArrival").html());
            	$(".reservationStatusDetail").val($(".reservationStatus").html());
            	$(".reservationOccupancyDaysDetail").val($(".reservationOccupancyDays").html());
            	$.post("/showRoomTypeStruts/"+roomTypeId,function(data){
            	    /*下拉选项添加选择的房间类型中空闲的房间的房间号*/
            		for(var i = 0;i<data.length;i++){
            			$(".roomNumberDetail").append("<option>"+data[i]+"</option>")
            		}
            		if($(".roomNumberDetail option").length == 0 ){
            		    $(".roomNumberDetail").append("<option>"+"暂无空闲客房"+"</option>");
                        $(".roomNumberDetail").attr("disabled","true");
                    }
            	})
            	$(".reservationDetail").css("display","block");
            })
            $(".closeReservationDetail").click(function(){
                /*关闭后删掉所有的下拉选项，不然上次查看的房间号还会存在*/
                $(".roomNumberDetail option").remove();
                $(".roomNumberDetail").removeAttr("disabled");
            	$(".reservationDetail").css("display","none");
            })
            $(".openUpdateReservation").click(function(){
            	var reservationId = $(this).attr("id");
            	$.post("/showReservationDetail/"+reservationId,function(data){
            		$(".reservationIdInp").val(reservationId);
            		$(".roomNumberDetail").val(data.roomNumber);
            		$(".reservationNameDetail").val(data.reservationName);
            		$(".reservationIdCardDetail").val(data.reservationIdCard);
            		$(".reservationPhoneNumberDetail").val(data.reservationPhoneNumber);
            		$(".reservationTimeDetail").val(data.reservationTime);
            		$(".expectedTimeOfArrivalDetail").val(data.expectedTimeOfArrival);
            		if(data.reservationStatus == 0){
            			$(".reservationStatusDetail").val("预订中");
            		}else if(data.reservationStatus == 1){
            			$(".reservationStatusDetail").val("已入住");
            		}else if(data.reservationStatus == 0){
            			$(".reservationStatusDetail").val("已退订");
            		}           		
            		$(".reservationOccupancyDaysDetail").val(data.reservationOccupancyDays);
            		$(".reservationForegiftDetail").val(data.reservationForegift);
            		$(".unsubscribeForegiftDetail").val(data.unsubscribeForegift);
            	})
                console.log(data.roomNumber);
            	$(".updateReservation").css("display","block");
            })
            $(".closeUpdateReservation").click(function(){
            	$(".updateReservation").css("display","none");
            })
            $(".openUpdateUsers").click(function(e){
            	var v_id =e.target.id;
            	var a =$(this).attr("a");
            	$(".userRealNameInp").val($(this).parent().parent().parent(".users").find(".userRealName").html());
            	$(".userVipIdInp").html($(this).parent().parent().parent(".users").find(".userVipId").html());
            	$(".userIdCardInp").html($(this).parent().parent().parent(".users").find(".userIdCard").html());
            	$(".userPassInp").val(a);
            	$(".userPhoneInp").val($(this).parent().parent().parent(".users").find(".userPhone").html());
            	$(".userGenderInp").html($(this).parent().parent().parent(".users").find(".userGender").html());
            	$(".usersIdInp").val(v_id)
            	$(".updateUsers").css("display","block");
            })
            $(".closeUpdateUsers").click(function(){
            	$(".updateUsers").css("display","none");
            })
            $(".openDeleteReservation").click(function(){
            	$(".deleteReservation").css("display","block");
            	var v_id = $(this).attr("id");
            	$("#okDeleteReservation").attr('href',"/deleteReservation?reservationId="+v_id);
            })
            $(".closeDeleteReservation").click(function(){
            	$(".deleteReservation").css("display","none");
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
                                <li><a href="${pageContext.request.contextPath}/showUserReservation/1">未处理预订订单</a></li>
                            </ol>
                        </div>            
          	<div class="col-md-12">
                    <div class="panel panel-default tableTitle">
                        <div class="panel-heading">
                          	搜索记录：
                          	<form action="${pageContext.request.contextPath}/showInputReservation/1" method="post">  
                       		<div class="input-group shouUsers">       
									              
                                    <input type="text" class="form-control shouUsersInp" name="roomNumber" placeholder="请输入房间号..." />
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="submit">搜索</button>
                                    </span>
                                    
                                </div>
                                </form> 
                        </div>
                        <div class="panel-body">
                            <table class="table table-bordered tb-hover">
                                <thead>
                                    <tr>
                                    	<td>房间类型</td>
                                    	<td>姓名</td>                                       
                                        <td>身份证号</td>                                        
                                        <td>预计到店时间</td>
                                        <td>预计到店时间</td>
                                        <td>入住天数</td>
                                        <td>状态</td>
                                        <td class="text-center">操作</td>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:if test="${requestScope.reservations.size() >0}">
                                	<c:forEach items="${requestScope.reservations}" var="reservations">
                                    <tr class="users">                                                                
                                        <td class="roomTypeName">${reservations.roomTypeName}</td>
                                        <td class="reservationName">${reservations.reservationName}</td>
                                        <td class="reservationIdCard">${reservations.reservationIdCard}</td>     
                                        <td class="reservationPhoneNumber">${reservations.reservationPhoneNumber}</td>                                    
                                        <td class="expectedTimeOfArrival">${reservations.expectedTimeOfArrival}</td>
                                        <td class="reservationOccupancyDays">${reservations.reservationOccupancyDays}</td>
                                        <c:if test="${reservations.reservationStatus == 0}">
                                        	<td class="reservationStatus">预订中</td>
                                        </c:if>
                                        <c:if test="${reservations.reservationStatus == 1}">
                                        	<td class="reservationStatus">已入住</td>
                                        </c:if>
                                        <c:if test="${reservations.reservationStatus == 2}">
                                        	<td class="reservationStatus">已退订</td>
                                        </c:if>
                                        <c:if test="${reservations.reservationStatus == 3}">
                                        	<td class="reservationStatus">未处理</td>
                                        </c:if>
                                        <td class=" text-center">
                                        <a href="#"><i title="预订登记" id="${reservations.roomTypeId}" class="glyphicon glyphicon-edit openReservationDetail"></i>
                                        </a>
                                        <c:if test="${reservations.reservationStatus == 0}">
                                        	 &nbsp;&nbsp;<a href="#"><i title="修改记录" id="${reservations.reservationId}"  class="glyphicon glyphicon-edit openUpdateReservation"></i></a>                                       
                                        </c:if>
                                       
                                        &nbsp;&nbsp;<i title="拒绝预订"  id="${reservations.reservationId}" class="glyphicon glyphicon-remove openDeleteReservation"></i></td>
                                    </tr>
                                    </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                        <!-- 分页 -->
                        <div class="panel-body spligs">
                            <nav>
                                <ul class="pagination">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/showUserReservation/${requestScope.nowPage -1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                  <c:forEach begin="${requestScope.beginPage}" end="${requestScope.endPage}" var="showPage"> 
								 <c:if test="${requestScope.nowPage == showPage}">	 
							    <li>				    		                       
							    <a style="background:#e7e7e7" href="/showUserReservation/${showPage}">${showPage}</a>				    			    
							    </li>
							    </c:if>	
							     <c:if test="${requestScope.nowPage != showPage}">	 
							    <li>				    		                       
							    <a href="/showUserReservation/${showPage}">${showPage}</a>				    			    
							    </li>
							    </c:if>	
							    </c:forEach>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/showUserReservation/${requestScope.nowPage +1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                 <!-- 预订登记 -->
               <div class="col-md-6 reservationDetail">
                  	<div class="panel panel-default">
                      <div class="panel-heading " style="text-align: center;">未处理订单</div>
                      <div class="panel-body">
                          <form action="${pageContext.request.contextPath}/reservation" method="post">
                          <input type="hidden" name="staffId" value="${sessionScope.staff.staffId}">
                          <input type="hidden" name="roomId" class="roomIdInp">
                         	 <div class="form-group newRoomTypeInp">
                                  <label for="exampleInputEmail1">房间号</label>
                                  <select class="form-control roomNumberDetail"></select>                
                              </div>
                              <div class="form-group newRoomTypeInp">
                                  <label for="exampleInputEmail1">姓名</label>
                                  <input type="text" name="reservationName" disabled="disabled" class="form-control reservationNameDetail"/>                             
                              </div>
                              <div class="form-group newRoomTypeInp">
                                  <label for="exampleInputEmail1">身份证号</label>
                                  <input type="text" name="reservationIdCard" disabled="disabled" class="form-control reservationIdCardDetail"/>
                              </div>
                              <div class="form-group newRoomTypeInp">
                                  <label for="exampleInputEmail1">电话号码</label>
                                  <input type="text" name="reservationPhoneNumber" disabled="disabled" class="form-control reservationPhoneNumberDetail"/>
                              </div>   
                            
                              <div class="form-group newRoomTypeInp">
                                  <label for="exampleInputEmail1">预计到店时间</label>
                                  <input type="text" name="expectedTimeOfArrival" disabled="disabled" class="form-control expectedTimeOfArrivalDetail" />
                              </div>
                              <div class="form-group newRoomTypeInp">
                                  <label for="exampleInputEmail1">预订状态</label>
                                 <input type="text" class="form-control reservationStatusDetail" />
                              </div>
                              <div class="form-group newRoomTypeInp">
                                  <label for="exampleInputEmail1">入住天数</label>
                                  <input type="text" name="reservationOccupancyDays" disabled="disabled" class="form-control reservationOccupancyDaysDetail"/>
                              </div>
                              <div class="form-group newRoomTypeInp">
                                  <label for="exampleInputEmail1">押金</label>
                                  <input type="text" name="reservationForegift" disabled="disabled" value="0" class="form-control reservationForegiftDetail"/>
                              </div>                             
                              <div class="newRoomTypeFooter">
                              <button type="submit" class="btn btn-default btns">预订</button>
                              <button type="button" class="btn btn-default btns closeReservationDetail">返回</button>
                              </div>
                          </form>
                      </div>
                  </div>
              </div>
                <!-- 修改预订记录 -->
               <div class="col-md-6 updateReservation">
                	<div class="panel panel-default">
                    <div class="panel-heading " style="text-align: center;">修改预订记录</div>
                    <div class="panel-body">
                        <form action="${pageContext.request.contextPath}/updateReservationUsers" method="post">
                        <input type="hidden" name="reservationId" class="reservationIdInp">
                       	 <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">房间号</label>
                                <input type="text" disabled="disabled" class="form-control roomNumberDetail"/>                             
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">姓名</label>
                                <input type="text" name="reservationName"  class="form-control reservationNameDetail"/>                             
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">身份证号</label>
                                <input type="text" name="reservationIdCard" class="form-control reservationIdCardDetail"/>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">电话号码</label>
                                <input type="text" name="reservationPhoneNumber" class="form-control reservationPhoneNumberDetail"/>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">预订时间</label>
                                <input type="text" disabled="disabled" class="form-control reservationTimeDetail"/>
                                
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">预计到店时间</label>
                                <input type="datetime-local" name="expectedTimeOfArrival"  class="form-control expectedTimeOfArrivalDetail" />
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">预订状态</label>
                               <input type="text"  class="form-control reservationStatusDetail" />
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">入住天数</label>
                                <input type="text" name="reservationOccupancyDays" class="form-control reservationOccupancyDaysDetail"/>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">押金</label>
                                <input type="text" name="reservationForegift" class="form-control reservationForegiftDetail"/>
                            </div>     
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">已退押金</label>
                                <input type="text" disabled="disabled"  class="form-control unsubscribeForegiftDetail"/>
                            </div>                          
                            <div class="newRoomTypeFooter">
                            <button type="submit" class="btn btn-default btns" >确认</button>
                            <button type="button" class="btn btn-default btns closeUpdateReservation">返回</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
                <!-- 删除记录 -->
                <div class="col-md-6 deleteReservation">
               <div class="panel panel-default ">
                   <div class="panel-heading">系统提示</div>
                   <div class="panel-body">
                           <div class="form-group deleteReservationInp">
                               <label for="exampleInputEmail1">是否删除该未处理的预订记录？</label>
                           </div>                       
                           <a  href="#" id="okDeleteReservation" class="btn btn-default on">确认</a>
                           <span class="btn btn-default closeDeleteReservation">取消</span>
		                   </div>
		               </div>
		           </div> 
            </div>
         </div>
    </div>
    
</body>
</html>