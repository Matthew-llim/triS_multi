<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css"> 
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<form action="mypage_mod_user.do" method="POST">
		Password 입력하세요 : 
		<input type="password" name="passwd" size="20"/>
		<input type="submit" value="확인" class="btn"/>
	</form>

</body>
</html>