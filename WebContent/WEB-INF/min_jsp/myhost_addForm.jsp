<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	${user_id}
	<h3>판매자 등록 form</h3>
	<form action="myhost_addhost.do" method="POST">
		<input type="hidden" name="user_id" value="${user_id}"/>
		<table border="1">
			<tr>
				<td>대표명</td>
				<td><input type="text" name="host_name"/></td>
			</tr>
			<tr>
				<td>사업자번호</td>
				<td><input type="text" name="crn"/></td>
			</tr>
			<tr>
				<td>회사주소</td>
				<td><input type="text" name="zipcode"/></td>
			</tr>
			<tr>
				<td>입금계좌</td>
				<td><input type="text" name="host_account"/></td>
			</tr>
		</table>
		<input type="submit" value="등록하기"/>
		<input type="reset" value="취소하기"/>
	</form>
	
</body>
</html>