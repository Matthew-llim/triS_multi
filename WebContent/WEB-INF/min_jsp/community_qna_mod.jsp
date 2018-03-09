<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
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
			$("#QnaModModal").modal("hide");

		});

		$("#btnQnASub").on("click", function() {
			$("#qnamodcompleteModal").modal("show");

		});
		
		$("#qnamodcompleteModal").on("hidden.bs.modal",function(){
			$("#qna_mod").submit();
		});
		});
	</script>
</head>
<body>
	<div id="i" class="jumbotron panel-primary">
		<h1>QnA</h1>
	</div>
	
	<form action="community_qna_mod2.do" method="POST" id="qna_mod">
		제목 : <input type="text" name="com_qna_title" value="${vo.com_qna_title}"/><br/>
		내용 :<textarea name="com_qna_content" rows="7" cols="63">${vo.com_qna_content}</textarea>
		<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
		<input type="button" value="QnA수정" class="btn btn-info btn-sm" data-toggle="modal" data-target="#QnaModModal"/>
		<div class="modal fade" id="QnaModModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>QnA를 수정 하시겠습니까?</p>
		        </div>
		        <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnClose" value="닫기">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnQnASub" value="수정">
		        </div>
		      </div>
		    </div>
		</div>
	</form>
	
	<div class="modal fade" id="qnamodcompleteModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>QnA 수정 완료!</p>
		        </div>
		         <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" value="확인">
		        </div>
		      </div>
	    </div>
	</div>		
</body>
</html>