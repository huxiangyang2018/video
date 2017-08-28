<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://zhiyou100.com/common/" prefix="pg" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    	<title>课程列表</title>
    	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
    	<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
    	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    	<script type="text/javascript">
    		function deleteCourse() {
				if(!confirm("确定要删除吗?")){
					window.event.returnValue = false;
				}
			}
    	</script>
	</head>
	
	<body>
	<jsp:include page="/WEB-INF/view/navigation.jsp">
		<jsp:param value="course" name="fromJsp"/>
	</jsp:include>
	<div class="row">
		<div class="jumbotron col-md-offset-2 col-md-8" id="jumbotron" style="border-radius: 10px;"> 
			<div class="container">
				<h3>课程列表-课程管理</h3>
			</div>
		</div>
			<a href="${pageContext.request.contextPath }/course/addCourse.action" >
				<button class="btn btn-primary col-md-offset-2">添加课程</button>
			</a>
		</div>
		
	<div class="bs-example col-md-8" data-example-id="hoverable-table">
    	<table class="table table-hover col-md-offset-3" style="text-align: center;">
			<thead>
        		<tr >
          			<td >序号</td>
          			<td >标题</td>
          			<td >学科</td>
          			<td >简介</td>
          			<td >编辑</td>
          			<td >删除</td>
        		</tr>
      		</thead>
      		<tbody>
      		<c:forEach items="${page.rows}" var="c" varStatus="status">
  			<tr>
          		<td scope="row">${status.count }</td>
          		<td >${c.courseName }</td>
          		<td >${c.sj.subjectName }</td>
          		<td >${c.courseDescr }</td>
          		<td >
          			<a href="${pageContext.request.contextPath }/course/editCourse.action?id=${c.id}">
          				<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
          			</a>
          		</td>	
          		<td >
          			<a 		onclick="return deleteCourse()"
          				href="${pageContext.request.contextPath }/course/deleteCourse.action?id=${c.id}">
          				<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
          			</a>
          		</td>
        	</tr>
        	</c:forEach>
        	</tbody>
			</table>
		<div class="col-md-offset-3">
			<pg:page url="${pageContext.request.contextPath }/course/courseList.action"></pg:page>
		</div>
  	 </div>
	</body>
</html>
