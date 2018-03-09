<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	
	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	
		
	<script type="text/javascript" src="./Resources/js/jquery.js"></script>
	<script type="text/javascript" src="./Resources/js/main.js"></script>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./common.js"></script>
	<style type="text/css">
	.comm_qna_list_wrapper .commask{
			margin-top:5px;
			text-align: center;
			float:left;
		}
		.comm_qna_list_table th, .comm_qna_list_table td {
			text-align: center;
		}
		.comm_qna_list_wrapper .selectdiv1{
			vertical-align : middle;
			width: 1000px;
			float: left;
		}
		
		.comm_qna_list_wrapper .selectdiv2{
			margin-top:5px;
			width: 150px;
			float: left;
		}
		
		.comm_qna_list_wrapper .selectdiv3 {
		 	width: 400px;
			padding : 5px;
			float: left;
		}
		.comm_qna_list_wrapper .selectdiv4 {
			padding : 5px;
			float: left;
		}
		.comm_qna_list_wrapper .selectdiv5 {
			width: 300px;
			margin-top:5px;
			float: left;
		}
		.comm_qna_list_wrapper .selecdiv0 {
			width: 600px;
			margin:0 auto;
		}
		.comm_qna_list_con {
			text-align:center;
		}
		
	</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		var url = "chk_login.do";
	 	ajaxGet(url,function(rt){
		 // 로그인 실패시 : rt값 -> ("/main_html.do")에서 10002 return
		 if(rt =="10002"){ 
			$("#login_nav").hide();
			$("#non_login_nav").show();
		}
		 					
		 // 로그인 시 : rt값 -> user_name
		else if(rt!=""){ 
		$("#login_nav").show();
		$("#non_login_nav").hide(); 
		$("#user_name").text(rt+"님");
			}
		 });
	 	
		
		$("#write").on("click",function(){
			var user_id = $(this).attr("xyz");
			if(user_id != ""){
				location.href="community_board_add.do";
			} else{
			$("#addwrite").modal("show");
				
			}
		});
		
		$("#success").on("click",function(){
			parent.location.href="home_moveLoginPage.do";
		});
	});
	function board_list(page){
		$("#cur_board_page").attr("value",page);
		$("#paging_frm").submit();
	}
	
</script>
</head>
<body>
	<!-- *********************  header  ************************ -->
         <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ --> 
	<div class="head" id="header">
	
		<ul id="Navtab" class="nav nav-tabs commu_nav-tabs" role="tablist"> 
			<li ><a href="community_board_list.do" ><h3>FREE BOARD</h3></a></li>

			<li ><a href="community_qna_list.do"  ><h3>QnA BOARD</h3></a></li>

			<li ><a href="community_review_list.do" ><h3>REVIEW BOARD</h3></a></li>
		</ul>
	</div>
	<br/>
	<div class="container comm_qna_list_con">
		<label><h3>자유롭게 글을 작성 할 수 있는 자유게시판입니다. 자유롭게 글을 써보세요!</h3></label>
	</div>
	<hr style="border: solid 0.5px black;">
	<table class="table table-hover comm_qna_list_table">
		<tr>
			<th width="40"></th>
			<th width="1000"><h3>제&nbsp;목</h3></th>
			<th width="100"><h3>글쓴이</h3></th>
			<th><h3>작성일</h3></th>
			<th><h3>조회</h3></th>
			<th><h3>추천</h3></th>
			<jl:forEach var="vo" items="${board_list}">
				<tr>
					<td><h4>${vo.com_board_no}</h4></td>
					<td><a href="community_board_read.do?com_board_no=${vo.com_board_no}"><h4>${vo.com_board_title}</h4></a></td>
					<td><h4>${vo.user_id}</h4></td>
					<td><h4>${vo.the_time}</h4></td>
					<td><h4>${vo.view_count}</h4></td>
					<td><h4>${vo.recom_count}</h4></td>
				</tr>

			</jl:forEach>
	</table>
	
	<!-- 페이징 -->
	<div align="center">
		<ul class="pagination pagination-sm">
			<!-- 이전 페이지로 이동 : 10페이지 이전으로(블록 이동) -->
			<jl:if test="${board_pz.hasPrevPagination }">
				<li><a class="page" href="javascript:board_list('${board_pz.paginationStart-1}')">&lt;</a></li>
			</jl:if>
			<!-- 이전 페이지로 이동 : 한페이지 이전으로 -->
			<jl:if test="${board_pz.hasPrevPage }">
				<li><a class="page" href="javascript:board_list('${board_pz.curPagination-1 }')">&lt;</a></li>
			</jl:if>
				<!-- 페이지 번호 만들기 -->
				<jl:forEach begin="${board_pz.paginationStart }" end="${board_pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=board_pz.curPagination }">
							<li><a class="page" href="javascript:board_list('${vs.index }')">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="javascript:board_list('${vs.index }')">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
			<!-- 다음 페이지로 이동 : 한페이지 이동 -->
			<jl:if test="${board_pz.hasNextPage }">
				<li><a class="page" href="javascript:board_list('${board_pz.curPagination+1}')">&gt;</a></li>
			</jl:if>
			<!-- 다음 페이지로 이동 : 10페이지 이후로(블록 이동) -->
			<jl:if test="${board_pz.hasNextPagination }">
				<li><a class="page" href="javascript:board_list('${board_pz.paginationEnd+1 }')">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	</div>
	<!-- 페이징 -->	

	<div class="wrapper comm_qna_list_wrapper">
			<form action="community_board_list.do" id="paging_frm">
				<div class="selecdiv0">
					<div class="selectdiv1">
						<div class="selectdiv2">
							<select class="form-control" name="commserch_option">
								<option value="0">선택해주세요</option>
								<option value="1">제목</option>
								<option value="2">내용</option>
								<option value="3">제목+내용</option>
								<option value="4">작성자</option>
							</select>
						</div>
						<div class="selectdiv3">
							<input class="form-control" type="text" name="commserch_content" placeholder="카테고리 선택 -> 내용 입력" />
							<input id="cur_board_page" type="hidden" name="cur_board_page" value="${board_pz.curPagination }">
						</div>
						<div class="selectdiv4">
							<input type="submit" class="btn btn-primary" value="검색"/>				
						</div>
						<div class="selectdiv5">
							<jl:if test="${user_id ne ''}"> 
								<a href="community_board_mytext.do"> <input type="button" class="btn btn-info" value="My 글보기" /></a>
							</jl:if>
						</div>
						<!-- 글쓰기 버튼-->
						<div class="commask">
							<jl:if test="${user_id ne ''}"> 
								<input class="btn btn-warning" type="button" value="글쓰기" id="write" xyz="${user_id}" />
							</jl:if>
						</div>
					</div>
				</div>
			</form>
		</div>
	<br><br><br><br>
	<!-- 모달폼 -->
	<div class="modal fade" id="addwrite" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">알림</h4>
				</div>
				<div class="modal-body">로그인을 먼저 해주세요</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="success">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- paging 이용할 form -->
	<form id="paging_frm" action="community_board_list.do" method="post">
		
	</form>
	<!-- paging 이용할 form -->
	
	
			
	<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
	<!--  end footer  -->
</body>
</html>