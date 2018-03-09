<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 김소영 -->
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
		.table {
			text-align: center;
			border-color: green;
		}
		
		.ask {
			text-align: center;
			margin-bottom: 27px;
			margin-top: 27px;
		}
		body {
			background-color: white;
		}
		.faqB {
			margin-top: 27px;
			margin-bottom: 27px;
			text-align: center;
			font-size: 2em;
			font-family: "lato-regular", Helvetica, Arial, sans-serif;
		}
		.panel-title {
			margin-top: 15px;
			margin-bottom: 15px;
		}
	</style>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="common.js" type="text/javascript"></script>

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

	</script>
	
</head>
<body>
	
	<!-- *********************  header  ************************ -->
         <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ -->



	<div class="container">
		<div class="faqB"><h2>FAQ BOARD</h2></div>
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<jl:forEach var="vo" items="${rl}">
				<div class="panel panel-info">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#${vo.faq_no}" aria-expanded="true"
								aria-controls="collapseOne">
							<table>
								<tr>
								<th width="50">${vo.faq_no}</th>
								<th width="400"> ${vo.faq_title}</th>
								</tr>
							</table>
							 </a>
						</h4>
					</div>
					<div id="${vo.faq_no}" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body"><h5>${vo.faq_content}</h5></div>
					</div>
				</div>
			</jl:forEach>
		</div>

		<div class="ask">
			<a href="o2oQnA_add.do">
				<input class="btn btn-primary" type="button" value="1:1 문의하기">
			</a>
			
		</div>
		
	</div>

	<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
	<!--  end footer  -->

</body>
</html>