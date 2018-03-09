<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
</head>
<body>
	<table>
		<tr>
			<td> 질문 : ${qnaInfo.space_qna_title}</td>
		</tr>
		<tr>
			<td> 내용 : ${qnaInfo.space_qna_content}
		</tr>
		<tr>
			<td> 답변 : ${Space_qna_repleVO.space_qna_reple_content }</td>
		</tr>
	</table>
</body>
</html>