<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    	<title>编辑主讲人</title>
    	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
    	<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
    	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	</head>
	
	<body>
	<jsp:include page="/WEB-INF/view/navigation.jsp">
		<jsp:param value="speaker" name="fromJsp"/>
	</jsp:include>
		<div class="row">
		<div class="jumbotron col-md-offset-2 col-md-8" id="jumbotron" style="border-radius: 10px;"> 
			<div class="container">
				<h3>编辑主讲人-主讲人管理</h3>
			</div>
		</div>
		</div>
		<form class="form-horizontal" action="${pageContext.request.contextPath }/speaker/editSpeaker.action" method="post">
  			<div class="form-group">
    			<label for="inputEmail3" class="col-md-2 control-label">名字</label>
    			<div class="col-md-8">
      				<input type="text" class="form-control" name="speakerName" value="${s.speakerName }">
    			</div>
  			</div>
  			<div class="form-group">
    			<label for="inputPassword3" class="col-md-2 control-label">职业</label>
    			<div class="col-sm-8">
      				<input type="text" class="form-control" name="speakerJob" value="${s.speakerJob }">
    			</div>
  			</div>
  			<div class="form-group">
    			<label for="inputPassword3" class="col-md-2 control-label">头像图片</label>
    			<div class="col-sm-8">
      				<input type="text" class="form-control" name="speakerHeadUrl" value="${s.speakerHeadUrl }">
    			</div>
  			</div>
  			
  			<div class="form-group">
    			<label for="inputPassword3" class="col-md-2 control-label">简介</label>
    			<div class="col-sm-8">
      				<textarea class="form-control" rows="3" name="speakerDescr">${s.speakerDescr }</textarea>
    			</div>
  			</div>
  			<div class="form-group">
    			<div class="col-md-offset-2 col-md-10">
    				<input type="hidden" name="id" value="${s.id }">
      				<button type="submit" class="btn btn-primary">保存</button>
      				<a href="javascript:history.go(-1)" class="btn btn-default" role="button">返回列表</a>
    			</div>
  			</div>
  			
		</form>
	</body>
</html>
