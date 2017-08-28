<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    	<title>导航</title>
    	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
    	<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
    	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    	
	</head>
	
	<body>
	<nav class="navbar navbar-inverse">
		<div class="container">
			
			<div class="navbar-header">
				<a class="navbar-brand" href="#">视频管理系统</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li >
						<a target="pageBox" href="video-list.html">视频管理 </a>
					</li>
					<li>
						<a target="pageBox" href="speaker-list.html">主讲人管理</a>
					</li>
					<li>
						<a target="pageBox" href="course-list.html">课程管理</a>
					</li>
					<li>
						<a href="#">统计分析</a>
					</li>
				</ul>
					<ul  class="nav navbar-nav navbar-right">
					<li >
						<a target="pageBox" href="#">admin
						<span class="glyphicon glyphicon-log-out" aria-hidden="true" ></span></a>
					</li>
  					</ul>	
			</div>
		</div>
	</nav>
	    <div class="embed-responsive embed-responsive-16by9">
  			<iframe class="embed-responsive-item" src="video-list.html" name="pageBox"></iframe>
		</div>
	</body>
</html>
