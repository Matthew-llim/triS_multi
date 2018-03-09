<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	
<script type="text/javascript" src="./Resources/js/jquery.js"></script>
<script type="text/javascript" src="./Resources/js/main.js"></script>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./common.js"></script>
</head>
<body>
	<div style="width: 1000px; margin: 20px;">
		<ul class="club_img_ul">
			<jl:forEach  var="pvo" items="${map.vo}" varStatus="vs">
				<li onclick="parent.location.href='club_detail.do?club_no=${pvo.club_no}'">
					<img src="club_img/${pvo.club_thumb_img }" class="img_ul" onerror="this.src='img/no_img.jpg'">
					<h3>${pvo.club_name}</h3>
					<p class="li_p">${pvo.club_title}</p>
					<button class="btn btn-default category" disabled="disabled">#${pvo.l_category_name}</button>
					<button class="btn btn-default category" disabled="disabled">#${pvo.c_category_name }</button>
					<button class="btn btn-default category" disabled="disabled">#${pvo.user_count}/${pvo.max_member}명</button>
				</li>
			</jl:forEach>
		</ul>
	</div>
	
	<div class="page_r">
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
	<div align="right">
		<button id="btn" class="btn_square" type="button" style="display: none">모임등록</button>
	</div>
	<!-- 자바스크립트 -->
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btn").on("click",function(){
				parent.location.href="club_add_page.do";
			});
			if('${map.user_id}'!=''){
				$("#btn").attr("style","display:inline;");
			}
		});
		function list(page){
			parent.setCurpage(page);
			
		}
	</script>
</body>
</html>