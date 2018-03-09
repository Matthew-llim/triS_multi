<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	
	<script type="text/javascript" src="common.js"></script>
	
	<style>
	</style>
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
			     <li><a href="home_login.do">로그인</a></li>		
			</ul>
		
			   </div>
			</div>
		</nav>
		<!-- nav -->
	<div class="container">
		<h2>모임장/모임신청자 페이지</h2>
		<label>${vo.club_name}</label><br/>
		<label>인원</label><input type="text" value="${vo.user_count+1}" disabled="disabled"/><br/>
		<label>소개</label><textarea rows="15" cols="30" disabled="disabled">소개글 : ${vo.club_title}
내용 : ${vo.club_content}</textarea><br/>
		<input id="clubApply" type="button" value="신청하기" style="display: none">
		<input id="moveCommunity" type="button" value="모임커뮤니티 가기" style="display: none">
		<br/><br/><br/>
		
		<h3>모임 장소 추천 페이지(이미지 슬라이딩으로 구현 예정)</h3>
		<%-- <div class="cycle-slideshow" align="center"
			data-cycle-fx="scrollHorz"
			data-cycle-pause-on-hover="true"
			data-cycle-speed="200">
			<jl:forEach items="${sVO}" var="svo">
				<a href="space_detail.do?space_no=${svo.space_no}">
				<img src="thumbnail/${svo.space_thumb_img}" alt="공간 사진 없음"/></a>
			</jl:forEach>
		    <img src="thumbnail/abc.jpg"/>
		    <img src="thumbnail/Penguins.jpg"/>
		    <img src="thumbnail/Tulips.jpg"/>
	    </div> --%>
	    <div id="img_slide">
			<jl:forEach items="${sVO}" var="svo">
				<a href="space_detail.do?space_no=${svo.space_no}">
				<img src="thumbnail/${svo.space_thumb_img}" alt="공간 사진 없음"/></a>
			</jl:forEach>
	    </div>
		
		<!-- modal창 시작 -->
		<form id="frm" action="club_apply.do" method="post">
			<div id="modal" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-head" align="center">
							<h4>모임 신청</h4>
						</div>
						<div class="modal-body" align="center"><h3 id="modalbody">
							<textarea name="apply_content" id="apply_content" class='form-control' rows="7" placeholder="자기소개를 입력하세요"></textarea>
							<input name="user_id" type="hidden"value="${user_id}"/>
							<input name="club_no" type="hidden"value="${vo.club_no}"/>
						</h3></div>
						<div id="ft" class="modal-footer">
							<button type='button' class='btn btn-default' id='modal-btn-Yes'>등록</button>
							<button type='button' class='btn btn-primary' id='modal-btn-No'>취소</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- modal창 끝 -->
		
		<!-- 모임커뮤니티 이동페이지 post방식으로 설정 -->
		<div style="display: none">
			<form id="move_frm" action="club_community.do" method="post">
				<input name="club_no" type="hidden" value="${vo.club_no}"/>
			</form>
		</div>
		<!-- 기본 modal창 시작 -->
		<div id="basic_modal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="basic_mobody" class="modal-body" align="center"></div>
					<div id="basic_ft" class="modal-footer">
						<button type='button' class='btn btn-default' id='basic_modal_Yes'>확인</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 기본 modal창 끝 -->
	</div>	
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			/* 기본 모달창 확인 버튼 클릭하면 숨기기 */
			$("#basic_modal_Yes").on("click",function(){
				$("#basic_modal").modal("hide");
			});
			
			//flag와 user_id를 이용해서 신청버튼과 모임커뮤니티 버튼 조정.
			if('${user_id}'=='${vo.user_id}'||'${user_id}'=='admin'||'${flag}'==''){
				$("#moveCommunity").attr("style","display:inline;");
			}else{
				if('${flag}'=='10001'){
					$("#clubApply").attr("style","display:inline;");
					$("#clubApply").attr("value","신청 중");
					$("#clubApply").attr("disabled","disabled");
				}else if('${user_id}'==''){}
				else if('${flag}'=='10000'){
					$("#clubApply").attr("style","display:inline;");
				}
			}
			
			/* 클럽 신청 이벤트 */
			$("#clubApply").on("click",function(){
				$("#modal").modal();
				$("#modal-btn-Yes").on("click",function(){
					var formData = $("#frm").serialize();
					$.ajax({
						type : "POST",
						url : "club_apply.do",
						data : formData,
						success	: function(rt) {
							if(rt=="10000"){
								$("#modal").modal("hide");
								$("#basic_mobody").html("<h4>모임 신청이 되었습니다.</h4>");
								$("#basic_modal").modal("show");
								$("#basic_modal").on("hidden.bs.modal",function(){
									location.reload();
								});
							}else if(rt=="10001"){
								$("#modal").modal("hide");
								$("#basic_mobody").html("<h4>신청 처리가 실패 되었습니다.</h4>");
								$("#basic_modal").modal("show");
								$("#basic_modal").on("hidden.bs.modal",function(){
									$("#basic_modal").modal("hide");
									location.reload();
								});
							}
					    }
					});
				});
				$("#modal-btn-No").on("click",function(){
					$("#modal").modal('hide');
				});
			});
			/* 모임커뮤니티 이동하는 이벤트 */
			$("#moveCommunity").on("click",function(){
				$("#move_frm").submit();
			});

			/* 네비바 관련 script */
			var scOffset = $( '.navbar-Menu' ).offset();
			$( window ).scroll( function() {
				if ( $( document ).scrollTop() > scOffset.top+50 ) {
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
			$("#user_name").text(rt+"님이 로그인하셨습니다.");
				}
			});
		 	
		 	/* 이미지 슬라이드 구현 */
		 	$("img").css("width",200);
		 	setInterval(function(){
		 		$("#img_slide").append($("img").first());
		 	},2000);
		 	
		});
		
	</script>	
	
</body>
</html>