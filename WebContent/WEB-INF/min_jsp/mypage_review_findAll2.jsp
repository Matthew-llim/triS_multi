<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
	
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="common.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".space_no").on("click",function(){
			var temp = $(this).attr("abc");
			window.parent.location.href="space_detail.do?space_no="+temp;
		});
	});
</script>
</head>
<body>
	<form name="frm">
	<h3>Review</h3>
	<table border="1" cellspacing="1" cellpadding="1">
		<tr>
			<th>리뷰번호</th>
			<th>방번호</th>
			<th>아이디</th>
			<th>제목</th>
			<th>내용</th>
			<th>시간</th>
			<th>별점</th>
			<th>이미지</th>
		</tr>
		<jl:forEach items="${rl}" var="rl">
			<tr>
				<td>${rl.review_no}</td>
				<td>${rl.space_no}</td>
				<td>${rl.user_id}</td>
				<td>${rl.review_title}</td>
				<td>${rl.review_content}</td>
				<td>${rl.the_time}</td>
				<td>${rl.review_score}</td>
				<td><img src="thumbnail/${rl.review_img}" width="100px" class="space_no" abc="${rl.space_no}"/></td>
			</tr>
		</jl:forEach>
	</table>
	</form>
	
		<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="mypage_review_findAll.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="mypage_review_findAll.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="mypage_review_findAll.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="mypage_review_findAll.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="mypage_review_findAll.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="mypage_review_findAll.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	

</body>
</html>