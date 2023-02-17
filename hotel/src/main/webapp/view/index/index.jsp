<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>主界面</title>
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/css/index/indexStyle.css"/>
	<style type="text/css">
	body{
		width: 100%;
		background: url(${pageContext.request.contextPath}/img/2.jpg) no-repeat 0 0/100%;
	}
	</style>
</head>
<body>
<div class="main">
			<div class="top">		
					<a href="${pageContext.request.contextPath}/gatewayShowAllRoomType/0">
					<img src="${pageContext.request.contextPath}/img/logo.png" class="top-logo"/>
					</a>
						<h1>warada酒店管理系统</h1>
						<p>欢迎<a href="#" style="text-decoration: none">${sessionScope.staff.staffName}</a>|<a href="${pageContext.request.contextPath}/staffCancellation">注销</a></p>
			</div>
			<div class="section">
				<div class="logo">
					<%--跳转会员用户页面--%>
			<a href="${pageContext.request.contextPath}/showAllUsers/1">
			<div class="logo1">
				<img src="${pageContext.request.contextPath}/img/userlogo.png"/>
				<p>会员信息管理</p>
			</div>
			</a>
						<%--跳转公告管理页面--%>
			<a href="${pageContext.request.contextPath}/showAllAnnouncement">
			<div class="logo2">
				<img src="${pageContext.request.contextPath}/img/logo2.png"/>
				<p>公告管理</p>
			</div>
			</a>
						<%--跳转客房管家页面--%>
			<a href="${pageContext.request.contextPath}/showAllRoomType/0">
			<div class="logo3">
				<img src="${pageContext.request.contextPath}/img/logo3.png"/>
				<p>客房管家</p>
			</div>
			</a>
						<%--跳转后勤管理页面--%>
			<a href="${pageContext.request.contextPath}/showAllMaintain/1">
			<div class="logo4">
				<img src="${pageContext.request.contextPath}/img/logo4.png"/>
				<p>后勤管理</p>
			</div>
			</a>
						<%--跳转夜审系统页面--%>
			<a href="${pageContext.request.contextPath}/showIncomeList/1">
			<div class="logo5">
				<img src="${pageContext.request.contextPath}/img/logo5.png"/>
				<p>夜审系统</p>
			</div>
			</a>
			</div>
			</div>
		</div>
</body>
</html>