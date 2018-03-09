<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<script type="text/javascript" src="common.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css"> 
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	
		.complete {
			width: 100%;
			height : 500px;
			text-align: center;
		}
		
		.complete1 {
			display: inline-block;
		}
		
		complete1 table th {
			padding :7px 0;
		}
		
		.complete1 table td {
			padding-left : 22px;
			padding : 7px;
		}
		
		td {
			margin-top: 20px;
		}
		
		body {
			background-color: white;
		}
		
		
	</style>
	
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
	<!-- *********************  header  ************************ -->
	<%@include file="./jsp/header_page.jsp"%>
	<!-- *********************  header - end  ************************ -->
	
	
	<div class="complete">
		<div class="complete1">
			<table class="table">
			<tr>
				<th>${user_id}님 환영합니다.</th>
			</tr>
			<tr>
				<td><a href="main.html" >main으로 돌아가기</a></td>
			</tr>
			</table>
		</div>
	</div>
	
		<!-- ******************************* footer ******************************* -->
	<%@include file="./jsp/footer.jsp"%>
	<!--  end footer  -->
	
	
</body>
</html>