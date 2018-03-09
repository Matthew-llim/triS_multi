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

.tabletitle{
	width: 500px;
	text-align:  center;
}

td,th{
text-align:  center;
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
<body>
	<br>

	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				Q&A게시판
				<form id="form_search" action="admin_community_qna_list.do">
					<input type="hidden" name="pg" value="" id="pg"> 
					<input type="hidden" name="search_content" value="${search.search_content}"> 
					<input type="hidden" name="search_option" value="${search.search_option}">
				</form>
				<form id="textsearch" action="admin_community_qna_list.do">
					<div class="select2">
					<select name="search_option" class="form-control" style="width: 200px;">
						<option value="0">선택</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
						<option value="3">제목 + 내용</option>
						<option value="4">작성자</option>
					</select> 
					</div>
					<div class="select2">
					<input type="text" name="search_content" class="form-control" style="width: 300px;"> 
					</div>
					<div class="select2">
					<input type="submit" class="btn" value="검색"> 
					</div>
				</form>
				
				<form action="admin_community_qna_add.do" method="post">
				
					<input type="submit" value="글쓰기" class="btn"
						type="button" />
				</form>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				 <div class="table-responsive">
                                <table class="table table-hover">
						<thead>
							<tr>
								<th>NO</th>
								<th class="tabletitle">TITLE</th>
								<th>ID</th>
								<th>VIEW</th>
						
								<th>TIME</th>
							</tr>
							<jl:forEach var="vo" items="${rl}">
								<tr>
									<td>${vo.com_qna_no}</td>
								
									<td><a
										href="admin_community_qna_read.do?com_qna_no=${vo.com_qna_no}">${vo.com_qna_title}</a></td>
										<td>${vo.user_id}</td>
									<td>${vo.view_count}</td>
									<td>${vo.the_time}</td>
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
					href="admin_community_qna_list.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
			<jl:if test="${pz.hasPrevPage }">
				<li><a class="page"
					href="admin_community_qna_list.do?pg=${pz.curPagination-1 }">&lt;</a></li>
			</jl:if>
			<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }"
				step="1" varStatus="vs">
				<jl:choose>
					<jl:when test="${vs.index!=pz.curPagination }">
						<li><a class="page"
							href="admin_community_qna_list.do?pg=${vs.index }">${vs.index }</a></li>
					</jl:when>
					<jl:otherwise>
						<li class="active"><a class="page"
							href="admin_community_qna_list.do?pg=${vs.index }">${vs.index }</a></li>
					</jl:otherwise>
				</jl:choose>
			</jl:forEach>
			<jl:if test="${pz.hasNextPage }">
				<li><a class="page"
					href="admin_community_qna_list.do?pg=${pz.curPagination+1}">&gt;</a></li>
			</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page"
					href="admin_community_qna_list.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	</div>
	<!-- 페이징 -->

</body>
</html>