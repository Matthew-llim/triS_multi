<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@taglib prefix="jl"
	uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="./Resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="./Resources/css/responsive.css">
<script type="text/javascript" src="./Resources/js/jquery.js"></script>
<script type="text/javascript" src="./Resources/js/main.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec027f4a7a75f9cd6ba56c97e88f31ae&libraries=services,clusterer,drawing"></script>				


<script>
	$(document).ready(function() {
						$("#btn_qna_submit").on("click",function(){
							if($("#space_qna_title").val()==""){
								$("#bookmark-modal-body").html("<h4>질문 제목을 입력해주세요.</h4>");
								$("#bookmark-modal").modal('show');
							}
							else if($("#space_qna_content").val()==""){
								$("#bookmark-modal-body").html("<h4>질문 내용을 입력해주세요.</h4>");
								$("#bookmark-modal").modal('show');
							}else{
								$("#btn_qna_submit").attr("type","submit");
							}
						});
						if ("${review_flag}" == 1) {
							var review = $("#review").offset();
							$('html, body').animate({
								scrollTop : review.top - 200
							}, 'slow');
						}
						if ("${qna_flag}" == 1) {
							var qna = $("#qna").offset();
							$('html, body').animate({
								scrollTop : qna.top - 200
							}, 'slow');
						}

						$(".sub_img").on("click", function() {
							var img = $(this).attr("src");
							$("#main_img").attr("src", img);
						});

						var scOffset = $('.navbar-Menu').offset();
						$(window).scroll(function() {
							if ($(document).scrollTop() > scOffset.top) {
								$('.navbar').addClass('navbar-fixed-top');
							} else {
								$('.navbar').removeClass('navbar-fixed-top');
							}
						});
						var url = "chk_login.do";
						ajaxGet(url, function(rt) {
							// 로그인 실패시 : rt값 -> ("/main_html.do")에서 10002 return
							if (rt == "10002") {
								$("#login_nav").hide();
								$("#non_login_nav").show();
							}

							// 로그인 시 : rt값 -> user_name
							else if (rt != "") {
								$("#login_nav").show();
								$("#non_login_nav").hide();
								$("#user_name").text(rt + "님");
							}
						});

						if ("${bookmark}" != "") {
							$("#btn_bookmark").html("즐겨찾기해제");
						}
						if ("${space_code }" == "20002") {
							$("#status-modal-body").html("<h4>후기 삭제 성공</h4>");
							$("#status-modal").modal('show');
						} else if ("${space_code }" == "20001") {
							$("#status-modal-body").html(
									"<h4>본인만 삭제 가능합니다</h4>");
							$("#status-modal").modal('show');
						} else if ("${space_code }" == "20003") {
							$("#status-modal-body").html("<h4>후기 등록 성공</h4>");
							$("#status-modal").modal('show');
						} else if ("${space_code }" == "20004") {
							$("#status-modal-body").html("<h4>질문 수정 성공</h4>");
							$("#status-modal").modal('show');
						} else if ("${space_code }" == "20005") {
							$("#status-modal-body").html("<h4>질문 삭제 성공</h4>");
							$("#status-modal").modal('show');
						} else if ("${space_code }" == "20006") {
							$("#status-modal-body").html("<h4>질문 등록 성공</h4>");
							$("#status-modal").modal('show');
						}
						$("#status-modal")
								.on(
										"hidden.bs.modal",
										function() {
											location
													.replace("space_detail.do?space_no=${space.space_no}&review_flag=${review_flag_imsi}&qna_flag=${qna_flag_imsi}");
										});

						$("#btn_bookmark").on("click", function() {
							if ($(this).html() == "즐겨찾기등록") {
								var url = $(this).attr("add");
								ajaxGet(url, function(rt) {
									$("#btn_bookmark").html("즐겨찾기해제");
									$("#bookmark-modal-body").html("<h4>즐겨찾기가 등록되었습니다.</h4>");
									$("#bookmark-modal").modal('show');
								});
							} else {
								var url = $(this).attr("del");
								ajaxGet(url, function(rt) {
									$("#btn_bookmark").html("즐겨찾기등록");
									$("#bookmark-modal-body").html("<h4>즐겨찾기가 해제되었습니다.</h4>");
									$("#bookmark-modal").modal('show');
								});
							}

						});

						$(".collapsed")
								.on(
										"click",
										function() {

											//후기가 있으면 작성 못하게 하는거 & 후기 없으면 안불러 오게 해야함
											var space_qna_no = $(this).attr(
													"no");
											ajaxGet(
													"find_space_qna_reple.do?space_qna_no="
															+ space_qna_no,
													function(rt) {
														if (rt.length > 5) {
															$("#qna_reple_add")
																	.hide();
															var qna_reple = window
																	.eval("("
																			+ rt
																			+ ")");
															var html = "<table>";
															html += "<tr>";
															html += "<td>"
																	+ qna_reple.qna_reple_content
																	+ "</td>";
															html += "</tr>";
															html += "</table>"
															$(
																	"#qna_reple"
																			+ space_qna_no)
																	.html(html);
														} else {

														}

													}, function() {
														alert(2);
													}, function() {
														alert(3);
													});
										});
						$("#a_mod").on("click", function() {
							$("#form_space_mod").submit();
						});
					});
