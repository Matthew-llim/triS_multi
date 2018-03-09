<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	
<script type="text/javascript" src="./Resources/js/jquery.js"></script>
<script type="text/javascript" src="./Resources/js/main.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	 <script src="common.js" type="text/javascript"></script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<script>
	
 	 	
 	 	$(document).ready(function(){
		
 	 		<jl:forEach items="${booking_list }" var="booking">
 	 			var start = "${booking.start_time}";
 	 			var end = "${booking.end_time}";
 	 			for(var x = parseInt(start) ; x <= parseInt(end) ; x++ ) {
 	 				$("#btn_time"+[x]).css("background","gray");
 	 				$("#btn_time"+[x]).html("X");
 	 			}
 	 		</jl:forEach>

 	 		//시간 설정 기능
 	 		var time_click_flag = "a";
 	 		var first_click_time = 0;
 	 		var second_click_time = 0;
 	 		 $(".cb_time").on("click",function(){
			
 	 			if(time_click_flag=="a"){
 	 				$(".cb_time").removeClass("active");
 	 				first_click_time = $(this).attr("time");
 	 				time_click_flag="b";
 	 			} else if(time_click_flag=="b"){
 	 				second_click_time=$(this).attr("time");
 	 				if(parseInt(first_click_time) > parseInt(second_click_time)){
 	 					for(var a = parseInt(second_click_time) ; a <= parseInt(first_click_time) ; a ++ ) {
 	 						if($("#btn_time"+[a]).html()=="X"){
 	 							$("#status-modal-body").html("이미 예약된 시간입니다.");
 	 		 	 				$("#status-modal").modal("show");
 	 							$(".cb_time").removeClass("active");
 	 							break;
 	 						} else {
 	 							$("#btn_time"+[a]).addClass("active");
 	 							if(a+1 == first_click_time){
 	 								$("#end").html(first_click_time);
 	 								$("#start").html(second_click_time);
 	 								$("#start_time").val(second_click_time);
 	 								$("#end_time").val(first_click_time);
 	 								$("#booking_price").val("${space.price}"*(first_click_time-second_click_time));
 	 								$("#table_price").html("${space.price}"*(first_click_time-second_click_time));
 	
 	 							}
 	 						}
 	 						
 	 					}
 	 				} else if(parseInt(first_click_time) < parseInt(second_click_time)){
 	 					for(var b = parseInt(first_click_time) ; b <= parseInt(second_click_time) ; b++ ) {
 	 						if($("#btn_time"+[b]).html()=="X"){
 	 							$("#status-modal-body").html("이미 예약된 시간입니다.");
 	 		 	 				$("#status-modal").modal("show");
 	 							$(".cb_time").removeClass("active");
 	 							break;
 	 						} else {
 	 							$("#btn_time"+[b]).addClass("active");
 	 							if(b+1 == second_click_time){
 	 								$("#start").html(first_click_time);
 	 								$("#end").html(second_click_time);
 	 								$("#start_time").val(first_click_time);
 	 								$("#end_time").val(second_click_time);
 	 								$("#booking_price").val("${space.price}"*(second_click_time-first_click_time));
 	 								$("#table_price").html("${space.price}"*(second_click_time-first_click_time));
 	 							}
 	 						}
	 	 				}
 	 				}
 	 				time_click_flag="a";
 	 			} 
 	 		 });
 	 		 //시간 설정 끝
 	 		 
 	 		 
 	 		 $("#booking_people").val("${space.min_people}");
 	 		 
 	 		 $("#people_plus").on("click",function(){
 	 			var people = $("#booking_people").val();
 	 			people_no=Number(people);
 	 			if(people_no<"${space.max_people}"){
 	 				people_no=people_no+1;
 	 				$("#booking_people").val(people_no);
 	 			}else{
 	 				$("#status-modal-body").html("최대 인원 입니다.");
 	 				$("#status-modal").modal("show");
 	 			}
 	 		 });
 	 		 
 	 		$("#people_minus").on("click",function(){
 	 			var people = $("#booking_people").val();
 	 			people_no=Number(people);
 	 			if(people_no>"${space.min_people}"){
 	 				people_no=people_no-1;
 	 				$("#booking_people").val(people_no);
 	 			}else{
 	 				$("#status-modal-body").html("최소 인원 입니다.");
 	 				$("#status-modal").modal("show");
 	 			}
 	 		 });
 	 		
 	 		$("#start_time_range").on("change",function(){
 	 			var start_time = $("#start_time_range").val();
 	 			var end_time = $("#end_time_range").val();

 	 			var final_time=Number(end_time)-Number(start_time);
 	 			var final_price=final_time*Number("${space.price}");
 	 			$("#booking_price").val(final_price);
 	 			$("#start").html(start_time);
 	 		});
 	 		
 	 		$("#end_time_range").on("change",function(){
 	 			var start_time = $("#start_time_range").val();
 	 			var end_time = $("#end_time_range").val();
 	 			
 	 			var final_time=Number(end_time)-Number(start_time);
 	 			var final_price=final_time*Number("${space.price}");
 	 			$("#booking_price").val(final_price);
 	 			$("#end").html(end_time);
 	 			
 	 		});
 	 		
 	 		$("#pay").on("click",function(){
 	 			if($("#booking_date").val()==""){
 	 				$("#status-modal-body").html("날짜를 선택해주세요");
 	 				$("#status-modal").modal("show");
 	 			}else if($("#booking_price").val()==""){
 	 				$("#status-modal-body").html("시간을 선택해주세요");
 	 				$("#status-modal").modal("show");
 	 			}else if($("#booking_email").val()==""){
 	 				$("#status-modal-body").html("이메일을 입력해주세요");
 	 				$("#status-modal").modal("show");
 	 			}else if($("#booking_phone").val()==""){
 	 				$("#status-modal-body").html("연락처를 입력해주세요");
 	 				$("#status-modal").modal("show");
 	 			}else if($("#booking_user_name").val()==""){
 	 				$("#status-modal-body").html("예약자 성함을 입력해주세요");
 	 				$("#status-modal").modal("show");
 	 			}
 	 			
 	 			else {
 	 			$("#booking_date").removeAttr("disabled");
 	 			$("#booking_people").removeAttr("disabled");
 	 			$("#booking_price").removeAttr("disabled");
 	 			$("#pay").attr("type","submit");
 	 			}
 	 		});
 	 		
 	 		$("#booking_date").datepicker({
 	 			dateFormat:"yy-mm-dd"
			});
 	 		$("#date2").datepicker({
 	 			dateFormat:"yy-mm-dd"
			});
 	 		var open_imsi = "${space.open_time}";
 	 		var open = Number(open_imsi)

	 		
 	 		var close_time = "${space.close_time}";
 	 		var close = Number(close_time)
 	 		
 	 		$("#date2").on("change",function(){
 	 			var currentDate = $( "#date2" ).datepicker("getDate","dateFormat" );
 	 			$("#booking_date").datepicker("setDate",currentDate);
 	 			
				var dat = $("#booking_date").val();
 	 			$("#reserve_day").html(dat);
 	 			
 	 			ajaxGet("reserve_change_day.do?booking_date="+dat+"&space_no=${space.space_no}",function(rt){	
 			 	 	 var booking_list = eval("("+rt+")");
 			 	 	 $(".cb_time").removeClass("active");
 			 	 	
 			 	 	 for(var z = open ; z <=close ; z++ ) {
 			 	 		$("#btn_time"+[z]).css("background","#5BC0DE");
 	 	 				$("#btn_time"+[z]).html(z);
 			 	 	 }
 			 	 	 for(var g = 0 ; g < booking_list.data.length; g++){
	 			 	 	for(var y = parseInt(booking_list.data[g].start_time) ; y < parseInt(booking_list.data[g].end_time) ; y++ ){
	 			 	 		$("#btn_time"+[y]).css("background","gray");
	 	 	 				$("#btn_time"+[y]).html("X");
	 			 	 	}
 			 	 	 }
 		 	 	 });
 	 			
 	 			
 	 		});
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
 	 <style>
 	 	.active{
 	 		background: #95BADF !important;
 	 	}
 	 	#booking_people{
 	 		height: 35px;
 	 		border-radius:3px;
 	 	}
 	 	.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover, html .ui-button.ui-state-disabled:active
 	 	{
 	 		height: 75px;
 	 	}
 	 	.ui-datepicker{
 	 		width: 100%;
 	 	}
 	 	.ui-widget-header{
 	 		background-color: #D9EDF7;
 	 	}
 	 	.btn-time{
 	 		padding-left: 10%;
 	 	}
 	 	.space-label{
 	 		margin-bottom: 10px;
 	 	}
 	 </style>
</head>
<body>
			<!-- *********************  header  ************************ -->
    <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ -->
	
	<div class="container">
	<h1>예약 페이지</h1>
	 <div class="panel panel-info">
          <div class="panel-heading">
            <h3 class="panel-title">주문 내역</h3>
          </div>
          <div class="panel-body">
            <div class="table-responsive">
              <table class="table table-condensed">
                <thead>
                  <tr>
                    <th class="text-center">공간 이름</th>
                    <th class="text-center">예약 날짜</th>
                    <th class="text-center">예약 시간</th>
                    <th class="text-right">가격</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-center">${space.space_title }</td>
					<td id="reserve_day" class="text-center"></td>
					<td id="table_booking_time" class="text-center"><label id="start"></label>시 ~ <label id="end"></label>시</td>
					<td id="table_price" class="text-right"></td>
                  </tr>
   
                </tbody>
              </table>
            </div>
          </div>
        </div>
		

		<form method="POST" action="space_payment.do">

		<div  id="date2" ></div>
		<br/>
			<div class="form-group">
				<label for="booking_date" class="space-label">예약 날짜</label>
				<input type="text"  id="booking_date" name="booking_date" disabled="disabled" class="form-control text-center">
			</div>
			
			<h4>시간</h4>
			<div class="btn-group btn-group-toggle btn-lg btn-time" data-toggle="buttons">
			<jl:forEach begin="0" end="24" varStatus="time">
			<jl:choose>
				<jl:when test="${space.open_time <= time.index && space.close_time >= time.index}">
				  <label class="btn btn-secondary btn-info cb_time"  time="${time.index }" id="btn_time${time.index }">
					    <input type="checkbox" autocomplete="off" id="input_time${time.index }"> ${time.index }
					  </label>
				</jl:when>
				<jl:otherwise>
					<label class="btn btn-secondary"  time="${time.index }" id="btn_time${time.index }">
					    <input type="hidden" autocomplete="off" id="input_time${time.index }" > X
					  </label>
				</jl:otherwise>
			</jl:choose>
	  		</jl:forEach>
			</div>
				<input id="start_time" type="hidden" name="start_time"/>
				<input id="end_time" type="hidden" name="end_time"/>
				<div class="input-group">
					<label for="people" class="space-label">대여 인원</label><br/>
						<button id="people_minus" type="button" class="btn btn-default btn-lg">
							<span class="glyphicon glyphicon-minus"></span>
						</button>
						<input id="booking_people" name="booking_people" type="text" disabled="disabled" class="text-center">
						<button id="people_plus" type="button" class="btn btn-default btn-lg">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
					</div>
					
						
				<br/>
				<div class="form-group">
					<label for="club_list" class="space-label">모임 목록</label>
					<select name="club_list" id="club_list" class="form-control">
						<option value="0" selected="selected">개인 회원</option>
						<jl:forEach var="club" items="${club_list }">
							<option value="${club.club_no }">${club.club_name }</option>
						</jl:forEach>
					</select>
				</div>
				
				<div>

					
					<hr/>
					
					<H1>예약자 정보</H1>
						<div class="form-group">
							<label class="space-label">예약자</label>
							<input type="text" name="booking_user_name" id="booking_user_name"  class="form-control">
						</div>
						<div class="form-group">
							<label class="space-label">연락처</label>
							<input type="text" name="booking_phone" id="booking_phone"  class="form-control">
						</div>
						<div class="form-group">
							<label class="space-label">이메일</label>
							<input type="text" name="booking_email" id="booking_email" class="form-control">
						</div>
						<div class="form-group">
							<label class="space-label">요청사항</label>
							<textarea name="booking_message" class="form-control"></textarea>
						</div>
					<input type="hidden" id="booking_price" name="booking_price"/>
					<input type="hidden" value="${user_id }" id="user_id" name="user_id"/>
					<input type="hidden" value="${space.space_no }" name="space_no"/>
					<div class="text-center">
						<input id="pay" type="button" class="btn btn-info btn-lg" value="결제하기"/>
					</div>
					<br/>
		<br/>
					
				</div>
		</form>
	</div>
	<!-- 모달 -->
	
		<div class="modal fade" id="status-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span>
									<span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title text-center">주의</h4>
							</div>
							<div class="modal-body">
								<h2 id="status-modal-body" class="text-center">XX 완료</h2>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
		
		
	<!-- ******************************* footer ******************************* -->
	  <%@include file="./jsp/footer.jsp"%>  
	<!--  end footer  -->
</body>
</html>