<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>
	$("document").ready(function(){
		$("#can").on("click",function(){
			document.frm.action="admin_hosts.do";
			document.frm.submit();
		});
	});
</script>
</head>
<body>
<form action="admin_host_user_downgrade.do" method="post" name="frm">
	<input type="hidden" name="user_id" value="${vo.user_id}"></input>
	<input type="hidden" name="crn" value="${vo.crn}"></input>
	<input type="hidden" name="send_user_id" value="admin"></input>
	<input type="hidden" name="receive_user_id" value="${vo.user_id}"></input>
	
	<table>
		<tr>
			<td>${vo.user_id} 유저 강등사항 작성 : </td>
			<td><textarea rows="20" cols="20" name="msg_content"></textarea></td>
		</tr>
	</table>
		
	<button type="submit">쪽지 전송 하기</button> &nbsp;&nbsp;&nbsp;
	<button id="can" type="submit">취소 하기</button>
</form>

</body>
</html>