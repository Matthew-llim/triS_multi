<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<style type="text/css">
		.jumbotron{
			text-align:center;
		}
		.content{
			height : 100px;
		}
		td, th {
			text-align:center;
		}
</style>
<script src="common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>

$(document).ready(function() {
	// QnA 댓글 수정시 모달
	$("#btnClose").on("click",function(){
		location.href = "admin_community_qna_read.do?com_qna_no=${vo.com_qna_no}";
	});
	$("#btnreMod").on("click", function() {
		$("#repleModal").modal("hide");
		$("#basic_modal").modal("show");
	});
	$("#basic_mobody").html("<h4>댓글 수정이 완료 되었습니다.<h4>");
	$("#basic_modal_yes").on("click",function(){
		var reple_no = $("#com_qna_reple_no").val();		
		var com_qna_reple_content = $("#content").val();
		var url = "admin_community_qna_reple_mod.do?com_qna_reple_no="+reple_no
				+"&com_qna_reple_content=" + com_qna_reple_content;
		ajaxGet(url,function(rt){ });
		location.reload();
	});
	$(".modReple").on("click", function() {
		$("#com_qna_reple_no").val($(this).attr("xyz"));
		$("#content").val($("#" + $(this).attr("abcd")).text());
		$("lblcontent").text("글번호 :" + $(this).attr("xyz"));
		$("#repleModal").modal("show");
	});
	
	// QnA 삭제시 모달
	$(".qna_remove").on("click",function(){
		$("#qna_No").val( $(this).attr("com_qna_no") );
		$("#text_modal").modal("show");
	});
	$("#text_modal_yes").on("click",function(){
		var del_qna_no = $("#qna_No").val();
			location.href = "admin_community_qna_del.do?com_qna_no=" + del_qna_no;
		$("#text_modal_modal").modal("hide");
	});
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});
	
	
	// QnA 리플 삭제시 모달
	// <a> 태그로 값을 불러 올 때 class 했을 때 동작 됨.
	$(".remove_qna_re").on("click",function(){
		$("#com_qna_No").val( $(this).attr("com_qna_no") );
		$("#com_qna_reple_No").val( $(this).attr("com_qna_reple_no") );
		
		$("#re_modal").modal("show");
	});
	$("#re_modal_yes").on("click",function(){
		var del_com_qna_no = $("#com_qna_No").val();
		var del_com_qna_reple_no = $("#com_qna_reple_No").val();
			location.href = "admin_community_qna_reple_del.do?com_qna_no=" + 
			del_com_qna_no +"&com_qna_reple_no=" + del_com_qna_reple_no;
		$("#re_modal_modal").modal("hide");
	});
	$("#re_modal_no").on("click",function(){
		$("#re_modal").modal('hide');
	});

});

</script>
	
