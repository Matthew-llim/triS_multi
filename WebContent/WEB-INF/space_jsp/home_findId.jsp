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
	  
<style type="text/css">

.findid_head{
text-align: center;
}


.name{
float: left;
margin-top : 10px;
margin-right: 8px;
text-align: center;

}
.name2{
float: left;
margin-right: 8px;

}


.find_id_div{
    margin: auto;
    width: 800px;
    height: 600px;
    padding-top: 3%;
    padding-bottom: 8%;
}


</style>	  
 <script>
 $(document).ready(function(){
	 
  $("#sub-btn").on("click",function(){ //아이디찾기 버튼 클릭시
		  
	var url = "home_findId.do?user_name="+$("#user_name").val()+"&ssn1="+$("#ssn1").val()+"&ssn2="+$("#ssn2").val();
	  ajaxGet(url,function(rt){
		  
		  if(rt=="error"){
			  $("#modal-title").text("입력된 정보가 없습니다. 다시 입력해주세요").append();
			  $("#id_modal").modal('show');
			  $("#login-btn").hide();
		  }else{
			$("#modal-title").text("고객님의 아이디는 " + rt+" 입니다.").append();
		    $("#id_modal").modal('show');
		    $("#login-btn").show();
		  }//end else
			  
	  }); //end ajaxGet
   }); // end function

	$("#login-btn").on("click",function(){ // 모달의 로그인하기 버튼 클릭시 이동
		location.href = "home_moveLoginPage.do";
	});
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
	<div class="login_div">
		<div class="wrapper">


		<form method="POST" class="form-signin">
			<div class="findid_head">
			 <h2 class="form-signin-heading">아이디 찾기</h2>

			</div>

	      <table width="600" align="left">
			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="35" class="g_13" align="left">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td>
				<td width="300" align="left">
					<input name="user_name"	id="user_name" type="text" class="textareabg" class="form-control" size="15"  placeholder="이름" />
				</td>
			</tr>

			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="35" class="g_13" align="left">주민번호</td>
				<td width="300" class="g_13" align="left">
					<input name="ssn1" id="ssn1" class="textareabg" class="form-control" size="15" maxlength="6" /> - 
					<input type="password" name="ssn2" id="ssn2" class="textareabg"  class="form-control" size="15" maxlength="7" />
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
				<td colspan="5" align="center" class="btn_wrap_align_top">
				<button id="sub-btn" class="btn btn-lg btn-blue" type="button" >
				아이디 찾기
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

	
	</div>
</div>

</div>

	
	
	
	
	
	
	

	<!-- 	<table width="600" align="left">
			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="35" class="g_13" align="left">이름</td>
				<td width="300" align="left">
					<input name="user_name"	id="user_name" type="text" class="form-control" size="15" />
				</td>
			</tr>

			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="35" class="g_13" align="left">주민번호</td>
				<td width="300" class="g_13" align="left">
					<input name="ssn1" id="ssn1" class="form-control" size="15" maxlength="20" /> - 
					<input name="ssn2" id="ssn2" class="form-control" size="15" maxlength="20" />
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
				<td colspan="5" align="center" class="btn_wrap_align_top">
				<button id="sub-btn" class="btn btn-lg btn-success" type="button" >
				아이디 찾기
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
		</table>  -->



<!-- **************************************** id_modal **************************************** -->
<div class="modal fade" id="id_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<p id="modal-title"></p>
				<div class="pull-right">
					<button id="login-btn" class="btn btn-defalut" >로그인하기</button>
					<button id="close-btn" class="btn btn-defalut" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- qna 수정 모달 끝 -->
</body>
</html>
