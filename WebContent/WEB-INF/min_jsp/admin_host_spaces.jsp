<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
table {
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>

</script>
</head>
<body>
<h1>판매자 유저 공간 상세 정보</h1>
	<table border="1">
		<tr>
			<td>판매자 이름</td>
			<td>${host_name}</td>
		</tr>
	</table>
	<br/>
	<br/>
		<table border="1">
		<tr>
			<td>사업자 등록 번호</td>
			<td>공간 이름</td>
			<td>공간 내용</td>
			<td>공간 썸브네일 이미지</td>
			<td>오픈 시간</td>
			<td>클로즈 시간</td>
			<td>가격</td>
			<td>최대 인원</td>
			<td>최소 인원</td>
			<td>공간 번호</td>
			<td>주소</td>
			<td>공간 카테고리</td>
			<td>장소 카테고리</td>
			<td>생성일</td>
		</tr>
		<jl:forEach var="vo" items="${ls}">
			<tr>
				<td>${vo.crn}</td>
				<td>${vo.space_title}</td>
				<td>${vo.space_content}</td>
				<td><a href="space_detail.do?space_no=${vo.space_no}"><img src="thumbnail/${vo.space_thumb_img}" style="width:128px;height:128px;"></img></a></td>
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
			</tr>
		</jl:forEach>
	</table>
	<br>
<br>
<form id="form_search" action="admin_host_spaces.do">
	<input type="hidden" name="pg" value="" id="pg">
	<input type="hidden" name="search_content" value="${search.search_content}">
	<input type="hidden" name="search_option" value="${search.search_option}">
	<input type="hidden" name="host_name" value="${host_name}">
	<input type="hidden" name="crn" value="${search.crn}">
</form>

<form id="textsearch" action="admin_host_spaces.do">
	<select name="search_option">
		<option value="0">선택해주세요</option>
		<option value="1">사업자 등록번호</option>
		<option value="2">공간 이름</option>
		<option value="3">공간 내용</option>
		<option value="4">오픈 시간</option>
		<option value="5">클로즈 시간</option>
		<option value="6">가격</option>
		<option value="7">최대 인원</option>
		<option value="8">최소 인원</option>
		<option value="9">공간 전화 번호</option>
		<option value="10">우편번호</option>
		<option value="11">공간 카테고리</option>
		<option value="12">장소 카테고리</option>
		<option value="13">생성일</option>
	</select>
	검색 : <input type="text" name="search_content">
	<input type="submit" value="검색">
</form>
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
</body>
</html>