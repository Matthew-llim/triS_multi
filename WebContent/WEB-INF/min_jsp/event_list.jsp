<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>


	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script>
	$(document).ready(function(){

		var scOffset = $( '.navbar-Menu' ).offset();
		$( window ).scroll( function() {
		if ( $( document ).scrollTop() > scOffset.top ) {
		$( '.navbar' ).addClass( 'navbar-fixed-top' );
		}
		else {
		$( '.navbar' ).removeClass( 'navbar-fixed-top' );
		}
		});




		});

	</script>
</head>
<body>
	
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

	<br/>
	
	<table border="1" cellspacing="0" cellpadding="8">
	
		<jl:forEach var="vo" items="${rl}">
			<tr>
				<td>${vo.eve_no}</td>
				<td><a href="event_read.do?eve_no=${vo.eve_no}"><img src="thumbnail/${vo.eve_thumb_img}" height="100" width="100"/></a></td>
				<td>
					<a href="event_read.do?eve_no=${vo.eve_no}">${vo.eve_title}</a>
				</td>
				<td>${vo.the_time} </td>
			</tr>
		</jl:forEach>
	</table>
		
		
	<br/>
	<form action="event_add.do" method="GET">
		<input type="submit" value="이벤트 등록">
	</form>
	
</body>
</html>