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
</head>
<body>
	${user_id}님 성공적으로 수정되었습니다.
	<a href="main.html" target="_parent">main으로 돌아가기</a>
</body>
</html>