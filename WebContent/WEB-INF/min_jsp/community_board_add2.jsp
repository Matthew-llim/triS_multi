<%@ page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"%><%@
taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

</style>
<script src="common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>자유게시판 글쓰기 공간</h1>
	</div>
	<form action="community_board_add2.do" class="form-group" method="POST" name="frm" id="text_addform">
		제목 : <input type="text" name="com_board_title" size="30" /> <br>
		말머리 : <select name="com_board_type">
			<option value="선택">선택하세요</option>
			<option value="유머">유머</option>
			<option value="맛집">맛집</option>
			<option value="취미">취미</option>
			<option value="감성">감성글</option>
			<option value="공유">공유</option>
		</select> <br>
		
		내용:
		<textarea name="com_board_content" rows="10" cols="60"></textarea>
		<br> 
		<input id="myAlert" class="btnAdd btn-success" type="submit" value="등록" />
		<input type="button"class="btn btn-success" id="cancel" value="취소"/>
	</form>
	
	<!--alert 모달폼  -->



</body>
</html>