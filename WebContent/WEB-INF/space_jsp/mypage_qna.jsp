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
	<link rel="stylesheet" href="http://70.12.113.229:8088/msspace_01/mypage_css/Myclub.css">
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
	<style type="text/css">
	table td{
		 overflow: hidden; 
		  text-overflow: ellipsis;
		  white-space: nowrap; 
		  width: 100px;
		  height: 20px;
		}
	#con {
		display: block;
	}

		
	</style>
</head>
<body>
	<form name="frm">
		<table>
			<tr>
				<th width="40">질문번호</th>
				<th width="100">질문 제목</th>
				<th width="100">질문 내용</th>
				<th width="100">작성 시간</th>
				<th width="100"></th>
			</tr>
			<jl:forEach var="QnAInfo" items="${qnaInfo}">
				<tr>
					<td>${QnAInfo.space_qna_no}</td>
					<td>${QnAInfo.space_qna_title}</td>
					<td id="con">${QnAInfo.space_qna_content}</td>
					<td>${QnAInfo.the_time}</td>
					<td><input type="button" class="btn btn-primary btnspace_no" id="btn_anwer" value="답변보기" abc="${QnAInfo.space_qna_no}"/>
				</tr>
					<input type="hidden" class="s_space_no" i="${QnAInfo.space_no}"/>
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