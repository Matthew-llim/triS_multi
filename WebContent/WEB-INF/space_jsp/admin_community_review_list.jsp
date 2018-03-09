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
	padding-right: 5px;
}


.select2 {
	float: left;
	padding-right: 5px;
}

.paginationdiv {
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
</head>
<script type="text/javascript">
$(document).ready(function(){
	// 해당 공간으로 이동
	$(".space_no").on("click",function(){
		var temp = $(this).attr("abc");
		document.frm.method="POST";
		document.frm.action="space_detail.do?space_no="+temp;
		document.frm.submit();
	});
	
	// 리뷰 삭제시의 모달
	$(".remove_review").on("click",function(){
		$("#review_No").val( $(this).attr("review_no") );
		$("#space_No").val( $(this).attr("space_no") );
		$("#text_modal").modal("show");
	});
	$("#text_modal_yes").on("click",function(){
		var del_review_no = $("#review_No").val();
		var del_space_no = $("#space_No").val();
			location.href = "admin_community_review_remove.do?review_no=" + 
			del_review_no + "&space_no=" + del_space_no;
		$("#text_modal_modal").modal("hide");
	});
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});

});
</script>



<body>
	<br>

	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				후기게시판

				<form id="form_search" action="admin_community_review_list.do">
					<input type="hidden" name="pg" value="" id="pg"> <input
						type="hidden" name="search_content"
						value="${search.search_content}"> <input type="hidden"
						name="search_option" value="${search.search_option}">
				</form>
				<form id="textsearch" action="admin_community_review_list.do">
				<div class="select">
					<select name="search_option" class="form-control">
						<option value="0">선택해주세요</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
						<option value="3">제목 + 내용</option>
						<option value="4">작성자</option>
					</select>
					</div>
								<div class="select2">
					<input type="text" name="search_content" class="form-control">
					</div> <input
						class="btn" type="submit" value="검색">
				</form>


			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>방번호</th>
								<th>아이디</th>
								<th>제목</th>
								<th>내용</th>
								<th>시간</th>
								<th>별점</th>
								<th>이미지</th>
								<th>삭제</th>
							</tr>
						</thead>
						<jl:forEach items="${ls}" var="rl" varStatus="vs">
							<tr>
								<td>${rl.review_no}</td>
								<td>${rl.space_no}</td>
								<td>${rl.user_id}</td>
								<td><a href="space_detail.do?space_no=${rl.space_no}">${rl.review_title}</a></td>
								<td>${rl.review_content}</td>
								<td>${rl.the_time}</td>
								<td>${rl.review_score}</td>
								<td><img src="img/${rl.review_img}" width="100px"
									class="space_no" abc="${rl.space_no}" /></td>
								<%-- <td><a href="admin_community_review_remove.do?review_no=${rl.review_no}&space_no=${rl.space_no}">삭제하기</a></td> --%>
								<td><button class="remove_review btn" review_no="${rl.review_no}" space_no="${rl.space_no}" >삭제하기</button></td>
							</tr>
						</jl:forEach>
					</table>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
<!-- 페이징 -->
	<div class="paginationdiv">
	<ul class="pagination pagination-sm">
		<jl:if test="${pz.hasPrevPagination }">
			<li><a class="page"
				href="admin_community_review_list.do?pg=${pz.paginationStart-1}">&lt;</a></li>
		</jl:if>
		<jl:if test="${pz.hasPrevPage }">
			<li><a class="page"
				href="admin_community_review_list.do?pg=${pz.curPagination-1 }">&lt;</a></li>
		</jl:if>
		<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }"
			step="1" varStatus="vs">
			<jl:choose>
				<jl:when test="${vs.index!=pz.curPagination }">
					<li><a class="page"
						href="admin_community_review_list.do?pg=${vs.index }">${vs.index }</a></li>
				</jl:when>
				<jl:otherwise>
					<li class="active"><a class="page"
						href="admin_community_review_list.do?pg=${vs.index }">${vs.index }</a></li>
				</jl:otherwise>
			</jl:choose>
		</jl:forEach>
		<jl:if test="${pz.hasNextPage }">
			<li><a class="page"
				href="admin_community_review_list.do?pg=${pz.curPagination+1}">&gt;</a></li>
		</jl:if>
		<jl:if test="${pz.hasNextPagination }">
			<li><a class="page"
				href="admin_community_review_list.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
		</jl:if>
	</ul>
	</div>

	<!-- 페이징 -->

<!-- 리뷰 삭제시의 모달 -->
<div id="text_modal" class="modal fade" role="dialog">
	<input type="hidden" id="review_No" value="0"/>
	<input type="hidden" id="space_No" value="0"/>
	
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