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
.paginationdiv {
	text-align: right;
}

.select {
	float: left;
}

.commask {
	text-align: center;
}
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
	<br>
	<div class="row">
		<div class="col-lg-12">
								<div class="container">
						<form action="admin_community_board_mod2.do" method="POST" id="frm">

							<div class="form-group">
							<br/>
								<label> ${mvo.user_id} 님 글 수정  <p class="fa fa-pencil"> </p></label> <br/><br/>
								
								 <label>제목</label> 
								 <input	type="text" size="30" class="form-control" name="com_board_title" value="${mvo.com_board_title}" />
									<input type="hidden" size="30" name="user_id" value="${mvo.user_id}" /><br/>
									 <label>내용</label> 
								<textarea name="com_board_content" rows="25" 
									class="form-control">${mvo.com_board_content}</textarea>
								<input type="hidden" name="com_board_no" value="${mvo.com_board_no}" /> <br /> 
								<input class="btn mod_complete" type="button" value="수정" />
							</div>
						</form>

					</div>
			
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
		
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
	
</body>
</html>