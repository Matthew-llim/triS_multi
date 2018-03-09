<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
.btn{

color: $F5F5F5
}
.mc{
text-align: center;
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

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">유저상세정보</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
				<form action="admin_user_mod.do" method="POST">
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<td>이름</td>
								<td>유저 ID</td>
								<td>주민등록번호 앞자리</td>
								<td>주민등록번호 뒷자리</td>
								<td>성별</td>
								<td>전화번호</td>
								<td>닉네임</td>
								<td>우편 번호</td>
								<td>상세 주소</td>
								<td>이메일</td>
							</tr>
						</thead>
							<tr>
								<td>${vo.user_name}</td>
								<td>${vo.user_id}</td>
								<td>${vo.ssn1}</td>
								<td>${vo.ssn2}</td>
								<jl:choose>
									<jl:when test="${vo.gender == 'M'}">
										<td>남자</td>
									</jl:when>
									<jl:when test="${vo.gender == 'F'}">
										<td>여자</td>
									</jl:when>
								</jl:choose>
								<td>${vo.phone}</td>
								<td>${vo.nickname}</td>
								<td>${vo.zipcode}</td>
								<td>${vo.zipdetail}</td>
								<td>${vo.email}</td>
							</tr>
					</table>
					<div class="mc">
					<input type="hidden" name="user_name" value="${vo.user_name}"/>
					<input type="hidden" name="user_id" value="${vo.user_id}"/>
					<input type="hidden" name="phone" value="${vo.phone}"/>
					<input type="hidden" name="nickname" value="${vo.nickname}"/>
					<input type="hidden" name="zipcode" value="${vo.zipcode}"/>
					<input type="hidden" name="email" value="${vo.email}"/>
					<button type="submit" class="btn" id="btnmod" ">수정 하기</button>
					<!-- <a href="admin_users.do"> <button type="button" class="btn" >취소</button></a>  -->
					&nbsp;<a href="admin_users.do"><input type="button" class="btn" value="취소 하기"/></a>
					</div>
				</form>

		 
                            <!-- /.table-responsive -->
                       
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
         

</body>
</html>