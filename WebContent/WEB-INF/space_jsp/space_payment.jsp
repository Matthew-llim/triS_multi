<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@taglib prefix="jl"
	uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="./Resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="./Resources/css/responsive.css">

<script type="text/javascript" src="./Resources/js/jquery.js"></script>
<script type="text/javascript" src="./Resources/js/main.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>
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
		<h1>결제페이지</h1>
		<hr>
		
		<p class="text-center">아래의 정보로 예약하시겠습니까?</p>
		<hr>
		<div class="panel panel-info">
			<div class="panel-heading pay_color">
				<h3 class="panel-title">호스트&공간 정보</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-condensed">
						<thead>
							<tr>
								<th class="text-center">호스트 이름</th>
								<th class="text-center">공간 이름</th>
								<th class="text-center">연락처</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="text-center">${host.host_name }</td>
								<td class="text-center">${space.space_title }</td>
								<td class="text-right">${space.space_call }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">예약 정보</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="text-center gr"><strong>예약금액</strong></td>
								<td>${booking.booking_price }</td>
								<td class="text-center gr"><strong>예약 인원</strong></td>
								<td>${booking.booking_people }</td>
							</tr>
							<tr>
								<td class="text-center gr"><strong>예약날짜</strong></td>
								<td>${booking.booking_date }</td>
								<td class="text-center gr"><strong>예약시간</strong></td>
								<td>${booking.start_time }~ ${booking.end_time }시</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">예약자 정보</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="text-center gr" width="20%"><strong>예약자</strong></td>
								<td>${booking.booking_user_name }</td>
							</tr>
							<tr>
								<td class="text-center gr" width="20%"><strong>전화번호 </strong></td>
								<td>${booking.booking_phone }</td>
							</tr>
							<tr>
								<td class="text-center gr" width="20%"><strong>요청사항 </strong></td>
								<td>${booking.booking_message }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>


	<div class="text-center">
		<h3>계좌정보 : ${host.host_account }</h3>
		<form method="POST" action="space_payment_clear.do">
			<input type="hidden" value="${booking.space_no }" name="space_no">
			<input type="hidden" value="${booking.user_id }" name="user_id">
			<input type="hidden" value="${booking.booking_date }"
				name="booking_date"> <input type="hidden"
				value="${booking.start_time }" name="start_time"> <input
				type="hidden" value="${booking.end_time }" name="end_time">
			<input type="hidden" value="${booking.booking_people }"
				name="booking_people"> <input type="hidden"
				value="${booking.booking_price }" name="booking_price"> <input
				type="hidden" value="${booking.booking_user_name }"
				name="booking_user_name"> <input type="hidden"
				value="${booking.booking_phone }" name="booking_phone"> <input
				type="hidden" value="${booking.booking_email }" name="booking_email">
			<input type="hidden" value="${booking.booking_message }"
				name="booking_message"> <input type="submit" value="예약하기"
				class="btn btn-info btn-lg">
			<input type="hidden" value="${club_list }" name="club_list">
		</form>
		<br/>
		<br/>
	</div>
	<!-- ******************************* footer ******************************* -->
	<%@include file="./jsp/footer.jsp"%>
	<!--  end footer  -->
</body>
</html>