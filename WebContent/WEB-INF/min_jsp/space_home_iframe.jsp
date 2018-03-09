<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script>
	$(document).ready(function(){
		$(".page").on("click",function(){
			var href = $(this).attr("hrefd");
			$("#form_search").attr("action",href);
			$("#pg").val($(this).attr("pg"));
			$("#form_search").submit();
		});
		
	});
 </script>

</head>
<body>
		<form id="form_search" action="">
			<input type="hidden" name="pg" value="" id="pg">
			<input type="hidden" name="s_category_no" value="${search.s_category_no }">
			<input type="hidden" name="l_category_no" value="${search.l_category_no }">
			<input type="hidden" name="search_content" value="${search.search_content }">
			<input type="hidden" name="search_option" value="${search.search_option }">
		</form>
		
		<table border="1">
		<jl:forEach var="vo" items="${list2 }">
			<tr>
				<td><p onclick="parent.location.href='space_detail.do?space_no=${vo.space_no }'"><img src="image/${vo.space_thumb_img }" alt="공간 사진 없음" width="100" height="130"/></p></td>
				<td>${vo.space_no }</td>
				<td>${vo.space_title }</td>
				<td>${vo.space_content }</td>
			</tr>
		</jl:forEach>
		
		</table>
		
		<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" hrefd="space_home_iframe.do" pg="${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" hrefd="space_home_iframe.do" pg="${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" hrefd="space_home_iframe.do" pg="${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" hrefd="space_home_iframe.do" pg="${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" hrefd="space_home_iframe.do" pg="${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" hrefd="space_home_iframe.do" pg="${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
</body>
</html>