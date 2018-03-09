<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />

<link rel="stylesheet" type="text/css"
	href="./Resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="./Resources/css/responsive.css">
<link rel="stylesheet" type="text/css"
	href="./Resources/css/event_hover.css">


<script type="text/javascript" src="./Resources/js/jquery.js"></script>
<script type="text/javascript" src="./Resources/js/main.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./common.js"></script>
<style>
.form-text {
	float: left; 
	padding:10px;
}
.form-input {
	float: left; 
	padding:10px;
}

.find_id_div{
    margin: auto;
    width: 800px;
    height: 600px;
    padding-top: 3%;
    padding-bottom: 8%;
}
    
.findpw_head{
text-align: center;
}    
</style>	

	<script>
  $(document).ready(function(){
 		
 		
 		$("#sub-btn").on("click",function(){
 			
 		 var formFindPasswdData = $("#formFindPasswd").serialize();	
	        $.ajax({
		           type : "POST",
		           url : "home_findPassswd.do",
		           data : formFindPasswdData,
		           success   : function(rt) {
		        	   
		        	if(rt=="error"){
			          $("#ErrorpasswdModal_body").text("입력된 정보가 없습니다. 다시 입력해주세요").append();
				      $("#ErrorpasswdModal").modal('show');
		        	}else{
			          $("#passwdModal_body").text(("고객님의 비밀번호는 " + rt+" 입니다.")).append();
			  		  $("#passwdModal").modal('show');	
		        	}

		           },
		           error : function(xhr , option , error){
						alert(error)
		           }
		  	 });//end ajax
 		}); //end function
        
        
});

 	
 	
 	
 
	</script>
</head>
<body>

<section class="hero_page">
		<header>
			<div class="wrapper">

				<a href="main.html" class="logo sh_a" alt="" titl="">Multi Space</a>
				<nav class="navbar navbar-default">

					<div id="navbar">

						<ul class="top_nav">
							<li><a href="space_home.do">공간</a></li>
							<li><a href="club_home.do">모임</a></li>
							<li><a href="community_list.do">커뮤니티</a></li>
							<li><a href="event_user_list.do">이벤트</a></li>
							<li><a href="notice_list.do">공지사항</a></li>
							<li><a href="faq_list.do">FAQ</a></li>
							<li><a href="admin_main.do">관리자</a></li>
						</ul>


						<ul id="non_login_nav" class="nav navbar-right">
							<li><a href="home_moveLoginPage.do">로그인</a></li>
						</ul>


					</div>
				</nav>
			</div>
		</header>
		<!--  end header section  -->
	</section>
<div class="find_id_div">
		<div class="wrapper">
	<form id="formFindPasswd">
	<div class="findpw_head">
		<h2 class="form-signin-heading">비밀번호 찾기</h2>

	</div>
	
		<table width="600" align="left">
			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="35" class="g_13" align="left">이&nbsp;&nbsp;&nbsp;&nbsp;름</td>
				<td width="300" align="left">
					<input  name="user_name"class="textareabg" type="text" class="textareabg" size="15"  placeholder="이름"  />
				</td>
			</tr>
			
			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="35" class="g_13" align="left">아이디</td>
				<td width="300" class="g_13" align="left">
					<input name="user_id" class="textareabg" size="15" maxlength="20"  placeholder="Id" />
				</td>
			</tr>
			
			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="35" class="g_13" align="left">주민번호</td>
				<td width="300" class="g_13" align="left">
					<input name="ssn1" class="textareabg" size="15" maxlength="6" /> - 
					<input type="password" name="ssn2" class="textareabg" size="15" maxlength="7" />
				</td>
			</tr>
			

			
			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="25"></td>
				<td width="15"></td>
			</tr>

			<tr>
				<td width="15"></td>
				<td width="12" height="15"></td>
				<td width="95" height="15"></td>
				<td width="285" height="15"></td>
				<td width="15"></td>
			</tr>
			<tr>
				<td width="15"></td>
				<td width="12" height="15"></td>
				<td width="95" height="15"></td>
				<td colspan="2" align="center" class="btn_wrap_align_top">
				<button id="sub-btn" class="btn btn-lg btn-blue" type="button" >
				비밀번호찾기
				</button>
				</td>
			</tr>
			<tr>
				<td width="15"></td>
				<td width="12" height="15"></td>
				<td width="95" height="15"></td>
				<td width="285" height="15"></td>
				<td width="15"></td>
			</tr>
		</table>
	</form>
	<!-- 이메일 주소로찾기 폼 끝-->
</div>
</div>


	<!-- **************************************** passwdModal *************************************** -->
	
	<div id="passwdModal" class="modal " role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="passwdModal_body" class="modal-body"></div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div> 
	
	
		<!-- **************************************** ErrorpasswdModal *************************************** -->
	<div id="ErrorpasswdModal" class="modal " role="dialog">
	
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="ErrorpasswdModal_body" class="modal-body"></div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div> 

</body>
</html>