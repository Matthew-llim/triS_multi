<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<form action="admin_notice_add2.do" method="POST">
		제목 : <input type="text" name="notice_title"/><br/>
		내용 : <textarea name="notice_content" rows="7" cols="63"></textarea>
		<input type="submit" value="작성"/>
	</form>
</body>
</html>