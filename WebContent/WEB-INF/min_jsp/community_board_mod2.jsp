<%@ page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"%><%@
taglib
	prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

#dialog-background {
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0,0,0,.3);
    z-index: 10;
}
#my-dialog {
    display: none;
    position: fixed;
    left: calc( 50% - 160px ); top: calc( 50% - 70px );
    width: 320px; height: 140px; 
    background: #fff;
    z-index: 11;
    padding: 10px;
}

.container{
text-align: center;
	
}

.jumbotron {
text-align: center;
}

th,td,tr {
text-align: center;
}

</style>



<script src="common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>

$(document).ready(function(){
	$("#btnMod").on("click",function(){
		$("#modtext").modal("show");
			$("#success").on("click",function(){	
				$("#modtext").modal("hide");	
				$("#modalmod").modal("show");
				$("#modalmod").on("hidden.bs.modal",function(){
					$("#modform").submit();
				});  
		});
	});
});

</script> 



</head>
<body>
	<div class="jumbotron" style="background-color: pink">
		<h1>글 수정합니다 </h1>
	</div>
	<div class="container" >
		<form action="community_board_mod2.do" method="POST" id="modform">
			<div class="form-group" id="modal_content">
				제 목 : <input type="text"  size="30"  name="com_board_title" value="${mvo.com_board_title}" /><br />
				<br /> 아이디 : 
				<label>${mvo.user_id}</label><br/>
				<input type="hidden"  size="30" name="user_id" value="${mvo.user_id}" /><br /> <br />
				<textarea name="com_board_content" rows="10" cols="40">${mvo.com_board_content}</textarea>
				<input type="hidden" name="com_board_no" value="${mvo.com_board_no}" /> <br />
				<input class="btnMod btn-success" type="button" id="btnMod" value="수정" />
			</div>
		</form>
	</div>
	
	
<!--글수정모달창 -->
	<div class="modal fade" id="modtext" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">알림</h4>
				</div>
				<div class="modal-body">글을 정말로 정말로 수정하시겠습니깡?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="success">확인</button>
				</div>
			</div>
		</div>
	</div>
	

<!-- 글수정모달창_수정버튼누르면 -->
	<div class="modal fade" id="modalmod" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">알림</h4>
				</div>
				<div class="modal-body">당신의 훌륭한 글이 수정되었습니다 !</div>
				<div class="modal-footer">
					<button id="modalmodclose"type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				
				</div>
			</div>
		</div>
	</div>


</html>