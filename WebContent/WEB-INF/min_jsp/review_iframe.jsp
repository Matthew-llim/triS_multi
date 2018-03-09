<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="common.js" type="text/javascript"></script>
  <script>
  	$(document).ready(function(){
  		if("${space_code }"=="20002"){
  			parent.location.href="space_detail.do?space_no=${space_no}&space_code=20002";
			}else if("${space_code }"=="20001"){
				parent.location.href="space_detail.do?space_no=${space_no}&space_code=20001";
			}else if("${space_code }"=="20003"){
				parent.location.href="space_detail.do?space_no=${space_no}&space_code=20003";
			}
  	});
  </script>
<title>Insert title here</title>
</head>
<body>
			<jl:forEach var="review" items="${list_review }">
				<div class="panel-group" id="accordion${review.review_no }">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								제목 :
								<a data-toggle="collapse" data-parent="#accordion${review.review_no }" href="#collapse_review${review.review_no }" class="collapsed">
									 ${review.review_title } <br/>
								</a>
								작성자: ${review.user_id }
							</h4>
						</div>
					</div>
				
				<div id="collapse_review${review.review_no }" Class="panel-collpase collapse">
					<div class="panel-body">
						<div class="col-xs-4"><img src="review_img/${review.review_img }" width="150" height="60" alt="썸네일"></div>
						<div class="col-xs-8">
							<table>
								<tr> 
									<td>내용</td>
									<td>${review.review_content }</td>
									<td>평점</td>
									<td>${review.review_score }</td>
								</tr>
								<tr>
									<td>작성 시간</td>
									<td>${review.the_time }</td>
								</tr>
								
							</table>
							<jl:if test="${user_id eq review.user_id }">
								<a href="#review_del${review.review_no }" data-toggle="modal">후기 삭제</a>
								
								<!-- 후기 삭제 모달 -->
								<div class="modal fade" id="review_del${review.review_no }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">&times;</span>
													<span class="sr-only">Close</span>
												</button>
												<h4 class="modal-title">주의</h4>
											</div>
											<div class="modal-body">
												<h2>정말 삭제하시겠습니까?</h2>
											</div>
											<div class="modal-footer">
												<a href="del_review.do?review_no=${review.review_no }&space_no=${review.space_no}" data-toggle="modal">
													<button type="button" class="btn btn-default">후기 삭제</button>
												</a>
												<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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
							<li><a class="page" href="review.do?pg=pz_review.paginationStart-1&space_no=${space_no }">&lt;</a></li>
						</jl:if>
							<jl:if test="${pz_review.hasPrevPage }">
								<li><a class="page" href="review.do?pg=${ pz_review.curPagination-1}&space_no=${space_no }">&lt;</a></li>
							</jl:if>
							<jl:forEach begin="${pz_review.paginationStart }" end="${pz_review.paginationEnd }" step="1" varStatus="vs">
								<jl:choose>
									<jl:when test="${vs.index!=pz_review.curPagination }">
										<li><a class="page" href="review.do?pg=${vs.index }&space_no=${space_no }">${vs.index }</a></li>
									</jl:when>
									<jl:otherwise>
										<li class="active"><a class="page" href="review.do?pg=${vs.index }&space_no=${space_no }">${vs.index }</a></li>
									</jl:otherwise>
								</jl:choose>
							</jl:forEach>
							<jl:if test="${pz_review.hasNextPage }">
								<li><a class="page" href="review.do?pg=${pz_review.curPagination+1}&space_no=${space_no} ">&gt;</a></li>
							</jl:if>
						<jl:if test="${pz_review.hasNextPagination }">
							<li><a class="page" href="review.do?pg=${pz_review.paginationEnd+1 }&space_no=${space_no }">&gt;&gt;</a></li>
						</jl:if>
					</ul>
			
				<form method="POST" action="review_add.do" target="_parent">
					<input type="hidden" name="user_id" value="${user_id }">
					<input type="hidden" name="space_no" value="${space_no }">
					<input type="submit" value="후기 작성" class="btn btn-default">
				</form>
</body>
</html>