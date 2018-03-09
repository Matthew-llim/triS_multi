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
	
		$(document).ready(function(){
			var flag1 = 0;
			var ssn11 = 0;
			var ssn22 = 0;
			
			$(".nameCk").on("focusout",function(){
				var user_name = $("#user_name1").val();
				if(user_name.replace(/[A-Za-z0-9!@#$%^&*()_+=|\ `~]/g, "")==""){
					$("#user_name1").val("");
					$("#lblContent").text("이름은 한글로 입력해주세요.");
					$("#repleModal").modal("show");
					return;
				}
			});
			
			$(".btn_ssn").on("click",function(){
			 	var ssn1 = $("#ssn1").val();
				if(ssn1.replace(/[A-Za-zㄱ-힣!@#$%^&*()_+=|\ `~]/g, "")==""){
					$("#lblContent").text("주민번호는 숫자만 입력해주세요");
					$("#repleModal").modal("show");
					return;
				}
				
		 		var ssn2 = $("#ssn2").val();
				if(ssn2.replace(/[A-Za-zㄱ-힣!@#$%^&*()_+=|\ `~]/g, "")==""){
					$("#lblContent").text("주민번호는 숫자만 입력해주세요");
					$("#repleModal").modal("show");
					return;
				} 
				
			 	var sum=0;
				sum += ssn1.charAt(0)*2;
			    sum += ssn1.charAt(1)*3;
			    sum += ssn1.charAt(2)*4;
			    sum += ssn1.charAt(3)*5;
			    sum += ssn1.charAt(4)*6;
			    sum += ssn1.charAt(5)*7;
		
			    sum += ssn2.charAt(0)*8;
			    sum += ssn2.charAt(1)*9;
			    sum += ssn2.charAt(2)*2;
			    sum += ssn2.charAt(3)*3;
			    sum += ssn2.charAt(4)*4;
			    sum += ssn2.charAt(5)*5;
				
			    var check = (11 - sum%11)%10;
		
			    if(ssn2.charAt(6) != check || (ssn1.length != 6 && ssn2.length !=7)){
			    	$("#lblContent").text("주민번호는 유효하지 않습니다.");
			    	$("#repleModal").modal("show");
			    	return ;
			    } else{
			    	flag1 = 1;
			    	ssn11 = $("#ssn1").val();
					ssn22 = $("#ssn2").val();
					$("#lblContent").text("사용가능");
			    	$("#repleModal").modal("show");
			    }
			});
		
			var flag = 0;
			var user_id;
			$("#primary_id").on("click",function(){
				user_id = $("#user_id").val();
				var url ="overlap.do?user_id="+user_id;
				
				ajaxGet(url,function(rt){
					if(rt==1){
						$("#lblContent").text("중복되었습니다.");
						$("#repleModal").modal("show");
						$("#user_id").val("");
					} else if(user_id==""){
						$("#lblContent").text("아이디를 입력하세요");
						$("#repleModal").modal("show");
					} else if( rt == 0){
						$("#lblContent").text("사용이 가능합니다.");
						$("#repleModal").modal("show");
						flag = 1;
					} 
				});
			});
			
			$("#member_join").on("click",function(){
				var user_idck = $("#user_id").val();
				var user_id1 = $("#user_id").val();
				var passwd = $("#passwd").val();
				var passwd2 = $("#passwd2").val();
				var user_name = $("#user_name1").val();
				var phone = $("#phone").val();
				var email = $("#email").val();
				var ssn1ck = $("#ssn1").val();
				var ssn2ck = $("#ssn2").val();
				var nickname= $("#nickname").val();
				var zipcode = $("#zipcode").val();
				
				if(user_id1==""){
					$("#lblContent").text("아이디를 입력하세요");
				} else if(passwd==""){
					$("#lblContent").text("비밀번호를 입력하세요.");
				} else if(passwd2==""){
					$("#lblContent").text("비밀번호를 입력하세요.");
				} else if(passwd != passwd2){
					$("#lblContent").text("비밀번호가 다릅니다.");
				} else if(user_name==""){
					$("#lblContent").text("이름을 입력하세요.");
				} else if(nickname==""){
					$("#lblContent").text("닉네임을 입력하세요.");
				} else if(phone==""){
					$("#lblContent").text("핸드폰번호를 입력하세요.");
				} else if(email==""){
					$("#lblContent").text("이메일을 입력하세요.");
				} else if(zipcode==""){
					$("#lblContent").text("주소를 입력하세요.");
				} else if(ssn1ck==""){
					$("#lblContent").text("주민번호를 입력하세요.");
				} else if(ssn2ck==""){
					$("#lblContent").text("주민번호를 입력하세요.");
				} else if(flag==0){
					$("#lblContent").text("아이디 중복체크 해주세요.");
				} else if(user_id != user_idck){
					$("#lblContent").text("아이디 중복체크 해주세요.");
				} else if(flag1==0){
					$("#lblContent").text("주민번호 체크 해주세요.");
				} else if(ssn11 != ssn1ck || ssn22 != ssn2ck) {
					$("#lblContent").text("주민번호 체크 해주세요.");
				} else {
					$("#sample4_postcode").removeAttr("disabled");
					$("#sample4_roadAddress").removeAttr("disabled");
					$("#sample4_jibunAddress").removeAttr("disabled");
					$("#member_join").attr('type','submit');
				}
				$("#repleModal").modal("show");
			});
		});
		
		$("#btnClose").on("click",function(){
			$("#repleModal").modal("hide");
		});
		
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
		
		function zipSearch(){
			window.open("find_zipcode.html", "zip", "width=600,height=450");
		}
		
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


	<form action="home_user_join2.do" name=frm method="POST">
		<table border="0" cellpadding="8" align="center">

			<tr>
				<th colspan="3" align="center"><h1>회원가입</h1></th>
				<!-- <td></td>
		<td></td> -->
			</tr>

			<tr>
				<th align="right">아이디</th>
				<td><input type="text" name="user_id" id="user_id" size="10" />
					<input type="button" id="primary_id" value="중복확인" />
					<div id="dvname"></div>
					</td>
				<td></td>
			</tr>

			<tr>
				<th align="right">비밀번호</th>
				<td><input type="password" name="passwd" id="passwd" size="20"
					maxlength="20" /></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">비밀번호 확인</th>
				<td><input type="password" name="passwd2" id="passwd2"
					size="20" maxlength="20" /></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">이름</th>
				<td><input type="text" name="user_name" id="user_name1" size="10" maxlength="8" class="nameCk"/>
					<div id="dv1"></div>
				</td>
				<td></td>
			</tr>

			<tr>
				<th align="right">닉네임</th>
				<td><input type="text" name="nickname" id="nickname" size="10" maxlength="8" /></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">전화번호</th>
				<td><select name="num">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
				</select> - <input type="text" name="phone_cen" size="5" maxlength="4" /> -
					<input type="text" name="phone_end" size="5" maxlength="4" /></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">이메일</th>
				<td><input type="text" name="email" id="email" size="10" />@ <select
					name="home">
						<option value="daum.net">daum.net</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
				</select></td>
				<td></td>
			</tr>

			<tr>
				<th>우편번호</th>
				<td><input type="text" name="zipcode" size="8" id="zipcode"/>
				<input type="button" name="findzip" value="찾기" class="btnzip" onclick="zipSearch()"/>
				</td>
			</tr>
			
			<tr>
				<th align="right">주소</th>
				<td><input type="text" size="40" name="addr1"/></td>
				<td></td>
			</tr>
			
			<tr>
				<th align="right">상세주소</th>
				<td><input type="text" size="20" name="zipdetail"/></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">주민번호</th>
				<td><input type="text" name="ssn1" id="ssn1" size="6" maxlength="6" /> - 
					<input type="password" name="ssn2" id="ssn2" size="7" maxlength="7" /> 
					<input type="button" value="확인" class="btn_ssn" />
					<div id="dv"></div></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">성별</th>
				<td><input type="radio" name="gender" value="M" checked="checked" /> 남 
				<input type="radio" name="gender" value="F" /> 여 
				<input type="hidden" name="grade" value="1" /></td>
				<td></td>
			</tr>

			<tr>
				<td></td>
				<td>
				<input type="button" name="member_join" id="member_join" value="    회원가입    " /> 
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="      재설정      " /></td>
				<td></td>
			</tr>
		</table>
		
	</form>
	
	<form id="ck_total">
		<div id="repleModal" class="modal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
							<label id="lblContent"></label><br/>
							<button type="button" class="btn btn-primary btn-sm" id="btnClose" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	
</body>
</html>