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
			document.frm.action="admin_o2oQnA_list.do";
			document.frm.submit();
		});
	});

</script>
</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>1:1 문의내용들</h1>
	</div>
	<table border="1">
		<tr>
			<td>문의 제목 : </td>
			<td>${vo.o2o_title}</td>
		</tr>
		<tr>
			<td>문의 타입 : </td>
			<td>${vo.o2o_type}</td>
		</tr>
		<tr>
			<td>문의 작성 시간 : </td>
			<td>${vo.the_time}</td>
		</tr>
		<tr>
			<td>이메일 주소 : </td>
			<td>${vo.o2o_email}</td>
		</tr>
		<tr>
			<td>고객 전화 번호 : </td>
			<td>${vo.o2o_phone}</td>
		</tr>
		<tr>
			<td>문의 내용 : </td>
			<td>${vo.o2o_content}</td>
		</tr>
	</table>
	<br/>
	<br/>
	<br/>
	
	<form method="post" action="admin_o2oQnA_Email.do" name="frm">
		<input type="hidden" name="o2o_no" value="${vo.o2o_no}">
		<input type="hidden" name="o2o_title" value="${o2o_title}">
		<input type="hidden" name="o2o_type" value="${vo.o2o_type}">
		<input type="hidden" name="the_time" value="${vo.the_time}">
		<input type="hidden" name="o2o_email" value="${vo.o2o_email}">
		<input type="hidden" name="o2o_phone" value="${vo.o2o_phone}">
		<input type="hidden" name="o2o_content" value="${vo.o2o_content}">
		
		고객님에게 문의 답변하기 : <br/>
		
		<textarea name="re_o2o_content" rows="20" cols="50"></textarea>
		<br/>
		<br/>
		<button type="submit">답변 보내기</button>
		<button id="cancel" type="submit">취소하기</button>
	</form>
</body>
</html>