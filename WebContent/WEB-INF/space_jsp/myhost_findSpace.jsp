<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script type="text/javascript" src="common.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<style type="text/css">
			@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
		</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="http://70.12.113.229:8088/msspace_01/mypage_css/Myclub.css">
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
	<form action="myhost_addForm.do" method="POST">
		<input type="submit" value="사업자추가등록" class="btn"/>
		<input type="hidden" name="user_id" value="${user_id}"/>
	</form>

	<form name="frm">
	<table>
		<jl:forEach var="ab" items="${rl}" >
			<tr>
				<td>${ab.space_no}</td>
				<td>
				<a href="space_detail.do?space_no=${ab.space_no}" target="_parent">
				<img src="space_img/${ab.space_thumb_img}" width="100px" class="space_no" abc="${ab.space_no}"  onerror="this.src='defualt/defualt.jpg'"/></a></td>
				<td>${ab.space_title}</td>
				<td>${ab.crn}</td>
			</tr>
		</jl:forEach>
	</table>
	</form>
	
	
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="myhost_findAll.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="myhost_findAll.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="myhost_findAll.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="myhost_findAll.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="myhost_findAll.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="myhost_findAll.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	
	
</body>
</html>