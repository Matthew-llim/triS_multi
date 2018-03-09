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
	<!--<div class="container"> -->
			<div class="wrapper">
				<div align="center">
					<h1 style="font: bold; color: #026fac;">
						<label>${vo.club_name}</label>
					</h1>
					<h3>
						<label>${vo.club_title}</label>
					</h3>
					<br />
				</div>
				<div align="right">
					<h4 class="bold_degisn"><label>#현재 인원${vo.user_count}</label></h4>
				</div>
				<br /> <h2 class="bold_degisn"><label>소개</label></h2>
				<textarea rows="5" cols="30" disabled="disabled"
					class="form-control club_textarea" style="cursor:default">${vo.club_content}</textarea>
				<br />
				<div align="right">
					<input id="clubApply" type="button" value="신청하기" style="display: none" class="btn"> 
					<input id="club_mod_club" type="button" value="모임 수정하기" style="display: none" class="btn">
					<input id="moveCommunity" type="button" value="모임커뮤니티 가기" style="display: none" class="btn">
				</div>
				<br />
				<br />
				<br />

				<h2 class="bold_degisn">모임 장소 추천 페이지</h2>
				<%-- <div class="cycle-slideshow" align="center"
						data-cycle-fx="scrollHorz"
						data-cycle-pause-on-hover="true"
						data-cycle-speed="200">
						<jl:forEach items="${sVO}" var="svo">
							<a href="space_detail.do?space_no=${svo.space_no}">
							<img src="thumbnail/${svo.space_thumb_img}" alt="공간 사진 없음"/></a>
						</jl:forEach>
					    <img src="thumbnail/abc.jpg"/>
					    <img src="thumbnail/Penguins.jpg"/>
					    <img src="thumbnail/Tulips.jpg"/>
				    </div> --%>
				<div id="img_slide" align="center">
					<jl:if test="${sVO eq '[]'}">
						<h4>해당 지역에 등록된 공간이 없습니다.</h4>
					</jl:if>
					<jl:forEach items="${sVO}" var="svo">
						<a href="space_detail.do?space_no=${svo.space_no}"> 
						<img src="thumbnail/${svo.space_thumb_img}" onerror="this.src='img/no_img.jpg'"/></a>
					</jl:forEach>
				</div>

				<!-- modal창 시작 -->
				<form id="frm" action="club_apply.do" method="post">
					<div id="modal" class="modal fade" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-head" align="center">
									<h4>모임 신청</h4>
								</div>
								<div class="modal-body" align="center">
									<h3 id="modalbody">
										<textarea name="apply_content" id="apply_content"
											class='form-control' rows="7" placeholder="자기소개를 입력하세요"></textarea>
										<input name="user_id" type="hidden" value="${user_id}" /> <input
											name="club_no" type="hidden" value="${vo.club_no}" />
									</h3>
								</div>
								<div id="ft" class="modal-footer">
									<button type='button' class='btn btn-default'
										id='modal-btn-Yes'>등록</button>
									<button type='button' class='btn btn-primary' id='modal-btn-No'>취소</button>
								</div>
							</div>
						</div>
					</div>
				</form>
				<!-- modal창 끝 -->

				<!-- 모임커뮤니티 이동페이지 post방식으로 설정 -->
				<div style="display: none">
					<form id="move_frm" action="club_community.do" method="post">
						<input name="club_no" type="hidden" value="${vo.club_no}" />
					</form>
				</div>
				
				<!-- 기본 modal창 시작 -->
				<div id="basic_modal" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div id="basic_mobody" class="modal-body" align="center"></div>
							<div id="basic_ft" class="modal-footer">
								<button type='button' class='btn btn-default'
									id='basic_modal_Yes'>확인</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 기본 modal창 끝 -->

			</div>
<!-- 		</div> -->
	</section>
	<!-- ******************************* footer ******************************* -->
	  <%@include file="./jsp/footer.jsp"%>  
	<!--  end footer  -->
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			/* 기본 모달창 확인 버튼 클릭하면 숨기기 */
			$("#basic_modal_Yes").on("click",function(){
				$("#basic_modal").modal("hide");
			});
			
			//flag와 user_id를 이용해서 신청버튼과 모임커뮤니티 버튼 조정.
			if('${user_id}'=='${vo.user_id}'||'${user_id}'=='admin'||'${flag}'==''){
				$("#moveCommunity").attr("style","display:inline;");
				$("#club_mod_club").attr("style","display:inline;");
			}else{
				if('${flag}'=='10001'){
					$("#clubApply").attr("style","display:inline;");
					$("#clubApply").attr("value","신청 중");
					$("#clubApply").attr("disabled","disabled");
				}else if('${user_id}'==''){}
				else if('${flag}'=='10000'){
					$("#clubApply").attr("style","display:inline;");
				}
			}
			
			/* 클럽 신청 이벤트 */
			$("#clubApply").on("click",function(){
				$("#modal").modal();
				$("#modal-btn-Yes").on("click",function(){
					var formData = $("#frm").serialize();
					$.ajax({
						type : "POST",
						url : "club_apply.do",
						data : formData,
						success	: function(rt) {
							if(rt=="10000"){
								$("#modal").modal("hide");
								$("#basic_mobody").html("<h4>모임 신청이 되었습니다.</h4>");
								$("#basic_modal").modal("show");
								$("#basic_modal").on("hidden.bs.modal",function(){
									location.reload();
								});
							}else if(rt=="10001"){
								$("#modal").modal("hide");
								$("#basic_mobody").html("<h4>신청 처리가 실패 되었습니다.</h4>");
								$("#basic_modal").modal("show");
								$("#basic_modal").on("hidden.bs.modal",function(){
									$("#basic_modal").modal("hide");
									location.reload();
								});
							}
					    }
					});
				});
				$("#modal-btn-No").on("click",function(){
					$("#modal").modal('hide');
				});
			});
			/* 모임커뮤니티 이동하는 이벤트 */
			$("#moveCommunity").on("click",function(){
				$("#move_frm").submit();
			});
			/* 모임 수정 페이지로 이동하는 이벤트 */
			$("#club_mod_club").on("click",function(){
				location.href="club_mod_club.do?club_no="+${vo.club_no};
			});

			/* 네비바 관련 script */
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
		 	
		 	/* 이미지 슬라이드 구현 */
		 	$("img").css("width",200);
		 	/* setInterval(function(){
		 		$("#img_slide").append($("img").first());
		 	},2000); */
		 	
		});
		
	</script>	
	
</body>
</html>