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
$(document).ready(function(){ 
	// 클럽 삭제 모달 부분
	$(".remove_club").on("click",function(){
		$("#club_No").val( $(this).attr("club_no") );
		
		$("#text_modal").modal("show");
	});
	//yes버튼 클릭 했을 때 실행할 function
	$("#text_modal_yes").on("click",function(){
		var del_club_no = $("#club_No").val();
			location.href = "admin_club_remove.do?club_no=" + 
			del_club_no;
		$("#text_modal_modal").modal("hide");
	});
	//no버튼 클릭 했을 때 실행할 function
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});

});
</script>
</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>모임 리스트</h1>
	</div>
	<br>
	<br>
	<form id="textsearch" action="admin_clubs.do" method="post">
		<select name="search_option">
			<option value="0">검색할 것을 선택해주세요</option>
			<option value="1">모임 이름</option>
			<option value="2">모임장 유저 ID</option>
			<option value="3">모임 최대 인원</option>
			<option value="4">모임 생성 날짜 시간</option>
		</select>
		&nbsp;<input type="text" name="search_content">
		<input type="submit" value="검색">
	</form>
	<br>
	<br>
	<table border="1">
		<tr>
			<td>모임 이름</td>
			<td>모임장 유저 ID</td>
			<td>모임 이미지</td>
			<td>모임 최대 인원</td>
			<td>모임 생성 날짜/시간</td>
			<td>모임 삭제 하기</td>
		</tr>
		<jl:forEach var="vo" items="${ls}">
			<tr>
				<td ><a href="admin_club_detail.do?club_no=${vo.club_no}">${vo.club_name}</a></td>
				<td>${vo.user_id}</td>
				<td><img src="club_thumb_images/${vo.club_thumb_img}" style="width:128px;height:128px;"/></td>
				<td>${vo.max_member}</td>
				<td>${vo.create_time}</td>
				<%-- <td><a href="admin_club_remove.do?club_no=${vo.club_no}">삭제</a></td> --%>
				<td><button class="remove_club" club_no="${vo.club_no}" >삭제하기</button></td>
			</tr>
		</jl:forEach>
	</table>
	
<form id="form_search" action="admin_clubs.do" method="post">
	<input type="hidden" name="pg" value="" id="pg">
	<input type="hidden" name="search_content" value="${search.search_content}">
	<input type="hidden" name="search_option" value="${search.search_option}">
</form>
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_clubs.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_clubs.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_clubs.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_clubs.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_clubs.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_clubs.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
		
		
<!-- 클럽 삭제 모달 폼 -->
<div id="text_modal" class="modal fade" role="dialog">
	<input type="hidden" id="club_No" value="0"/>
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="text_mohead" class="modal-header"align="center"><h4>글 삭제</h4></div>
			<div id="text_mobody" class="modal-body" align="center">
				<h4>글을 삭제 하시겠습니까?</h4>
			</div>
			<div id="text_ft" class="modal-footer">
				<button type='button' class='btn btn-default' 
					to-delete="delete_${vs.count}"  id='text_modal_yes'>확인</button>
				<button type='button' class='btn btn-primary' id='text_modal_no'>취소</button>
			</div>
		</div>
	</div>
</div>
		
</body>
</html>