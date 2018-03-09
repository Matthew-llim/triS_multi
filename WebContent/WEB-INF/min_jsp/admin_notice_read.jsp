<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		.jumbotron{
			text-align:center;
		}
		.container{
			height : 50px;
		}
		.content{
			height : 100px;
		}
	
	</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>
$(document).ready(function(){ 
	// 공지 삭제시 모달
	$("#remove_notice").on("click",function(){
		$("#notice_No").val( $(this).attr("notice_no") );
		$("#text_modal").modal("show");
	});
	$("#text_modal_yes").on("click",function(){
		var del_notice_no = $("#notice_No").val();
			location.href = "admin_notice_del.do?notice_no=" + del_notice_no;
		$("#text_modal_modal").modal("hide");
	});
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});

});
</script>
</head>
<body>

	<div id="i" class="jumbotron panel-primary">
		<h1>공지사항</h1>
	</div>
	<div class="container">
		<div class="title">
			<label>제목:</label>
			<span>${vo.notice_title}</span><br>
		</div>
		
		<div class="content">
			<label>내용</label><br/>
			<span>${vo.notice_content}</span><br/>
		</div>
	
		<form action="admin_notice_list.do" method="post">
			<input type="submit" value="공지목록"/>
		</form>
		<form action="admin_notice_mod.do" method="post">
			<input type="hidden" name="notice_no" value="${vo.notice_no}"/>
			<input type="hidden" name="notice_title" value="${vo.notice_title}"/>
			<input type="hidden" name="notice_content" value="${vo.notice_content}"/>
			<input type="submit" value="공지수정"/> &nbsp;&nbsp;&nbsp;
			<input type="button" id="remove_notice" notice_no="${vo.notice_no}" value="공지삭제"/>
		</form>

	</div>
	
	
<!-- 공지 삭제시 모달 -->
<div id="text_modal" class="modal fade" role="dialog">
	<input type="hidden" id="notice_No" value="0"/>
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="text_mohead" class="modal-header"align="center"><h4>글 삭제</h4></div>
			<div id="text_mobody" class="modal-body" align="center">
				<h4>글을 삭제 하시겠습니까?</h4>
			</div>
			<div id="text_ft" class="modal-footer">
				<button type='button' class='btn btn-default' to-delete="delete_${vs.count}"  id='text_modal_yes'>확인</button>
				<button type='button' class='btn btn-primary' id='text_modal_no'>취소</button>
			</div>
		</div>
	</div>
</div>
	
</body>
</html>