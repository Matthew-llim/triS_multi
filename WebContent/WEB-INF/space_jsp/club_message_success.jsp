<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<style>
	</style>
	<script type="text/javascript">
		$("window").ready(function(){
			$("#btn").on("click",function(){
				window.close();
			});
		});
	</script>
</head>
<body>
	<h3>쪽지가 성공적으로 전달 되었습니다.</h3>
	<input id="btn" type="button" value="확인">
</body>
</html>