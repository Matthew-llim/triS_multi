<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />

	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
		
	<script type="text/javascript" src="./Resources/js/jquery.js"></script>
	<script type="text/javascript" src="./Resources/js/main.js"></script>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./common.js"></script>
	
	
	
	
	<style type="text/css">
		.textarea_h{
			padding: 10px;
			padding-top: 50px;
		}
		.label_reple{
			padding-bottom: 18px;
		}
	</style>
</head>
<body>
	<div>
		<label><h3>제목</h3></label><label style="margin: 20px;">::</label> <label>${qnaInfo.space_qna_title}</label>
	</div>
	<hr>
	<div class="col-sm-6" align="left">
		<label><span class="glyphicon glyphicon-user"></span>
			${qnaInfo.user_id}</label>
	</div>
	<div class="textarea_h" >
		<textarea rows="15" cols="30" disabled="disabled" class="form-control" style="cursor:default">${qnaInfo.space_qna_content}</textarea>
		<br />
	</div>

	<form id="add_reple_frm">
		<div class="label_reple">
			<label id="reple" class="l" style="width: 100px; font-size: 100%">답변</label><hr>
		</div>
		<div class="form-group" align="left">
			<div class="input-group" >


				<label id="reple" style="height: 80px;" style="cursor: default"
					id="c_board_reple_content" class="l" >${Space_qna_repleVO.space_qna_reple_content}</label>



			</div>
		</div>
	</form>
	
	<form action="del_space_qna.do" method="POST">
		<input type="hidden" value="${space_qna_no}" name="space_qna_no"/>
		<input type="submit" value="삭제" class="btn"/>
	</form>
	
	<br />
	<hr />
	<div id="reple_list" class="form-group" align="left"></div>


</body>
</html>