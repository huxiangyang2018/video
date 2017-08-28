<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    	<title>编辑视频</title>
    	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
    	<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
    	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<div class="row">
		<div class="jumbotron col-md-offset-2 col-md-8" id="jumbotron" style="border-radius: 10px;"> 
			<div class="container">
				<h3>编辑视频信息-视频管理</h3>
			</div>
		</div>
		</div>
		<form class="form-horizontal"	method="post"
		 	action="${pageContext.request.contextPath }/video/editVideo.action" >
  			<div class="form-group">
    			<label for="inputEmail3" class="col-md-2 control-label">视频标题</label>
    			<div class="col-md-8">
      				<input type="text" class="form-control" value="${v.videoTitle}" name="videoTitle" placeholder="视频标题">
    			</div>
  			</div>
  			<div class="form-group">
    			<label for="inputEmail3" class="col-md-2 control-label">主讲人</label>
    			<div class="col-md-8">
      				<select class="form-control" name="speakerId">
  						<option value="">请选择主讲人</option>
  						<c:forEach items="${sList }" var="s">
  							<option value="${s.id}" ${v.speakerId eq s.id ?"selected":""}>
  								${s.speakerName }
  							</option>
  						</c:forEach>
					</select>
    			</div>
  			</div>
  			<div class="form-group">
    			<label for="inputEmail3" class="col-md-2 control-label">所属课程</label>
    			<div class="col-md-8">
      				<select class="form-control" name="courseId">
  						<option value="">请选择课程</option>
  						<c:forEach items="${cList }" var="c">
  							<option value="${c.id}" ${v.courseId eq c.id ?"selected":""}>
  								${c.courseName }
  							</option>
  						</c:forEach>
					</select>
    			</div>
  			</div>
  			<div class="form-group">
    			<label for="inputPassword3" class="col-md-2 control-label">视频时长</label>
    			<div class="col-sm-8">
      				<input type="number" class="form-control" name="videoLength"
      					value="${v.videoLength }" placeholder="视频时长(秒)">
    			</div>
  			</div>
  			<div class="form-group">
    			<label for="inputPassword3" class="col-md-2 control-label">封面图片</label>
    			<div class="col-sm-8">
      				<input type="url" class="form-control" name="videoImageUrl"
      					value="${v.videoImageUrl }" placeholder="视频封面图片地址,网络图片">
    			</div>
  			</div>
  			<div class="form-group">
    			<label for="inputPassword3" class="col-md-2 control-label">视频播放地址</label>
    			<div class="col-sm-8">
      				<input type="url" class="form-control" name="videoUrl"
      					value="${v.videoUrl }" placeholder="视频播放地址,网络地址">
    			</div>
  			</div>
  			<div class="form-group">
    			<label for="inputPassword3" class="col-md-2 control-label">视频简介</label>
    			<div class="col-sm-8">
      				<textarea class="form-control" rows="3" name="videoDescr">${v.videoDescr}</textarea>
    			</div>
  			</div>
  			<div class="form-group">
    			<div class="col-md-offset-2 col-md-10">
    				<input type="hidden" name="id" value="${v.id}">
<%--     				<input type="hidden" name="insertTime" value="<fmt:formatDate value="${v.insertTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>"> --%>
      				<button type="submit" class="btn btn-primary">保存</button>
      				<a href="javascript:history.go(-1)" role="button" class="btn btn-default">返回列表</a>
    			</div>
  			</div>
  			
		</form>
	</body>
</html>