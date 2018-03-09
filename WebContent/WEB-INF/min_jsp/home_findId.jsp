<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="common.js" type="text/javascript"></script>

	  
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
	<form method="POST" class="form-signin">
		<table width="422" align="left">
			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="35" class="g_13" align="left">이름</td>
				<td width="300" align="left">
					<input name="user_name"	id="user_name" type="text" class="textareabg" size="15" />
				</td>
			</tr>

			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="35" class="g_13" align="left">주민번호</td>
				<td width="300" class="g_13" align="left">
					<input name="ssn1" id="ssn1" class="textareabg" size="15" maxlength="20" /> - 
					<input name="ssn2" id="ssn2" class="textareabg" size="15" maxlength="20" />
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
		</table>
	</form>


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
