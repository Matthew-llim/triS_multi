<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<script type="text/javascript" src="common.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	var scOffset = $('.navbar-Menu').offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() > scOffset.top) {
			$('.navbar').addClass('navbar-fixed-top');
		} else {
			$('.navbar').removeClass('navbar-fixed-top');
		}
	});

	var url = "chk_login.do";
	ajaxGet(url, function(rt) {

		// 로그인 실패시 : rt값 -> ("/main_html.do")에서 10002 return
		if (rt == "10002") {
			$("#login_nav").hide();
			$("#non_login_nav").show();
		}

		// 로그인 시 : rt값 -> user_name
		else if (rt != "") {
			$("#login_nav").show();
			$("#non_login_nav").hide();
			$("#user_name").text(rt + "님이 로그인하셨습니다.");
		}
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

	${user_id}님 환영합니다.<br>
	<a href="main.html" >main으로 돌아가기</a>
</body>
</html>