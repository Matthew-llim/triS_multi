<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		table, tr, td{
			border: 1px solid;
		}
	</style>
</head>
<body>
	<div class="container">
		<table style="width: 1000px">
			<tr>
				<td>번호</td>
				<td>제목</td>
			</tr>
			<jl:forEach  var="pvo" items="${map.vo}" varStatus="vs">
				<tr>
					<td id="no" align="center">${vs.count }</td>
					<td><p onclick="parent.location.href='club_detail.do?club_no=${pvo.club_no}'">${pvo.club_title}</td>
				</tr>
			</jl:forEach>
		</table>
		<div align="center">
			<ul class="pagination pagination-sm">
				<!-- 이전 페이지로 이동 : 10페이지 이전으로(블록 이동) -->
				<jl:if test="${map.pz.hasPrevPagination }">
					<li><a class="page" href="javascript:list('${map.pz.paginationStart-1}')">&lt;</a></li>
				</jl:if>
				<!-- 이전 페이지로 이동 : 한페이지 이전으로 -->
				<jl:if test="${map.pz.hasPrevPage }">
					<li><a class="page" href="javascript:list('${map.pz.curPagination-1 }')">&lt;</a></li>
				</jl:if>
					<!-- 페이지 번호 만들기 -->
					<jl:forEach begin="${map.pz.paginationStart }" end="${map.pz.paginationEnd }" step="1" varStatus="vs">
						<jl:choose>
							<jl:when test="${vs.index!=map.pz.curPagination }">
								<li><a class="page" href="javascript:list('${vs.index }')">${vs.index }</a></li>
							</jl:when>
							<jl:otherwise>
								<li class="active"><a class="page" href="javascript:list('${vs.index }')">${vs.index }</a></li>
							</jl:otherwise>
						</jl:choose>
					</jl:forEach>
				<!-- 다음 페이지로 이동 : 한페이지 이동 -->
				<jl:if test="${map.pz.hasNextPage }">
					<li><a class="page" href="javascript:list('${map.pz.curPagination+1}')">&gt;</a></li>
				</jl:if>
				<!-- 다음 페이지로 이동 : 10페이지 이후로(블록 이동) -->
				<jl:if test="${map.pz.hasNextPagination }">
					<li><a class="page" href="javascript:list('${map.pz.paginationEnd+1 }')">&gt;&gt;</a></li>
				</jl:if>
			</ul>
		</div>
	</div>
	
	<!-- 자바스크립트 -->
	<script type="text/javascript">

		function list(page){
			parent.setCurpage(page);
		}
	</script>
</body>
</html>