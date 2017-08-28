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
    	<title>主讲人列表</title>
    	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
    	<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
    	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    	
    	<script type="text/javascript">
    		function deleteSpeaker() {
				if(!confirm("确定要删除吗?")){
					window.event.returnValue = false;
				}
			}
    	</script>
    	
	</head>
	
	<body>
	<div class="row">
		<div class="jumbotron col-md-offset-2 col-md-8" id="jumbotron" style="border-radius: 10px;"> 
			<div class="container">
				<h3>主讲人列表-主讲人管理</h3>
			</div>
		</div>
		
		<form class="form-inline" action="${pageContext.request.contextPath }/speaker/speakerList.action">
			<a href="${pageContext.request.contextPath }/speaker/addSpeaker.action" class="btn btn-primary col-md-offset-2" role="button">添加主讲人</a>

  			<div class="form-group col-md-offset-4">
    			<label for="exampleInputName2">名称</label>
    			<input type="text" class="form-control" name="speakerName" 
    				value="${speakerName }"  placeholder="主讲人名称">
  			</div>
  			<div class="form-group">
    			<label for="exampleInputEmail2">职位</label>
    			<input type="text" class="form-control" name="speakerJob" 
    				value="${speakerJob }"  placeholder="主讲人职位">
  			</div>
  			<button type="submit" class="btn btn-primary">查询</button>
		</form>
	</div>
	
	<div class="bs-example col-md-8" data-example-id="hoverable-table">
    	<table class="table table-hover col-md-offset-3" style="text-align: center;">
			<thead>
        		<tr >
          			<td >序号</td>
          			<td >名称</td>
          			<td >职位</td>
          			<td >简介</td>
          			<td >编辑</td>
          			<td >删除</td>
        		</tr>
      		</thead>
      		<tbody>
      		<c:forEach items="${page.rows }" var="s" varStatus="status">
  			<tr>
          		<td scope="row">${status.count }</td>
          		<td >${s.speakerName }</td>
          		<td >${s.speakerJob }</td>
          		<td >${s.speakerDescr }</td>
          		<td >
          			<a href="${pageContext.request.contextPath }/speaker/editSpeaker.action?id=${s.id}">
          				<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
          			</a>
          		</td>
          		<td >
          			<a         onclick="return deleteSpeaker()"
          				href="${pageContext.request.contextPath }/speaker/deleteSpeaker.action?id=${s.id}">
          				<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
          			</a>	
          		</td>
        	</tr>
        	</c:forEach>
        	</tbody>
		</table>
 
		<div class="col-md-offset-3">
			<pg:page url="${pageContext.request.contextPath }/speaker/speakerList.action"></pg:page>
		</div>
  	 </div>
	</body>
</html>
