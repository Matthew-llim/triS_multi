<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	
<script type="text/javascript" src="./Resources/js/jquery.js"></script>
<script type="text/javascript" src="./Resources/js/main.js"></script>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script>
 
 	function review_scoreChange() {
 		var x = document.getElementById("review_score_range");
 		var y = document.getElementById("review_score");
 		y.value=x.value;
 	}
 	
 	$(document).ready(function(){
 		$("#btn_review_add").on('click',function(){
 			if($("#review_title").val()==""){
				$("#status-modal-body").html("<h4>후기 제목을 입력해주세요.</h4>");
				$("#status-modal").modal('show');
			}
			else if($("#review_content").val()==""){
				$("#status-modal-body").html("<h4>후기 내용을 입력해주세요.</h4>");
				$("#status-modal").modal('show');
			}else{
				$("#btn_review_add").attr("type","submit");
			}
 		});
 		
 	});
 </script>
</head>
<body>

	<!-- *********************  header  ************************ -->
    <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ -->
	<div class="container">
		<h1>후기 작성</h1>
		<form method="POST" action="review_add2.do" enctype="multipart/form-data">
			<div class="form-group">
			<label for="review_title">제목</label>
			<input type="text" id="review_title" name="review_title" class="form-control">
			</div>
			
			<div class="form-group">
			<label for="review_content">내용</label>
			<textarea  row="10" col="30" id="review_content" name="review_content" class="form-control"></textarea>
			</div>
			
			<div class="form-group">
				<label for="review_score">점수</label>
				<input id="review_score_range" type="range" min="0" max="10" onchange="review_scoreChange();"/>
				<input id="review_score" name="review_score" type="number" min="0" max="10" value="5"/>점
			</div>
			
			<div class="form-group">
			<label for="review_img">첨부이미지</label>
			<input type="file" id="review_img" name="review_img" class="form-control">
			</div>
			
			
			<input type="hidden" name="user_id" value="${review.user_id }">
			<input type="hidden" name="space_no" value="${review.space_no }">
			<input id="btn_review_add" type="button" value="후기 작성" class="btn btn-default">
		</form>
		<br/>
		<br/>
	</div>
	<!-- 상태 모달 -->
						<div class="modal fade" id="status-modal" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-body">
										<div id="status-modal-body" align="center">XX 완료</div>
									</div>
									<div class="modal-footer">
										<button id="btn-status-close" type="button"
											class="btn btn-primary" data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
			<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
		<!--  end footer  -->
</body>
</html>