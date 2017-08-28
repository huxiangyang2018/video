<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
   	 	<title>智游教育</title>
    	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
    	<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
    	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    	<style type="text/css">
    		body{
    			margin: 0 auto;
    			text-align: center;
    			padding-top: 300px;
    			width: 309px;
     		}
    	</style>
	</head>
	<body>
		
		<div class="center-block" >
			<img src="${pageContext.request.contextPath }/img/logo.png" class="img-rounded"/>
		<form action="${pageContext.request.contextPath }/admin/login.action">
  			 <div class="form-group has-success">
    			<input type="text" class="form-control" name="loginName" placeholder="用户名">
 		 	</div>
  			<div class="form-group has-success">
    			<input type="password" class="form-control" name="loginPwd" placeholder="登录密码">
 	 		</div>
  			<button type="submit"  class="btn btn-success form-control">登录</button>
		</form>
		</div>
		
	</body>
</html>
