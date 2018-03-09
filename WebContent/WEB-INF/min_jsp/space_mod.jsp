<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="common.js" type="text/javascript"></script>
 
 	 <script>
 	 	function openTimeChange() {
 	 		var x = document.getElementById("open_time_range");
 	 		var y = document.getElementById("open_time");
 	 		y.value=x.value;
 	 	}
 	 	
 	 	function closeTimeChange() {
 	 		var a = document.getElementById("close_time_range");
 	 		var b = document.getElementById("close_time");
 	 		b.value=a.value;
 	 	}
 	 	
 	 	$("document").ready(function(){
 	 		$("#sub").on("click",function(){
 	 			$("#open_time").removeAttr("disabled");
 	 			$("#close_time").removeAttr("disabled");
 	 			$("#sub").attr("type","submit");
 	 		});
 	 	});
 	 	
 	 	$("document").ready(function(){
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
	<div class="container">
		<h1>
		ADD
		</h1>
		<form method="POST" action="space_mod2.do">
			<input type="hidden" value="${space.space_no }" name="space_no"/>
			<div class="form-group">
				<label for="space_title">공간 이름</label>
				<input type="text" id="space_title" name="space_title" class="form-control" value="${space.space_title }"/>
			</div>
			<div class="form-group">
				<label for="space_title">공간 소개</label>
				<input type="text" id="space_content" name="space_content" class="form-control" value="${space.space_content }"/>
			</div>
			<!-- 이미지 수정 지금은 안됌 ㅠㅠ...나중에 멀티 파티 리퀘스트로 바꿀것.. 
			<div class="form-group">
				<label for="space_thumb_img">썸네일 이미지</label>
				<input type="file" id="space_thumb_img" name="space_thumb_img" class="form-control" value="${space.space_thumb_img }"/>
			</div>
			 -->
			<div class="form-group">
				<label for="open_time">시작 시간</label>
				<input id="open_time_range" type="range" value="0" min="0" max="24" onchange="openTimeChange();"/>
				<input id="open_time" name="open_time" type="number" min="0" max="24" value="0" disabled="disabled" value="${space.open_time }"/>시
			</div>
			<div class="form-group">
				<label for="close_time">종료 시간</label>
				<input id="close_time_range" type="range" value="24" min="0" max="24" onchange="closeTimeChange();"/>
				<input id="close_time" name="close_time" type="number" min="0" max="24" value="24" disabled="disabled" value="${space.close_time }"/>시
			</div>
			
			<div class="form-group">
				<label for="price">시간당 가격</label>
				<input id="price" type="number" name="price" class="form-control" value="${space.price }"/>
			</div>
			
			<div class="form-group">
				<label for="min_people">최소 인원</label>
				<input id="min_people" type="number" name="min_people" class="form-control" value="${space.min_people }"/>
			</div>
			
			<div class="form-group">
				<label for="max_people">최대 인원</label>
				<input id="max_people" type="number" name="max_people" class="form-control" value="${space.max_people }"/>
			</div>
			
			<div class="form-group">
				<label for="space_call">연락 받을 전화번호</label>
				<input id="space_call" type="tel" name="space_call" class="form-control" value="${space.space_call }"/>
			</div>
			
			<div class="form-group">
				<label for="l_category_no">지역</label>
				<jl:forEach var="local" items="${local_list }">
					<jl:choose>
						<jl:when test="${local.l_category_no eq space.l_category_no }">
							<label class="radio-inline"><input type="radio" name="l_category_no" checked value="${local.l_category_no }">${local.l_category_name }</label>
						</jl:when>
						<jl:otherwise>
							<label class="radio-inline"><input type="radio" name="l_category_no" value="${local.l_category_no }">${local.l_category_name }</label>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
			</div>
			<div class="form-group">
				<label for="s_category_no">카테고리</label>
				<jl:forEach var="category" items="${category_list }">
					<jl:choose>
						<jl:when test="${category.s_category_no eq space.s_category_no }">
							<label class="radio-inline"><input type="radio" name="s_category_no" checked value="${category.s_category_no }">${category.s_category_name }</label>
						</jl:when>
						<jl:otherwise>
							<label class="radio-inline"><input type="radio" name="s_category_no" value="${category.s_category_no }">${category.s_category_name }</label>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
			</div>
			
			<input type="button" id="sub" value="등록"/>
		</form>
	</div>
</body>
</html>