</head>
<body>
	<div id="i" class="jumbotron panel-primary">
		<h1>QnA</h1>
	</div>
	
	<div class="container">
		<div class="title">
			<label>제목:</label>
			<span>${vo.com_qna_title}</span><br>
		</div>
		
		<div class="user_id">
			<label>아이디:</label>
			<span>${vo.user_id}</span><br>
		</div>
		
		<div class="content">
			<label>내용</label><br/>
			<span>${vo.com_qna_content}</span><br/>
		</div>
		
		<table border="1" cellspacing="0" cellpadding="8">
		<tr>
			<th>유저</th>
			<th width="200">댓글내용</th>
			<th>시간</th>
			<th>추천수</th>
			<th>추천하기</th>
			<th>댓글삭제</th>
		</tr>
		<jl:forEach var="rpl" items="${rp}" varStatus="vs2">
			<tr>
				<td>${rpl.user_id}</td>
				<td>
				<span id="rb_${rpl.com_qna_reple_no}"> ${rpl.com_qna_reple_content} </span>
				<a abcd="rb_${rpl.com_qna_reple_no}" xyz="${rpl.com_qna_reple_no}" class="modReple" href="#">수정</a>
				</td>
				<td>${rpl.the_time}</td>
				<td>
					<div id="recom_count">${rpl.recom_count}</div>
				</td>
				<td>
					[<a href="admin_community_qna_reple_recom.do?user_id=${user_id}&com_qna_reple_no=${rpl.com_qna_reple_no}&com_qna_no=${rpl.com_qna_no}">추천</a>]
				</td>
				<%-- <td>[<a href="admin_community_qna_reple_del.do?com_qna_no=${rpl.com_qna_no }&com_qna_reple_no=${rpl.com_qna_reple_no}">삭제</a>]</td> --%>
				<td>[<a href="#" class="remove_qna_re" com_qna_no="${rpl.com_qna_no }" com_qna_reple_no="${rpl.com_qna_reple_no}" >삭제</a>]</td>
			</tr>
		</jl:forEach>
	</table>
	
		<form method="POST" action="admin_community_qna_reple_mod.do" id="reple_form" name="frm">
		<div id="repleModal" class="modal" role="dialog">
			<input type="hidden" id="com_qna_no" value="${vo.com_qna_no}" name="com_qna_no" />
			<input id="com_qna_reple_no" type="hidden" name="com_qna_reple_no" />
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<div class="form-group">
							<label id="lblContent" for="content"></label>
							<textarea name ="com_qna_reple_content" class="form-control" id="content" rows="7"></textarea>
						</div>
						<input type="button" class="btn btn-primary btn-sm" id="btnClose" value="닫기">
						<input type="button" class="btn btn-primary btn-sm" id="btnreMod" value="수정">
					</div>
				</div>
			</div>
		</div>
	</form>
	
		<form action="admin_community_qna_reple_add.do" method="post">
			<input type="text" name="com_qna_reple_content" />
			<input type="hidden" name="user_id" value="${user_id}"/>
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="submit" value="댓글작성"/>
		</form>
		
		<form action="admin_community_qna_list.do" method="post">
			<input type="submit" value="QnA목록"/>
		</form>
		
		<form action="admin_community_qna_mod.do" method="post">
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="hidden" name="com_qna_title" value="${vo.com_qna_title}"/>
			<input type="hidden" name="com_qna_content" value="${vo.com_qna_content}"/>
			<input type="submit" value="QnA수정"/> &nbsp;&nbsp;&nbsp;
			<input type="button" class="qna_remove" com_qna_no="${vo.com_qna_no}"  value="QnA삭제"/>
		</form>
		
		
		
	<!-- QnA 글 삭제시 모달 -->
		<div id="text_modal" class="modal fade" role="dialog">
			<input type="hidden" id="qna_No" value="0"/>
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="text_mohead" class="modal-header"align="center"><h4>글 삭제</h4></div>
					<div id="text_mobody" class="modal-body" align="center">
						<h4>글을 삭제 하시겠습니까?</h4>
					</div>
					<div id="text_ft" class="modal-footer">
						<button type='button' class='btn btn-default' to-delete="delete_${vs.count}"  id='text_modal_yes'>확인</button>
						<button type='button' class='btn btn-primary' id='text_modal_no'>취소</button>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- QnA 리플 삭제시 모달 -->
		<div id="re_modal" class="modal fade" role="dialog">
			<input type="hidden" id="com_qna_No" value="0"/>
			<input type="hidden" id="com_qna_reple_No" value="0"/>	
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="re_mohead" class="modal-header"align="center"><h4>댓글 삭제</h4></div>
					<div id="re_mobody" class="modal-body" align="center">
						<h4>댓글을 삭제 하시겠습니까?</h4>
					</div>
					<div id="re_ft" class="modal-footer">
						<button type='button' class='btn btn-default' to-delete="delete_${vs2.count}"  id='re_modal_yes'>확인</button>
						<button type='button' class='btn btn-primary' id='re_modal_no'>취소</button>
					</div>
				</div>
			</div>
		</div>

<!-- QnA 글, 댓글 수정 완료시 쓰는 모달 -->		
<div id="basic_modal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="basic_mobody" class="modal-body" align="center">
			</div>
			<div id="basic_ft" class="modal-footer">
				<button type='button' class='btn btn-default' id='basic_modal_yes'>닫기</button>
			</div>
		</div>
	</div>
</div>		
		
	</div>
</body>
</html>