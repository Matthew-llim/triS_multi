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
<link rel="stylesheet" href="./mypage_css/Myclub.css">
	
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
			<div class="properties_list">
				<div class="container">
					<div align="center"><h1 class="h1_design">모임 수정 페이지</h1></div><br/>
					<form id="club_mod_frm">
						<label class="label_design">클럽이름</label><input id="club_name" name="club_name" type="text" class="form-control" value="${vo.club_name }"><br/>
						<label class="label_design">제목</label><input id="club_title" name="club_title" type="text" class="form-control" value="${vo.club_title }"><br/>
						<label class="label_design">인원</label><input id="max_member" name="max_member"type="number" class="form-control" value="${vo.max_member}"><br/>
						<label class="label_design">소개</label><textarea id="club_content" name="club_content" rows="8" cols="24" class="form-control" >${vo.club_content}</textarea><br/>
						<label class="label_design">사진등록</label><input id="club_thumb_img" name="club_thumb_img" type="file" class="form-control" value="${vo.club_thumb_img}"><br/>
						<select id="l_category_no" name="l_category_no" class="input-sm" >
							<option>지역선택</option>
							<jl:forEach items="${lmap}" var="m">
								<jl:choose>
									<jl:when test="${vo.l_category_no eq m.l_category_no}">
										<option value="${m.l_category_no}" selected="selected">${m.l_category_name}</option>
									</jl:when>
									<jl:otherwise>
										<option value="${m.l_category_no}">${m.l_category_name}</option>
									</jl:otherwise>
								</jl:choose>
							</jl:forEach>
						</select>
						<select id="c_category_no" name="c_category_no" class="input-sm">
							<option>분야선택</option>
							<jl:forEach items="${cmap}" var="c">
								<jl:choose>
									<jl:when test="${vo.c_category_no eq c.c_category_no}">
										<option value="${c.c_category_no}" selected="selected">${c.c_category_name}</option>
									</jl:when>
									<jl:otherwise>
										<option value="${c.c_category_no}">${c.c_category_name}</option>
									</jl:otherwise>
								</jl:choose>
							</jl:forEach>
						</select>
						<input name="user_id" type="hidden" value="${vo.user_id}">
						<input name="club_no" type="hidden" value="${vo.club_no}">
						<input name="create_time" type="hidden" value="${vo.create_time}">
						<div align="right"><input id="submit_btn" type="button" value="등록하기" class="btn">&nbsp<input id="cancel" type="button" value="취소하기" class="btn"></div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
	<!--  end footer  -->	
	
	
	<!-- 모임 등록 modal창 시작 -->
	<div id="club_add_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="club_add_head" class="modal-header" align="center"><h4>모임 등록</h4></div>
				<div id="club_add_body" class="modal-body" align="center">
					<h4>모임을 등록 하시 겠습니까?</h4>
				</div>
				<div id="ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='club_add_yes'>등록</button>
					<button type='button' class='btn btn-primary' id='club_add_no'>취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모임 등록 modal창 끝 -->
	
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
			// 기본 모달창 확인 버튼 클릭 시 이벤트 발생
			$("#basic_modal_Yes").on("click",function(){
				$("#basic_modal").modal("hide");
			});
			
			/* 글 등록 모달 Yes or No */
			$("#club_add_yes").on("click",function(){
				if($("#club_name").val()==''){
					$("#basic_mobody").html("<h4>모임이름을 등록해주세요.</h4>");
				}else if($("#club_title").val()==''){
					$("#basic_mobody").html("<h4>글 제목을 등록해주세요.</h4>");
				}else if($("#max_member").val()==''){
					$("#basic_mobody").html("<h4>모임 최대인원을 등록해주세요.</h4>");
				}else if($("#club_content").val()==''){
					$("#basic_mobody").html("<h4>모임 소개를 등록해주세요.</h4>");
				}else if($("#l_category_no").val()=='0'){
					$("#basic_mobody").html("<h4>지역카테고리를 선택해주세요.</h4>");
				}else if($("#c_category_no").val()=='0'){
					$("#basic_mobody").html("<h4>분류카테고리를 선택해주세요.</h4>");
				}else if($("#club_name").val().length>49){
					$("#basic_mobody").html("<h4>모임이름을 50자 이하로 등록해주세요.</h4>");
				}else if($("#club_title").val().length>99){
					$("#basic_mobody").html("<h4>글 제목을 100자 이하로 등록해주세요.</h4>");
				}else{
					okBtnClick();
				}
				$("#club_add_modal").modal("hide");
				$("#basic_modal").modal("show");
			});
			$("#club_add_no").on("click",function(){
				cancelBtnClick();
			});			
			/* 글 등록 모달 Yes or No */			
			var okBtnClick = function () {
				var frm = $("#club_mod_frm")[0];
				var formData = new FormData(frm);
				$.ajax({
					type : "POST",
					url : "club_mod_club_submit.do",
					data : formData,
					processData: false,
                    contentType: false,
					success	: function(rt) {
						if(rt=="ok"){
							$("#club_add_modal").modal("hide");
							$("#basic_mobody").html("<h4>모임이 수정 되었습니다.</h4>");
							$("#basic_modal").modal("show");
							$("#basic_modal").on("hidden.bs.modal",function(){
								$("#basic_modal").modal("hide");
								location.href="club_home.do";
							});
						}else{
							$("#club_add_modal").modal("hide");
							$("#basic_mobody").html("<h4>모임 수정 처리가 실패 되었습니다.</h4>");
							$("#basic_modal").modal("show");
							$("#basic_modal").on("hidden.bs.modal",function(){
								$("#basic_modal").modal("hide");
								location.reload();
							}); 
						}
				    }
				});
			}
			var cancelBtnClick = function () {
				$("#club_add_modal").modal("hide");
			}
			
			// 모임 등록 버튼 클릭 시 이벤트 발생
			$("#submit_btn").on("click",function(){
				$("#club_add_modal").modal("show");
			});//submit_btn.on click
			
			$("#cancel").on("click",function(){
				location.href="club_detail.do?club_no="+${vo.club_no};
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