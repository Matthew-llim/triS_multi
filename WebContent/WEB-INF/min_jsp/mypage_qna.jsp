<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script>

	$(document).ready(function(){
		$(".btnspace_no").on("click",function(){
			var space_qna_no = $(this).attr("abc");
			document.frm.method="POST";
			document.frm.action="mypage_getMypageQnAReple.do?space_qna_no="+space_qna_no;
			document.frm.submit();
		});
	});
	
	
	</script>

</head>
<body>
	<form name="frm">
		<table border="1" cellspacing="0" cellpadding="8">
			<tr>
				<th width="40">qna_no</th>
				<th width="40">space_no</th>
				<th width="100">user_id</th>
				<th width="100">space_qna_title</th>
				<th width="100">space_qna_content</th>
				<th width="100">the_time</th>
				<th width="100">답변보기</th>
			</tr>
			<jl:forEach var="QnAInfo" items="${qnaInfo}">
				<tr>
					<td>${QnAInfo.space_qna_no}</td>
					<td><span class="s_space_no" i="${QnAInfo.space_no}">${QnAInfo.space_no}</span>
					</td>
					<td>${QnAInfo.user_id}</td>
					<td>${QnAInfo.space_qna_title}</td>
					<td>${QnAInfo.space_qna_content}</td>
					<td>${QnAInfo.the_time}</td>
					<td><input type="button" class="btn btn-primary btnspace_no" id="btn_anwer" value="답변보기" abc="${QnAInfo.space_qna_no}"/>
				</tr>
			</jl:forEach>
		</table>
	</form>
	
	
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="mypage_moveMypageQnAPage.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="mypage_moveMypageQnAPage.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="mypage_moveMypageQnAPage.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="mypage_moveMypageQnAPage.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="mypage_moveMypageQnAPage.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="mypage_moveMypageQnAPage.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	
	
</body>
</html>