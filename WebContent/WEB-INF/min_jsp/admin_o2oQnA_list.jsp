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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script>
	$(document).ready(function(){
		$("#cancel").on("click",function(){
			document.frm.method="POST";
			document.frm.action="admin_o2oQnA.do";
			document.frm.submit();
		});
		$("#cancels").on("click",function(){
			document.frm.method="POST";
			document.frm.action="admin_o2oQnA.do";
			document.frm.submit();
		});
	});

</script>
</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>1:1 문의내용들</h1>
	</div>
	<table border="1">
		<tr>
			<td>제목</td>
			<td>고객님 이메일</td>
			<td>문의 타입</td>
			<td>문의 시간</td>
			<td>답변 내용</td>
		</tr>
		<jl:forEach var="vo" items="${ls}">
		<tr>
			<td><a href="admin_o2oQnA_read.do?o2o_no=${vo.o2o_no}">${vo.o2o_title}</a></td>
			<td>${vo.o2o_email}</td>
			<td>${vo.o2o_type}</td>
			<td>${vo.the_time}</td>
			<td>없음</td>
		</tr>
		</jl:forEach>
	</table>
	<br>
<br>
<form id="form_search" action="admin_o2oQnA_list.do">
	<input type="hidden" name="pg" value="" id="pg">
	<input type="hidden" name="search_content" value="${search.search_content}">
	<input type="hidden" name="search_option" value="${search.search_option}">
</form>
<form id="textsearch" action="admin_o2oQnA_list.do" method="post">
	<select name="search_option">
		<option value="0">선택해주세요</option>
		<option value="1">제목</option>
		<option value="2">내용</option>
		<option value="3">제목 + 내용</option>
		<option value="4">고객님 이메일</option>
		<option value="5">문의 타입</option>
		<option value="6">전화 번호</option>
		<option value="7">문의 시간</option>
	</select>
	검색 : <input type="text" name="search_content">
	<input type="submit" value="검색">
</form>
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_o2oQnA_list.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_o2oQnA_list.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_o2oQnA_list.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_o2oQnA_list.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_o2oQnA_list.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_o2oQnA_list.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
</body>
</html>