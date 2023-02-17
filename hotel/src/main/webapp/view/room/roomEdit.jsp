<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>客房管家</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/room/roomEdit.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/room/room.js"></script>
</head>
<script>

</script>
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
                            &nbsp&nbsp&nbsp&nbsp客房管理
                            <span class="glyphicon glyphicon-option-horizontal navbtn1"></span>
                            <span class="glyphicon glyphicon-option-vertical navbtns1"></span>
                        </a>
                        <ul class="nav-left-dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/showAllRoomEdit/${roomTypeId}">编辑客房</a></li>
                            <li><a href="#" class="openNewRoomType">新增客房</a></li>
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
                    <c:set value="1" var="sum" />
                    <c:forEach items="${requestScope.rooms}" var="room">
                        <c:if test="${sum ==1}">
                            <li><a href="${pageContext.request.contextPath}/showAllRoom/${room.roomTypeId}">${room.roomTypeName}</a></li>
                            <c:set value="2" var="sum" />
                        </c:if>
                    </c:forEach>
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
            <div class="romTypeList">
                <c:forEach items="${requestScope.rooms}" var="rooms">
                        <div class="romTypeList_a" style="background: #daF0c8">
                            <p>${rooms.roomNumber}</p>
                            <span class="editRoomType">
                        	<a href="#" class="openUpdateRoom" id="${rooms.roomId}"><b>修改</b></a>
                        	<a href="#" class="openDeleteRoom" id="${rooms.roomId}"><b>删除</b></a>
                        	</span>
                        </div>
                    <c:if test="${rooms.roomSanitation == 0 && rooms.roomStatus == 1}">
                        <div class="romTypeList_a" style="background: #D9EDF7">
                            <p>${rooms.roomNumber}</p>
                            <span class="editRoomType">
                        	<a href="#" class="openUpdateRoom" id="${rooms.roomId}"><b>修改</b></a>
                        	<a href="#" class="openDeleteRoom" id="${rooms.roomId}"><b>删除</b></a>
                        	</span>
                        </div>
                    </c:if>
                    <c:if test="${rooms.roomSanitation == 0 && rooms.roomStatus == 2}">
                        <div class="romTypeList_a" style="background: #5ca99e">
                            <p>${rooms.roomNumber}</p>
                            <span class="editRoomType">
                        	<a href="#" class="openUpdateRoom" id="${rooms.roomId}"><b>修改</b></a>
                        	<a href="#" class="openDeleteRoom" id="${rooms.roomId}"><b>删除</b></a>
                        	</span>
                        </div>
                    </c:if>
                    <c:if test="${rooms.roomSanitation == 1}">
                        <div class="romTypeList_a" style="background: #e89279">
                            <p>${rooms.roomNumber}</p>
                            <span class="editRoomType">
                        	<a href="#" class="openUpdateRoom" id="${rooms.roomId}"><b>修改</b></a>
                        	<a href="#" class="openDeleteRoom" id="${rooms.roomId}"><b>删除</b></a>
                        	</span>
                        </div>
                    </c:if>
                    <c:if test="${rooms.roomSanitation == 2}">
                        <div class="romTypeList_a" style="background: #E96060">
                            <p>${rooms.roomNumber}</p>
                            <span class="editRoomType">
                        	<a href="#" class="openUpdateRoom" id="${rooms.roomId}"><b>修改</b></a>
                        	<a href="#" class="openDeleteRoom" id="${rooms.roomId}"><b>删除</b></a>
                        	</span>
                        </div>
                    </c:if>
                </c:forEach>
                <a class="romTypeList_a openNewRoomType" href="#">
                    <span class="newRoomText">新增客房</span>
                </a>
            </div>
            <!-- 新增客房 -->
            <div class="col-md-6 newRoomType">
                <div class="panel panel-default ">
                    <div class="panel-heading " style="text-align: center;">新增客房</div>
                    <div class="panel-body">
                        <form action="${pageContext.request.contextPath}/newRoom" method="post">
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">类型名</label>
                                <select name="roomTypeId" class="form-control">
                                    <option value="${roomType.roomTypeId}">${roomType.roomTypeName}</option>
                                </select>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">房间号</label>
                                <input type="text" name="roomNumber" class="form-control" id="exampleInputEmail1" placeholder="请输入房间号..." />
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">客房状态</label>
                                <select name="roomStatus" class="form-control">
                                    <option value="0">空闲</option>
                                    <option value="1">已预订</option>
                                    <option value="2">已入住</option>
                                </select>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">客房情况</label>
                                <select name="roomSanitation" class="form-control">
                                    <option value="0">已打扫</option>
                                    <option value="1">未打扫</option>
                                    <option value="2">维修中</option>
                                </select>

                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">楼层</label>
                                <input type="text" name="roomStorey" class="form-control" id="exampleInputEmail1" placeholder="请输入房间所属楼层..." />
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">窗型</label>
                                <select name="roomWindow" class="form-control">
                                    <option value="0">有窗</option>
                                    <option value="1">无窗</option>
                                </select>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">床型</label>
                                <input type="text" name="roomBed" class="form-control" id="exampleInputEmail1" placeholder="请输入房间床型..." />
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">可入住人数</label>
                                <select name="roomGuestNumber" class="form-control">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="0">不限</option>
                                </select>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">房间设施</label>
                                <textarea name="roomFacility" class="form-control" placeholder="请输入客房设施..." ></textarea>
                            </div>
                            <div class="newRoomTypeFooter">
                                <button type="submit" class="btn btn-default btns">提交</button>
                                <button type="button" class="btn btn-default btns closeNewRoomType">取消</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 房间明细 -->
            <div class="col-md-6 roomDetail">
                <div class="panel panel-default ">
                    <div class="panel-heading " style="text-align: center;">客房详情</div>
                    <div class="panel-body">
                        <form>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">类型名</label>
                                <input type="text" name="roomNumber" class="form-control roomTypeNameDetail"/>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">房间号</label>
                                <input type="text" name="roomNumber" class="form-control roomNumberDetail"/>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">客房状态</label>
                                <input type="text" name="roomNumber" class="form-control roomStatusDetail"/>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">客房情况</label>
                                <input type="text" name="roomNumber" class="form-control roomSanitationDetail"/>

                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">楼层</label>
                                <input type="text"class="form-control roomStoreyDetail" />
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">窗型</label>
                                <input type="text" name="roomNumber" class="form-control roomWindowDetail"/>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">床型</label>
                                <input type="text" class="form-control roomBedDetail"/>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">可入住人数</label>
                                <input type="text" name="roomNumber" class="form-control roomGuestNumberDetail"/>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">房间设施</label>
                                <textarea class="form-control roomFacilityDetail"></textarea>
                            </div>
                            <div class="newRoomTypeFooter">
                                <button type="button" class="btn btn-default btns openUpdateRoom">修改</button>
                                <button type="button" class="btn btn-default btns openDeleteRoom">删除</button>
                                <button type="button" class="btn btn-default btns closeRoomDetail">返回</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 修改客房信息 -->
            <div class="col-md-6 updateRoom">
                <div class="panel panel-default ">
                    <div class="panel-heading " style="text-align: center;">修改客房信息</div>
                    <div class="panel-body">
                        <form action="${pageContext.request.contextPath}/updateRoom" method="post">
                            <input type="hidden" name="roomId" class="updateroomId">
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">类型名</label>
                                <select name="roomTypeId" class="form-control updateroomTypeId">
                                </select>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">房间号</label>
                                <input type="text" name="roomNumber" class="form-control updateroomNumber" placeholder="请输入房间号..." />
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">客房状态</label>
                                <select name="roomStatus" class="form-control updateroomStatus">
                                </select>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">客房情况</label>
                                <select name="roomSanitation" class="form-control updateroomSanitation">
                                </select>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">楼层</label>
                                <input type="text" name="roomStorey" class="form-control updateroomStorey" placeholder="请输入房间所属楼层..." />
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">窗型</label>
                                <select name="roomWindow" class="form-control updateroomWindow">
                                </select>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">床型</label>
                                <input type="text" name="roomBed" class="form-control updateroomBed" placeholder="请输入房间床型..." />
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">可入住人数</label>
                                <select name="roomGuestNumber" class="form-control updateroomGuestNumber">
                                </select>
                            </div>
                            <div class="form-group newRoomTypeInp">
                                <label for="exampleInputEmail1">房间设施</label>
                                <textarea name="roomFacility" class="form-control updateroomFacility" placeholder="请输入客房设施..." ></textarea>
                            </div>
                            <div class="newRoomTypeFooter">
                                <button type="submit" class="btn btn-default btns">提交</button>
                                <button type="button" class="btn btn-default btns closeUpdateRoom">取消</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 删除客房 -->
            <div class="col-md-6 deleteRoom" >
                <div class="panel panel-default deleteRoomBody">
                    <div class="panel-heading">系统提示</div>
                    <div class="panel-body">
                        <div class="form-group tips">
                            <label for="exampleInputEmail1">是否删除该客房？</label>
                        </div>
                        <div class="deleteRoomFooter">
                            <a  href="#" id="okDeleteRoom" class="btn btn-default btns">确认</a>
                            <span class="btn btn-default closeDeleteRoom btns">取消</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <p class="countRoom" id="${requestScope.countRoomType}">全部<br/>(${requestScope.countRoomType})</p>
                <a href="${pageContext.request.contextPath}/showRoomStruts/5/${requestScope.roomTypeId}"/><p style="color: #000" class="span2">预订<br/>(${requestScope.countReservationRoomType})</p></a>
                <a href="${pageContext.request.contextPath}/showRoomStruts/6/${requestScope.roomTypeId}"/><p class="countCheckin" id="${requestScope.countCheckinRoomType}">在住<br/>(${requestScope.countCheckinRoomType})</p></a>
                <a href="${pageContext.request.contextPath}/showRoomStruts/7/${requestScope.roomTypeId}"/><p class="span4">空闲<br/>(${requestScope.countFreeRoomType})</p></a>
                <a href="${pageContext.request.contextPath}/showRoomStruts/8/${requestScope.roomTypeId}"/><p class="span5">脏房<br/>(${requestScope.countNotCleanedRoomType})</p></a>
                <a href="${pageContext.request.contextPath}/showRoomStruts/9/${requestScope.roomTypeId}"/><p class="span6">维修<br/>(${requestScope.countRepairRoomType})</p></a>
                <p class="span1"></p>
            </div>
        </div>
    </div>
</div>

</body>
</html>