</script>
</head>
<body>
	<!-- *********************  header  ************************ -->
	<%@include file="./jsp/header_page.jsp"%>
	<!-- *********************  header - end  ************************ -->

	<!-- 제목 부분 -->
	<div class="container-fluid">
	
		<div class="col-xs-12">
			<div class="col-xs-2"></div>
			<div class="col-xs-6">
				<div class="panel">
					<h1 id="space_title">${space.space_title }</h1>
				</div>
				<div class="panel">
					<p id="space_content">${space.space_content }</p>
					<br />
					<button class="btn btn-default category"># ${s_category }</button>
					<button class="btn btn-default category"># ${l_category }</button>
					<br />
				</div>
			</div>
			<div class="col-xs-4"></div>
		</div>

		<div class="col-xs-12">
			<div class="col-xs-2"></div>
			<div class="col-xs-6">
				<div class="panel">
					<img src="space_img/${space.space_thumb_img }" width="100%"
						height="100%" onerror="this.src='defualt/defualt.jpg'" />
				</div>
				<p style="font-size: 40px; color: black;">${space.space_content }</p>
				<br/>
				<p style="font-size: 30px; color:balck;">공간 소개</p>
				<hr width="20%" size="10" color="#95BADF"/>
				<br/>
				<pre>
하우스오브조셉디자인(주)은 해외 프랜차이즈 Hotel 및 상업공간의 가구 및 
스타일링/데코레이션 전문회사로서
본사 공간의 세미나룸, 라운지, 테라스, 독립 오피스를 쉐어공간으로 오픈합니다. 

양재천이 내려다 보이는 신축 건물내에 통 유리창으로 되어 있는 
10평 규모의 대형 세미나룸 입니다 :)
모던한 인테리어에 이태리 브랜드가구 및 소품들로 꾸며진 
공간은 모임의 질과 품격을 높일 것이고, 
한 쪽 벽면은 초대형 Full 화이트 보드로 브레인스토밍, 강연 하실 때 
편리하게 사용 가능합니다. 

