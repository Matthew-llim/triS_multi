<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<title>Welcome to Multi Space</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	

<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
<link rel="stylesheet" href="./mypage_css/Myclub.css">
	
<script type="text/javascript" src="./Resources/js/jquery.js"></script>
<script type="text/javascript" src="./Resources/js/main.js"></script>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./common.js"></script>

</head>
<body>
	<!-- *********************  header  ************************ -->
         <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ -->
	
	<!-- paging 이용할 form -->
	<form id="paging_frm" action="club_community.do" method="post">
		<input type="hidden" name="club_no" value="${vo.club_no }">
		<input id="cur_notice_page" type="hidden" name="cur_notice_page" value="${notice_pz.curPagination }">
		<input id="cur_board_page" type="hidden" name="cur_board_page" value="${board_pz.curPagination }">
	</form>
	<!-- paging 이용할 form -->

	<section class="listings">
		<div class="wrapper">
			<div class="properties_list">
					<div align="center"><h1 style="color: #026fac;">${vo.club_name}</h1></div><br/><br/> 
					<div align="right">
							<jl:if test="${userVO!=null}">
									<p style="font: bold;font-size: large;"><span class="glyphicon glyphicon-user"></span>&nbsp${master}(모임장)
									<jl:if test="${user_id != vo.user_id }">
										<span user_id="${vo.user_id}" class="user_name glyphicon glyphicon-envelope"></span>
									</jl:if>
									</p>
									<br/>
									<jl:forEach items="${userVO}" var="uvo">
										<p>
											<jl:if test="${uvo.user_id!=vo.user_id }">
												<span class="glyphicon glyphicon-user"></span>&nbsp${uvo.user_name}
												<span user_id="${uvo.user_id}" class="user_name glyphicon glyphicon-envelope"></span>
												<jl:if test="${vo.user_id eq user_id }">
													<a class="release" user_id="${uvo.user_id }" club_no="${vo.club_no }" club_name="${vo.club_name}" href="#">
														<span class="glyphicon glyphicon-remove"></span>
													</a>
												</jl:if>
											</jl:if>
											<br />
										</p>
									</jl:forEach>
							</jl:if> <br />
					</div>
					<br/><br/><br/>
					<div>
						<label><h3>공지사항</h3></label><br /> 
						<jl:if test="${noticeVO!=null}">
							<table class="table">
								<jl:forEach items="${noticeVO}" var="nvo" varStatus="i">
									<colgroup>
										<col width="10%"/>
										<col width="50%"/>
										<col width="23%"/>
										<col width="15%"/>
									</colgroup>
									<jl:if test="${i.count==1 }">
										<thead>
											<tr>
												<th class="club_th_align">글 번호</th>
												<th class="club_th_align">제목</th>
												<th class="club_th_align">작성자</th>
												<th class="club_th_align">작성시간</th>
											</tr>
										</thead>
									</jl:if>
									<tbody>
										<tr>
											<td align="center">${i.count}</td>
											<td><a href="club_notice_detail.do?c_notice_no=${nvo.c_notice_no}">${nvo.c_notice_title}</a></td>
											<td  align="center">${nvo.user_name}</td>
											<td  align="center">${nvo.the_time}</td>
										</tr>
									</tbody>
								</jl:forEach>
							</table>
						</jl:if>
						<jl:choose>
							<jl:when test="${noticeVO ne '[]'}">
								<div align="center">
									<ul class="pagination pagination-sm">
										<!-- 이전 페이지로 이동 : 10페이지 이전으로(블록 이동) -->
										<jl:if test="${notice_pz.hasPrevPagination }">
											<li><a class="page"
												href="javascript:notice_list('${notice_pz.paginationStart-1}')">&lt;</a></li>
										</jl:if>
										<!-- 이전 페이지로 이동 : 한페이지 이전으로 -->
										<jl:if test="${notice_pz.hasPrevPage }">
											<li><a class="page"
												href="javascript:notice_list('${notice_pz.curPagination-1 }')">&lt;</a></li>
										</jl:if>
										<!-- 페이지 번호 만들기 -->
										<jl:forEach begin="${notice_pz.paginationStart }"
											end="${notice_pz.paginationEnd }" step="1" varStatus="vs">
											<jl:choose>
												<jl:when test="${vs.index!=notice_pz.curPagination }">
													<li><a class="page"
														href="javascript:notice_list('${vs.index }')">${vs.index }</a></li>
												</jl:when>
												<jl:otherwise>
													<li class="active"><a class="page"
														href="javascript:notice_list('${vs.index }')">${vs.index }</a></li>
												</jl:otherwise>
											</jl:choose>
										</jl:forEach>
										<!-- 다음 페이지로 이동 : 한페이지 이동 -->
										<jl:if test="${notice_pz.hasNextPage }">
											<li><a class="page"	href="javascript:notice_list('${notice_pz.curPagination+1}')">&gt;</a></li>
										</jl:if>
										<!-- 다음 페이지로 이동 : 10페이지 이후로(블록 이동) -->
										<jl:if test="${notice_pz.hasNextPagination }">
											<li><a class="page"
												href="javascript:notice_list('${notice_pz.paginationEnd+1 }')">&gt;&gt;</a></li>
										</jl:if>
									</ul>
								</div> 
							</jl:when>
							<jl:otherwise>
								<div align="center"><h4>등록된 글이 없습니다.</h4></div>
							</jl:otherwise>
						</jl:choose>
						<div align="right"><input id="noticeBtn" type="button" class="btn" value="공지쓰기" /><br /></div>
					
						<br /> <label><h3>커뮤니티</h3></label><br /> 
							<jl:if	test="${noticeVO!=''}">
							<table class="table">
								<jl:forEach items="${boardVO}" var="bvo" varStatus="i">
									<colgroup>
										<col width="8%"/>
										<col width="14%"/>
										<col width="43%"/>
										<col width="20%"/>
										<col width="20%"/>
									</colgroup>
									<jl:if test="${i.count==1 }">
										<tr>
											<th class="club_th_align">글 번호</th>
											<th class="club_th_align">말머리</th>
											<th class="club_th_align">제목</th>
											<th class="club_th_align">작성자</th>
											<th class="club_th_align">작성시간</th>
										</tr>
									</jl:if>
									<tr>
										<td class="club_th_align">${i.count}</td>
										<td class="club_th_align">${bvo.c_board_subject }</td>
										<td><a href="club_board_detail.do?c_board_no=${bvo.c_board_no}">${bvo.c_board_title}</a></td>
										<td class="club_th_align">${bvo.user_name }</td>
										<td class="club_th_align">${bvo.the_time }</td>
									</tr>
								</jl:forEach>
							</table>
						</jl:if>
						<jl:choose>
							<jl:when test="${boardVO ne '[]'}">
								<div align="center">
									<ul class="pagination pagination-sm">
										<!-- 이전 페이지로 이동 : 10페이지 이전으로(블록 이동) -->
										<jl:if test="${board_pz.hasPrevPagination }">
											<li><a class="page"
												href="javascript:board_list('${board_pz.paginationStart-1}')">&lt;</a></li>
										</jl:if>
										<!-- 이전 페이지로 이동 : 한페이지 이전으로 -->
										<jl:if test="${board_pz.hasPrevPage }">
											<li><a class="page"
												href="javascript:board_list('${board_pz.curPagination-1 }')">&lt;</a></li>
										</jl:if>
										<!-- 페이지 번호 만들기 -->
										<jl:forEach begin="${board_pz.paginationStart }"
											end="${board_pz.paginationEnd }" step="1" varStatus="vs">
											<jl:choose>
												<jl:when test="${vs.index!=board_pz.curPagination }">
													<li><a class="page"
														href="javascript:board_list('${vs.index }')">${vs.index }</a></li>
												</jl:when>
												<jl:otherwise>
													<li class="active"><a class="page" href="javascript:board_list('${vs.index }')">${vs.index }</a></li>
												</jl:otherwise>
											</jl:choose>
										</jl:forEach>
										<!-- 다음 페이지로 이동 : 한페이지 이동 -->
										<jl:if test="${board_pz.hasNextPage }">
											<li><a class="page"
												href="javascript:board_list('${board_pz.curPagination+1}')">&gt;</a></li>
										</jl:if>
										<!-- 다음 페이지로 이동 : 10페이지 이후로(블록 이동) -->
										<jl:if test="${board_pz.hasNextPagination }">
											<li><a class="page"
												href="javascript:board_list('${board_pz.paginationEnd+1 }')">&gt;&gt;</a></li>
										</jl:if>
									</ul>
								</div>
							</jl:when>
							<jl:otherwise>
									<div align="center"><h4>등록된 글이 없습니다.</h4></div>
							</jl:otherwise>
						</jl:choose>
						<div align="right"><input id="boardBtn" type="button" class="btn" value="글쓰기" /></div><br />
					<br /> 
					<br />
					<div id="applyList">
						<label><h3>신청 현황 리스트</h3></label><br />
						<jl:choose>
							<jl:when test="${applyVO ne '[]'}">
								<table class="table">
									<colgroup>
										<col width="20%"/>
										<col width="55%"/>
										<col width="25%"/>
									</colgroup>
									<tr>
										<th class="club_th_align">이름</td>
										<th class="club_th_align">신청내용</td>
										<th class="club_th_align">신청승인</td>
									</tr>
									<jl:forEach items="${applyVO}" var="avo">
										<tr>
											<td class="club_th_align">${avo.user_name}</td>
											<td>${avo.apply_content}</td>
											<td class="club_th_align"><input club_name="${vo.club_name }"
												club_no="${vo.club_no}" user_id="${avo.user_id}"" type="button" class="agree btn" value="수락">
												<input type="button" class="btn disagree" club_name="${vo.club_name }"	club_no="${vo.club_no}" user_id="${avo.user_id}" value="거절"></td>
										</tr>
									</jl:forEach>
								</table>
							</jl:when>
						<jl:otherwise>
							<div align="center"><h4>신청 내역이 없습니다.</h4></div>
						</jl:otherwise>
					</jl:choose>
					</div> <br /> 
					<div align="right">
						<input id="prev" type="button" value="뒤로가기" class="btn"> 
						<input id="delClub" type="button" value="해체하기" class="btn" />
					</div>

			</div>
		</div>
	</div>
