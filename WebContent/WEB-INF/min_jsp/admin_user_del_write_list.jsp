<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

.form-group {
	text-align: center;
}

.jumbotron {
	text-align: center;
}

.btn {
	text-align: center;
}


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script>


</script>
</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>탈퇴 시킨 유저 리스트 보기(판매자 포함)</h1>
	</div>
	
	<table border="1">
		<tr>
			<td>번호</td>
			<td>유저 ID</td>
			<td>유저 이름</td>
			<td>이메일</td>
			<td>작성 메일 제목</td>
			<td>작성 메일 내용</td>
			<td>작성 메일 시간</td>
		</tr>
		<jl:forEach var="vo" items="${ls}">
			<tr>
				<td>${vo.writing_no}</td>
				<td>${vo.user_id}</td>
				<td>${vo.user_name}</td>
				<td>${vo.email}</td>
				<td>${vo.subject}</td>
				<td>${vo.mail_content}</td>
				<td>${vo.the_time}</td>
			</tr>
		</jl:forEach>
	</table>
	
<form id="form_search" action="admin_user_del_write_list.do">
	<input type="hidden" name="pg" value="" id="pg">
</form>
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_user_del_write_list.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_user_del_write_list.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_user_del_write_list.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_user_del_write_list.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_user_del_write_list.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_user_del_write_list.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
</body>
</html>