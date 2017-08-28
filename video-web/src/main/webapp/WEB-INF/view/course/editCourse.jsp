<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    	<title>编辑课程</title>
    	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
    	<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
    	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<div class="row">
		<div class="jumbotron col-md-offset-2 col-md-8" id="jumbotron" style="border-radius: 10px;"> 
			<div class="container">
				<h3>编辑课程-课程管理</h3>
			</div>
		</div>
		</div>
		<form class="form-horizontal" method="post"
		action="${pageContext.request.contextPath }/course/editCourse.action">
  			<div class="form-group">
    			<label for="inputEmail3" class="col-md-2 control-label">所属学科</label>
    			<div class="col-md-8">
      				<select class="form-control" name="subjectId">
  						<option value="">请选择所属学科</option>
  						<c:forEach items="${sList }" var="s">
  							<option value="${s.id }" ${course.subjectId == s.id ?"selected":"" }>
  								${s.subjectName }
  							</option>
  						</c:forEach>
					</select>
    			</div>
  			</div>
  			<div class="form-group">
    			<label for="inputPassword3" class="col-md-2 control-label">标题</label>
    			<div class="col-sm-8">
      				<input type="text" class="form-control" name="courseName" value="${course.courseName }">
    			</div>
  			</div>
  			
  			<div class="form-group">
    			<label for="inputPassword3" class="col-md-2 control-label">简介</label>
    			<div class="col-sm-8">
      				<textarea class="form-control" rows="3" name="courseDescr">${course.courseDescr }</textarea>
    			</div>
  			</div>
  			<div class="form-group">
    			<div class="col-md-offset-2 col-md-10">
    				<input type="hidden" value="${course.id }" name="id">
      				<button type="submit" class="btn btn-primary">保存</button>
      				<a href="javascript:history.go(-1)"><button class="btn btn-default">返回列表</button></a>
    			</div>
  			</div>
  			
		</form>
	</body>
</html>