</section>


		<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
		<!--  end footer  -->
	
	
	
	
		<!-- 유저 강퇴 modal창 시작 -->
	<div id="user_release" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="user_releasehead" class="modal-header"align="center"><h2>유저 강퇴</h2></div>
				<div id="user_releasebody" class="modal-body" align="center"><h3>유저를 강퇴 하시겠습니까?</h3></div>
				<div id="user_releaseft" class="modal-footer">
					<button type="button" class="btn btn-default" id="user_release_yes">확인</button>
					<button type='button' class='btn btn-primary' id='user_release_no'>취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 유저 강퇴 modal창 끝 -->
	<!-- 글 작성 modal창 시작 -->
	<div id="text_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="text_mohead" class="modal-header"align="center"><h4>글 작성</h4></div>
				<div id="text_mobody" class="modal-body" align="center">
					<h4>글을 작성 하시겠습니까?</h4>
				</div>
				<div id="text_ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='text_modal_yes'>확인</button>
					<button type='button' class='btn btn-primary' id='text_modal_no'>취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 글 작성 modal창 끝 -->
	<!-- 클럽 해체 modal창 시작 -->
	<form id="del_club_frm" method="post" action="club_del_club.do">
		<div id="del_club_modal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="mohead" class="modal-header"align="center"><h4>모임 해체</h4></div>
					<div id="mobody" class="modal-body" align="center"><h4>모임을 정말 해체하시겠습니까?</h4></div>
					<div id="ft" class="modal-footer">
						<button type="button" class="btn btn-default" id="del_club_yes">확인</button>
						<button type='button' class='btn btn-primary' id='del_club_no'>취소</button>
					</div>
				</div>
			</div>
		</div>
		<input name="club_no" type="hidden" value="${vo.club_no}"/>
	</form>
	<!-- 클럽 해체 modal창 끝 -->
	
	<!-- 유저 탈퇴 modal창 시작 -->
	<div id="del_user_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="mohead" class="modal-header"align="center"><h4>모임 탈퇴</h4></div>
				<div id="mobody" class="modal-body" align="center"><h4>모임을 정말 탈퇴하시겠습니까?</h4></div>
				<div id="ft" class="modal-footer">
					<button type="button" class="btn btn-default" id="del_user_yes">확인</button>
					<button type='button' class='btn btn-primary' id='del_user_no'>취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 유저 탈퇴 modal창 끝 -->
	
	<!-- 기본 modal창 시작 -->
	<div id="basic_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="basic_mobody" class="modal-body" align="center">
				</div>
				<div id="basic_ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='basic_modal_Yes'>확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 기본 modal창 끝 -->
	
	<!-- 유저 신청 수락 modal창 시작 -->
	<form id="agree_frm">
		<div id="user_agree_modal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="mohead" class="modal-header"align="center"><h4>유저 수락</h4></div>
					<div id="mobody" class="modal-body" align="center"><h4>유저를 모임에 수락하시겠습니까?</h4></div>
					<div id="ft" class="modal-footer">
						<button type="button" class="btn btn-default" id="user_agree_yes">확인</button>
						<button type='button' class='btn btn-primary' id='user_agree_no'>취소</button>
					</div>
				</div>
			</div>
		</div>
		<input id="agree_id" name="user_id" type="hidden"/>
		<input id="agree_no" name="club_no" type="hidden"/>
		<input id="agree_name" name="club_name" type="hidden"/>
	</form>
	<!-- 유저 신청 수락 modal창 끝 -->
	
	<!-- 유저 신청 거절 modal창 시작 -->
	<div id="user_disagree_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="mohead" class="modal-header"align="center"><h4>유저 거절</h4></div>
				<div id="mobody" class="modal-body" align="center"><h4>유저를 거절 하시겠습니까?</h4></div>
				<div id="ft" class="modal-footer">
					<button type="button" class="btn btn-default" id="user_disagree_yes">확인</button>
					<button type='button' class='btn btn-primary' id='user_disagree_no'>취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 유저 신청 거절 modal창 끝 -->
	<!-- 유저 쪽지 모달창 시작 -->
	<form id="message_frm" action="club_add_message.do" method="post">
		<div id="message_modal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-head" align="center">
						<h4>쪽지 보내기</h4>
					</div>
					<div class="modal-body" align="center">
						<h4 id="modalbody">
							<textarea name="msg_content" id="msg_content"
								class='form-control' rows="7" placeholder="쪽지를 입력하세요"></textarea>
						</h4>
					</div>
					<div id="ft" class="modal-footer">
						<button type='button' class='btn btn-default' id='message_modal_yes'>보내기</button>
						<button type='button' class='btn btn-primary' id='message_modal_no'>취소</button>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" name="send_user_id" value="${user_id}"/>
		<input type="hidden" id="receive_user_id" name="receive_user_id"/>
		<input name="club_no" type="hidden" value="${vo.club_no}" />
	</form>
	<!-- 유저 쪽지 모달창 끝 -->

	<script type="text/javascript">
		$(document).ready(function(){
			
			// 기본 모달창의 확인 버튼 누르면 숨기기
			$("#basic_modal_Yes").on("click",function(){
				$("#basic_modal").modal("hide");
			});
			
			/* 모임 회원 강퇴시키기 기능 */
			$(".release").on("click",function(){
				var user_id = $(this).attr("user_id");
				var club_no = $(this).attr("club_no");
				var club_name = $(this).attr("club_name");
				$("#user_release").modal("show");
				$("#user_release_yes").on("click",function(){
					var url = "club_user_release.do?user_id="+user_id+"&club_no="+club_no+"&club_name="+club_name;
					ajaxGet(url, function(rt){
						if(rt=="ok"){
							$("#user_release").modal("hide");
							$("#basic_mobody").text("사용자를 방출 시켰습니다.");
							$("#basic_modal").modal("show");
							
							$("#basic_modal").on("hidden.bs.modal",function(){
								$("#basic_modal").modal("hide");
								location.reload();
							});
						}else{
							$("#user_release").modal("hide");
							$("#basic_mobody").text("사용자 방출을 실패 하였습니다.");
							$("#basic_modal").modal("show");
							$("#basic_modal").on("hidden.bs.modal",function(){
								$("#basic_modal").modal("hide");
								location.reload();
							});
						}
					});
				});
				$("#user_release_no").on("click",function(){
					$("#user_release").modal("hide");
				});
			});
			
			/* 모임 신청자 거절 버튼 클릭시 이벤트 발생 */
			$(".disagree").on("click",function(){
				var user_id = $(this).attr("user_id");
				var club_no = $(this).attr("club_no");
				var club_name = $(this).attr("club_name");
				
				$("#user_disagree_modal").modal("show");
				$("#user_disagree_yes").on("click",function(){
					var url = "club_apply_disagree.do?club_no="+club_no+"&user_id="+user_id+"&club_name="+club_name;
					ajaxGet(url, function(rt){
						if(rt=="ok"){
							$("#user_disagree_modal").modal("hide");
							$("#basic_mobody").text("사용자를 거절 하였습니다.");
							$("#basic_modal").modal("show");
							
							$("#basic_modal").on("hidden.bs.modal",function(){
								$("#basic_modal").modal("hide");
								location.reload();
							});
						}else{
							$("#user_disagree_modal").modal("hide");
							$("#basic_mobody").text("사용자 거절을 실패 하였습니다.");
							$("#basic_modal").modal("show");
							$("#basic_modal").on("hidden.bs.modal",function(){
								$("#basic_modal").modal("hide");
								location.reload();
							});
						}
					});
				});
				$("#user_disagree_no").on("click",function(){
					$("#user_disagree_modal").modal("hide");
				});
			});
			
			/* 모임 신청자 수락 버튼 클릭시 이벤트 발생 */
			$(".agree").on("click",function(){
				var user_id = $(this).attr("user_id")
				var club_no = $(this).attr("club_no")
				var club_name = $(this).attr("club_name");
				
				$("#user_agree_modal").modal("show");
				$("#user_agree_yes").on("click",function(){
					$("#agree_id").attr("value",user_id);
					$("#agree_no").attr("value",club_no);
					$("#agree_name").attr("value",club_name);
					var formData = $("#agree_frm").serialize();
					$.ajax({
						type : "POST",
						url : "club_apply_agree.do",
						data : formData,
						success	: function(rt) {
							if(rt=="10000"){
								$("#user_agree_modal").modal("hide");
								$("#basic_mobody").text("사용자가 모임에 가입되었습니다.");
								$("#basic_modal").modal("show");
								$("#basic_modal").on("hidden.bs.modal",function(){
									$("#basic_modal").modal("hide");
									location.reload();
								});
							}else if(rt=="10001"){
								$("#user_agree_modal").modal("hide");
								$("#basic_mobody").text("정원이 다 되어서 가입이 불가능합니다.");
								$("#basic_modal").modal("show");
								$("#basic_modal").on("hidden.bs.modal",function(){
									$("#basic_modal").modal("hide");
									location.reload();
								});
							}else{
								$("#user_agree_modal").modal("hide");
								$("#basic_mobody").text("사용자 신청 처리가 실패 되었습니다.");
								$("#basic_modal").modal("show");
								$("#basic_modal").on("hidden.bs.modal",function(){
									$("#basic_modal").modal("hide");
									location.reload();
								});
							}
					    }
					});
				});
				$("#user_agree_no").on("click",function(){
					$("#user_agree_modal").modal("hide");
				});
			});
			
			/* 공지사항,자유게시판 글쓰기 버튼 클릭 시 이동  */
			$("#noticeBtn").on("click",function(){
				$("#text_modal").modal("show");
				$("#text_modal_yes").on("click",function(){
					$("#text_modal_modal").modal("hide");
					location.href="club_add_community_notice.do?club_no="+${vo.club_no};
				});
				$("#text_modal_no").on("click",function(){
					$("#text_modal").modal('hide');
				});
			});
			
			$("#boardBtn").on("click",function(){
				$("#text_modal").modal("show");
				$("#text_modal_yes").on("click",function(){
					$("#text_modal_modal").modal("hide");
					location.href="club_add_community_board.do?club_no="+${vo.club_no};
				});
				$("#text_modal_no").on("click",function(){
					$("#text_modal").modal('hide');
				});
			});
			
			/* 해체하기, 혹은 탈퇴하기 버튼을 눌렀을 때 실행*/
			$("#delClub").on("click",function(){
				/*쿠키의 user_id와 모임의 user_id가 같을 때 즉 마스터이면 모임 해체가 가능하다*/
				if('${user_id}'=='${vo.user_id}'){
					$("#del_club_modal").modal("show");
					$("#del_club_yes").on("click",function(){
						var url = "club_del_club.do?club_no="+${vo.club_no};
						ajaxGet(url,function(rt){
							if(rt=="ok"){
								$("#del_club_modal").modal("hide");
								$("#basic_mobody").text("모임이 해체 되었습니다.");
								$("#basic_modal").modal("show");
								$("#basic_modal").on("hidden.bs.modal",function(){
									$("#basic_modal").modal("hide");
									location.href="club_home.do";
								});
							}else{
								$("#del_club_modal").modal("hide");
								$("#basic_mobody").text("모임 해체가 실패 되었습니다.");
								$("#basic_modal").modal("show");
								$("#basic_modal_Yes").on("click",function(){
									$("#basic_modal").modal("hide");
									location.reload();
								});
							}
						});
					});
					$("#del_club_no").on("click",function(){
						$("#del_club_modal").modal('hide');
					});
				}else{
					/*그게 아니라면 일반 회원 이므로 유저 탈퇴로 실행*/
					$("#del_user_modal").modal("show");
					$("#del_user_yes").on("click",function(){
						var url = "club_del_user.do?club_no="+${vo.club_no};
						ajaxGet(url,function(rt){
							if(rt=="ok"){
								$("#del_user_modal").modal("hide");
								$("#basic_mobody").text('${vo.club_name}'+"모임에서 탈퇴 되었습니다.");
								$("#basic_modal").modal("show");
								$("#basic_modal").on("hidden.bs.modal",function(){
									$("#basic_modal").modal("hide");
									location.href="club_home.do";
								});
							}else{
								$("#del_user_modal").modal("hide");
								$("#basic_mobody").text("모임 탈퇴가 실패 되었습니다.");
								$("#basic_modal").modal("show");
								$("#basic_modal_Yes").on("click",function(){
									$("#basic_modal").modal("hide");
									location.reload();
								});
							}//end if
						});//end ajaxGet
					});
					$("#del_user_no").on("click",function(){
						$("#del_user_modal").modal('hide');
					});//취소 버튼 클릭시 이벤트
				}//end if
			});//delClub function
			
			/* 마스터 이외에게 신청 현황 리스트, 공지쓰기 버튼 보여주지 않기*/
			if('${user_id}'!='${vo.user_id}'){
				$("#applyList").attr("style","display:none");
				$("#noticeBtn").attr("style","display:none");
				$("#delClub").attr("value","탈퇴하기");
			}
			
			// 이름 클릭하면 쪽지 보낼 팝업창 띄우기
			$(".user_name").on("click",function(){
				$("#receive_user_id").attr("value",$(this).attr("user_id"));
				$("#message_modal").modal("show");
			});
			$("#message_modal_yes").on("click",function(){
				send_message();
			});
			$("#message_modal_no").on("click",function(){
				$("#message_modal").modal("hide");
			});
			
			/* msg_content modal창이 사라지면 무조건 content 내용 초기화 */
			$("#message_modal").on("hidden.bs.modal",function(){
				$("#msg_content").val("");
			});
			
			var send_message = function(){
				var formData = $("#message_frm").serialize();
				$.ajax({
					type : "POST",
					url : "club_add_message.do",
					data : formData,
					success	: function(rt) {
						if(rt=="ok"){
							$("#message_modal").modal("hide");
							$("#basic_mobody").html("<h4>쪽지를 보냈습니다.</h4>");
							$("#basic_modal").modal("show");
							$("#basic_modal").on("hidden.bs.modal",function(){
								$("#basic_modal").modal("hide");
							});
						}else{
							$("#message_modal").modal("hide");
							$("#basic_mobody").html("<h4>쪽지 전송 처리가 실패 되었습니다.</h4>");
							$("#basic_modal").modal("show");
							$("#basic_modal").on("hidden.bs.modal",function(){
								$("#basic_modal").modal("hide");
							});
						}
				    }
				});
			}
			
			/* 뒤로가기 버튼 클릭 시 club_home.do로 이동*/
			$("#prev").on("click",function(){
				location.href="club_home.do";
			});
			
			
			/* 네비바 관련 script */
			var scOffset = $( '.navbar-Menu' ).offset();
			$( window ).scroll( function() {
				if ( $( document ).scrollTop() > scOffset.top ) {
					$( '.navbar' ).addClass( 'navbar-fixed-top' );
				}
				else {
					$( '.navbar' ).removeClass( 'navbar-fixed-top' );
				}
			});
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
		 	
		});
		
		/* 페이징 function */
		function notice_list(page){
			$("#cur_notice_page").attr("value",page);
			$("#paging_frm").submit();
		}
		function board_list(page){
			$("#cur_board_page").attr("value",page);
			$("#paging_frm").submit();
		}
		/* 페이징 function */
	</script>
</body>
</html>