커피 및 올가닉 티, 음료 무료 서비스가 제공 되며, 30인 내외 모임이 가능한 
야외 테라스도 마련되어 있어 예약/협의도 가능합니다!
실내 디자인 뿐 아니라 주변 환경이 주는 쾌적함이 더해져 회의 및 클래스, 워크샵등 
다목적 모임과 중요한 미팅에 최적의 장소가 될것입니다.
				
				</pre>
				<p>
					<strong>이용 시간</strong> : ${space.open_time } ~ ${space.close_time }시
				</p>
				<br />
				<p>
					<strong>휴무일</strong> : 금,토
				</p>
				<br/>
				<br/>
				<div class="text-center">
					<jl:if test="${fn:length(image.image_one) > 3}">
						<div>
							<img src="space_img/${image.image_one }" width="100%" height="500px"
								id="main_img">
						</div>
					</jl:if>
					<div class="row">
						<jl:if test="${fn:length(image.image_one) > 3}">
							<img src="space_img/${image.image_one }"
								class="sub_img" />
						</jl:if>
						<jl:if test="${fn:length(image.image_two) > 3}">
							<img src="space_img/${image.image_two }" 
								class="sub_img" />
						</jl:if>
						<jl:if test="${fn:length(image.image_three) > 3}">
							<img src="space_img/${image.image_three }"  class="sub_img" />
						</jl:if>
						<jl:if test="${fn:length(image.image_four) > 3}">
							<img src="space_img/${image.image_four }" class="sub_img" />
						</jl:if>
						<jl:if test="${fn:length(image.image_five) > 3}">
							<img src="space_img/${image.image_five }" class="sub_img" />
						</jl:if>
						<jl:if test="${fn:length(image.image_six) > 3}">
							<img src="space_img/${image.image_six }" 
								class="sub_img" />
						</jl:if>
						<jl:if test="${fn:length(image.image_seven) > 3}">
							<img src="space_img/${image.image_seven }" class="sub_img" />
						</jl:if>
					</div>
				</div>
				<hr width="100%" size="10" color="#95BADF"/>
				<br/>
				
				<div>
				<!-- 지도 -->
				<h1>Map</h1>
				<hr width="9%" size="10" color="#95BADF"/>
				<div id="map" style="width:100%;height:400px;"></div>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new daum.maps.LatLng("${space.latitude}", "${space.longitude}"), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
		
					// 지도를 생성합니다    
					var map = new daum.maps.Map(mapContainer, mapOption); 
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new daum.maps.services.Geocoder();
					// 주소로 좌표를 검색합니다
					// 마커가 표시될 위치입니다 
					var markerPosition  = new daum.maps.LatLng("${space.latitude}", "${space.longitude}"); 
					
					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
					    position: markerPosition
					});
					
					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					var iwContent = '<div style="padding:5px;">${space.space_title} <br><a href="http://map.daum.net/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					    iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다
					
					// 인포윈도우를 생성합니다
					var infowindow = new daum.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent 
					});
					  
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow.open(map, marker); 
				</script>
				
				<!-- 지도 끝 -->
				<br/>
				<hr width="100%" size="10" color="#95BADF"/>
					<!-- space q&a 부분 -->
					<div class="col-xs-12" id="qna">
						<h1>QnA</h1>
						<hr width="9%" size="10" color="#95BADF"/>
						<jl:if test="${fn:length(list_space_qna) == 0}"> <div class="text-center"><p class="nothing text-center">등록된 질문이 없습니다.</p></div></jl:if>
						<jl:forEach var="space_qna" items="${list_space_qna }">
							<div class="panel-group" id="accordion${space_qna.space_qna_no }">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											제목 : <a data-toggle="collapse"
												data-parent="#accordion${space_qna.space_qna_no }"
												href="#collapse${space_qna.space_qna_no }"
												no="${space_qna.space_qna_no }" class="collapsed">
												${space_qna.space_qna_title } <br />
											</a> 작성자: ${space_qna.user_id }
										</h4>
									</div>
								</div>

								<div id="collapse${space_qna.space_qna_no }"
									Class="panel-collpase collapse">
									<div class="panel-body">
										
										<table class="table table-condensed">
											<tr>
												<td width="10%">내용</td>
												<td width="60%">${space_qna.space_qna_content }</td>
												<td width="15%">작성 시간</td>
												<td width="15%">${space_qna.the_time }</td>
											</tr>
										</table>
										<jl:if test="${user_id eq space_qna.user_id }">
											<div class="text-right">
												<a href="#qna_mod${space_qna.space_qna_no }"
													data-toggle="modal"><button class="btn btn-default btn-xs">질문 수정</button></a>
												<a href="#qna_del${space_qna.space_qna_no }"
													data-toggle="modal"><button class="btn btn-default btn-xs">질문 삭제</button></a>
											</div>

											<!-- qna 삭제 모달 -->
											<div class="modal fade"
												id="qna_del${space_qna.space_qna_no }" tabindex="-1"
												role="dialog" aria-labelledby="myModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header" align="center">
															<button type="button" class="close" data-dismiss="modal">
																<span aria-hidden="true">&times;</span> <span
																	class="sr-only">Close</span>
															</button>
															<h4 class="modal-title">주의</h4>
														</div>
														<div class="modal-body" align="center">
															<h4>정말 삭제하시겠습니까?</h4>
														</div>
														<div class="modal-footer">
															<a
																href="delete_space_qna.do?space_qna_no=${space_qna.space_qna_no }&space_no=${space_qna.space_no}"
																data-toggle="modal">
																<button type="button" class="btn btn-primary">질문
																	삭제</button>
															</a>
															<button type="button" class="btn btn-primary"
																data-dismiss="modal">닫기</button>
														</div>
													</div>
												</div>
											</div>
											<!-- qna 삭제 모달 끝 -->

											<!-- qna 수정 모달 -->
											<div class="modal fade"
												id="qna_mod${space_qna.space_qna_no }" tabindex="-1"
												role="dialog" aria-labelledby="myModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header" align="center">
															<button type="button" class="close" data-dismiss="modal">
																<span aria-hidden="true">&times;</span> <span
																	class="sr-only">Close</span>
															</button>
															<h4 class="modal-title">QnA 수정</h4>
														</div>
														<form method="POST" action="mod_space_qna.do">
															<div class="modal-body">
																<div class="form-group">
																	<label for="mod_space_qna_title">제목</label> <input
																		type="text" name="space_qna_title"
																		id="mod_space_qna_title" class="form-control"
																		value="${space_qna.space_qna_title }">
																</div>
																<div class="form-group">
																	<label for="mod_space_qna_content">내용</label>
																	<textarea name="space_qna_content"
																		id="mod_space_qna_content" class="form-control">${space_qna.space_qna_content }</textarea>
																</div>
																<input type="hidden" name="user_id" value="${user_id }">
																<input type="hidden" name="space_no"
																	value="${space.space_no }"> <input
																	type="hidden" name="space_qna_no"
																	value="${space_qna.space_qna_no }">
															</div>
															<div class="modal-footer">
																<input type="submit" class="btn btn-primary"
																	value="질문 수정">
																<button type="button" class="btn btn-primary"
																	data-dismiss="modal">닫기</button>
															</div>
														</form>
													</div>
												</div>
											</div>
											<!-- qna 수정 모달 끝 -->


										</jl:if>
										<table class="table">
											<tr>
												<td width="10%;">답변 : </td>
												<td><div id="qna_reple${space_qna.space_qna_no }">등록 된 답변이 없습니다.</div></td>
											</tr>
										</table>
										<br/>
										<jl:forEach var="vo" items="${host }">
											<jl:if test="${vo.crn eq space.crn }">
												<div id="qna_reple_add">
													<form method="POST" action="add_space_qna_reple.do">
														<input type="hidden" name="space_qna_no"
															value="${space_qna.space_qna_no }"> <input
															type="hidden" name="space_no"
															value="${space_qna.space_no }"> <input
															type="hidden" name="user_id" value="${user_id }">
															<div class="form-group">
																<label for="space_qna_reple_content">답글 달기</label>
																<textarea row="5" col="30" name="space_qna_reple_content" id="space_qna_reple_content"  class="form-control"></textarea>
															</div>

														<input type="submit" class="btn btn-default btn-xs" value="답변 등록">
													</form>
												</div>
											</jl:if>
										</jl:forEach>

									</div>
								</div>
							</div>
						</jl:forEach>
						<ul class="pagination pagination-sm">
							<jl:if test="${pz_space_qna.hasPrevPagination }">
								<li><a class="page"
									href="space_detail.do?pg_qna=${ pz_space_qna.paginationStart-1}&space_no=${space.space_no }&qna_flag=1">&lt;</a></li>
							</jl:if>
							<jl:if test="${pz_space_qna.hasPrevPage }">
								<li><a class="page"
									href="space_detail.do?pg_qna=${ pz_space_qna.curPagination-1}&space_no=${space.space_no }&qna_flag=1">&lt;</a></li>
							</jl:if>
							<jl:forEach begin="${pz_space_qna.paginationStart }"
								end="${pz_space_qna.paginationEnd }" step="1" varStatus="vs">
								<jl:choose>
									<jl:when test="${vs.index!=pz_space_qna.curPagination }">
										<li><a class="page"
											href="space_detail.do?pg_qna=${vs.index }&space_no=${space.space_no }&qna_flag=1">${vs.index }</a></li>
									</jl:when>
									<jl:otherwise>
										<li class="active"><a class="page"
											href="space_detail.do?pg_qna=${vs.index }&space_no=${space.space_no }&qna_flag=1">${vs.index }</a></li>
									</jl:otherwise>
								</jl:choose>
							</jl:forEach>
							<jl:if test="${pz_space_qna.hasNextPage }">
								<li><a class="page"
									href="space_detail.do?pg_qna=${pz_space_qna.curPagination+1}&space_no=${space.space_no}&qna_flag=1">&gt;</a></li>
							</jl:if>
							<jl:if test="${pz_space_qna.hasNextPagination }">
								<li><a class="page"
									href="space_detail.do?pg_qna=${pz_space_qna.paginationEnd+1 }&space_no=${space.space_no }&qna_flag=1">&gt;&gt;</a></li>
							</jl:if>
						</ul>
						<!-- space q&a 쓰는 곳 -->
		
						<h3>질문작성</h3>
						<form method="POST" action="add_space_qna.do">
							<input type="hidden" name="space_no" value="${space.space_no }">
							<input type="hidden" name="user_id" value="${user_id }">
							<div class="form-group">
								<label for="space_qna_title">제목</label> <input type="text"
									name="space_qna_title" id="space_qna_title"
									class="form-control">
							</div>
							<div class="form-group">
								<label for="space_qna_content">내용</label>
								<textarea name="space_qna_content" id="space_qna_content"
									class="form-control"></textarea>
							</div>
							<input id="btn_qna_submit" type="button" class="btn btn-default" value="질문하기">
						</form>
					</div>
					<br/> <br/>
					<hr/>
					<!-- 후기 -->
					<div class="col-xs-12" id="review">
						<h1>후기</h1>
						<hr width="9%" size="10" color="#95BADF"/>
						<jl:if test="${fn:length(list_review) == 0}"> <div class="text-center"><p class="nothing text-center">등록된 후기가 없습니다.</p></div></jl:if>
						<jl:forEach var="review" items="${list_review }">
							<div class="panel-group" id="accordion${review.review_no }">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											제목 : <a data-toggle="collapse"
												data-parent="#accordion${review.review_no }"
												href="#collapse_review${review.review_no }"
												class="collapsed"> ${review.review_title } <br />
											</a> 작성자: ${review.user_id }
										</h4>
									</div>
								</div>

								<div id="collapse_review${review.review_no }"
									Class="panel-collpase collapse">
									<div class="panel-body">
										<div class="col-xs-4">
											<img src="review_img/${review.review_img }" width="100%"
												height="100%" alt="사진 없음">
										</div>
										<div class="col-xs-8">
											<table class="table">
												<tr>
													<td>내용</td>
													<td>${review.review_content }</td>
													<td>평점</td>
													<td>${review.review_score }</td>
												</tr>
												<tr>
													<td>작성 시간</td>
													<td rowspan="3">${review.the_time }</td>
												</tr>

											</table>
											<jl:if test="${user_id eq review.user_id }">
												<a href="#review_del${review.review_no }"
													data-toggle="modal">후기 삭제</a>

												<!-- 후기 삭제 모달 -->
												<div class="modal fade" id="review_del${review.review_no }"
													tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header" align="center">
																<button type="button" class="close" data-dismiss="modal">
																	<span aria-hidden="true">&times;</span> <span
																		class="sr-only">Close</span>
																</button>
																<h4 class="modal-title">후기 삭제</h4>
															</div>
															<div class="modal-body" align="center">
																<h4>정말 삭제하시겠습니까?</h4>
															</div>
															<div class="modal-footer">
																<a
																	href="del_review.do?review_no=${review.review_no }&space_no=${review.space_no}"
																	data-toggle="modal">
																	<button type="button" class="btn btn-default">후기
																		삭제</button>
																</a>
																<button type="button" class="btn btn-primary"
																	data-dismiss="modal">닫기</button>
															</div>
														</div>
													</div>
												</div>
												<!-- 모달 끝 -->

											</jl:if>
										</div>
									</div>
								</div>
							</div>
						</jl:forEach>
						<ul class="pagination pagination-sm">
							<jl:if test="${pz_review.hasPrevPagination }">
								<li><a class="page"
									href="space_detail.do?pg_review=pz_review.paginationStart-1&space_no=${space.space_no }&review_flag=1">&lt;</a></li>
							</jl:if>
							<jl:if test="${pz_review.hasPrevPage }">
								<li><a class="page"
									href="space_detail.do?pg_review=${ pz_review.curPagination-1}&space_no=${space.space_no }&review_flag=1">&lt;</a></li>
							</jl:if>
							<jl:forEach begin="${pz_review.paginationStart }"
								end="${pz_review.paginationEnd }" step="1" varStatus="vs">
								<jl:choose>
									<jl:when test="${vs.index!=pz_review.curPagination }">
										<li><a class="page"
											href="space_detail.do?pg_review=${vs.index }&space_no=${space.space_no }&review_flag=1">${vs.index }</a></li>
									</jl:when>
									<jl:otherwise>
										<li class="active"><a class="page"
											href="space_detail.do?pg_review=${vs.index }&space_no=${space.space_no }&review_flag=1">${vs.index }</a></li>
									</jl:otherwise>
								</jl:choose>
							</jl:forEach>
							<jl:if test="${pz_review.hasNextPage }">
								<li><a class="page"
									href="space_detail.do?pg_review=${pz_review.curPagination+1}&space_no=${space.space_no}&review_flag=1 ">&gt;</a></li>
							</jl:if>
							<jl:if test="${pz_review.hasNextPagination }">
								<li><a class="page"
									href="space_detail.do?pg_review=${pz_review.paginationEnd+1 }&space_no=${space.space_no }&review_flag=1">&gt;&gt;</a></li>
							</jl:if>
						</ul>

						<form method="POST" action="review_add.do">
							<input type="hidden" name="user_id" value="${user_id }">
							<input type="hidden" name="space_no" value="${space.space_no }">
							<input type="submit" value="후기 작성" class="btn btn-default">
						</form>


						<!--  모달들 모음  -->

						<!-- 전화번호 모달 -->
						<div class="modal fade" id="call" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header" align="center">

										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title">전화번호</h4>
									</div>
									<div class="modal-body">
										<h2>${space.space_call }</h2>
										<p>전화 하실 때 MSSPACE보고 문의 드립니다. 라고 말하시면 더욱 친절하게 대해주실거에요~</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
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
						<!-- 즐겨찾기 모달 -->
						<div class="modal fade" id="bookmark-modal" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-body">
										<div id="bookmark-modal-body" align="center">XX 완료</div>
									</div>
									<div class="modal-footer">
										<button id="btn-status-close" type="button"
											class="btn btn-primary" data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				
			</div>

			<div class="col-xs-3">
				<div class="text-center">
					<div class="row" style="border-color: #95BADF; border: thin;">
						<div class="panel"
							style="border-bottom: solid; border-bottom-color: #95BADF;">
							<p
								class="reserve">예약하기</p>
						</div>
						<br />
						<div style="border: thin; border-bottom-color: blue;">
							<ul class="properties_list">
								
								<li>						
									<div class="property_details">
										<p class="space_title">${space.space_title }</p>
										<div class="property_details_box">
											<div class="property_sub_details_left">
												<h2>${space.price }원/시간</h2>
											</div>
											<div class="property_sub_details_right">
												<h2>
													<span class="property_size">최소 ${space.min_people }
														명~ 최대 ${space.max_people } </span>
												</h2>
											</div>
											<div class="btn-group btn-group-justified">
												<a><button class="btn btn-info btn-reserve btn-reserve" data-toggle="modal"
													data-target="#call">전화</button></a>
												<a href="space_reservation.do?space_no=${space.space_no }"><button
														class="btn btn-info btn-reserve">예약하기</button></a>
												<a><button class="btn btn-info btn-reserve" id="btn_bookmark"
													add="add_bookmark.do?space_no=${space.space_no }&user_id=${user_id}"
													del="del_bookmark.do?space_no=${space.space_no }&user_id=${user_id}">즐겨찾기등록</button></a>
											</div>
										</div>
									</div></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-1"></div>
		</div>

		<div>
			<jl:forEach var="vo" items="${host }">
				<jl:if test="${vo.crn == space.crn }">
					<button class="btn btn-sm btn-default" id="a_mod">공간 수정</button>
					<button class="btn btn-sm btn-default" data-toggle="modal"
						data-target="#space_del">공간 삭제</button>
					<div class="modal fade" id="space_del" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
									</button>
									<h4 class="modal-title">공간 삭제</h4>
								</div>
								<div class="modal-footer">
									<a href="space_del.do?space_no=${space.space_no }"><button
											type="button" class="btn btn-defualt">삭제</button></a>
									<button type="button" class="btn btn-defualt"
										data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</jl:if>
			</jl:forEach>
		</div>
		<form method="POST" id="form_space_mod" action="space_mod.do">
			<input type="hidden" value="${space.space_no }" name="space_no">
			<input type="hidden" value="${space.space_title }" name="space_title">
			<input type="hidden" value="${space.space_content }"
				name="space_content"> <input type="hidden"
				value="${space.space_thumb_img }" name="space_thumb_img"> <input
				type="hidden" value="${space.open_time }" name="open_time">
			<input type="hidden" value="${space.close_time }" name="close_time">
			<input type="hidden" value="${space.price }" name="price"> <input
				type="hidden" value="${space.min_people }" name="min_people">
			<input type="hidden" value="${space.max_people }" name="max_people">
			<input type="hidden" value="${space.space_call }" name="space_call">
			<input type="hidden" value="${space.s_category_no }"
				name="s_category_no"> <input type="hidden"
				value="${space.l_category_no }" name="l_category_no">
		</form>
	</div>
	<!-- ******************************* footer ******************************* -->
	<%@include file="./jsp/footer.jsp"%>
	<!--  end footer  -->
</body>
</html>