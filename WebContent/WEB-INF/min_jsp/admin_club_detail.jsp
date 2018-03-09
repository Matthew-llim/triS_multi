<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
table {
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>

</script>
</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>모임 세부 정보</h1>
	</div>
	
	<table border="1">
		<tr>
			<td>모임 번호</td>
			<td>모임 이름</td>
			<td>모임장 유저 ID</td>
			<td>모임 제목</td>
			<td>모임 내용</td>
			<td>모임 이미지</td>
			<td>모임 최대 인원</td>
			<td>모임 생성일</td>
			<td>로컬 카테고리</td>
			<td>클럽 카테고리</td>
		</tr>
		<tr>
			<td>${vo.club_no}</td>
			<td>${vo.club_name}</td>
			<td>${vo.user_id}</td>
			<td>${vo.club_title}</td>
			<td>${vo.club_content}</td>
			<td><img src="club_thumb_images/${vo.club_thumb_img}" style="width:128px;height:128px;"/></td>
			<td>${vo.max_member}</td>
			<td>${vo.create_time}</td>
			<td>${vo.l_category_no}</td>
			<td>${vo.c_category_no}</td>
		</tr>
	</table>
	<br/>
	<a href="club_detail.do?club_no=${vo.club_no}">해당 모임으로 가기</a>
	<br/>
	<br/>
	<table border="1">
		<tr>
			<td>모임 회원 목록들</td>
		</tr>
		<jl:forEach var="ls" items="${ls}">
			<tr>
				<td>${ls.user_id}&nbsp;<a href="admin_host_user_check.do?user_id=${ls.user_id}">유저 정보 확인하기</a></td>
			</tr>
		</jl:forEach>
	</table>
</body>
</html>