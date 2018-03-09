<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
	<script type="text/javascript">
		function move(){
			window.parent.location.href="main.html";
		}
		setTimeout(move,3000);
	</script>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css"> 
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<body>
	${user_id}님 성공적으로 수정되었습니다.<br/>
	<a href="main.html" target="_parent">main으로 돌아가기</a>
</body>
</html>