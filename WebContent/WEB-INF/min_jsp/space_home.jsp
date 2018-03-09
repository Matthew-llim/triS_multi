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
 	$(document).ready(function(){
 		if("${user.grade}" == "2"){
 			$("#add_space").css("display","block");
 		}
 		
 		$('#boy').on("load",function(){
 			var h = this.contentWindow.document.body.offsetHeight;
 			$(this).height(h);
 		});
 		

 		if("${space_code }"=="20007"){
			$("#status-modal-body").html("판매자만 공간 등록이 가능합니다");
			$("#status-modal").modal('show');
		}else if("${space_code}"=="20006"){
			$("#status-modal-body").html("게시글이 삭제되었습니다.");
			$("#status-modal").modal('show');
		}
 		
 		$("#status-modal").on("hidden.bs.modal",function(){
			location.replace("space_home.do");
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
		<H1>공간 홈</H1>

		

		<form target="boy" action="space_home_iframe.do">
			<div class="form-group">
				<label for="s_category_no">카테고리</label>
				<jl:forEach var="category" items="${category_list }">
					<label class="radio-inline"><input type="radio" name="s_category_no" value="${category.s_category_no }">${category.s_category_name }</label>
				</jl:forEach>
			</div>
			<div class="form-group">
				<label for="l_category_no">지역</label>
				<jl:forEach var="local" items="${local_list }">
					<label class="radio-inline"><input type="radio" name="l_category_no" value="${local.l_category_no }">${local.l_category_name }</label>
				</jl:forEach>
			</div>
			<select name="search_option">
				<option value="0"></option>
				<option value="1">제목</option>
				<option value="2">내용</option>
				<option value="3">제목+내용</option>
			</select>
			<input type="text" name="search_content"/>
			<input type="submit" value="제출">
		</form>
		<hr/>
		<iframe id="boy" name="boy" src="space_home_iframe.do" width="100%" frameborder="0"></iframe>
		<a href="space_add.do" id="add_space" style="display: none;">공간 등록</a>
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
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
			
		
</body>
</html>