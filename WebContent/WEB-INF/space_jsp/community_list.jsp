<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>Welcome to Multi Space</title>
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	
	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
<!-- 	<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css"> -->
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	
		
	<script type="text/javascript" src="./Resources/js/jquery.js"></script>
	<script type="text/javascript" src="./Resources/js/main.js"></script>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./common.js"></script>
	<style type="text/css">
	
	
.commu_nav-tabs {
	border: 0 !important;
	font-size: 100% !important;
}


</style>
<script>
$(document).ready(function(){
	
	var scOffset = $('.navbar-Menu').offset();
	$(window).scroll(function() {
		if ($(document).scrollTop() > scOffset.top) {
			$('.navbar').addClass('navbar-fixed-top');
		} else {
			$('.navbar').removeClass('navbar-fixed-top');
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
				$("#user_name").text(rt+"님");
			}
		});	
		
		
		
		
	$("#reflag1").on("click",function(){
		$("#flag1").attr("src","community_board_list.do");
	});
	
	$("#reflag2").on("click",function(){
		$("#flag2").attr("src","community_qna_list.do");
	});
	
	$("#reflag3").on("click",function(){
		$("#flag3").attr("src","community_review_list.do");
	});
		
});
</script>
</head>
<body>

	<!-- *********************  header  ************************ -->
         <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ --> 

	<div class="head" id="header">
	
		<ul id="Navtab" class="nav nav-tabs commu_nav-tabs" role="tablist">
			<li class="active" id="reflag1"><a href="#community"  data-toggle="tab"><h2>FREE BOARD</h2></a></li>

			<li id="reflag2"><a href="#qna" data-toggle="tab" ><h2>QnA BOARD</h2></a></li>

			<li id="reflag3"><a href="#review" data-toggle="tab"><h2>REVIEW BOARD</h2></a></li>
		</ul>
	</div>

	<div class="tab-content">
		<div role="tabpanel" class="tab-pane fade active in iframe_div" id="community" aria-labelledby="community">
			<iframe src="community_board_list.do" width='100%' height="780px" id="flag1"></iframe>
		</div>

		<div role="tabpanel" class="tab-pane fade" id="qna" aria-labelledby="qna">
			<iframe src="community_qna_list.do" width='100%' height="780px" id="flag2"></iframe>
		</div>

		<div role="tabpanel" class="tab-pane fade" id="review" aria-labelledby="review">
			<iframe src="community_review_list.do" width='100%' height="780px" id="flag3"></iframe>
		</div>
	</div>

	<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
	<!--  end footer  -->
</body>
</html>