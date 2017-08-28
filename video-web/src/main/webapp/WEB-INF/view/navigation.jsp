<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    	<title>导航</title>
    	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
    	<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
    	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    	
	</head>
	
	<body>
	<div class="navbar navbar-inverse">
<!-- 	<nav class="navbar navbar-inverse"> -->
		<div class="container">
			
			<div class="navbar-header">
				<a class="navbar-brand"    target="pageBox"
				 href="${pageContext.request.contextPath }/video/video-list.action">视频管理系统</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li >
						<a target="pageBox" href="${pageContext.request.contextPath }/video/video-list.action">视频管理 </a>
					</li>
					<li>
						<a target="pageBox" href="${pageContext.request.contextPath }/speaker/speakerList.action">主讲人管理</a>
					</li>
					<li>
						<a target="pageBox" href="${pageContext.request.contextPath }/course/courseList.action">课程管理</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/analysis/analysis.action" target="pageBox">统计分析</a>
					</li>
				</ul>
					<ul  class="nav navbar-nav navbar-right">
					<li >
						<a target="pageBox" href="${pageContext.request.contextPath }/admin/loginOut.action">${admin.loginName }
						<span class="glyphicon glyphicon-log-out"></span></a>
						<!-- <span class="glyphicon glyphicon-log-out" aria-hidden="true" ></span></a> -->
					</li>
  					</ul>	
			</div>
		</div>
	</div>
<!-- 	</nav> -->
	    <div class="embed-responsive embed-responsive-16by9">
  			<iframe class="embed-responsive-item" src="${pageContext.request.contextPath }/video/video-list.action" name="pageBox"></iframe>
		</div>
	</body>
</html>
