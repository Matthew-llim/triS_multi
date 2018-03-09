<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="common.js" type="text/javascript"></script>
 	<script>
 		$(document).ready(function(){
			if("${review_flag}"==1){
				var review = $("#review").offset();
		          $('html, body').animate({scrollTop:review.top-200}, 'slow');
			}
			if("${qna_flag}"==1){
				var qna = $("#qna").offset();
		          $('html, body').animate({scrollTop:qna.top-200}, 'slow');
			}
 			
 			$(".img").on("click",function(){
 				var img = $(this).attr("src");
 				$("#main_img").attr("src",img);
 			});

 			
 			var scOffset = $( '.navbar-Menu' ).offset();
 	 		$( window ).scroll( function() {
 	 		if ( $( document ).scrollTop() > scOffset.top ) {
 	 			$( '.navbar' ).addClass( 'navbar-fixed-top' );
 	 		}else {
 	 			$( '.navbar' ).removeClass( 'navbar-fixed-top' );
 	 		}
 	 		});
 	 		var url = "chk_login.do";
 	 	 	ajaxGet(url,function(rt){	
		 	 	 // 로그인 실패시 : rt값 -> ("/main_html.do")에서 10002 return
		 	 	 if(rt =="10002"){ 
		 	 		$("#login_nav").hide();				$("#non_login_nav").show();
		 	 	}
		 	 	 					
		 	 	 // 로그인 시 : rt값 -> user_name
		 	 	else if(rt!=""){ 
		 	 	$("#login_nav").show();
		 	 	$("#non_login_nav").hide(); 
		 	 	$("#user_name").text(rt+"님이 로그인하셨습니다.");
		 	 		}
	 	 	 });

 	 		
 			if("${bookmark}"!=""){
 				$("#btn_bookmark").html("북마크해제");
 			}
 			if("${space_code }"=="20002"){
 				$("#status-modal-body").html("후기 삭제 성공");
 				$("#status-modal").modal('show');
 			}else if("${space_code }"=="20001"){
 				$("#status-modal-body").html("본인만 삭제 가능합니다");
 				$("#status-modal").modal('show');
 			}else if("${space_code }"=="20003"){
 				$("#status-modal-body").html("후기 등록 성공");
 				$("#status-modal").modal('show');
 			}else if("${space_code }"=="20004"){
 				$("#status-modal-body").html("질문 수정 성공");
 				$("#status-modal").modal('show');
 			}else if("${space_code }"=="20005"){
 				$("#status-modal-body").html("질문 삭제 성공");
 				$("#status-modal").modal('show');
 			}else if("${space_code }"=="20006"){
 				$("#status-modal-body").html("질문 등록 성공");
 				$("#status-modal").modal('show');
 			}
 			$("#status-modal").on("hidden.bs.modal",function(){
 				location.replace("space_detail.do?space_no=${space.space_no}");
 			});
 			
 		
 			$("#btn_bookmark").on("click",function(){
 				if($(this).html()=="북마크등록"){
 					var url=$(this).attr("add");
 					ajaxGet(url,function(rt){
 						$("#btn_bookmark").html("북마크해제");
 					});
 				}else{
 					var url=$(this).attr("del");
 					ajaxGet(url,function(rt){
 						$("#btn_bookmark").html("북마크등록");
 					});
 				}
 				
 			});

 			$(".collapsed").on("click",function(){
 				
 				//후기가 있으면 작성 못하게 하는거 & 후기 없으면 안불러 오게 해야함
 				var space_qna_no = $(this).attr("no");
 				ajaxGet("find_space_qna_reple.do?space_qna_no="+space_qna_no,function(rt){
 					if(rt.length>5) {
 						$("#qna_reple_add").hide();
 						var qna_reple = window.eval("("+rt+")");
 	 					var html = "<table>";
 	 					html += "<tr>";
 	 					html += "<td>제목</td>";
 	 					html += "<td>" + qna_reple.qna_reple_title +"</td>";
 	 					html +="</tr>";
 	 					html += "<tr>";
 	 					html += "<td>내용</td>";
 	 					html += "<td>" + qna_reple.qna_reple_content+"</td>";
 	 					html += "</tr>";
 	 					html+="</table>"
 						$("#qna_reple"+space_qna_no).html(html);
 					} else {
 						
 					}
 					
 				},
 				function(){alert(2);},
 				function(){alert(3);}
 				);
 			});
 			$("#a_mod").on("click",function(){
 				$("#form_space_mod").submit();
 			});
 		});
 	</script>
