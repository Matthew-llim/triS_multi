<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

.form-group {
	text-align: center;
}

.jumbotron {
	text-align: center;
}

.btn {
	text-align: center;
}


</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script>
	$(document).ready(function(){
		$("#cancel").on("click",function(){
			document.frm.method="POST";
			document.frm.action="admin_users.do";
			document.frm.submit();
		});
	});

</script>
</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h3>${vo.user_id} 회원 탈퇴 사유 작성하기</h3>
	</div>
	<form action="admin_user_del.do" class="form-group" method="POST" name="frm">
		<input type="hidden" name="user_id" value="${vo.user_id}"/>
		<input type="hidden" name="user_name" value="${vo.user_name}"/>
		<input type="hidden" name="email" value="${vo.email}"/>
		
		제목 : <input type="text" name="subject" size="30" /> <br>
		<br> 내용 작성:
		<textarea name="mail_content" rows="10" cols="60"></textarea>
		<br> <input class="btn btn-success" type="submit" value="작성 및 탈퇴 시키기" />
		<input type="button"class="btn btn-success" id="cancel" value="취소하기"/>
	</form>

</body>
</html>