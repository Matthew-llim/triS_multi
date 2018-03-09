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
$(document).ready(function(){
	// 유저 정보 수정 완료시 모달
	$("#basic_mobody").html("<h4>수정이 완료 되었습니다.<h4>");
	$(".mod_complete").on("click",function(){
		$("#basic_modal").modal("show");
	});
	$("#basic_modal_yes").on("click",function(){
		$("#frm").submit();
	});

});
</script>
</head>
<body>
<h1>개별 유저 상세 정보 수정하기</h1>
<table border="1">
	<tr>
		<td>이름</td>
		<td>유저 ID</td>
		<td>전화번호</td>
		<td>닉네임</td>
		<td>우편 번호</td>
		<td>상세 주소</td>
		<td>이메일</td>
	</tr>
	<tr>
		<td>${vo.user_name}</td>
		<td>${vo.user_id}</td>
		<td>${vo.phone}</td>
		<td>${vo.nickname}</td>
		<td>${vo.zipcode}</td>
		<td>${vo.zipdetail}</td>
		<td>${vo.email}</td>
	</tr>
</table>
<br/>
<br/>
<form method="POST" action="admin_user_mod2.do" method="post" id="frm">
		<input type ="hidden" name="user_id" value="${vo.user_id}"></input>
		이름 : <input type="text" name="user_name" value="${vo.user_name}" /> <br/>
		전화번호 : <input type="text" name="phone" value="${vo.phone}" /> <br/>
		닉네임 : <input type="text" name="nickname" value="${vo.nickname}" /> <br/>
		우편 번호 : <input type="text" name="zipcode" value="${vo.zipcode}" /> <br/>
		상세 주소 : <input type="text" name="zipdetail" value="${vo.zipdetail}" /> <br/>
		이메일 : <input type="text" name="email" value="${vo.email}" /> <br/><br/>
	<input type="button" class="mod_complete" value="수정 완료 하기"/>
</form>
<br>

<form method="POST" action="admin_users.do">
	<button type="submit">취소하기</button>
</form>

<!-- 유저 정보 수정 완료시 모달 -->
<div id="basic_modal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="basic_mobody" class="modal-body" align="center">
			</div>
			<div id="basic_ft" class="modal-footer">
				<button type='button' class='btn btn-default' id='basic_modal_yes'>닫기</button>
			</div>
		</div>
	</div>
</div>


</body>
</html>