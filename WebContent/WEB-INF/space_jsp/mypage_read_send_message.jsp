<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />

	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	<style type="text/css">
		.textarea_h{
			padding: 10px;
			padding-top: 50px;
		}
		.label_reple{
			padding-bottom: 18px;
		}
	</style>
	<script type="text/javascript" src="./Resources/js/jquery.js"></script>
	<script type="text/javascript" src="./Resources/js/main.js"></script>
		
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./common.js"></script>
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		$("#del").on("click",function(){
			$("#lblContent").text("삭제하시겠습니까?");
			$("#modal").modal("show");
		});
		
		$("#success").on("click",function(){
			$("#frm").submit();
		});
	});
	</script>
	
</head>
<body>

	<div>
		<label><h3>보낸쪽지함</h3></label><label style="margin: 20px;">::</label>
	</div>
	<hr>
	<div class="col-sm-6" align="left">
		<label><span class="glyphicon glyphicon-user"></span>
			받은 사람 : ${sendMessageRead.receive_user_id}</label>
	</div>
	<div class="textarea_h">
		<textarea rows="15" cols="30" disabled="disabled" class="form-control" style="cursor:default">${sendMessageRead.msg_content}</textarea>
		<br />
	</div>
	<form action="del_msg.do" method="POST" id="frm">
		<input type="hidden" value="${sendMessageRead.msg_no}" name="msg_no"/>
		<input type="hidden" value="0" name="flag"/>
		<input type="button" value="삭제하기" id="del" class="btn"/>
	</form>	
	<hr>
	
	
	<div id="modal" class="modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="text_mohead" class="modal-header"align="center"><h4>글 삭제</h4></div>
				<div id="text_mobody" class="modal-body" align="center">
					<h4 id="lblContent"></h4>
				</div>
				<div id="text_ft" class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal" id="success">확인</button>
					<button class="btn btn-default" data-dismiss="modal" id="close">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	

</body>
</html>