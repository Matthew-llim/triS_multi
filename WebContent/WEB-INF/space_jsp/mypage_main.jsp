<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-112826214-1', 'auto');
ga('send', 'pageview');
</script>
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

<style type="text/css">

iframe {
	display: block;
	border: none;
	width: 100%;
	height: 919px;
	align:center;
}



.mypage_main {
	height: 100%;
	
}


.mypage_main ul {
	display: inline;
	list-style-type: none;
	margin: 10px;
	padding: 10px;
	height: 100%;
	
}

.mypage_main li:hover {
    background: rgba(28, 54, 85, .2) !important;
	
}

.mypage_main .active {
    background: rgba(28, 54, 85, .2) !important;
	
}

.mypage_main li a {
	color: black;
    position: relative;
    display: block;
    padding: 20px 15px;
}

.mypage_content_row{
	margin-top : 50px !important;
}

.li_bold{
	font-weight : bold !important;
	 background: rgba(28, 54, 85, .2) !important;
}

</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="common.js"></script>
	
	<script>
	$(document).ready(function(){
		
	/* ************************** top_nav - 상단고정 ************************** */	
		
		var scOffset = $('.navbar-Menu').offset(); //top_nav의 현재 좌표 구함.
		
		$(window).scroll(function() {
			if ($(document).scrollTop() > scOffset.top+50) {
				$('.navbar').addClass('navbar-fixed-top');
			} else {
				$('.navbar').removeClass('navbar-fixed-top');
			}
		});

	/* ************************** top_nav - 로그인 ************************** */	
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
		
 		
 	/* ************************** 쪽지함 ************************** */	
 		
 		
		$("#receiveMessageBox").hide();
		$("#sendMessageBox").hide();
		$("#sendMessage").hide();
		
		$("#message_nav").on("click",function(e){
			if($("#receiveMessageBox").css("display") == "none"){
				$("#receiveMessageBox").show();
				$("#sendMessageBox").show();
				$("#sendMessage").show();
			} else {
				$("#receiveMessageBox").hide();
				$("#sendMessageBox").hide();
				$("#sendMessage").hide();
			}
		});
		
		
		
		$("#reflag1").on("click",function(){
			$("#flag1").attr("src","myinfo_ckpass.do");
		});
		
		$("#reflag2").on("click",function(){
			$("#flag2").attr("src","mypage_moveMypageBookingPage.do");
		});
		
		$("#reflag3").on("click",function(){
			$("#flag3").attr("src","bookmark_findAll.do");
		});
		
		$("#reflag4").on("click",function(){
			$("#flag4").attr("src","mypage_moveMypageQnAPage.do");
		});
		
		$("#reflag5").on("click",function(){
			$("#flag5").attr("src","myclub_findAll.do");
		});
		$("#reflag6").on("click",function(){
			$("#flag6").attr("src","mypage_review_findAll.do");
		});
		
		$("#reflag7").on("click",function(){
			$("#flag7").attr("src","mypage_moveMypageReceiveMessagePage.do");
		});
		$("#receiveMessageBox").on("click",function(){
			$("#flag7").attr("src","mypage_moveMypageReceiveMessagePage.do");
		});
		
		$("#sendMessageBox").on("click",function(){
			$("#flag8").attr("src","mypage_moveMypageSendMessagePage.do");
		});
		
		$("#reflag10").on("click",function(){
			$("#flag10").attr("src","myhost_findAll.do");
		});
		$("#reflag11").on("click",function(){
			$("#flag10").attr("src","myhost_findAll.do");
		});
		
		
	});



	
	</script>
</head>
<body>


	<!-- *********************  header  ************************ -->
         <%@include file="./jsp/header_mypage.jsp"%>  
	<!-- *********************  header - end  ************************ -->
	


<div class="container-fluid">

	
	<div class="row mypage_main">
			<div class="col-sm-2 ">
				<ul class="nav">
					<li class="active li_bold"><a data-toggle="tab" href="#myInfo"id="reflag1">[내
							정보]</a></li>
					<li id="reflag2"><a data-toggle="tab" href="#myBooking">구매 정보</a></li>
					<li id="reflag3"><a data-toggle="tab" href="#myBookmark">즐겨찾기</a></li>
					<li id="reflag4"><a data-toggle="tab" href="#myQna">Q&A</a></li>
					<li id="reflag5"><a data-toggle="tab" href="#myClub">내 모임</a></li>
					<li id="reflag6"><a data-toggle="tab" href="#myReview">내 후기</a></li>
					<li id="reflag7"><a data-toggle="tab" id="message_nav" href="#myReceiveMessageBox">쪽지 함</a></li>
						
					<ul class="sub_message_nav">
						<li id="receiveMessageBox" class="active"><a
							data-toggle="tab" href="#myReceiveMessageBox">받은 쪽지함</a></li>
						<li id="sendMessageBox"><a data-toggle="tab" href="#mySendMessageBox">보낸 쪽지함</a></li>
						<li id="sendMessage"><a data-toggle="tab" href="#mySendMessage">쪽지 보내기</a></li>
					</ul>

					<li id="reflag10" class="li_bold"><a data-toggle="tab" href="#sellerWrite">[판매자]</a></li>
					<li id="reflag11"><a data-toggle="tab" href="#sellerWrite">내 글</a></li>
				</ul>
			</div>


	<div class="tab-content col-sm-10 mypage_content_row" >
		<div id="myInfo"  class="tab-pane active fade in">	
			<iframe class="mypage_iframe" src="myinfo_ckpass.do"  align="center" id="flag1"></iframe>
		</div>
		<div id="myBooking" class="tab-pane fade">
			<iframe class="mypage_iframe" src="mypage_moveMypageBookingPage.do"  align="center" id="flag2"></iframe>
		</div>
		<div id="myBookmark"   class="tab-pane fade">
			<iframe class="mypage_iframe" src="bookmark_findAll.do"  align="center" id="flag3"></iframe>
		</div>
		<div id="myQna"   class="tab-pane fade">
			<iframe class="mypage_iframe" src="mypage_moveMypageQnAPage.do"  align="center" id="flag4"></iframe>
		</div>
		<div id="myClub"   class="tab-pane fade">
			<iframe class="mypage_iframe" src="myclub_findAll.do"  align="center" id="flag5"></iframe>
		</div>
		<div id="myReview"   class="tab-pane fade">
			<iframe class="mypage_iframe"  src="mypage_review_findAll.do"  align="center" id="flag6"></iframe>
		</div>
		<div id="myReceiveMessageBox"   class="tab-pane fade">
			<iframe class="mypage_iframe" src="mypage_moveMypageReceiveMessagePage.do"  align="center" id="flag7"></iframe>
		</div>
		<div id="mySendMessageBox"   class="tab-pane fade">
			<iframe class="mypage_iframe" src="mypage_moveMypageSendMessagePage.do"  align="center" id="flag8"></iframe>
		</div>
		<div id="mySendMessage"   class="tab-pane fade">
			<iframe class="mypage_iframe" src="mypage_moveMypageWriteMessagePage.do"  align="center" id="flag9"></iframe>
		</div>
		
		<!-- **************** 마이페이지-판매자 *************** -->
		
		<div id="sellerWrite"   class="tab-pane fade">
			<iframe src="myhost_findAll.do"  align="center" id="flag10"></iframe>
		</div>
		
	</div>
	
	</div>

</div>
</body>
</html>
