<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
		
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="common.js" type="text/javascript"></script>
	<link rel="stylesheet" href="http://70.12.113.229:8088/msspace_01/mypage_css/Myclub.css">
	<script type="text/javascript">
	$(document).ready(function(){
		$(".thumb_img").on("click",function(){
			var club_no = $(this).attr("abc");
			window.parent.location.href="club_community.do?club_no="+club_no;
		});
	});
</script>
</head>
<body>
	<form id="form_search" action="myclub_findAll.do">
		<input type="hidden" name="pg" value="" id="pg">
	</form>
	<form name="frm">
	<h3>Myclub</h3>
	<table>
		<tr>
			<th width="13%">클럽이름</th>
			<th width="12%">글제목</th>
			<th width="50%">내용</th>
			<th width="13%">이미지</th>
			<th width="12%">최대인원</th>
		</tr>
		<jl:forEach items="${rl}" var="rl">
			<tr>
				<td>${rl.club_name}</td>
				<td>${rl.club_title}</td>
				<td>${rl.club_content}</td>
				<td><a href="club_community.do?club_no=${rl.club_no}"><img src="club_img/${rl.club_thumb_img}" width="80px" height="100px" class="thumb_img" abc="${rl.club_no}" onerror="this.src='img/no_img.jpg'"/></a></td>
				<td>${rl.max_member}${rl.club_thumb_img}</td>
			</tr>
			
			
			
		</jl:forEach>
	</table>
	</form>
	
		<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="myclub_findAll.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="myclub_findAll.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="myclub_findAll.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="myclub_findAll.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="myclub_findAll.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="myclub_findAll.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
</body>
</html>