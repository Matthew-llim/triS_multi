<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="common.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
			 if("${space_code }"=="20001"){
				 parent.location.href="space_detail.do?space_no=${space_no}&space_code=20001";
			}else if("${space_code }"=="20004"){
				parent.location.href="space_detail.do?space_no=${space_no}&space_code=20004";
			}else if("${space_code }"=="20005"){
				parent.location.href="space_detail.do?space_no=${space_no}&space_code=20005";
			}else if("${space_code }"=="20006"){
				parent.location.href="space_detail.do?space_no=${space_no}&space_code=20006";
			}
	});
</script>
</head>
<body>
	<jl:forEach var="space_qna" items="${list_space_qna }">
				<div class="panel-group" id="accordion${space_qna.space_qna_no }">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								제목 :
								<a data-toggle="collapse" data-parent="#accordion${space_qna.space_qna_no }" href="#collapse${space_qna.space_qna_no }" no="${space_qna.space_qna_no }" class="collapsed">
									 ${space_qna.space_qna_title } <br/>
								</a>
								작성자: ${space_qna.user_id }
							</h4>
						</div>
					</div>
				
				<div id="collapse${space_qna.space_qna_no }" Class="panel-collpase collapse">
					<div class="panel-body">
						<table>
							<tr> 
								<td>내용</td>
								<td>${space_qna.space_qna_content }</td>
							</tr>
							<tr>
								<td>작성 시간</td>
								<td>${space_qna.the_time }</td>
							</tr>
						</table>
							<jl:if test="${user_id eq space_qna.user_id }">
								<a href="#qna_mod${space_qna.space_qna_no }" data-toggle="modal">질문 수정</a>
								<a href="#qna_del${space_qna.space_qna_no }" data-toggle="modal">질문 삭제</a>
								
								<!-- qna 삭제 모달 -->
								<div class="modal fade" id="qna_del${space_qna.space_qna_no }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
												<a href="delete_space_qna.do?space_qna_no=${space_qna.space_qna_no }&space_no=${space_qna.space_no}" data-toggle="modal">
													<button type="button" class="btn btn-default">질문 삭제</button>
												</a>
												<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
											</div>
										</div>
									</div>
								</div>
								<!-- qna 삭제 모달 끝 -->
								
								<!-- qna 수정 모달 -->
								<div class="modal fade" id="qna_mod${space_qna.space_qna_no }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">&times;</span>
													<span class="sr-only">Close</span>
												</button>
												<h4 class="modal-title">QnA 수정</h4>
											</div>
											<form method="POST" action="mod_space_qna.do">
												<div class="modal-body">
													<div class="form-group">
														<label for="mod_space_qna_title">제목</label>
														<input type="text" name="space_qna_title" id="mod_space_qna_title" class="form-control" value="${space_qna.space_qna_title }">
													</div>
													<div class="form-group">
														<label for="mod_space_qna_content">내용</label>
														<textarea name="space_qna_content" id="mod_space_qna_content" class="form-control">${space_qna.space_qna_content }</textarea>
													</div>
													<input type="hidden" name="user_id" value="${user_id }">
													<input type="hidden" name="space_no" value="${space.space_no }">
													<input type="hidden" name="space_qna_no" value="${space_qna.space_qna_no }">
												</div>
												<div class="modal-footer">
													<input type="submit" class="btn btn-default" value="질문 수정">
													<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
												</div>
											</form>
										</div>
									</div>
								</div>
								<!-- qna 수정 모달 끝 -->
							
								
							</jl:if>
								<div id="qna_reple${space_qna.space_qna_no }"></div>
								<jl:forEach var="vo" items="${host }">
									<jl:if test="${vo.crn eq space.crn }">
										<div id="qna_reple_add">
											<form method="POST" action="add_space_qna_reple.do">
												<input type="hidden" name="space_qna_no" value="${space_qna.space_qna_no }">
												<input type="hidden" name="space_no" value="${space_qna.space_no }">
												<input type="hidden" name="user_id" value="${user_id }">
												<table>
												
												<tr>
													<td>제목</td>
													<td><input type="text" name="space_qna_reple_title"></td>
												</tr>
												<tr>
													<td>내용</td>
													<td><textarea row="5" col="30" name="space_qna_reple_content"></textarea></td>
												</tr>
												</table>
												<input type="submit">
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
							<li><a class="page" href="space_qna.do?pg=${ pz_space_qna.paginationStart-1}&space_no=${space_no }">&lt;</a></li>
						</jl:if>
							<jl:if test="${pz_space_qna.hasPrevPage }">
								<li><a class="page" href="space_qna.do?pg=${ pz_space_qna.curPagination-1}&space_no=${space_no }">&lt;</a></li>
							</jl:if>
							<jl:forEach begin="${pz_space_qna.paginationStart }" end="${pz_space_qna.paginationEnd }" step="1" varStatus="vs">
								<jl:choose>
									<jl:when test="${vs.index!=pz_space_qna.curPagination }">
										<li><a class="page" href="space_qna.do?pg=${vs.index }&space_no=${space_no }">${vs.index }</a></li>
									</jl:when>
									<jl:otherwise>
										<li class="active"><a class="page" href="space_qna.do?pg=${vs.index }&space_no=${space_no }">${vs.index }</a></li>
									</jl:otherwise>
								</jl:choose>
							</jl:forEach>
							<jl:if test="${pz_space_qna.hasNextPage }">
								<li><a class="page" href="space_qna.do?pg=${pz_space_qna.curPagination+1}&space_no=${space_no} ">&gt;</a></li>
							</jl:if>
						<jl:if test="${pz_space_qna.hasNextPagination }">
							<li><a class="page" href="space_qna.do?pg=${pz_space_qna.paginationEnd+1 }&space_no=${space_no }">&gt;&gt;</a></li>
						</jl:if>
					</ul>
			<!-- space q&a 쓰는 곳 -->

			<h3>질문하기</h3>
			<form method="POST" action="add_space_qna.do">
				<input type="hidden" name="space_no" value="${space_no }">
				<input type="hidden" name="user_id" value="${user_id }">
				<div class="form-group">
					<label for="space_qna_title">제목</label>
					<input type="text" name="space_qna_title" id="space_qna_title" class="form-control">
				</div>
				<div class="form-group">
					<label for="space_qna_content">내용</label>
					<textarea name="space_qna_content" id="space_qna_content" class="form-control"></textarea>
				</div>
				<input type="submit"  class="btn btn-default" value="질문전송">
			</form>
			
</body>
</html>