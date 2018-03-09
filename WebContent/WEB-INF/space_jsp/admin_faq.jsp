<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html> 
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="./Resources/css/bootstrap.css">
<style type="text/css">
.paginationdiv {
	text-align: center;
}

.select1 {
	float: left;
	padding : 15px;
}

.select2 {
	float: left;
	padding-left : 5px;
	padding-right : 5px;
}

.select3 {
	float: left;
	padding : 8px;
}

.btnheart{
	float: left;
	
}

p{
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
	// FAQ 삭제 시 모달
	$(".remove_faq").on("click",function(){
		$("#faq_No").val( $(this).attr("faq_no") );
		
		$("#text_modal").modal("show");
	});
	$("#text_modal_yes").on("click",function(){
		var del_faq_no = $("#faq_No").val();
			location.href = "admin_faq_remove.do?faq_no=" + 
			del_faq_no;
		$("#text_modal_modal").modal("hide");
	});
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});

});
</script>
</head>
<body>
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading" style="text-align:center;"><b>FAQ</b><br></div><!-- /.panel-heading -->
			<form id="form_search" action="admin_faq.do" method="post">
				<input type="hidden" name="pg" value="" id="pg">
				<input type="hidden" name="search_content" value="${search.search_content}">
				<input type="hidden" name="search_option" value="${search.search_option}">
			</form>
			
			<form id="textsearch" action="admin_faq.do" method="post">
				<div class="select2">
					<select name="search_option" class="form-control">
						<option value="0">선택해주세요</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
						<option value="3">제목 + 내용</option>
					</select>
				</div>
			<div class="select2">
				<input type="text" name="search_content" class="form-control" style="width: 300px;">
						</div>
					<div class="select2">
						<input class="btn" type="submit" value="검색">
					</div>						
				</form>
				&nbsp;&nbsp;
				<a href="admin_faq_add.do"> 
					<input class="btn" type="button" value="FAQ 작성">
				</a>
			</div>
			<!-- /.panel-heading -->
				<div class="panel-body">
				  <div class="table-responsive">
				  	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
						<jl:forEach var="vo" items="${rl}" varStatus="vs">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#${vo.faq_no}" aria-expanded="true"
											aria-controls="collapseOne">${vo.faq_no} . ${vo.faq_title} </a>
									</h4>
								</div>
								<div id="${vo.faq_no}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">${vo.faq_content}</div>
						
								<form method="post" action="admin_faq_read.do" name="frm" >
									<input type="hidden" name="faq_no" value="${vo.faq_no}" />
									<input type="hidden" name="faq_title" value="${vo.faq_title}" />
									<input type="hidden" name="faq_content" value="${vo.faq_content}" />
									<button type="submit">수정 하기</button>&nbsp;&nbsp;&nbsp;
									<input type="button"  class="remove_faq" faq_no="${vo.faq_no}" value="삭제 하기"/>
								</form>
								<br>
								</div>
							</div>
							</jl:forEach>
						</div>
                   </div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->

	
<br>
<br>

<div class="paginationdiv">
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_faq.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_faq.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_faq.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_faq.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_faq.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_faq.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
</div>
<!-- FAQ 삭제 시 모달 -->
<div id="text_modal" class="modal fade" role="dialog">
	<input type="hidden" id="faq_No" value="0"/>
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