</head>
<body>
	<div class="jbTitle">
		<h1>Multi Space</h1>
	</div>
	
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default ">
		<div class="container">
		 <div class="navbar-header">
		   <a class="navbar-brand" href="main.html">multi space</a>
		 </div>
	
	 <div id="navbar" class="navbar-collapse collapse navbar-Menu ">
		<ul class="nav navbar-nav ">
	 	 <li><a href="space_home.do">공간</a></li>
		 <li><a href="club_home.do">모임</a></li>
		 <li><a href="community_list.do">커뮤니티</a></li>
		 <li><a href="event_user_list.do">이벤트</a></li>	
		 <li><a href="notice_list.do">공지사항</a></li>
		 <li><a href="faq_list.do">FAQ</a></li>			
		 <li><a href="admin_main.do">관리자</a></li>			
		</ul>
				
	<ul id="login_nav" class="nav navbar-nav navbar-right">
		<li><a href="#" id="user_name"></a></li>
		<li><a href="mypage_moveMypageMainPage.do">마이페이지</a></li>
		<li><a href="home_logout.do">로그아웃</a></li>	
	</ul>
					
		<ul id="non_login_nav" class="nav navbar-nav navbar-right">
		     <li><a href="#">로그인</a></li>		
		</ul>
	
		   </div>
		</div>
	</nav>
	<!-- nav -->
	<div class="container-fluid">
	<div class="col-xs-2"></div>
	<div class="col-xs-7">
	<h1>공간 상세 페이지</h1>
		<div>
			<table>
				<tr>
					<th><h1>공간 소개</h1></th>
					<jl:forEach var="vo" items="${host }">
						<jl:if test="${vo.crn == space.crn }">
							<th><a id="a_mod">공간 수정</a>
								<form method="POST" id="form_space_mod" action="space_mod.do">
									<input type="hidden" value="${space.space_no }" name="space_no">
									<input type="hidden" value="${space.space_title }" name="space_title">
									<input type="hidden" value="${space.space_content }" name="space_content">
									<input type="hidden" value="${space.space_thumb_img }" name="space_thumb_img">
									<input type="hidden" value="${space.open_time }" name="open_time">
									<input type="hidden" value="${space.close_time }" name="close_time">
									<input type="hidden" value="${space.price }" name="price">
									<input type="hidden" value="${space.min_people }" name="min_people">
									<input type="hidden" value="${space.max_people }" name="max_people">
									<input type="hidden" value="${space.space_call }" name="space_call">
									<input type="hidden" value="${space.s_category_no }" name="s_category_no">
									<input type="hidden" value="${space.l_category_no }" name="l_category_no">
								
								</form>
							</th>
							<th><a  data-toggle="modal" href="#space_del">공간 삭제</a></th>
							<div class="modal fade" id="space_del" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">&times;</span>
													<span class="sr-only">Close</span>
												</button>
												<h4 class="modal-title">공간 삭제</h4>
											</div>
												<div class="modal-footer">
													<a href="space_del.do?space_no=${space.space_no }"><button type="button" class="btn btn-defualt">삭제</button></a>
													<button type="button" class="btn btn-defualt" data-dismiss="modal">닫기</button>
												</div>
										</div>
									</div>
								</div>
						</jl:if>
					</jl:forEach>
				</tr>
				<tr>
					<td>공간 이름</td>
					<td>${space.space_title }</td>
				</tr>
				<tr>
					<td>공간 카테고리</td>
					<td>${s_category }</td>
				</tr>
				<tr>
					<td><img src="image/${space.space_thumb_img }"/></td>
				</tr>
				<tr>
					<td>공간 소개</td>
					<td>${space.space_content }</td>
				</tr>
				<tr>
					<td>이용 시간</td>
					<td>${space.open_time } ~ ${space.close_time }</td>
				</tr>
			</table>
		</div>
		
		<hr/>
			<div class="panel text-center">
				<jl:if test="${fn:length(image.image_one) > 3}">
					<div>
						<img src="image/${image.image_one }" width="400" height="300" id="main_img">
					</div>
				</jl:if>
				<hr/>
				<div>
						<jl:if test="${fn:length(image.image_one) > 3}">
							<img src="image/${image.image_one }" width="100" height="130" class="img"/>
						</jl:if>
						<jl:if test="${fn:length(image.image_two) > 3}">
							<img src="image/${image.image_two }" width="100" height="130" class="img"/>
						</jl:if>
						<jl:if test="${fn:length(image.image_three) > 3}">
							<img src="image/${image.image_three }" width="100" height="130" class="img"/>
						</jl:if>
						<jl:if test="${fn:length(image.image_four) > 3}">
							<img src="image/${image.image_four }" width="100" height="130" class="img"/>
						</jl:if>
						<jl:if test="${fn:length(image.image_five) > 3}">
							<img src="image/${image.image_five }" width="100" height="130" class="img"/>
						</jl:if>
						<jl:if test="${fn:length(image.image_six) > 3}">
							<img src="image/${image.image_six }" width="100" height="130" class="img"/>
						</jl:if>
						<jl:if test="${fn:length(image.image_seven) > 3}">
							<img src="image/${image.image_seven }" width="100" height="130" class="img"/>
						</jl:if>
				</div>
			</div>
		<hr/>
		
		<div>
		
		<!-- space q&a 부분 -->
		<div class="col-xs-12" id="qna">
			<h1>QnA</h1>
			<jl:forEach var="space_qna" items="${list_space_qna }">
				<div class="panel-group" id="accordion${space_qna.space_qna_no }">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								제목 :
								<a data-toggle="collapse" data-parent="#accordion${space_qna.space_qna_no }" href="#collapse${space_qna.space_qna_no }" no="${space_qna.space_qna_no }" class="collapsed">
									 ${space_qna.space_qna_title } <br/>
								</a>
								작성자: ${space_qna.user_id }
							</h4>
						</div>
					</div>
				
				<div id="collapse${space_qna.space_qna_no }" Class="panel-collpase collapse">
					<div class="panel-body">
						<table>
							<tr> 
								<td>내용</td>
								<td>${space_qna.space_qna_content }</td>
							</tr>
							<tr>
								<td>작성 시간</td>
								<td>${space_qna.the_time }</td>
							</tr>
						</table>
							<jl:if test="${user_id eq space_qna.user_id }">
								<a href="#qna_mod${space_qna.space_qna_no }" data-toggle="modal">질문 수정</a>
								<a href="#qna_del${space_qna.space_qna_no }" data-toggle="modal">질문 삭제</a>
								
								<!-- qna 삭제 모달 -->
								<div class="modal fade" id="qna_del${space_qna.space_qna_no }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">&times;</span>
													<span class="sr-only">Close</span>
												</button>
												<h4 class="modal-title">주의</h4>
											</div>
											<div class="modal-body">
												<h2>정말 삭제하시겠습니까?</h2>
											</div>
											<div class="modal-footer">
												<a href="delete_space_qna.do?space_qna_no=${space_qna.space_qna_no }&space_no=${space_qna.space_no}" data-toggle="modal">
													<button type="button" class="btn btn-default">질문 삭제</button>
												</a>
												<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>
								<!-- qna 삭제 모달 끝 -->
								
								<!-- qna 수정 모달 -->
								<div class="modal fade" id="qna_mod${space_qna.space_qna_no }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">&times;</span>
													<span class="sr-only">Close</span>
												</button>
												<h4 class="modal-title">QnA 수정</h4>
											</div>
											<form method="POST" action="mod_space_qna.do">
												<div class="modal-body">
													<div class="form-group">
														<label for="mod_space_qna_title">제목</label>
														<input type="text" name="space_qna_title" id="mod_space_qna_title" class="form-control" value="${space_qna.space_qna_title }">
													</div>
													<div class="form-group">
														<label for="mod_space_qna_content">내용</label>
														<textarea name="space_qna_content" id="mod_space_qna_content" class="form-control">${space_qna.space_qna_content }</textarea>
													</div>
													<input type="hidden" name="user_id" value="${user_id }">
													<input type="hidden" name="space_no" value="${space.space_no }">
													<input type="hidden" name="space_qna_no" value="${space_qna.space_qna_no }">
												</div>
												<div class="modal-footer">
													<input type="submit" class="btn btn-default" value="질문 수정">
													<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
												</div>
											</form>
										</div>
									</div>
								</div>
								<!-- qna 수정 모달 끝 -->
							
								
							</jl:if>
								<div id="qna_reple${space_qna.space_qna_no }"></div>
								<jl:forEach var="vo" items="${host }">
									<jl:if test="${vo.crn eq space.crn }">
										<div id="qna_reple_add">
											<form method="POST" action="add_space_qna_reple.do">
												<input type="hidden" name="space_qna_no" value="${space_qna.space_qna_no }">
												<input type="hidden" name="space_no" value="${space_qna.space_no }">
												<input type="hidden" name="user_id" value="${user_id }">
												<table>
												
												<tr>
													<td>제목</td>
													<td><input type="text" name="space_qna_reple_title"></td>
												</tr>
												<tr>
													<td>내용</td>
													<td><textarea row="5" col="30" name="space_qna_reple_content"></textarea></td>
												</tr>
												</table>
												<input type="submit">
											</form>
										</div>
									</jl:if>
								</jl:forEach>
								
					</div>
				</div>
				</div>
			</jl:forEach>
			<ul class="pagination pagination-sm">
						<jl:if test="${pz_space_qna.hasPrevPagination }">
							<li><a class="page" href="space_detail.do?pg_qna=${ pz_space_qna.paginationStart-1}&space_no=${space.space_no }&qna_flag=1">&lt;</a></li>
						</jl:if>
							<jl:if test="${pz_space_qna.hasPrevPage }">
								<li><a class="page" href="space_detail.do?pg_qna=${ pz_space_qna.curPagination-1}&space_no=${space.space_no }&qna_flag=1">&lt;</a></li>
							</jl:if>
							<jl:forEach begin="${pz_space_qna.paginationStart }" end="${pz_space_qna.paginationEnd }" step="1" varStatus="vs">
								<jl:choose>
									<jl:when test="${vs.index!=pz_space_qna.curPagination }">
										<li><a class="page" href="space_detail.do?pg_qna=${vs.index }&space_no=${space.space_no }&qna_flag=1">${vs.index }</a></li>
									</jl:when>
									<jl:otherwise>
										<li class="active"><a class="page" href="space_detail.do?pg_qna=${vs.index }&space_no=${space.space_no }&qna_flag=1">${vs.index }</a></li>
									</jl:otherwise>
								</jl:choose>
							</jl:forEach>
							<jl:if test="${pz_space_qna.hasNextPage }">
								<li><a class="page" href="space_detail.do?pg_qna=${pz_space_qna.curPagination+1}&space_no=${space.space_no}&qna_flag=1">&gt;</a></li>
							</jl:if>
						<jl:if test="${pz_space_qna.hasNextPagination }">
							<li><a class="page" href="space_detail.do?pg_qna=${pz_space_qna.paginationEnd+1 }&space_no=${space.space_no }&qna_flag=1">&gt;&gt;</a></li>
						</jl:if>
					</ul>
			<!-- space q&a 쓰는 곳 -->

			<h3>질문하기</h3>
			<form method="POST" action="add_space_qna.do">
				<input type="hidden" name="space_no" value="${space.space_no }">
				<input type="hidden" name="user_id" value="${user_id }">
				<div class="form-group">
					<label for="space_qna_title">제목</label>
					<input type="text" name="space_qna_title" id="space_qna_title" class="form-control">
				</div>
				<div class="form-group">
					<label for="space_qna_content">내용</label>
					<textarea name="space_qna_content" id="space_qna_content" class="form-control"></textarea>
				</div>
				<input type="submit"  class="btn btn-default" value="질문전송">
			</form>
		</div>
		<br/>
		<br/>
		<hr/>
		
		<!-- 후기 -->
		<div class="col-xs-12" id="review">
			<h1>후기</h1>
				<jl:forEach var="review" items="${list_review }">
				<div class="panel-group" id="accordion${review.review_no }">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								제목 :
								<a data-toggle="collapse" data-parent="#accordion${review.review_no }" href="#collapse_review${review.review_no }" class="collapsed">
									 ${review.review_title } <br/>
								</a>
								작성자: ${review.user_id }
							</h4>
						</div>
					</div>
				
				<div id="collapse_review${review.review_no }" Class="panel-collpase collapse">
					<div class="panel-body">
						<div class="col-xs-4"><img src="review_img/${review.review_img }" width="150" height="60" alt="썸네일"></div>
						<div class="col-xs-8">
							<table>
								<tr> 
									<td>내용</td>
									<td>${review.review_content }</td>
									<td>평점</td>
									<td>${review.review_score }</td>
								</tr>
								<tr>
									<td>작성 시간</td>
									<td>${review.the_time }</td>
								</tr>
								
							</table>
							<jl:if test="${user_id eq review.user_id }">
								<a href="#review_del${review.review_no }" data-toggle="modal">후기 삭제</a>
								
								<!-- 후기 삭제 모달 -->
								<div class="modal fade" id="review_del${review.review_no }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">&times;</span>
													<span class="sr-only">Close</span>
												</button>
												<h4 class="modal-title">주의</h4>
											</div>
											<div class="modal-body">
												<h2>정말 삭제하시겠습니까?</h2>
											</div>
											<div class="modal-footer">
												<a href="del_review.do?review_no=${review.review_no }&space_no=${review.space_no}" data-toggle="modal">
													<button type="button" class="btn btn-default">후기 삭제</button>
												</a>
												<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>
								<!-- 모달 끝 -->
								
							</jl:if>
						</div>
					</div>
				</div>
				</div>
			</jl:forEach>
				<ul class="pagination pagination-sm">
						<jl:if test="${pz_review.hasPrevPagination }">
							<li><a class="page" href="space_detail.do?pg_review=pz_review.paginationStart-1&space_no=${space.space_no }&review_flag=1">&lt;</a></li>
						</jl:if>
							<jl:if test="${pz_review.hasPrevPage }">
								<li><a class="page" href="space_detail.do?pg_review=${ pz_review.curPagination-1}&space_no=${space.space_no }&review_flag=1">&lt;</a></li>
							</jl:if>
							<jl:forEach begin="${pz_review.paginationStart }" end="${pz_review.paginationEnd }" step="1" varStatus="vs">
								<jl:choose>
									<jl:when test="${vs.index!=pz_review.curPagination }">
										<li><a class="page" href="space_detail.do?pg_review=${vs.index }&space_no=${space.space_no }&review_flag=1">${vs.index }</a></li>
									</jl:when>
									<jl:otherwise>
										<li class="active"><a class="page" href="space_detail.do?pg_review=${vs.index }&space_no=${space.space_no }&review_flag=1">${vs.index }</a></li>
									</jl:otherwise>
								</jl:choose>
							</jl:forEach>
							<jl:if test="${pz_review.hasNextPage }">
								<li><a class="page" href="space_detail.do?pg_review=${pz_review.curPagination+1}&space_no=${space.space_no}&review_flag=1 ">&gt;</a></li>
							</jl:if>
						<jl:if test="${pz_review.hasNextPagination }">
							<li><a class="page" href="space_detail.do?pg_review=${pz_review.paginationEnd+1 }&space_no=${space.space_no }&review_flag=1">&gt;&gt;</a></li>
						</jl:if>
					</ul>
			
				<form method="POST" action="review_add.do">
					<input type="hidden" name="user_id" value="${user_id }">
					<input type="hidden" name="space_no" value="${space.space_no }">
					<input type="submit" value="후기 작성" class="btn btn-default">
				</form>
				
		
		<!--  모달들 모음  -->
		
		<!-- 전화번호 모달 -->
		<div class="modal fade" id="call" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">전화번호</h4>
					</div>
					<div class="modal-body">
						<h2>${space.space_call }</h2>
						<p>전화 하실 때 MSSPACE보고 문의 드립니다. 라고 말하시면 더욱 친절하게 대해주실거에요~</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		
		
		
		<!-- 상태 모달 -->
		<div class="modal fade" id="status-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">진행상태</h4>
					</div>
					<div class="modal-body">
						<h2 id="status-modal-body">XX 완료</h2>
					</div>
					<div class="modal-footer">
						<button id="btn-status-close" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	</div>
	</div>
	<div class="col-xs-2">
		<div class="panel">
			공간 이름: <h1>${space.space_title }</h1>
			<img src="image/${space.space_thumb_img }" width="100" height="100"/>
			<table>
				<tr>
					<td>예약 인원</td>
					<td>최소 ${space.min_people } 명~ 최대 ${space.max_people } 명</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>${space.price } 원 /시간</td>
				</tr>
			</table>
			<button class="btn btn-default btn-sm" data-toggle="modal" data-target="#call">전화</button>
			<a href="space_reservation.do?space_no=${space.space_no }"><button class="btn btn-default btn-sm">예약하기</button></a>
			<button class="btn btn-default btn-sm" id="btn_bookmark" add="add_bookmark.do?space_no=${space.space_no }&user_id=${user_id}" del="del_bookmark.do?space_no=${space.space_no }&user_id=${user_id}">북마크등록</button>
		</div>
	</div>
	<div class="col-xs-1"></div>
	</div>

	
	

	
</body>
</html>