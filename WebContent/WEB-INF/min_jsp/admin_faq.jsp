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

.jumbotron {
	background-color: orange;
}

.FAQ {
	color: white;
	text-align: center;
}

.table {
	text-align: center;
	border-color: center;
}

.ask {
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	// FAQ 삭제 시 모달
	$(".remove_faq").on("click",function(){
		$("#faq_No").val( $(this).attr("faq_no") );
		
		$("#text_modal").modal("show");
	});
	$("#text_modal_yes").on("click",function(){
		var del_faq_no = $("#faq_No").val();
			location.href = "admin_faq_remove.do?faq_no=" + 
			del_faq_no;
		$("#text_modal_modal").modal("hide");
	});
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});

});
</script>
</head>
<body>

	<div class="jumbotron">
		<div class="FAQ">
			<h1>F A Q</h1>
		</div>
	</div>

	<div class="container">
		<h2>FAQ Board</h2>
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<jl:forEach var="vo" items="${rl}" varStatus="vs">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#${vo.faq_no}" aria-expanded="true"
								aria-controls="collapseOne">${vo.faq_no} . ${vo.faq_title} </a>
						</h4>
					</div>
					<div id="${vo.faq_no}" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">${vo.faq_content}</div>
						
						<form method="post" action="admin_faq_read.do" name="frm" >
							<input type="hidden" name="faq_no" value="${vo.faq_no}" />
							<input type="hidden" name="faq_title" value="${vo.faq_title}" />
							<input type="hidden" name="faq_content" value="${vo.faq_content}" />
							<button type="submit">수정 하기</button>&nbsp;&nbsp;&nbsp;
							<input type="button"  class="remove_faq" faq_no="${vo.faq_no}" value="삭제 하기"/>
						</form>
						<br>
						
					</div>
				</div>
			</jl:forEach>
		</div>

		<div class="write">
			<a href="admin_faq_add.do">
				<input class="btn btn-success" type="button" value="write FAQ">
			</a>
		</div>
		
	</div>
	
<br>
<br>
<form id="form_search" action="admin_faq.do">
	<input type="hidden" name="pg" value="" id="pg">
	<input type="hidden" name="search_content" value="${search.search_content}">
	<input type="hidden" name="search_option" value="${search.search_option}">
</form>
<form id="textsearch" action="admin_faq.do" method="post">
	<select name="search_option">
		<option value="0">선택해주세요</option>
		<option value="1">제목</option>
		<option value="2">내용</option>
		<option value="3">제목 + 내용</option>
	</select>
	검색 : <input type="text" name="search_content">
	<input type="submit" value="검색">
</form>
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_faq.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_faq.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_faq.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_faq.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_faq.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_faq.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>

<!-- FAQ 삭제 시 모달 -->
<div id="text_modal" class="modal fade" role="dialog">
	<input type="hidden" id="faq_No" value="0"/>
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="text_mohead" class="modal-header"align="center"><h4>글 삭제</h4></div>
			<div id="text_mobody" class="modal-body" align="center">
				<h4>글을 삭제 하시겠습니까?</h4>
			</div>
			<div id="text_ft" class="modal-footer">
				<button type='button' class='btn btn-default' to-delete="delete_${vs.count}"  id='text_modal_yes'>확인</button>
				<button type='button' class='btn btn-primary' id='text_modal_no'>취소</button>
			</div>
		</div>
	</div>
</div>

	
</body>
</html>