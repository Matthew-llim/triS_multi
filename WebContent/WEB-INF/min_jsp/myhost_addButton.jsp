<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<title>Insert title here</title>d
</head>
<body>
	${user_id}
	
	<form action="myhost_addForm.do" method="POST">
		<input type="submit" value="판매자등록"/>
		<input type="hidden" name="user_id" value="${user_id}"/>
	</form>
	

</body>
</html>