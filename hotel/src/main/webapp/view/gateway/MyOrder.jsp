<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的订单</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/gateway/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/gateway/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/gateway/jquery.bxslider.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/gateway/jquery.fancybox.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/gateway/jquery.mCustomScrollbar.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/gateway/strock-icon.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/gateway/default.css" rel="stylesheet">
    <!-- strock gap icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gateway/style1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gateway/animate.min.css">
    <!--    owl-carousel-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gateway/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gateway/jquery-ui.min.css">
    <!-- Main Css  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gateway/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gateway/responsive.css">
    <link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
</head>
<body>
<style>
*{margin: 0;padding: 0}

.sec-title h2:after {
    content: '';
    position: absolute;
    bottom: 7px;
    width: 35px;
    height: 2px;
    display: inline-block;
    background: #a7cc38;
    margin: 0 0 0 12px;
}
.panel-body{
    height: 300px;
    margin: 30px auto;
}
.spligs{
    margin: 0 auto;
}
table{
    text-align: center;
}
</style>
<script>
    window.onload = function(){
        var dates = new Date();
        var years = dates.getFullYear();
        var monhs = dates.getMonth()+1;
        var days = dates.getDate();
        var h = dates.getHours();
        var m = dates.getMinutes();
        var s = dates.getSeconds();
        $("#reservationTime").val(years+"-"+monhs+"-"+days+" "+h+":"+m+":"+s);
        $.post()
    }
</script>
<section class="top-bar dhomev">
    <div class="container">
        <div class="pull-left left-infos contact-infos">
            <ul class="list-inline">
                <li>
                    <a href="#"><i class="fa fa-phone"></i> (+86) 13707849274</a>
                </li><!-- comment for inline hack
                     --><li>
                <a href="#"><i class="fa fa-map-marker"></i> 广西南宁市wrada酒店</a>
            </li><!-- comment for inline hack
                     --><li>
                <a href="#"><i class="fa fa-envelope"></i> 761299323@qq.com</a>
            </li>
            </ul>
        </div><!-- /.pull-left left-infos -->
        <div class="pull-right right-infos link-list">
            <from action="${pageContext.request.contextPath}/showReservationIdCard" method="post">
            <c:if test="${sessionScope.userss == null && sessionScope.client == null}">
                <ul class="list-inline">
                    <li>
                        <a href="${pageContext.request.contextPath}/view/gateway/userLogin.jsp">登录</a>
                    </li>
                    <li>
                    <a href="${pageContext.request.contextPath}/view/gateway/userRegist.jsp">注册</a>
                </li>
                </ul>
            </c:if>
            <%--登陆了显示欢迎--%>
            <c:if test="${sessionScope.userss != null}">
                <ul class="list-inline">
                    <input type="hidden" id="${sessionScope.userss.usersId}" name="id">
                    <li>
                        <a href="/showReservationIdCard/${sessionScope.userss.userIdCard}/0" >我的订单</a>
                    </li>
                    <li>
                        <a href="#">欢迎！${sessionScope.userss.userRealName}</a>
                    </li><!-- comment for inline hack
                     --><li>
                    <a href="${pageContext.request.contextPath}/userCancellation">注销</a>
                </li>
                </ul>
            </c:if>
            <c:if test = "${sessionScope.client != null}">
                <ul class="list-inline">
                    <input type="hidden" id="${sessionScope.client.clientId}" name="id">
                    <li>
                        <a href="/showReservationIdCard/${sessionScope.client.clientIdCard}/0" >我的订单</a>
                    </li>
                    <li>
                        <a href="#">欢迎！${sessionScope.client.clientName}</a>
                    </li><!-- comment for inline hack
                     --><li>
                    <a href="${pageContext.request.contextPath}/clientCancellation">注销</a>
                </li>
                </ul>
            </c:if>
            </from>
        </div><!-- /.pull-right right-infos link-list -->
    </div><!-- /.container -->
</section><!-- /.top-bar -->

<nav class="navbar navbar-default  _fixed-header _light-header stricky" id="main-navigation-wrapper">
    <div class="container">
        <div class="navbar-header">
            <a href="${pageContext.request.contextPath}/gatewayShowAllRoomType/0" class="navbar-brand">
                <img alt="Awesome Image" src="${pageContext.request.contextPath}/img/gateway/logo2.png">
            </a>
        </div>
        <div class="collapse navbar-collapse" id="main-navigation">
            <ul class="nav navbar-nav ">
                <li>
                    <a href="${pageContext.request.contextPath}/gatewayShowAllRoomType/0" class="dropdown-toggle" >首页<span class="glyphicon glyphicon-chevron-down"></span></a>
                </li>
            </ul>
        </div>
    </div>
