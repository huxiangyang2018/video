<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://zhiyou100.com/common/" prefix="pg"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>视频列表</title>
<link href='<c:url value="/css/bootstrap.min.css"></c:url>' rel="stylesheet">
    <script src='<c:url value="/js/jquery-1.12.4.min.js"></c:url>'></script>
    <script src='<c:url value="/js/bootstrap.min.js"></c:url>'></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-confirm.min.css" />
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-confirm.min.js" ></script>

	

<script>
    		/* var time = 0;
    		function count(check){
    			if(check.checked){
    				time++;
    			}else if(time>0){
    				time--;
    			}
    			document.getElementById("delete").innerHTML=time;
    		}
    		
			function SelectAll() {
				time = 0;
			var ck = document.getElementById("ckb")
 			var checkboxs=document.getElementsByName("checkbox")
 			for (var i=0;i<checkboxs.length;i++) {
  			var e=checkboxs[i];
  			e.checked=ck.checked;
  			count(e);
 				}
			} */
			/* function deleteData() {
			if(!confirm("确定要删除吗?")){
				window.event.returnValue = false;
			}
		} */
		
		/* function deleteVideos(){
			if(!confirm("你确定要删除这"+time+"条吗?")){
				window.event.returnValue = false;
			}else{
				document.getElementById("videoform").action="${pageContext.request.contextPath }/video/deleteVideos.action"
				document.getElementById("videoform").submit();
				return true;
			}
		} */
			var deleteNum = 0;
			function checkDelete(ele){
				var size = $("input[name=checkid]").length;
				if(ele.checked){
					deleteNum ++;
				}else{
					deleteNum --;
				}
				$("#countSpan").text(deleteNum);
				if(size == deleteNum){
					$("#checkAll").prop("checked",true);
				}else{
					$("#checkAll").prop("checked",false);
				}
			}
			function checkAllElement(ele){
				$("input[name=checkid]").prop("checked",ele.checked);
				if(ele.checked){
					deleteNum = $("input[name='checkid']").length;
				}else{
					deleteNum = 0;
				}
				$("#countSpan").text(deleteNum);
			}
			function batchDelete(){
				if(deleteNum == 0){
					$.alert({
					    title: '提示',
					    content: '还没有选择',
					});
					return;
				}
				$.confirm({
				    title: '小心',
				    content: '看清楚,可以全删哦',
				    buttons: {
				    	确认: function () {
				        	$("#deleteForm").prop("action","${pageContext.request.contextPath}/video/deleteVideos.action");
				        	//$("#deleteForm")[0].action="${pageContext.request.contextPath}/video/deleteVideos.action";
				        	$("#deleteForm").submit();
				        },
				                  取消: function () {
				           
				        }
				    }
				});
			}
			
			 function deleteData(id){
				 alert(111);
				$.confirm({
				    title: '小心',
				    content: '确认删除么?',
				    buttons: {
				    	确认: function () {
				    		   $.ajax({
				    			   data:{"id":id},
				    			   dataType:"text",
				    			   success:function(msg){
				    				 	if(msg=="success"){
				    				 		location.reload();
				    				 	}
				    			   },
				    			   type:"GET",
				    			   url:"${pageContext.request.contextPath }/video/deleteVideo.action"   
				    		   });
				        },
				                    取消: function () {
				        }
				    }
				});
			}

		</script>
</head>

<body>
	<jsp:include page="/WEB-INF/view/navigation.jsp">
		<jsp:param value="video" name="fromJsp"/>
	</jsp:include>
	<div class="row">
		<div class="jumbotron col-md-offset-2 col-md-8"
			style="border-radius: 10px;">
			<div class="container">
				<h3>视频列表-视频管理</h3>
			</div>
		</div>

		<form class="form-inline" id="deleteForm"
			action="${pageContext.request.contextPath }/video/video-list.action">
			<a href="${pageContext.request.contextPath }/video/addVideo.action" 
				class="btn btn-primary col-md-offset-2"
				role="button">添加视频
			</a> 
			<a  onclick="batchDelete()">
				<button class="btn btn-primary" type="button">
					批量删除<span class="badge" id="countSpan">0</span>
				</button>
			</a>
			<div class="form-group col-md-offset-2">
				<input type="text" class="form-control" id="exampleInputName2" name="videoTitle" 
				value="${vt }"	placeholder="视频标题">
			</div>
			<div class="form-group">
				<div class="col-md-8">
					<select class="form-control" name="speakerName">
						<option value="">请选择主讲人</option>
						<c:forEach items="${sList }" var="s">
							<option ${sn eq s.speakerName ? "selected" :"" }>${s.speakerName }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-8">
					<select class="form-control" name="courseName">
						<option value="">请选择课程</option>
						<c:forEach items="${cList }" var="c">
							<option ${cn eq c.courseName ? "selected" :"" }>${c.courseName }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">查询</button>

			<div class="bs-example col-md-8" data-example-id="hoverable-table">
				<table class="table table-hover col-md-offset-3"
					style="text-align: center;">
					<thead>
						<tr>
							<td><label class="checkbox-inline"> 
							<input type="checkbox" id="checkAll" onclick="checkAllElement(this)"
							>序号
							</label></td>
							<td>名称</td>
							<td>介绍</td>
							<td>讲师</td>
							<td>课程</td>
							<td>时长(秒)</td>
							<td>播放次数</td>
							<td>编辑</td>
							<td>删除</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.rows }" var="v" varStatus="status">
							<tr>
								<td><label class="checkbox-inline"> <input
										type="checkbox" name="checkid" onclick="checkDelete(this)"
										value="${v.id}">${status.count }
								</label></td>
								<td>${v.videoTitle }</td>
								<td>${v.videoDescr }</td>
								<td>${v.speakerName }</td>
								<td>${v.courseName }</td>
								<td>${v.videoLength }</td>
								<td>${v.videoPlayTimes }</td>
								<td><a
									href="${pageContext.request.contextPath }/video/editVideo.action?id=${v.id}">
										<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
								</a></td>

								<td><a  onclick="deleteData(${v.id})">
										<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
										<!-- href="${pageContext.request.contextPath }/video/deleteVideo.action?id=${v.id}" -->
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-offset-3">
					<pg:page
						url="${pageContext.request.contextPath }/video/video-list.action">
					</pg:page>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
