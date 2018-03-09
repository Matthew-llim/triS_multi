<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>
$(document).ready(function(){ 
	// 이벤트 삭제시 모달
	$("#remove_eve").on("click",function(){
		$("#eve_No").val( $(this).attr("eve_no") );
		$("#text_modal").modal("show");
	});
	$("#text_modal_yes").on("click",function(){
		var del_eve_no = $("#eve_No").val();
			location.href = "admin_event_del2.do?eve_no=" + del_eve_no;
		$("#text_modal_modal").modal("hide");
	});
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});

});
</script>
</head>


<body>		

		<form method="POST" action="admin_event_mod.do" >
			제목 :<input type="text" name="eve_title" value="${text.eve_title}" readonly /><br/>
			내용 :<textarea name="eve_content" rows="7" cols="40" readonly >${text.eve_content}</textarea><br/>
				<input type="hidden" name="eve_no" value="${text.eve_no}" />
				<img src="thumbnail/${text.eve_thumb_img}" height="100" width="100"/><br/>
			<input type="submit" value="수정 하기" /> &nbsp;&nbsp;
			<%-- <a href="admin_event_del2.do?eve_no=${text.eve_no}">삭제</a> --%>
			<input type="button" id="remove_eve" eve_no="${text.eve_no}" value="삭제하기" />&nbsp;&nbsp;
			<input type="button" value="취소 하기" onclick= "window.location.href='admin_event_list.do'">
		</form>
		
<!-- 이벤트 삭제시 모달 -->
<div id="text_modal" class="modal fade" role="dialog">
	<input type="hidden" id="eve_No" value="0"/>	
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="text_mohead" class="modal-header"align="center"><h4>글 삭제</h4></div>
			<div id="text_mobody" class="modal-body" align="center">
				<h4>글을 삭제 하시겠습니까?</h4>
			</div>
			<div id="text_ft" class="modal-footer">
				<button type='button' class='btn btn-default' to-delete="delete_${vs.count}"  id='text_modal_yes'>확인</button>
				<button type='button' class='btn btn-primary' id='text_modal_no'>취소</button>
			</div>
		</div>
	</div>
</div>
		
		
</body>
</html>