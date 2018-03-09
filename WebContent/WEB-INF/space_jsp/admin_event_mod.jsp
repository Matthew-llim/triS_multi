<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">


</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<!-- Bootstrap Core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
<body>

	<form method="POST" action="admin_event_mod2.do" enctype="multipart/form-data" id="frm">
	<label>이벤트 제목</label><br/><br/>
	<input type="text" name="eve_title" value="${text.eve_title}" style="width:100%;" class="form-control"/> <br/>
	<label>이벤트 내용</label><br/><br/>
	<pre><input type="text" name="eve_content" class="form-control" style="width:100%; height: 300px;"value="${text.eve_content}"/></pre> <br/>
	<input type="hidden" name="eve_no" value="${text.eve_no}">
	<label>썸네일 업로드</label><br/><br/>
	<input type="file" name="eve_thumb_img" /> <br/>
		<input type="button" class="mod_complete btn" value="수정 완료 하기"/> &nbsp;&nbsp;
		<input type="button" class="btn" value="취소 하기" onclick="window.history.back()"/>
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