<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script>
 
 	function review_scoreChange() {
 		var x = document.getElementById("review_score_range");
 		var y = document.getElementById("review_score");
 		y.value=x.value;
 	}
 	
 	$(document).ready(function(){
 		
 	});
 </script>
</head>
<body>
	<div class="container">
		<h1>리뷰 작성하기</h1>
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
			<input type="submit" class="btn btn-default" value="리뷰 작성">
		</form>
	</div>
</body>
</html>