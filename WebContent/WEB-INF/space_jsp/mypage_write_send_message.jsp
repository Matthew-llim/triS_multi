<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="common.js"></script>
<style type="text/css">

.send {
	
	padding-top: 5px;
}

</style>
	<!-- Bootstrap Core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
	
	
	
	<script>
	
	$(document).ready(function(){
		
		
		/* ******************	******** select_club의 기본값 ************************** */	
		
		var club_no_1 = $("#select_club").val();
		$('#select_club_member').empty();	
		 url = "mypage_moveMypageWriteMessageFindUserClubMemberPage.do?club_no="+club_no_1;
		 ajaxGet(url,function(rt){
			 var user_club_member = window.eval("("+rt+")");
			 for( var i = 0 ; i < user_club_member.data.length ; i++ ){
				    var option = $("<option value="+user_club_member.data[i]+">"+user_club_member.data[i]+"</option>");
	                $('#select_club_member').append(option);
			 } 
		 });
		/* ************************** select_club의 선택값 ************************** */	
		$("#select_club").change(function(){
			 club_no = $(this).val();	
			 $('#select_club_member').empty();	
			 url = "mypage_moveMypageWriteMessageFindUserClubMemberPage.do?club_no="+club_no;
			 
			 ajaxGet(url,function(rt){
				 var user_club_member = window.eval("("+rt+")");
				 for( var i = 0 ; i < user_club_member.data.length ; i++ ){
					    var option = $("<option value="+user_club_member.data[i]+">"+user_club_member.data[i]+"</option>");
		                $('#select_club_member').append(option);
				 } 
			 });
		});		

		/* ************************** 쪽지 보내기 버튼 클릭시 ************************** */	
		$("#submitBtn").on("click",function(e){
			
			var flag = $("#i_msg_content").val()
			
			if( flag != ""){
				
				
			var sel_receive_user_id = $("#select_club_member option:selected").val();
			$("#i_receive_user_id").attr("value",sel_receive_user_id);
				
			var formMData = $("#form_sendMessage").serialize();	
			$.ajax({
			         type : "POST",
			         url : "mypage_sendMessage.do",
			         data : formMData,
			         success   : function(rt) {
			           	if(rt=="30003"){
			           		$("#lblCon").text("쪽지가 성공적으로 보내졌습니다.");
			           		$("#messageModal").modal('show');
			           		$("#i_msg_content").val("");
			           	}
				 },
			   error : function(xhr, option, error){
				   alert(error);
				            }
			      });
			} else{
				$("#lblCon").text("보내실 메시지를 입력해주세요.");
           		$("#messageModal").modal('show');         		
			}
		});// end function
		
		$("#btn_goSendMBox").on("click",function(){
			location.href="mypage_moveMypageSendMessagePage.do";	
		});
		
		
	}); //end$(document)
	
	
	
	</script>
</head>
<body>
<br/>
	<div class="col-lg-3 col-md-10">
		<div class="panel panel-yellow">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa fa-envelope-o fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge">Send !</div>
						<div>write..</div>
					</div>
				</div>
			</div>

		</div>



		<form id="form_sendMessage">
			<label> 모임 </label> <select name="club_list" id="select_club"	class="form-control">
				<jl:forEach var="User_clubInfo" items="${user_clubInfo}">
					<a class="aclass" clubno="${User_clubInfo.club_no}">sujin</a>
					<option value="${User_clubInfo.club_no}">${User_clubInfo.club_name}</option>
				</jl:forEach>
			</select> <br /> <label> 받는사람 </label> 
			
			
			
			<select name="club_member_list"	id="select_club_member" class="form-control">
				
			</select> 
			
			
			
			
			<br /> <label>쪽지 내용</label>
			<!-- 	<input type="text" name="msg_content" id="i_msg_content"/> -->
			<textarea class="form-control" name="msg_content" id="i_msg_content" style="height: 350px;"> </textarea>
			<input type="hidden" name="receive_user_id" id="i_receive_user_id" />
		</form>
		<div class="send">
		<button class="btn" id="submitBtn">쪽지 보내기</button>
		</div>
	</div>






	<!-- ************************** messageModal ************************** --> 
	<div id="messageModal" class="modal " role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="text_mohead" class="modal-header"align="center"><h4>쪽지</h4></div>
				<div id="text_mobody" class="modal-body" align="center">
				<label id="lblCon"></label></div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" id="btn_goSendMBox">보낸쪽지함 가기</button>
					<button class="btn btn-default" data-dismiss="modal" id="btnck">확인</button>
				</div>
			</div>
		</div>
	</div> 
	

</body>
</html>