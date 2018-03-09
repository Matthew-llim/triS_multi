<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
	$(document).ready(function(){

	});

</script>
</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>보낸 쪽지 보관함</h1>
	</div>
	<div class="container">
	<table border="1">
		<tr>
			<td>받은 유저 ID</td>
			<td>쪽지 내용</td>
			<td>작성 시간</td>
			<td>수신 확인</td>
		</tr>
		<jl:forEach var="vo" items="${ls}">
		<tr>
			<td>${vo.receive_user_id}</td>
			<td><textarea rows="10" cols="30">${vo.msg_content}</textarea></td>	
			<td>${vo.the_time }</td>
			<jl:choose>
				<jl:when test="${vo.view_count == 0}">
					<td>읽지 않음</td>
				</jl:when>
				<jl:when test="${vo.view_count >= 1}">
					<<td>읽음</td>
			</jl:when>
			</jl:choose>
		</tr>
		</jl:forEach>
	</table>
		
	</div>
	<br>
<br>
<form id="form_search" action="admin_message_read_to.do">
	<input type="hidden" name="pg" value="" id="pg">
	<input type="hidden" name="search_content" value="${search.search_content}">
	<input type="hidden" name="search_option" value="${search.search_option}">
</form>
<form id="textsearch" action="admin_message_read_to.do" method="post">
	<select name="search_option">
		<option value="0">선택해주세요</option>
		<option value="1">받은 유저 ID</option>
		<option value="2">쪽지 내용</option>
		<option value="3">작성 시간</option>
	</select>
	검색 : <input type="text" name="search_content">
	<input type="submit" value="검색">
</form>
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_message_read_to.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_message_read_to.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_message_read_to.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_message_read_to.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_message_read_to.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_message_read_to.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	
</body>
</html>