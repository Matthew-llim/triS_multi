<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
.btn {
	color: $F5F5F5
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



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
<br>

<form action="admin_host_user_downgrade.do" method="post" name="frm">

	<input type="hidden" name="user_id" value="${vo.user_id}"></input>
	<input type="hidden" name="crn" value="${vo.crn}"></input>
	<input type="hidden" name="send_user_id" value="admin"></input>
	<input type="hidden" name="receive_user_id" value="${vo.user_id}"></input>
	

	<p class="fa fa-frown-o"> <label>강등사항작성</label><br></p>
	<textarea class="form-control" name="msg_content" rows="10"></textarea>
	<br>
		
	<button class="btn" type="submit">쪽지 전송 하기</button> 
	<button id="can" class="btn" type="submit">취소 하기</button>
</form>

</body>
</html>