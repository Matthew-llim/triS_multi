<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>
<link rel="stylesheet" href="css/style.css">
<style>
.form-text {
	float: left; 
	padding:10px;
}
.form-input {
	float: left; 
	padding:10px;
}
</style>	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script> -->
	<script type="text/javascript" src="common.js"></script>
	
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
	<form id="formFindPasswd">
		<table width="422" align="left">
			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="35" class="g_13" align="left">이름</td>
				<td width="300" align="left">
					<input name="user_name"	type="text" class="textareabg" size="15" />
				</td>
			</tr>
			
			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="35" class="g_13" align="left">아이디</td>
				<td width="300" class="g_13" align="left">
					<input name="user_id" class="textareabg" size="15" maxlength="20" />
				</td>
			</tr>
			
			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="35" class="g_13" align="left">주민번호</td>
				<td width="300" class="g_13" align="left">
					<input name="ssn1" class="textareabg" size="15" maxlength="20" /> - 
					<input name="ssn2" class="textareabg" size="15" maxlength="20" />
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
				비밀번호 찾기
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