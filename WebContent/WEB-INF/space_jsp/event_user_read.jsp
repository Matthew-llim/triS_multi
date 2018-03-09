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
	<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	
		
	<script type="text/javascript" src="./Resources/js/jquery.js"></script>
	<script type="text/javascript" src="./Resources/js/main.js"></script>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./common.js"></script>
	<style type="text/css">
	.event_user_list .button{
		text-align: center;
		margin-bottom: 40px;
	}
	.event_user_list .table{
		text-align: center;
	}
	</style>
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
	$("#user_name").text(rt+"님");
		}
	 });	
		});

	
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-112826214-1', 'auto');
		ga('send', 'pageview');

	</script>
</head>


<body>	
	<!-- *********************  header  ************************ -->
         <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ -->
	
	
	<div class="container event_user_list">
		<table class="table table-hover">
			<tr><td><h3>EVENT #${text.eve_no}  ${text.eve_title}</h3></td></tr>
			<tr><td><h4>${text.eve_content}</h4></td></tr>
			<tr><td><img src="thumbnail/${text.eve_thumb_img}" height="400" width="400" onerror="this.src='img/no_img.jpg'"/></td></tr>
		</table>
			<div class="button">
				<input type="button"  class="btn btn-primary" value="목록" onclick= "window.location.href='event_user_list.do'">
			</div>
	</div>
	
	<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
	<!--  end footer  -->
</body>
</html>