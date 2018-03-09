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


</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
</head>
<body>
<table border="1" cellspacing="0" cellpadding="8" class="table table-hover">
<tr>
<th>NO</th>
<th>TITLE</th>
<th>TIME</th>
<th>ID</th>
<th>VIEW</th>
<jl:forEach var="vo" items="${mrl}">
<tr>
<td>${vo.com_qna_no}</td>
<td><a href="community_qna_read.do?com_qna_no=${vo.com_qna_no}">${vo.com_qna_title}</a></td>
<td>${vo.the_time}</td>
<td>${vo.user_id}</td>
<td>${vo.view_count}</td>
</tr>

</jl:forEach>

</table>
	<form action="community_qna_list.do" method="post">
		<input type="submit" value="QnA¸ñ·Ï" class="btn btn-info btn-sm"/>
	</form>
</body>
</html>