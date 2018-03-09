<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
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
	
	<div class="container">
		<form id="club_add_frm">
			<label>클럽이름</label><input id="club_name" name="club_name" type="text"><br/>
			<label>제목</label><input id="club_title" name="club_title" type="text"><br/>
			<label>인원</label><input id="max_member" name="max_member"type="number"><br/>
			<label>소개</label><textarea id="club_content" name="club_content" rows="3" cols="24"></textarea><br/>
			<label>사진등록</label><input id="club_thumb_img" name="club_thumb_img" type="file"><br/>
			<select id="l_category_no" name="l_category_no">
				<option>지역선택</option>
				<jl:forEach items="${lmap}" var="m">
					<option value="${m.l_category_no}">${m.l_category_name}</option>
				</jl:forEach>
			</select>
			<select id="c_category_no" name="c_category_no">
				<option>분야선택</option>
				<jl:forEach items="${cmap}" var="c">
					<option value="${c.c_category_no}">${c.c_category_name}</option>
				</jl:forEach>
			</select>
			<input name="user_id" type="hidden" value="${user_id}">
			<input id="submit_btn" type="button" value="등록하기"><input id="cancel" type="button" value="취소하기">
		</form>
	</div>
	
	<!-- 모임 등록 modal창 시작 -->
	<div id="club_add_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="club_add_head" class="modal-header" align="center"><h4>모임 등록</h4></div>
				<div id="club_add_body" class="modal-body" align="center">
					모임을 등록 하시 겠습니까?
				</div>
				<div id="ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='club_add_yes'>등록</button>
					<button type='button' class='btn btn-primary' id='club_add_no'>취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모임 등록 modal창 끝 -->
	
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
			// 기본 모달창 확인 버튼 클릭 시 이벤트 발생
			$("#basic_modal_Yes").on("click",function(){
				$("#basic_modal").modal("hide");
			});
			
			// 모임 등록 버튼 클릭 시 이벤트 발생
			$("#submit_btn").on("click",function(){
				$("#club_add_modal").modal("show");
				$("#club_add_yes").on("click",function(){
					var frm = $("#club_add_frm")[0];
					var formData = new FormData(frm);
					$.ajax({
						type : "POST",
						url : "club_add_page_submit.do",
						data : formData,
						processData: false,
	                    contentType: false,
						success	: function(rt) {
							if(rt=="ok"){
								$("#club_add_modal").modal("hide");
								$("#basic_mobody").text("모임이 등록 되었습니다.");
								$("#basic_modal").modal("show");
								$("#basic_modal").on("hidden.bs.modal",function(){
									$("#basic_modal").modal("hide");
									location.href="club_home.do";
								});
							}else{
								alert(rt);
								$("#club_add_modal").modal("hide");
								$("#basic_mobody").text("모임 등록 처리가 실패 되었습니다.");
								$("#basic_modal").modal("show");
								$("#basic_modal").on("hidden.bs.modal",function(){
									$("#basic_modal").modal("hide");
									location.reload();
								}); 
							}
					    }
					});
				});
				$("#club_add_no").on("click",function(){
					$("#club_add_modal").modal("hide");
				});
			});//submit.on click
			
			
			
			$("#cancel").on("click",function(){
				location.href="club_home.do";
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
		});
	</script>
</body>
</html>