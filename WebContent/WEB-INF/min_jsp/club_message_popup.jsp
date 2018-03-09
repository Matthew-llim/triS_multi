<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#submitBtn").on("click",function(){
				$("#frm").submit();
			});
		});
	</script>
</head>
<body>
	<div class="container">
		<h2>쪽지 보내기</h2>
		<form id="frm" action="club_add_message.do" method="post">
			<textarea name="msg_content" rows="10" cols="30"></textarea>
			<input type="hidden" name="send_user_id" value="${vo.send_user_id}">
			<input type="hidden" name="receive_user_id" value="${vo.receive_user_id}">
			<input id="submitBtn" type="button" value="쪽지 보내기">
		</form>
	</div>
</body>
</html>