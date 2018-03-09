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

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">공간리스트<br></div><!-- /.panel-heading -->

			<div class="col-lg-6">
					<br>
					<div class="select">
						<form id="textsearch" action="admin_spaces_search.do">
							<div class="select1">
								<select name="search_option" class="form-control">
									<option value="0">선택</option>
									<option value="1">사업자 등록번호</option>
									<option value="2">공간 이름</option>
									<option value="3">공간 내용</option>
									<option value="4">오픈 시간</option>
									<option value="5">클로즈 시간</option>
									<option value="6">가격</option>
									<option value="7">최대 인원</option>
									<option value="8">최소 인원</option>
									<option value="9">공간 전화 번호</option>
									<option value="10">주소</option>
									<option value="11">공간 카테고리</option>
									<option value="12">장소 카테고리</option>
									<option value="13">생성일</option>
								</select>
							</div>

							<div class="select2">
								<input class="form-control" type="text" name="search_content">
							</div>

							<div class="select3">
								<input class="btn" type="submit" value="검색">
							</div>
						</form>

					</div>
				</div>


			<div class="panel-body">
				<br> <br> <br>
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th>사업자 등록 번호</th>
							<th>공간 이름</th>
							<th>공간 내용</th>
							<th>공간 썸브네일 이미지</th>
							<th>오픈 시간</th>
							<th>클로즈 시간</th>
							<th>가격</th>
							<th>최대 인원</th>
							<th>최소 인원</th>
							<th>공간 번호</th>
							<th>주소</th>
							<th>공간 카테고리</th>
							<th>장소 카테고리</th>
							<th>생성일</th>
							<th>삭제하기</th>
						</tr>
					</thead>
					<jl:forEach var="vo" items="${ls}">
						<tr>
							<td><a href="admin_space_crn_check.do?crn=${vo.crn}">${vo.crn}</a></td>
							<td>${vo.space_title}</td>
							<td>${vo.space_content}</td>
							<td><a href="space_detail.do?space_no=${vo.space_no}"><img
									src="space_img/${vo.space_thumb_img}"
									style="width: 128px; height: 128px;"></img></a></td>
							<td>${vo.open_time}</td>
							<td>${vo.close_time}</td>
							<td>${vo.price}</td>
							<td>${vo.max_people}</td>
							<td>${vo.min_people}</td>
							<td>${vo.space_call}</td>
							<td>${vo.zipcode}</td>
							<td>${vo.s_category_no}</td>
							<td>${vo.l_category_no}</td>
							<td>${vo.the_time}</td>
							<td><a href="admin_space_remove.do?space_no=${vo.space_no}">삭제</a></td>
						</tr>
					</jl:forEach>
				</table>
				<!-- /.table-responsive -->
                    </div>
                      		  <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
</div>
<div class="paginationdiv">
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_host_spaces.do?pg=${pz.paginationStart-1}&crn=${search.crn}&host_name=${host_name}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_host_spaces.do?pg=${pz.curPagination-1 }&crn=${search.crn}&host_name=${host_name}">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_host_spaces.do?pg=${vs.index }&crn=${search.crn}&host_name=${host_name}">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_host_spaces.do?pg=${vs.index }&crn=${search.crn}&host_name=${host_name}">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_host_spaces.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_host_spaces.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>        
</div>

</body>
</html>