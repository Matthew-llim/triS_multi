<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="common.js"></script>
	<style>
		table, tr, td{
			border: 1px solid;
		}
		
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
		<h2>모임 페이지</h2>
		
		<form id="frm" target="club_list" action="club_list.do" method="post">
			<div style="display: inline;">
				<h4>지역별 선택</h4>
				<jl:forEach items="${lmap}" var="l" varStatus="i">
					<input num="${i.count}" class="a" type="radio" value="${l.l_category_no}" name="l_category_no" />${l.l_category_name}
				</jl:forEach>
				<br/>
				<h4>분야별 선택</h4>
				<jl:forEach items="${cmap}" var="c">
					<input type="radio" value="${c.c_category_no}" name="c_category_no" />${c.c_category_name}
				</jl:forEach>
			</div><br/>
			<select name="search_option">
				<option value="0"></option>
				<option value="1">제목</option>
				<option value="2">내용</option>
				<option value="3">제목+내용</option>
				<option value="4">작성자</option>
			</select>
			<input type="text" name="search_content"/>
			<br/><input type="button" id="submitBtn" value="검색">
			<input id="curPage" name="curPage" type="hidden" value="">
		</form>
		<br/><br/>
		
		<div>
			<iframe name="club_list" width="100%" height="100%"></iframe>
		</div>
		
		<input id="btn" type="button" value="모임등록"/>
	</div>

	<!-- 자바스크립트 -->	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#a").on("click",function(){
				$(this).attr("checked","checked")
			})
			
			$("#frm").submit();
			
			$("#btn").on("click",function(){
				location.href="club_add_page.do";
			});
			
			$("#submitBtn").on("click",function(){
				$("#curPage").attr("value",1);
				$("#frm").submit();
			});
		});
	
		function setCurpage(page){
			if($("input[name=l_category_no]:checked").val()>0){
				$("#curPage").attr("value","");
			}else{
				$("#curPage").attr("value",page);
			}
			$("#frm").submit();
		}
		
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

	</script>
</body>
</html>