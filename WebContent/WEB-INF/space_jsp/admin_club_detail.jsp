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
.check {
	text-align: center;
}
.table_text_align{
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

<body>

	<br>
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">모임상세정보</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover table_text_align"
						id="dataTables-example">
						<thead>
							<tr>
								<td>모임 번호</td>
								<td>모임 이름</td>
								<td>모임장 유저 ID</td>
								<td>모임 제목</td>
								<td>모임 내용</td>
								<td>모임 이미지</td>
								<td>모임 최대 인원</td>
								<td>모임 생성일</td>
								<td>분야</td>
								<td>지역</td>
							</tr>
						</thead>
						<tr>
							<td>${vo.club_no}</td>
							<td>${vo.club_name}</td>
							<td>${vo.user_id}</td>
							<td>${vo.club_title}</td>
							<td>${vo.club_content}</td>
							<td><img src="club_img/${vo.club_thumb_img}"
								style="width: 128px; height: 128px;" /></td>
							<td>${vo.max_member}</td>
							<td>${vo.create_time}</td>
							<jl:choose>
									<jl:when test="${vo.c_category_no == 1}">
										<td>공부</td>
									</jl:when>
									<jl:when test="${vo.c_category_no == 2}">
										<td>회의</td>
									</jl:when>
									<jl:when test="${vo.c_category_no == 3}">
										<td>파티</td>
									</jl:when>
									<jl:when test="${vo.c_category_no == 4}">
										<td>레저</td>
									</jl:when>
									<jl:when test="${vo.c_category_no == 5}">
										<td>스포츠</td>
									</jl:when>
									<jl:when test="${vo.c_category_no == 6}">
										<td>기타</td>
									</jl:when>
							</jl:choose>
							<jl:choose>
									<jl:when test="${vo.l_category_no == 1}">
										<td>서울</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 2}">
										<td>경기</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 3}">
										<td>인천</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 4}">
										<td>강원</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 5}">
										<td>대전</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 6}">
										<td>세종</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 7}">
										<td>충남</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 8}">
										<td>충북</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 9}">
										<td>부산</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 10}">
										<td>울산</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 11}">
										<td>경남</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 12}">
										<td>경북</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 13}">
										<td>대구</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 14}">
										<td>광주</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 15}">
										<td>전남</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 16}">
										<td>전북</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 17}">
										<td>제주</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 18}">
										<td>전국</td>
									</jl:when>
							</jl:choose>
						</tr>
					</table>
					<br /> 
					<a href="club_detail.do?club_no=${vo.club_no}">해당 모임으로 가기</a> <br /> <br />
					
						<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
						<tr>
							<td>모임 회원 목록들</td>
						</tr>
						</thead>
						<jl:forEach var="ls" items="${ls}">
							<tr>
								<td>${ls.user_id}&nbsp;
								<a href="admin_host_user_check.do?user_id=${ls.user_id}">유저 정보 확인하기</a></td>
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

	
	<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>
</body>
</html>