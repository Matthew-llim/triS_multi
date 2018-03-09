<%@ page 
	contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel='stylesheet prefetch'
	href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>

<link rel="stylesheet" href="css/style.css">

<style>
.login_div {
	margin: auto;
	width: 600px;
}

.wrapper2 {
	display: inline-block;
	width: 600px;
}

#sub-btn {
	width: 180px;
	margin: auto;
}
</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="common.js"></script>
	
	<script>
	$(document).ready(function(){
		
		//ctrlLogin에서 chkcode 받아와서 조건에 맞으면 모달 show
		
		var chkcode = ${chkcode};
		if(chkcode=="10001"){
		$("#loginModal").modal('show');   
		}
		
	});
	
	
	</script>
</head>
<body>


	<div class="login_div">
		<div class="wrapper">
			<form method="POST" action="home_login.do" class="form-signin">
				<h2 class="form-signin-heading">Please login</h2>
				
				<input type="text" class="form-control" name="user_id"
					placeholder="Email Address" autofocus="" /> 
				<input type="password" class="form-control" name="passwd" 
					placeholder="Password" />

				<button class="btn btn-lg btn-success btn-block" type="submit">Login</button>
			</form>
		</div>
		
		<div class="wrapper2">
			<a id="sub-btn" class="btn btn-lg btn-success" href="home_user_join.do" role="button">회원가입</a>
			<a id="sub-btn" class="btn btn-lg btn-success" href="home_moveFindIdPage.do" role="button">ID 찾기</a>
			<a id="sub-btn" class="btn btn-lg btn-success" href="home_moveFindPasswdPage.do" role="button">Passward 찾기</a>
		</div>
	</div>
	
	
					
	<!-- **************************************** loginModal *************************************** -->
					
	<div id="loginModal" class="modal " role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="modal_text" class="modal-body">ID 가 없거나 암호가 틀립니다.</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div> 

</body>
</html>