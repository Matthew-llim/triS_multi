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
			document.frm.action="admin_o2oQnA.do";
			document.frm.submit();
		});
	});

</script>
</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>1:1 문의하기</h1>
	</div>
	<form action="admin_o2oQnA_add.do" class="form-group" method="POST" name="frm">
		제목 : <input type="text" name="o2o_title" size="30" /> <br>
		이메일 : <input type="text" name="o2o_email" size="30" /> <br>
		핸드폰번호 : <input type="text" name="o2o_phone" size="30" /><br>
		서비스분류 : <select name="o2o_type">
			<option value="회원">회원</option>
			<option value="예약 및 결제">예약 및 결제</option>
			<option value="취소 및 환불">취소 및 환불</option>
			<option value="기타">기타</option>
		</select> <br> 문의 내용:
		<textarea name="o2o_content" rows="10" cols="60"></textarea>
		<br> <input class="btn btn-success" type="submit" value="문의하기" />
		<input type="button"class="btn btn-success" id="cancel" value="취소하기"/>
	</form>

</body>
</html>