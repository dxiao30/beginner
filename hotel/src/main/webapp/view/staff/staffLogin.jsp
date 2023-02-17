<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工登录</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/staff/LoginStyle.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js" ></script>
		<script type="text/javascript">
			$(function(){
				var spans = $("span")
				$("#passwords").click(function(){
					if($("#names").val() == ""){
						$(spans[0]).html("账号不能为空")
					}
				})
				$("#names").on("input",function(){
					$(spans[0]).html("");
				})
				$("#passwords").on("input",function(){
						$(spans[1]).html("");
					})
				$("#mainButtun").click(function(){
					if($("#names").val() == ""){
						$(spans[0]).html("账号不能为空")
						return false;
					}
					if($("#passwords").val() == ""){
						$(spans[1]).html("密码不能为空")
						return false;
					}
					getStaff();
				})
				
			})			
		</script>
		<style type="text/css">
		body{
			width: 100%;
			background: url(${pageContext.request.contextPath}/img/LoginBg.jpg) 0 0/100%;
		}
		</style>
</head>
<body>
	<form action="${pageContext.request.contextPath}/staffLogin" method="post">
		<div class="main">
			<div class="mainLogo">
				<a href="${pageContext.request.contextPath}/view/staff/staffLogin.jsp">
					<img src="${pageContext.request.contextPath}/img/logo.png" class="logo"/>
				</a>
			</div>
			<div class="section">
				<div class="user">
					<img src="${pageContext.request.contextPath}/img/user.png" class="userLogo"/>
					<input type="text" id="names" name="staffAccount" autocomplete="off" autofocus required placeholder="请输入员工账号..."/><span></span>
				</div>
				<div class="passwords">
					<img src="${pageContext.request.contextPath}/img/password.png" class="passwordLogo"/>
					<input type="password" id="passwords" name="staffPassword" autocomplete="off" required placeholder="请输入员工密码"/><span></span>
				</div>
			</div>
			<div class="skip">
				<a href="${pageContext.request.contextPath}/view/gateway/clientLogin.jsp" >普通用户登录</a>
				<a href="${pageContext.request.contextPath}/view/gateway/userLogin.jsp" >会员登录</a>
			</div>
			<div class="footer">
				<input type="submit" value="登录" class="mainButtun"/>
			</div>
		</div>
	</form>
</body>
</html>