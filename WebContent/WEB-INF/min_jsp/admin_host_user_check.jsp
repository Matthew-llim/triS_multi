<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>

</script>
</head>
<body>
<h1>판매자 유저 상세 정보</h1>
<table border="1" width="500">
	<tr>
		<td>이름</td>
		<td>유저 ID</td>
		<td>주민등록번호 앞자리</td>
		<td>주민등록번호 뒷자리</td>
		<td>성별</td>
		<td>전화번호</td>
		<td>닉네임</td>
		<td>우편번호</td>
		<td>상세주소</td>
		<td>이메일</td>
	</tr>
	<tr>
		<td>${vo.user_name}</td>
		<td>${vo.user_id}</td>
		<td>${vo.ssn1}</td>
		<td>${vo.ssn2}</td>
		<jl:choose>
			<jl:when test="${vo.gender == 'M'}">
				<td>남자</td>
			</jl:when>
			<jl:when test="${vo.gender == 'F'}">
				<td>여자</td>
			</jl:when>
		</jl:choose>
		<td>${vo.phone}</td>
		<td>${vo.nickname}</td>
		<td>${vo.zipcode}</td>
		<td>${vo. zipdetail}</td>
		<td>${vo.email}</td>
	</tr>
</table>
<br>
<form method="POST" action="admin_user_mod.do">
	<input type="hidden" name="user_id" value="${vo.user_id}" />
	<button type="submit">수정하기</button>
</form>
<br>
<form method="POST" action="admin_hosts.do">
	<button type="submit">취소하기</button>
</form>

</body>
</html>