</nav>

    <div>
        <section class="row final-breadcrumb">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/gatewayShowAllRoomType/0">首页</a></li>
                    <c:if test="${sessionScope.userss != null}">
                        <li><a href="/showReservationIdCard/${userss.userIdCard}/0">我的订单</a></li>
                    </c:if>
                    <c:if test="${sessionScope.client != null}">
                        <li><a href="/showReservationIdCard/${client.clientIdCard}/0">我的订单</a></li>
                    </c:if>
                </ol>
            </div>
        </section>
        <%--我的订单列表--%>
        <div class="panel-body">
            <table class="table table-bordered tb-hover">
                <thead>
                    <tr>
                        <td>预订人</td>
                        <td>房间号</td>
                        <td>房间类型</td>
                        <td>身份证号</td>
                        <td>预订人手机号</td>
                        <td>预订时间</td>
                        <td>预订天数</td>
                        <td>状态</td>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${requestScope.reservations.size() >0}">
                        <c:forEach items="${requestScope.reservations}" var="reservations">
                            <tr class="users">
                                <td class="reservationName">${reservations.reservationName}</td>
                                <td>${reservations.roomNumber}</td>
                                <td class="roomTypeName">${reservations.roomTypeName}</td>
                                <td class="reservationIdCard">${reservations.reservationIdCard}</td>
                                <td class="reservationPhoneNumber">${reservations.reservationPhoneNumber}</td>
                                <td class="reservationTime">${reservations.reservationTime}</td>
                                <td class="reservationOccupancyDays">${reservations.reservationOccupancyDays}</td>
                                <c:if test="${reservations.reservationStatus == 0}">
                                    <td class="reservationStatus">已预订</td>
                                </c:if>
                                <c:if test="${reservations.reservationStatus == 1}">
                                    <td class="reservationStatus">已入住</td>
                                </c:if>
                                <c:if test="${reservations.reservationStatus == 2}">
                                    <td class="reservationStatus">已退订</td>
                                </c:if>
                                <c:if test="${reservations.reservationStatus == 3}">
                                    <td class="reservationStatus">预订中</td>
                                </c:if>
                                <td><a href="#">评价</a></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
            <c:if test="${requestScope.reservations.size() == 0}">
                <center>暂无订单</center>
            </c:if>
        </div>
    </div>

<!-- 分页 -->
<div class="spligs">
    <nav>
        <c:if test="${sessionScope.userss != null}">
        <ul class="pagination">
            <li>
                <a href="/showReservationIdCard/${userss.userIdCard}/${requestScope.nowPage -1}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:if test="${requestScope.reservations.size() == 0}">
                <li>
                    <a style="background:#e7e7e7" href="#">1</a>
                </li>
            </c:if>
            <c:forEach begin="${requestScope.beginPage}" end="${requestScope.endPage}" var="showPage">
                <c:if test="${requestScope.nowPage == showPage}">
                    <li>
                        <a style="background:#e7e7e7" href="/showReservationIdCard/${userss.userIdCard}/${showPage}">${showPage}</a>
                    </li>
                </c:if>
                <c:if test="${requestScope.nowPage != showPage}">
                    <li>
                        <a href="/showReservationIdCard/${userss.userIdCard}/${showPage}">${showPage}</a>
                    </li>
                </c:if>
            </c:forEach>
            <li>
                <a href="${pageContext.request.contextPath}/showReservationIdCard/${userss.userIdCard}/${requestScope.nowPage +1}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
        </c:if>
        <c:if test="${sessionScope.client != null}">
            <ul class="pagination">
                <li>
                    <a href="/showReservationIdCard/${client.clientIdCard}/${requestScope.nowPage -1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:if test="${requestScope.reservations.size() == 0}">
                    <li>
                        <a style="background:#e7e7e7" href="#">1</a>
                    </li>
                </c:if>
                <c:forEach begin="${requestScope.beginPage}" end="${requestScope.endPage}" var="showPage">
                    <c:if test="${requestScope.nowPage == showPage}">
                        <li>
                            <a style="background:#e7e7e7" href="/showReservationIdCard/${client.clientIdCard}/${showPage}">${showPage}</a>
                        </li>
                    </c:if>
                    <c:if test="${requestScope.nowPage != showPage}">
                        <li>
                            <a href="/showReservationIdCard/${client.clientIdCard}/${showPage}">${showPage}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <li>
                    <a href="${pageContext.request.contextPath}/showReservationIdCard/${client.clientIdCard}/${requestScope.nowPage +1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </c:if>
    </nav>
</div>


<footer>
    <section class="container clearfix footer-b-pad">
        <div class="footer-copy"><div class="pull-left fo-txt">
            <p>Copyright (c) Resort and Hotel 2016. All rights reserved. </p>
        </div>
            <div class="pull-right fo-txt">
                <p>Created by: <a href="http://www.htmlsucai.com">DesignArc</a></p>
            </div>
        </div>
    </section>
</footer>
<!-- footer  style-->

<script src="${pageContext.request.contextPath}/js/gateway/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/gateway/jquery.bxslider.js"></script>
<!-- owl carousel  -->
<script src="${pageContext.request.contextPath}/js/gateway/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/gateway/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/js/gateway/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="${pageContext.request.contextPath}/js/gateway/zebra_datepicker.js"></script>
<!-- jQuery ui js -->
<script src="${pageContext.request.contextPath}/js/gateway/jquery.mixitup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/gateway/jquery.fancybox.pack.js"></script>
<script src="${pageContext.request.contextPath}/js/gateway/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/gateway/custom.js"></script>
</body>
</html>