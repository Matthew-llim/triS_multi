<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript">
		function move(){
			location.href="myinfo_ckpass.do";
		}
		setTimeout(move,3000);
	</script>
</head>
<body>
	비밀번호가 올바르지 않습니다.<br/>
	<a href="myinfo_ckpass.do"><input type="button" class="btn" value="다시입력"/></a>
</body>
</html>