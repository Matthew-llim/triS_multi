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
	
	<form id="add_frm">
		<label>제목 : </label><input name="c_notice_title" type="text"/><br/>
		<label>내용 : </label><textarea name="c_notice_content" rows="15" cols="25"></textarea><br/>
		
		<input name="club_no" type="hidden" value="${club_no}"/>
		<input name="user_id" type="hidden" value="${user_id}"/>
		<input id="text_submit"type="button" value="등록"/><input id="cancel" type="button" value="취소"/>
	</form>
	
	<!-- 글 등록 modal창 시작 -->
	<div id="text_add_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="text_add_head" class="modal-header" align="center"><h4>글 등록</h4></div>
				<div id="text_add_body" class="modal-body" align="center">
					글을 등록 하시 겠습니까?
				</div>
				<div id="ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='text_add__Yes'>등록</button>
					<button type='button' class='btn btn-primary' id='text_add__No'>취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 글 등록 modal창 끝 -->
	
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
	
	<!-- 자바스크립트 -->
	<script type="text/javascript">
		$(document).ready(function(){
			//글 등록 하기 버튼 클릭 시 이벤트 발생
			$("#text_submit").on("click",function(){
				$("#text_add_modal").modal("show");
				$("#text_add__Yes").on("click",function(){
					var formData = $("#add_frm").serialize();
					$.ajax({
						type : "POST",
						url : "club_add_community_notice_submit.do",
						data : formData,
						success	: function(rt) {
							if(rt=="ok"){
								$("#text_add_modal").modal("hide");
								$("#basic_mobody").text("글이 등록 되었습니다.");
								$("#basic_modal").modal("show");
								$("#basic_modal_Yes").on("click",function(){
									$("#basic_modal").modal("hide");
									location.href="club_community.do?club_no="+${club_no};
								});
							}else{
								$("#text_add_modal").modal("hide");
								$("#basic_mobody").text("글 등록 처리가 실패 되었습니다.");
								$("#basic_modal").modal("show");
								$("#basic_modal_Yes").on("click",function(){
									$("#basic_modal").modal("hide");
									location.reload();
								}); 
							}
					    }
					});
				});
				$("#mod_modal_No").on("click",function(){
					$("#mod_modal").modal("hide");
				});
			});
			
			//취소 버튼 클릭 시 이벤트 발생
			$("#cancel").on("click",function(){
				location.href="club_community.do?club_no="+${club_no};
			});
			
			/* 네비 바 부분 */
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
		 	/* 네비 바 부분 */
		});
	</script>
</body>
</html>

