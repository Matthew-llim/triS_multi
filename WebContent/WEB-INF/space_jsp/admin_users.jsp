<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
.paginationdiv{
text-align: center;
}
.select {
	float: left;
	padding-right: 5px;
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<!-- Bootstrap Core CSS -->
    <link href="./Resouces_admin/vendor/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<br>
<a href="admin_user_del_write_list.do">탈퇴 시킨 유저 리스트 보기(판매자 포함)</a>
<br>
<br>

  			<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            유저 리스트
                            <form id="textsearch" action="admin_users_search.do" method="post">
                            <div class="select">
                            
								<select name="search_option"  class="form-control" style="width: 200px;">
									<option value="0">선택해주세요</option>
									<option value="1">이름</option>
									<option value="2">유저 ID</option>
									<option value="3">닉네임</option>
									<option value="4">성별</option>
									<option value="5">이메일</option>
									<option value="6">우편 번호</option>
									<option value="7">상세 주소</option>
								</select>
						
								</div>
								<div class="select">
									<input type="text" name="search_content" class="form-control" style="width: 300px;" >
								</div>
								<input type="submit" class="btn" value="검색" >
							</form>
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>이름</th>
                                        <th>사용자 아이디</th>
                                        <th>이메일</th>
                                        <th>탈퇴시키기</th>
                                    </tr>
                                </thead>
								
								<jl:forEach var="vo" items="${ls}">
									<tr>
										<td>${vo.user_name}</td>
										<td><a href="admin_user_check.do?user_id=${vo.user_id}">${vo.user_id}</a></td>
										<td>${vo.email}</td>
										<%-- <td><a href="admin_user_del_write.do?user_id=${vo.user_id}&user_name=${vo.user_name}&email=${vo.email}">탈퇴
												시키기</a></td> --%>
										<td>
											<form method="post" action="admin_user_del_write.do">
												<input type="hidden" name="user_id" value="${vo.user_id}"/>
												<input type="hidden" name="user_name" value="${vo.user_name}"/>
												<input type="hidden" name="email" value="${vo.email}"/>
												<button type="submit" >탈퇴 시키기</button>
											</form>
										</td>
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

<!-- 페이징 -->
<br>
<br>
<!-- <form id="textsearch" action="admin_users_search.do" method="post">
	<select name="search_option">
		<option value="0">선택해주세요</option>
		<option value="1">이름</option>
		<option value="2">유저 ID</option>
		<option value="3">닉네임</option>
		<option value="4">성별</option>
		<option value="5">이메일</option>
		<option value="6">우편 번호</option>
		<option value="7">상세 주소</option>
	</select>
	검색 : <input type="text" name="search_content">
	<input type="submit" value="검색">
</form> -->
<div class="paginationdiv">
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_users_search.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_users_search.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_users_search.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_users_search.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_users_search.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_users_search.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	</div>
<!-- 페이징 -->
</body>
</html>