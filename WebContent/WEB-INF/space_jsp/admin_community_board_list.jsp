<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">

.ad_com_bor_list_paginationdiv {
	text-align: center;
}

.select2 {
	float: left;
	padding-right: 5px;
}

.commask {
	float: left;
	text-align: center;
	padding-left: 10px;

}
.tabletitle{
	width: 500px;
	text-align:  center;
}

.ad_com_bor_table td, .ad_com_bor_table th{
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
</head>
<body>
	<br>

		<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
					자유게시판
				
				<form id="form_search" action="admin_community_board_list.do" method="post">
					<input type="hidden" name="pg" value="" id="pg">
					<input type="hidden" name="search_content" value="${search.search_content}">
					<input type="hidden" name="search_option" value="${search.search_option}">
				</form>
					
					<form id="textsearch" action="admin_community_board_search.do">
						<div class="select2">
							<select name="commsearch_option" class="form-control"
								style="width: 200px;">
								<option value="0">선택해주세요</option>
								<option value="1">제목</option>
								<option value="2">내용</option>
								<option value="3">제목 + 내용</option>
								<option value="4">작성자</option>
							</select>
						</div>

						<div class="select2">
							<input type="text" name="commsearch_content" class="form-control"
								style="width: 300px;">
						</div>
						
						<div class="select2">
						<input class="btn" type="submit" value="검색">
						</div>						
					</form>
				
						<a href="admin_community_board_add.do"> <input class="btn"
							type="button" value="글쓰기">
						</a>
			
				
					
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
				  <div class="table-responsive">
                                <table class="table table-hover ad_com_bor_table">
					<!-- <table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example"> -->
						<thead>
							<tr>
								<th>NO</th>
								<th class="tabletitle">TITLE</th>
								<th>ID</th>
								<th>VIEW</th>
						
								<th>TIME</th>
							</tr>
						</thead>
						<jl:forEach var="vo" items="${rl}">
							<tr>
								<td>${vo.com_board_no}</td>
								<td><a
									href="admin_community_board_read.do?com_board_no=${vo.com_board_no}">${vo.com_board_title}</a></td>
								<td>${vo.user_id}</td>
								<td>${vo.view_count}</td>
							
								<td>${vo.the_time}</td>
							</tr>

						</jl:forEach>
					</table>


					<!-- /.table-responsive -->
<!-- 					<div class="commask">
						<a href="admin_community_board_add.do"> 
						<input class="btn" type="button" value="글쓰기">
						</a>
					</div> -->

				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>


	<div class="ad_com_bor_list_paginationdiv">
		<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page"
					href="admin_community_board_list.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
			<jl:if test="${pz.hasPrevPage }">
				<li><a class="page"
					href="admin_community_board_list.do?pg=${pz.curPagination-1 }">&lt;</a></li>
			</jl:if>
			<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }"
				step="1" varStatus="vs">
				<jl:choose>
					<jl:when test="${vs.index!=pz.curPagination }">
						<li><a class="page"
							href="admin_community_board_list.do?pg=${vs.index }">${vs.index }</a></li>
					</jl:when>
					<jl:otherwise>
						<li class="active"><a class="page"
							href="admin_community_board_list.do?pg=${vs.index }">${vs.index }</a></li>
					</jl:otherwise>
				</jl:choose>
			</jl:forEach>
			<jl:if test="${pz.hasNextPage }">
				<li><a class="page"
					href="admin_community_board_list.do?pg=${pz.curPagination+1}">&gt;</a></li>
			</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page"
					href="admin_community_board_list.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	</div>

</body>
</html>