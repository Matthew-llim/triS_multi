<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>    
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>
$("document").ready(function(){
	// 이벤트 수정 완료시 모달
	$("#basic_mobody").html("<h4>수정이 완료 되었습니다.<h4>");
	$(".mod_complete").on("click",function(){
		$("#basic_modal").modal("show");
	});
	//
	// 창이 닫히면 페이지 reload. 필요한 사람은 사용하세요.
	$("#basic_modal").on("hidden.bs.modal",function(){
		//location.reload();
	});
	$("#basic_modal_yes").on("click",function(){
		$("#frm").submit();
	});

});
</script>	
</head>
<body>
	<form method="POST" action="admin_event_mod2.do" enctype="multipart/form-data" id="frm">
	제목: <input type="text" name="eve_title" value="${text.eve_title}"/> <br/>
	내용: <textarea name="eve_content" rows="7" cols="40"> ${text.eve_content}</textarea> <br/>
	<input type="hidden" name="eve_no" value="${text.eve_no}">
	
	썸네일 업로드: <input type="file" name="eve_thumb_img" /> <br/>
		<input type="button" class="mod_complete" value="수정 완료 하기"/> &nbsp;&nbsp;
		<input type="button" value="취소 하기" onclick="window.history.back()"/>
	</form>
	
<!-- 이벤트 수정 완료시 모달 -->
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