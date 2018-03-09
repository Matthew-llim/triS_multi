<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<title>Welcome to Multi Space</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	

<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	
<script type="text/javascript" src="./Resources/js/jquery.js"></script>
<script type="text/javascript" src="./Resources/js/main.js"></script>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./common.js"></script>

</head>
<body>

	<!-- *********************  header  ************************ -->
         <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ -->
	<section class="listings">
		<div class="wrapper">
			<div align="center"><h1 class="h1_design">글 수정</h1></div><br/>
			<form id="frm">
				<div align="right"><label>작성시간 ${vo.the_time}</label><br/><label> 작성자 ${vo.user_id}</label><br/></div>
				
				<label>말머리</label>
				<select id="c_board_subject" name="c_board_subject" class="input-sm">
					<option value="0"></option>	
					<option value="일반">일반</option>	
					<option value="유머">유머</option>	
					<option value="질문/답변">질문/답변</option>	
				</select><br/><br/>
				<label class="label_design">제목</label><input id="c_board_title" name="c_board_title" type="text" value="${vo.c_board_title}" class="form-control"/><br/>
				<label class="label_design">소개</label><textarea id="c_board_content" name="c_board_content" rows="15" cols="30" class="form-control">${vo.c_board_content}</textarea><br/>
				<input name="c_board_no" type="hidden" value="${vo.c_board_no}">
				<div align="right">
					<input id="textMod" type="button" value="수정하기" class="btn">
					<input id="textDel" type="button" value="삭제하기" class="btn">
					<input id="cancel" type="button" value="취소" class="btn">
				</div>
			</form>
		</div>
	</section>
	<!-- ******************************* footer ******************************* -->
	  <%@include file="./jsp/footer.jsp"%>  
	<!--  end footer  -->
	
	
	
	<!-- 글 수정 modal창 시작 -->
	<div id="text_mod_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="mohead" class="modal-header" align="center"><h4>글 수정</h4></div>
				<div id="mobody" class="modal-body" align="center">
					<h4>글을 수정 하시 겠습니까?</h4>
				</div>
				<div id="ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='text_modal_Yes'>수정</button>
					<button type='button' class='btn btn-primary' id='text_modal_No'>취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 글 수정 modal창 끝 -->
	
	<!-- 글 삭제 modal창 시작 -->
	<div id="del_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="mohead" class="modal-header" align="center"><h4>글 삭제</h4></div>
				<div id="mobody" class="modal-body" align="center">
					<h4>글을 삭제하시겠습니까?</h4>
				</div>
				<div id="ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='del_modal_Yes'>삭제</button>
					<button type='button' class='btn btn-primary' id='del_modal_No'>취소</button>
				</div>
			</div>
		</div>
	</div>
	<input id="c_board_no" name='c_board_no' type='hidden' value="${vo.c_board_no}"/>
	<!-- 글 삭제 modal창 끝 -->
	
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
	
	<!-- 자바스크립트 -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			//기본 모달창 확인 버튼 클릭 시 이벤트 발생
			$("#basic_modal_Yes").on("click",function(){
				$("#basic_modal").modal("hide");
			});
			
			$("#cancel").on("click",function(){
				location.href="club_board_detail.do?c_board_no="+${vo.c_board_no};
			});
			
			// 글 수정 버튼 클릭 시 이벤트 발생
			$("#textMod").on("click",function(){
				$("#text_mod_modal").modal("show");
				$("#text_modal_Yes").on("click",function(){
					if($("#c_board_title").val()==''){
						$("#basic_mobody").html("<h4>글 제목을 등록해주세요.</h4>");
					}else if($("#c_board_content").val()==''){
						$("#basic_mobody").html("<h4>글 내용을 등록해주세요.</h4>");
					}else if($("#c_board_title").val().length>199){
						$("#basic_mobody").html("<h4>글 제목을 200자 이하로 등록해주세요.</h4>");
					}else if($("#c_board_subject").val()=='0'){
						$("#basic_mobody").html("<h4>말머리를 선택해주세요.</h4>");
					}else{
						okBtnClick();
					}
					$("#text_add_modal").modal("hide");
					$("#basic_modal").modal("show");
					
				});
				$("#text_modal_No").on("click",function(){
					$("#text_mod_modal").modal("hide");
				});
			});
			
			var okBtnClick = function () {
				var formData = $("#frm").serialize();
				$.ajax({
					type : "POST",
					url : "club_mod_board_detail_submit.do",
					data : formData,
					success	: function(rt) {
						if(rt=="ok"){
							$("#text_mod_modal").modal("hide");
							$("#basic_mobody").html("<h4>글이 수정 되었습니다.</h4>");
							$("#basic_modal").modal("show");
							$("#basic_modal").on("hidden.bs.modal",function(){
								$("#basic_modal").modal("hide");
								location.href="club_board_detail.do?c_board_no="+${vo.c_board_no};
							});
						}else{
							$("#mod_modal").modal("hide");
							$("#basic_mobody").html("<h4>글 수정이 실패 되었습니다.</h4>");
							$("#basic_modal").modal("show");
							$("#basic_modal").on("hidden.bs.modal",function(){
								$("#basic_modal").modal("hide");
								location.reload();
							});
						}
				    }
				});
			};
			
			// 글 삭제 버튼 클릭 시 이벤트 실행
			$("#textDel").on("click",function(){
				$("#del_modal").modal("show");
				$("#del_modal_Yes").on("click",function(){
					var url = "club_del_board_detail.do?c_board_no="+${vo.c_board_no};
					ajaxGet(url,function(rt){
						if(rt=="ok"){
							$("#del_modal").modal("hide");
							$("#basic_mobody").html("<h4>글이 삭제 되었습니다.</h4>");
							$("#basic_modal").modal("show");
							$("#basic_modal_Yes").on("click",function(){
								$("#basic_modal").modal("hide");
								location.href="club_community.do?club_no="+${vo.club_no};
							});
						}else{
							$("#del_modal").modal("hide");
							$("#basic_mobody").html("<h4>글 삭제가 실패 되었습니다.</h4>");
							$("#basic_modal").modal("show");
							$("#basic_modal_Yes").on("click",function(){
								$("#basic_modal").modal("hide");
								location.reload();
							});
						}
					});
						
					
				});
				$("#del_modal_No").on("click",function(){
					$("#del_modal").modal("hide");
				});
			});
			
			
			/* 네비 바 부분 */
			var scOffset = $( '.navbar-Menu' ).offset();
			$( window ).scroll( function() {
				if ( $( document ).scrollTop() > scOffset.top+50 ) {
					$( '.navbar' ).addClass( 'navbar-fixed-top' );
				}
				else {
					$( '.navbar' ).removeClass( 'navbar-fixed-top' );
				}
			});
			var url = "chk_login.do";
		 	ajaxGet(url,function(rt){
			// 로그인 실패시 : rt값 -> ("/main_html.do")에서 10002 return
			if(rt =="10002"){ 
				$("#login_nav").hide();
				$("#non_login_nav").show();
			}
			// 로그인 시 : rt값 -> user_name
			else if(rt!=""){ 
			$("#login_nav").show();
			$("#non_login_nav").hide(); 
			$("#user_name").text(rt+"님");
				}
			});
		 	/* 네비 바 부분 */
		});
	</script>
</body>
</html>