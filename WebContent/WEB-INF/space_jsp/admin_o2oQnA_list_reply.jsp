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
p{
text-align: center;
}
.paginationdiv {
	text-align: right;
}
.select {
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
</head>
<script>
	$(document).ready(function() {
		$("#cancel").on("click", function() {
			document.frm.method = "POST";
			document.frm.action = "admin_o2oQnA.do";
			document.frm.submit();
		});
	});
</script>
</head>
<body>
	<br />


	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"> 일대일 답변 리스트
			
			<form id="form_search" action="admin_o2oQnA_list_reply.do">
		<input type="hidden" name="pg" value="" id="pg"> <input
			type="hidden" name="search_content" value="${search.search_content}">
		<input type="hidden" name="search_option"
			value="${search.search_option}">
	</form>
	<form id="textsearch" action="admin_o2oQnA_list_reply.do">
		<div class="select">
		<select name="search_option" class="form-control" style="width: 200px;">
			<option value="0">선택해주세요</option>
			<option value="1">제목</option>
			<option value="2">내용</option>
			<option value="3">제목 + 내용</option>
			<option value="4">고객님 이메일</option>
			<option value="5">문의 타입</option>
			<option value="6">전화 번호</option>
			<option value="7">문의 시간</option>
			<option value="8">답변 내용</option>
		</select>
		</div>
		<div class="select">
		 <input type="text" name="search_content" class="form-control" style="width: 300px;"> 
		 </div>
		 <input	type="submit" class="btn" value="검색">
	</form>
			</div>
		
			<div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
					<thead>
						<tr>
							<td>문의 제목</td>
							<td>고객 이메일</td>
							<td>고객 전화번호</td>
							<td>고객 문의 타입</td>
							<td>고객 문의 시간</td>
							<td>운영진 답변 내용</td>
						</tr>
					</thead>
					<jl:forEach var="vo" items="${ls}">
						<tr>
							<td>${vo.o2o_title}</td>
							<td>${vo.o2o_email}</td>
							<td>${vo.o2o_phone}</td>
							<td>${vo.o2o_type}</td>
							<td>${vo.the_time}</td>
							<td>${vo.re_o2o_content}</td>
						</tr>
					</jl:forEach>
				</table>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>

	<br>
	<br>
	
<!-- 페이징 -->	
	<div class="paginationdiv">
	<ul class="pagination pagination-sm">
		<jl:if test="${pz.hasPrevPagination }">
			<li><a class="page"
				href="admin_o2oQnA_list_reply.do?pg=${pz.paginationStart-1}">&lt;</a></li>
		</jl:if>
		<jl:if test="${pz.hasPrevPage }">
			<li><a class="page"
				href="admin_o2oQnA_list_reply.do?pg=${pz.curPagination-1 }">&lt;</a></li>
		</jl:if>
		<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }"
			step="1" varStatus="vs">
			<jl:choose>
				<jl:when test="${vs.index!=pz.curPagination }">
					<li><a class="page"
						href="admin_o2oQnA_list_reply.do?pg=${vs.index }">${vs.index }</a></li>
				</jl:when>
				<jl:otherwise>
					<li class="active"><a class="page"
						href="admin_o2oQnA_list_reply.do?pg=${vs.index }">${vs.index }</a></li>
				</jl:otherwise>
			</jl:choose>
		</jl:forEach>
		<jl:if test="${pz.hasNextPage }">
			<li><a class="page"
				href="admin_o2oQnA_list_reply.do?pg=${pz.curPagination+1}">&gt;</a></li>
		</jl:if>
		<jl:if test="${pz.hasNextPagination }">
			<li><a class="page"
				href="admin_o2oQnA_list_reply.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
		</jl:if>
	</ul>
	</div>
<!-- 페이징 -->		
</body>
</html>