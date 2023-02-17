<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>公告管理</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/announcement/announcements.css" rel="stylesheet" />
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
            $(".openNewAnnouncement").click(function(){
            	$(".announcementType").on("input propertychange",function(){
            		if($(this).val() == 1){
            			$(".activityTime").css("display","block");
            		}else{
            			$(".activityTime").css("display","none");
            		}
            	})
            	$(".newAnnouncement").css("display","block");
            })
            $(".closeNewAnnouncement").click(function(){
            	$(".newAnnouncement").css("display","none");
            })
            $(".openUpdateAnnouncement").click(function(e){
            	var v_id =e.target.id;
            	$(".upAnnouncementId").val(v_id);
            	$.post("/showAnnouncement/"+v_id,function(data){
            		$(".announcementTitleUpdate").val(data.announcementTitle);
            		$(".announcementContentUpdate").val(data.announcementContent);
            		if(data.announcementType == 0){
            			$(".announcementTypeUpdate").append("<option value='0' class='customerTypes'>前台公告</option>");
            			$(".announcementTypeUpdate").append("<option value='1' class='customerTypes'>网站活动公告</option>");
            		}else{
            			$(".announcementTypeUpdate").append("<option value='1' class='customerTypes'>网站活动公告</option>");
            			$(".announcementTypeUpdate").append("<option value='0' class='customerTypes'>前台公告</option>");
            		}
            		if(data.announcementState == 0){
            			$(".announcementStateUpdate").append("<option value='0' class='customerTypes'>未发布</option>");
            			$(".announcementStateUpdate").append("<option value='1' class='customerTypes'>已发布</option>");
            		}else{
            			$(".announcementStateUpdate").append("<option value='1' class='customerTypes'>已发布</option>");
            			$(".announcementStateUpdate").append("<option value='0' class='customerTypes'>未发布</option>");
            		}
            		$(".announcementTimeUpdate").val(data.announcementTime);
            		$(".staffNameUpdate").html("原发布人："+data.staffName);
            	})
            	$(".updateAnnouncement").css("display","block");
            })
            $(".closeUpdateAnnouncement").click(function(){
            	$(".customerTypes").remove();
            	$(".updateAnnouncement").css("display","none");
            })
            $(".openShowAnnouncement").click(function(e){
            	var v_id =e.target.id;
            	$.post("/showAnnouncement/"+v_id,function(data){
            		$(".announcementTitleDetail").val(data.announcementTitle);
            		$(".announcementContentDetail").val(data.announcementContent);
            		if(data.announcementType == 0){
            			$(".announcementTypeDetail").val("前台公告");
            		}else{
            			$(".announcementTypeDetail").val("网站活动公告");
            		}
            		if(data.announcementState == 0){
            			$(".announcementStateDetail").val("未发布");
            		}else{
            			$(".announcementStateDetail").val("已发布");
            		}
            		$(".announcementTimeDetail").val(data.announcementTime);
            		$(".staffNameDetail").html("发布人："+data.staffName);
            	})
            	$(".showAnnouncement").css("display","block");
            })
            $(".closeShowAnnouncement").click(function(){
            	$(".showAnnouncement").css("display","none");
            })
            $(".openDeleteAnnouncement").click(function(e){
            	$(".deleteAnnouncement").css("display","block");
            	var v_id =e.target.id;
            	$("#okDeleteAnnouncement").attr('href',"/deleteAnnouncement?announcementId="+v_id);
            })
            $(".closeDeleteAnnouncement").click(function(){
            	$(".deleteAnnouncement").css("display","none");
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
                    </ul>
                </div>
            </div>
            <div class="main-right  col-md-10 col-md-offset-2">
            <div class="panel-body navs">
                            <ol class="breadcrumb">
                                <li><a href="${pageContext.request.contextPath}/toPage/index/index">首页</a></li>
                                <li><a href="${pageContext.request.contextPath}/showAllAnnouncement">公告列表</a></li>
                            </ol>
                        </div> 
          	<div class="col-md-12">
                    <div class="panel panel-default ">
                        <div class="panel-heading">
                          		公告列表<span title="新增公告" class="glyphicon glyphicon-plus openNewAnnouncement">新增</span>
                        </div>
                        <div class="panel-body">
                            <table class="table table-bordered tb-hover">
                                <thead>
                                    <tr>
                                        <td>标题</td>
                                        <td>发布时间</td>
                                        <td>公告类型</td>
                                        <td>公告状态</td>
                                        <td>发布人</td>
                                        <td class="text-center">操作</td>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:if test="${requestScope.announcements.size() >0}">
                                	<c:forEach items="${requestScope.announcements}" var="announcements">
                                    <tr class="announcements">
                                        <td class="announcementTitles">${announcements.announcementTitle}</td>
                                        <td class="announcementTimes">${announcements.announcementTime}</td>
                                        <c:if test="${announcements.announcementType ==0}">
                                        	<td>前台公告</td>
                                        </c:if>
                                        <c:if test="${announcements.announcementType ==1}">
                                        	<td>网站活动公告</td>
                                        </c:if>
                                        <c:if test="${announcements.announcementState ==0}">
                                        	<td>未发布</td>
                                        </c:if>
                                        <c:if test="${announcements.announcementState ==1}">
                                        	<td>已发布</td>
                                        </c:if>
                                        <td class="staffNames">${announcements.staffName}</td>
                                        <td class=" text-center">                                        
                                        <c:if test="${announcements.announcementState ==0}">
                                        <a href="${pageContext.request.contextPath}/updateAnnouncementState/${announcements.announcementId}&1">
                                        <i title="发布公告" class="glyphicon glyphicon-send"></i>
                                        </a>&nbsp;&nbsp;
                                        </c:if>
                                        <c:if test="${announcements.announcementState ==1}">
                                        <a href="${pageContext.request.contextPath}/updateAnnouncementState/${announcements.announcementId}&0">
                                        <i title="停用公告" class="glyphicon glyphicon-paperclip"></i>
                                        </a>&nbsp;&nbsp;
                                        </c:if>                                      
                                        <a href="#">
                                        <i title="查看详细" id="${announcements.announcementId}" class="glyphicon glyphicon-search openShowAnnouncement"></i>
                                        </a>&nbsp;&nbsp;
                                        <a href="#">
                                        <i title="修改公告" id="${announcements.announcementId}" class="glyphicon glyphicon-edit openUpdateAnnouncement"></i>
                                        </a>&nbsp;&nbsp;
                                        <a href="#">
                                        <i title="删除公告" id="${announcements.announcementId}" class="glyphicon glyphicon-remove openDeleteAnnouncement"></i>
                                        </a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- 新增公告 -->
                <div class="col-md-6 newAnnouncement">
                    <div class="panel panel-default ">
                        <div class="panel-heading" style="text-align: center;">新增公告</div>
                        <div class="panel-body">
                            <form action="${pageContext.request.contextPath}/newAnnouncement" method="post">
                            <input type="hidden" name="staffId" value="${sessionScope.staff.staffId}">
                                <div class="form-group announcementText" style="margin-left: 40px;">
                                    <label for="exampleInputEmail1">标题</label>
                                    <input type="text" name="announcementTitle" class="form-control" id="exampleInputEmail1" placeholder="请输入公告标题..." />
                                </div>
                                <div class="form-group announcementTextarea">
                                    <label for="exampleInputPassword1">内容</label>
                                    <textarea class="form-control announcementContent" name="announcementContent" id="exampleInputPassword1" placeholder="请输入公告内容..." rows="4" cols="2"></textarea>
                                </div>
                                <div class="form-group announcementText">
                                    <label for="exampleInputEmail1">公告类型</label>
                                   <select name="announcementType" class="form-control announcementType">
                                   <option value="0">前台公告</option>
                                   <option value="1">网站活动公告</option>
                                   </select>
                                </div>
                                <div class="form-group announcementText activityTime" style="margin-left: 40px;">
                                    <label for="exampleInputEmail1">活动时间</label>
                                    <input type="date" name="activityTime" class="form-control" id="exampleInputEmail1" placeholder="请输入公告标题..." />
                                </div>
                                <div class="form-group announcementText">
                                    <label for="exampleInputEmail1">公告状态</label>
                                   <select name="announcementState" class="form-control">
                                   <option value="0">未发布</option>
                                   <option value="1">已发布</option>
                                   </select>
                                </div>                               
                                <div class="form-group announcementStaff">
                                    <label for="exampleInputPassword1">发布人：${sessionScope.staff.staffName}</label>
                                    </div>
                                <div class="btns">
                                <button type="submit" class="btn btn-default">提交</button>
                                <span class="btn btn-default closeNewAnnouncement">取消</span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- 修改公告 -->
                <div class="col-md-6 updateAnnouncement">
                    <div class="panel panel-default ">
                        <div class="panel-heading" style="text-align: center;">修改公告</div>
                        <div class="panel-body">
                            <form action="${pageContext.request.contextPath}/updateAnnouncement" method="post">
                            <input type="hidden" name="announcementId" class="upAnnouncementId">
                            <input type="hidden" name="staffId" value="${sessionScope.staff.staffId}">
                                <div class="form-group announcementText" style="margin-left: 40px;">
                                    <label for="exampleInputEmail1">标题</label>
                                    <input type="text" name="announcementTitle" class="form-control announcementTitleUpdate" id="exampleInputEmail1" placeholder="请输入公告标题..." />
                                </div>
                                <div class="form-group announcementTextarea">
                                    <label for="exampleInputPassword1">内容</label>
                                    <textarea class="form-control announcementContentUpdate" name="announcementContent" id="exampleInputPassword1" placeholder="请输入公告内容..." rows="4" cols="2"></textarea>
                                </div>
                                <div class="form-group announcementText">
                                    <label for="exampleInputEmail1">公告类型</label>
                                   <select name="announcementType" class="form-control announcementTypeUpdate">
                                   </select>
                                </div>
                                <div class="form-group announcementText">
                                    <label for="exampleInputEmail1">公告状态</label>
                                   <select name="announcementState" class="form-control announcementStateUpdate">
                                   </select>
                                </div>                                                       
                                <div class="form-group announcementStaff">
                                    <label for="exampleInputPassword1">现发布人：${sessionScope.staff.staffName}</label>
                                    </div>
                                <div class="form-group announcementStaff">
                                   <label for="exampleInputPassword1" class="staffNameUpdate"></label>
                                </div>   
                                <div class="btns">
                                <button type="submit" class="btn btn-default">提交</button>
                                <span class="btn btn-default closeUpdateAnnouncement">取消</span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- 查看公告详情 -->
                <div class="col-md-6 showAnnouncement">
                    <div class="panel panel-default ">
                        <div class="panel-heading" style="text-align: center;">公告详情</div>
                        <div class="panel-body">
                          <form action="${pageContext.request.contextPath}/updateAnnouncement" method="post">
                                <div class="form-group announcementText">
                                    <label for="exampleInputEmail1">标题</label>
                                    <input type="text" name="announcementTitle" class="form-control announcementTitleDetail" id="exampleInputEmail1" />
                                </div>
                                <div class="form-group announcementText">
                                    <label for="exampleInputEmail1">发布时间</label>
                                    <input type="text" name="announcementTitle" class="form-control announcementTimeDetail" id="exampleInputEmail1"/>
                                </div>
                                <div class="form-group announcementText">
                                    <label for="exampleInputEmail1">公告类型</label>
                                    <input type="text"  class="form-control announcementTypeDetail" id="exampleInputEmail1"/>
                                </div>
                                <div class="form-group announcementText">
                                    <label for="exampleInputEmail1">公告状态</label>
                                    <input type="text"  class="form-control announcementStateDetail" id="exampleInputEmail1"  />
                                </div>                          
                                <div class="form-group announcementTextarea">
                                    <label for="exampleInputPassword1">内容</label>
                                    <textarea class="form-control announcementContentDetail" id="exampleInputPassword1" rows="4" cols="2"></textarea>
                                </div> 
                                <div class="form-group announcementStaff">
                                    <label for="exampleInputEmail1" class="staffNameDetail"></label>
                                   </div>                           
                                <div class="btns">
                                <span class="btn btn-default closeShowAnnouncement">关闭</span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- 删除公告 -->
                <div class="col-md-6 deleteAnnouncement">
               <div class="panel panel-default ">
                   <div class="panel-heading" style="text-align: center;">删除公告</div>
                   <div class="panel-body">
                           <div class="form-group deleteText">
                               <label for="exampleInputEmail1">是否删除该公告？</label>
                           </div>                       
                           <div class="btns">
                           <a href="#" id="okDeleteAnnouncement" class="btn btn-default">确认</a>
                           <span class="btn btn-default closeDeleteAnnouncement">取消</span>
                           </div>
		                   </div>
		               </div>
		           </div> 
            </div>
         </div>
    </div>
    
</body>
</html>