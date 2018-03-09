<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="common.js" type="text/javascript"></script>
<script src="common.js" type="text/javascript"></script>
<script src="common.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<DIV class="container">
		<h1>주문하신 공간 예약이 완료되었습니다.</h1>
	         <hr>  
	          <p>${user_id } 고객님 저희 MSSPACE를 이용해 주셔서 대단히 감사드립니다. <br>
	            고객님께서 <strong>${booking.du_time }</strong> 구매하신 상품에 대한 금액 <strong>${booking.booking_price }</strong> 원이 예약완료 되었습니다.</p>
	        <hr>
	   	<div class="panel panel-info">
          <div class="panel-heading">
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
                    <td>${booking.booking_price } </td>  
                    <td class="text-center gr"><strong>예약 인원</strong></td>
                    <td>${booking.booking_people }</td>
                  </tr>
                  <tr>
                    <td class="text-center gr"><strong>예약날짜</strong></td>
                     <td>${booking.booking_date }</td>
                    <td class="text-center gr"><strong>예약시간</strong></td>
                    <td>${booking.start_time } ~ ${booking.end_time }시</td>
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
                    <td class="text-center gr" width="20%"><strong>예약자</strong> </td>
                    <td>${booking.booking_user_name }</td>
                  </tr>
                  <tr>
                    <td class="text-center gr" width="20%"><strong>전화번호 </strong></td>
                     <td>${booking.booking_phone }</td>
                  </tr>
                  <tr>
                    <td class="text-center gr" width="20%"><strong>요청사항  </strong></td>
                     <td>${booking.booking_message }</td>
                  </tr>                  
                </tbody>
              </table>
            </div>
          </div>
          </div>
          
           <div class="panel panel-info">
          <div class="panel-heading">
            <h3 class="panel-title">환불 안내</h3>
          </div>
          <div class="panel-body">
            <div class="table-responsive">
              <table class="table table-bordered">
                <tbody>
                  <tr>
                    <td class="text-center gr"><strong>예약 5일전까지</strong> </td>
                    <td>금액의 100%</td>
                  </tr>
                  <tr>
                    <td class="text-center gr"><strong>예약 4일전 </strong></td>
                     <td>금액의 80%</td>
                  </tr>
                  <tr>
                    <td class="text-center gr"><strong>예약 3일전  </strong></td>
                     <td>금액의 50%</td>
                  </tr>                  
                  <tr>
                    <td class="text-center gr"><strong>예약 2일전  </strong></td>
                     <td>금액의 20%</td>
                  </tr>                  
                  <tr>
                    <td class="text-center gr"><strong>예약 당일  </strong></td>
                     <td>환불 불가</td>
                  </tr>                  
                </tbody>
              </table>
            </div>
          </div>

    </div>
	</DIV>
	<!-- ******************************* footer ******************************* -->
	<%@include file="./jsp/footer.jsp"%>
	<!--  end footer  -->
</body>
</html>