<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />

	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
	
	<script type="text/javascript" src="./Resources/js/jquery.js"></script>
	<script type="text/javascript" src="./Resources/js/main.js"></script>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./common.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>

	<script>
	
	$(document).ready(function() {
	/* 기본 모달 창 닫기 버튼 눌렀을 때 이벤트 발생 */
	$("#basic_modal_Yes").on("click",function(){
		$("#basic_modal").modal("hide");
	});
		


	$("#ee").on("click",function(){
		$("#text_add_modal").modal("show");
		$("#text_add_modal_Yes").on("click",function(){
			$("#text_add_modal").modal("hide");
			$("#basic_mobody").html("<h4>QnA가 등록되었습니다.</h4>");
			$("#basic_modal").modal("show");
			$("#basic_modal").on("hidden.bs.modal",function(){
				$("#qna_submit").submit();
			});
			
		});
		$("#text_add_modal_No").on("click",function(){
			$("#text_add_modal").modal("hide");
		});
	});
	/* 	$("#btnClose").on("click", function() {
			$("#QnaModal").modal("hide");
		}); */
	/* 	$("#status-modal").on("hidden.bs.modal",function(){
	        location.href="space_detail.do?space_no="+${space.space_no};
	     }); */
		
		/* $("#btnQnASub").on("click", function() {
			$("#completeModal").modal("show");
			
		}); */
		
	/* 	$("#completeModal").on("hidden.bs.modal",function(){
			location.href="community_qna_list.do";
			$("#qna_submit").submit();
		}); */
	});
	

	</script>
<!--에디터 -->	
	<script>
$(document).ready(function() {
	$("#summernote").summernote({
        lang: 'ko-KR',
		height : 300, // set editor height
		minHeight : null, // set minimum height of editor
		maxHeight : null, // set maximum height of editor
		focus : true // set focus to editable area after initializing summernote 
	
	});
});
</script>
</head>
<body>
<!-- *********************  header  ************************ -->
         <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ --> 
<br/>
	<p class="community_qna_add_p"><label>QnA 글쓰기</label></p>
	<hr style="border: solid 0.5px black;">
	<div class="container">
		<div class="col-lg-12">
			<form action="community_qna_add2.do" method="POST" id="qna_submit">
				<input type="hidden" name="user_id" value="${user_id}"/>
				<label>제목</label><input  class="form-control" type="text" name="com_qna_title"/><br/>
				<label>내용</label><textarea  id="summernote"  name="com_qna_content" ></textarea>
				<br/>
				<div class="community_qna_add_write">
				<input type="button" value="등록" class="btn btn-info" data-toggle="modal"  id="ee"/>
				</div>
			</form>
			
			<form action="community_qna_list.do" method="POST">
				<input type="submit" value="취소" class="btn btn-info"/>
			</form>
		</div>
	</div>
	
		<br>
	<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
	<!--  end footer  -->
	
	<!-- 기본 modal창 시작 -->
	<div id="basic_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="basic_mobody" class="modal-body" align="center">
				</div>
				<div id="basic_ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='basic_modal_Yes'>닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 기본 modal창 끝 -->
	<!-- 글 수정 modal창 시작 -->
	<div id="text_add_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="mohead" class="modal-header" align="center"><h4>글 등록</h4></div>
				<div id="mobody" class="modal-body" align="center">
				<h4>QnA를 등록 하시겠습니까?</h4>
				</div>
				<div id="ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='text_add_modal_Yes'>등록</button>
					<button type='button' class='btn btn-primary' id='text_add_modal_No'>취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 글 수정 modal창 끝 -->	
	
	
	<!-- 수정 전 코드 -->
	<!-- 		<div class="modal fade" id="QnaModal" role="dialog">
		    <div class="modal-dialog">
		      Modal content
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>QnA를 작성 하시겠습니까?</p>
		        </div>
		        <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnClose" value="닫기">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnQnASub" value="작성">
		        </div>
		      </div>
		    </div>
		</div> -->
<!-- 	<div class="modal fade" id="completeModal" role="dialog">
		    <div class="modal-dialog">
		      Modal content
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>QnA 작성 완료!</p>
		        </div>
		         <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" value="확인">
		        </div>
		      </div>
		    </div>
		</div> -->
</body>
</html>