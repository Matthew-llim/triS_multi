<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
.paginationdiv{
text-align: right;
}
.select {
	float: left;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<br>
	<label>글쓰기 </label> <br>
	<form action="admin_community_board_add2.do" class="form-group" method="POST" name="frm">
		제목 : <input type="text"  class="form-control" name="com_board_title" size="30" /> <br>
		말머리 : <select name="com_board_type"  class="form-control">
			<option value="선택">선택하세요</option>
			<option value="유머">유머</option>
			<option value="맛집">맛집</option>
			<option value="취미">취미</option>
			<option value="감성">감성글</option>
			<option value="공유">공유</option>
		</select> <br>
		
		내용 :
		<textarea name="com_board_content" rows="10" cols="60"  class="form-control"></textarea>
		<br> 
		<input class="btn" type="submit" value="등록" />
		<input type="button" class="btn" id="cancel" value="취소"/>
	</form>
	


</body>
</html>