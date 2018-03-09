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
.select {
	float: left;
}

.select1 {
	float: left;
}

.select2 {
	float: left;
}

.select3 {
	float: left;
}
.select4 {
	float: left;
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
	// 판매자 등록시 모달
	$(".host_join").on("click",function(){
		$("#text_modal").modal("show");
	});
	$("#text_modal_yes").on("click",function(){
		var crn = $("#crn").val() ;
		var user_id = $("#user_id").val();
		var host_name = $("#host_name").val();
		var host_account = $("#host_account").val();
		var account_name = $("#account_name").val();
		var etc = $("#etc").val() ;
		
		var url = "admin_host_user_accept.do?crn=" + crn 
				+ "&user_id=" + user_id + "&host_name=" + host_name + "&host_account=" + host_account
				+ "&account_name=" +account_name+ "&etc="+etc;
		ajaxGet(url,function(rt){ });
		/* location.href = "admin_host_user_accept.do?crn=" + crn 
			+ "&user_id=" + user_id + "&host_name=" + host_name + "&host_account=" + host_account
			+ "&account_name=" +account_name+ "&etc="+etc; */
		location.href = "admin_host_request.do";
		/* $("#text_modal_modal").modal("hide"); */
	});
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});
	
	// 판매자 요청 삭제시 모달
	$(".host_request_refuse").on("click",function(){
		$("#text_modal2").modal("show");
	});
	$("#text_modal_yes2").on("click",function(){
		var host_apply_no = $("#host_apply_no").val();
		location.href = "admin_host_user_remove_request.do?host_apply_no=" + host_apply_no;
		$("#text_modal_modal").modal("hide");
	});
	$("#text_modal_no2").on("click",function(){
		$("#text_modal2").modal('hide');
	});

});
</script>
</head>
<body>
	${vo.host_apply_no}
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">판매자신청정보</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<td>사업자 번호</td>
								<td>유저 ID</td>
								<td>판매자 이름</td>
								<td>판매자 계좌 번호</td>
								<td>판매자 계좌 이름</td>
								<td>참고사항(거절 사항)</td>
							</tr>
						</thead>
						<tr>
							<td>${vo.crn}</td>
							<td>${vo.user_id}</td>
							<td>${vo.host_name}</td>
							<td>${vo.host_account}</td>
							<td>${vo.account_name}</td>
							<td>${vo.etc}</td>
						</tr>
					</table>

					<div class="select">
						<form action="admin_host_user_accept.do" method="post">
							<input type="hidden" id="crn" name="crn" value="${vo.crn}"></input> 
							<input type="hidden" id="user_id" name="user_id" value="${vo.user_id}"></input> 
							<input type="hidden" id="host_name" name="host_name" value="${vo.host_name}"></input>
							<input type="hidden" id="host_account" name="host_account" value="${vo.host_account}"></input> 
							<input type="hidden" id="account_name" name="account_name" value="${vo.account_name}"></input>
							<input type="button" class="host_join btn" value="판매자 등록 하기" />&nbsp;&nbsp;&nbsp;&nbsp;
						</form>
					</div>
					
					<div class="select2">
						<form action="admin_host_user_refuse_write.do" method="post">
							<input type="hidden" id="host_apply_no" name="host_apply_no" value="${vo.host_apply_no}"></input> 
							<input type="hidden" id="etc" name="etc" value="${vo.etc}"></input>
							<button class="btn" type="submit">참고 사항(거절 사항) 작성 하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
						</form>
					</div>
					
					<div class="select3">
						<form action="admin_host_user_remove_request.do" method="post">
							<input type="hidden" name="host_apply_no" value="${vo.host_apply_no}"></input>
							<input type="button" class="host_request_refuse btn" value="판매자 신청 사항 삭제" />&nbsp;&nbsp;&nbsp;&nbsp;
						</form>
					</div>
					
				<div class="select4">
						<form method="post" action="admin_host_request.do">
							<button class="btn" type="submit">취소 하기</button>
						</form>
				</div>	
					<!-- /.table-responsive -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>


<!-- 판매자 등록시 모달 -->
<div id="text_modal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="text_mohead" class="modal-header"align="center"><h4>판매자 등록</h4></div>
			<div id="text_mobody" class="modal-body" align="center">
				<h4>판매자 등록 하시겠습니까?</h4>
			</div>
			<div id="text_ft" class="modal-footer">
				<button type='button' class='btn btn-default' to-delete="delete_${vs.count}"  id='text_modal_yes'>확인</button>
				<button type='button' class='btn btn-primary' id='text_modal_no'>취소</button>
			</div>
		</div>
	</div>
</div>

<!-- 판매자 신청 사항 삭제시 모달 -->
<div id="text_modal2" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="text_mohead2" class="modal-header"align="center"><h4>판매자 신청 사항 삭제</h4></div>
			<div id="text_mobody2" class="modal-body" align="center">
				<h4>판매자 신청 사항 삭제 하시겠습니까?</h4>
			</div>
			<div id="text_ft2" class="modal-footer">
				<button type='button' class='btn btn-default' to-delete="delete_${vs.count}"  id='text_modal_yes2'>확인</button>
				<button type='button' class='btn btn-primary' id='text_modal_no2'>취소</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>