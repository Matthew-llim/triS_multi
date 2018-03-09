<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
	
		.jumbotron{
			text-align:center;
		}
		
	</style>
	<script src="common.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function() {
	$("#btnClose").on("click", function() {
		$("#QnaModal").modal("hide");

	});

	$("#ee").on("click",function(){
		$("#QnaModal").modal("show");
	});
	
/* 	$("#status-modal").on("hidden.bs.modal",function(){
        location.href="space_detail.do?space_no="+${space.space_no};
     }); */
	
	$("#btnQnASub").on("click", function() {
		$("#completeModal").modal("show");
		
	});
	
	$("#completeModal").on("hidden.bs.modal",function(){
		location.href="community_qna_list.do";
		$("#qna_submit").submit();
	});
	
	});
	</script>
</head>
<body>
	<div id="i" class="jumbotron panel-primary">
		<h1>QnA</h1>
	</div>
	
	<form action="community_qna_add2.do" method="POST" id="qna_submit">
		<input type="hidden" name="user_id" value="${user_id}"/>
		제목 : <input type="text" name="com_qna_title"/><br/>
		내용 : <textarea name="com_qna_content" rows="7" cols="63"></textarea>
		<br/><input type="button" value="QnA작성" class="btn btn-info btn-sm" data-toggle="modal"  id="ee"/>
		<div class="modal fade" id="QnaModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>QnA를 작성 하시겠습니까?</p>
		        </div>
		        <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnClose" value="닫기">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnQnASub" value="작성">
		        </div>
		      </div>
		    </div>
		</div>
	</form>
	
	<form action="community_qna_list.do" method="POST">
		<input type="submit" value="취소" class="btn btn-info btn-sm"/>
	</form>
	
	<div class="modal fade" id="completeModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>QnA 작성 완료!</p>
		        </div>
		         <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" value="확인">
		        </div>
		      </div>
		    </div>
		</div>
</body>
</html>