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
			document.frm.action="admin_host_request.do";
			document.frm.submit();
		});
	});
</script>
</head>
<body>
<form action="admin_host_user_refuse.do" method="post" name="frm">
	<input type="hidden" name="host_apply_no" value="${vo.host_apply_no}"></input>
	<table>
		<tr>
			<td>참고 사항(거절 사항) 작성 : </td>
			<td><textarea rows="20" cols="20" name="etc">${vo.etc}</textarea></td>
		</tr>
	</table>
		
	<button type="submit">전송 하기</button> &nbsp;&nbsp;&nbsp;
	<button id="can" type="submit">취소 하기</button>
</form>

</body>
</html>