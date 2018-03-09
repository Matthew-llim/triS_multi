<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

.container{
text-align: center;
	
}

.jumbotron {
text-align: center;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="common.js"></script>
<script>
$(document).ready(function(){
	// 커뮤니티 글 수정 완료 모달 부분
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
	<div class="jumbotron" style="background-color: pink">
		<h1>글 수정합니다 </h1>
	</div>
	<div class="container">
		<form action="admin_community_board_mod2.do" method="POST" id="frm">
			<div class="form-group">
				제 목 : <input type="text"  size="30"  name="com_board_title" value="${mvo.com_board_title}" /><br />
				<br /> 아이디 : 
				<label>${mvo.user_id}</label><br/>
				<input type="hidden"  size="30" name="user_id" value="${mvo.user_id}" /><br /> <br />
				<textarea name="com_board_content" rows="10" cols="40">${mvo.com_board_content}</textarea>
				<input type="hidden" name="com_board_no" value="${mvo.com_board_no}" /> <br />
				<input class="btn btn-success mod_complete" type="button" value="수정" />
			</div>
		</form>
		
<!-- 커뮤니티 글 수정 완료 모달 부분	 -->	
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
	
	</div>
</body>
</html>