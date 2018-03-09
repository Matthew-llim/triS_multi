<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="euc-kr"%>
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

		$("#btnClose").on("click", function() {
			$("#repleModal").modal("hide");
			$("#rsModal").modal("hide");
			$("#rdModal").modal("hide");
			$("#repleModal").modal("hide");
		});
	
		$("#btnMod").on("click", function() {
			$("#replemodcompleteModal").modal("show");
		});
		
		$("#replemodcompleteModal").on("hidden.bs.modal",function(){
			$("#reple_form").submit();
		});
		
		$("#btnModRep").on("click", function() {
			$("#reple_mod").submit();
		});
		
		$("#btnSub").on("click", function() {
			$("#replewritecompleteModal").modal("show");
		});
		
		$("#replewritecompleteModal").on("hidden.bs.modal",function(){
			$("#reple_submit").submit();
		});
		
		$(".showDelModal").on("click",function()
		{
			$("#del_com_qna_no").val( $(this).attr("del_com_qna_no") );
			$("#del_com_qna_reple_no").val( $(this).attr("del_com_qna_reple_no") );
			
			$('#repDelModal').modal('show');			
		});
		
		$(".btnDel").on("click", function() {
			$("#repledeletecompleteModal").modal("show");
		});
		
		$("#repledeletecompleteModal").on("hidden.bs.modal",function(){
			var del_com_qna_no = $("#del_com_qna_no").val();
			var del_com_qna_reple_no = $("#del_com_qna_reple_no").val();
				location.href = "community_qna_reple_del.do?com_qna_no=" + 
				del_com_qna_no + "&com_qna_reple_no=" + del_com_qna_reple_no;
		});
		
		
		$("#btnDelQna").on("click", function() {
			$("#qnadeletecompleteModal").modal("show");
			
		});
		$("#qnadeletecompleteModal").on("hidden.bs.modal",function(){
			location.href="community_qna_list.do"
			$("#Qna_delete").submit();
		});
		
		
		$(".modReple").on("click", function() {
			$("#com_qna_reple_no").val($(this).attr("xyz"));
			$("#content").val($("#" + $(this).attr("abcd")).text());	
			$("#repleModal").modal("show");
		});
		
		$(".recom").on("click", function() {
			
			var user_id=$(this).attr("user_id");
			var com_qna_reple_no=$(this).attr("com_qna_reple_no");
			var dc = "?dc=" + new Date().getTime();
			ajaxGet("community_qna_reple_recom.do" + dc
						+"&com_qna_reple_no="+com_qna_reple_no+"&user_id="+user_id, function(rt) {

					$("#recom_count"+com_qna_reple_no).html(rt);
			});
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
			<th>#</th>		
			<th>ID</th>
			<th width="400">CONTENT</th>
			<th>TIME</th>
			<th>RECOM</th>
			<th>추천</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<jl:forEach var="rpl" items="${rp}" varStatus="vs">
			<tr>
				<td>${rpl.com_qna_reple_no}</td>
				<td>${rpl.user_id}</td>
				<td>
					<span id="rb_${rpl.com_qna_reple_no}"> ${rpl.com_qna_reple_content} </span>
				</td>
				<td>${rpl.the_time}</td>
				<td>
					<div id="recom_count${rpl.com_qna_reple_no}">${rpl.recom_count}</div>
				</td>
				<td>
					<!-- <a user_id="${user_id}" com_qna_reple_no="${rpl.com_qna_reple_no}" id="recom" class="btn btn-primary btn-sm" href="community_qna_reple_recom.do?user_id=${user_id }&com_qna_reple_no=${rpl.com_qna_reple_no}&com_qna_no=${rpl.com_qna_no}">추천</a> -->	
					<jl:if test="${user_id ne ''}">
					<a user_id="${user_id}" com_qna_reple_no="${rpl.com_qna_reple_no}" class="btn btn-primary btn-sm recom"">추천</a>
					</jl:if>
				</td>
				<td> 
					<jl:if test="${rpl.user_id eq user_id}"> 
					<a abcd="rb_${rpl.com_qna_reple_no}" xyz="${rpl.com_qna_reple_no}" class="modReple btn btn-primary btn-sm" href="#">수정</a>
					</jl:if>
				</td>
				<td>
				<jl:if test="${rpl.user_id eq user_id}"> 
					<input type="button" class="btn btn-primary btn-sm showDelModal" 
						del_com_qna_no="${rpl.com_qna_no}"
						del_com_qna_reple_no="${rpl.com_qna_reple_no}"
						value="삭제"/>		
				</jl:if>	
				</td>
			</tr>
		</jl:forEach>

		<div class="modal fade" id="repDelModal" role="dialog">
			<input type="hidden" id="del_com_qna_no" value="0"/>
			<input type="hidden" id="del_com_qna_reple_no" value="0"/>
			
			<div class="modal-dialog">
	      		<div class="modal-content" >
	        		<div class="modal-header">
	          			<button type="button" class="close" data-dismiss="modal">&times;</button>
	        		</div>
	        		<div class="modal-body">
	          			<p>댓글을 삭제 하시겠습니까?</p>
	        		</div>
	        		<div class="modal-footer">
	        			<input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnClose" value="닫기">
	        			<input type="button" to-delete="reple_delete_${vs.count}" class="btn btn-primary btn-sm btnDel" data-dismiss="modal" value="삭제"/>
	        		</div>
	      		</div>
	    	</div>
		</div>
	</table>
	
	
	<form method="POST" action="community_qna_reple_mod.do" id="reple_form" >
		<div id="repleModal" class="modal fade" role="dialog">
			<input type="hidden" id="com_qna_no" value="${vo.com_qna_no}" name="com_qna_no" /> 
			<input id="com_qna_reple_no" type="hidden" name="com_qna_reple_no" />
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<div class="form-group">
							<label id="lblContent" for="content">수정할 댓글을 입력하세요:</label>
							<textarea name ="com_qna_reple_content" class="form-control" id="content" rows="7"></textarea>
						</div>
						<div class="modal-footer">
						<input type="button" class="btn btn-primary btn-sm" data-dismiss="modal"  id="btnClose" value="닫기"/>
						<input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnMod" value="수정"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	
		<form action="community_qna_reple_add.do" method="post" id="reple_submit">
		<jl:if test="${user_id ne ''}">
			<input type="text" name="com_qna_reple_content" />
			<input type="hidden" name="user_id" value="${user_id}"/>
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="button" value="댓글작성" class="btn btn-info btn-sm" data-toggle="modal" data-target="#rsModal">
		</jl:if>
		
		<div class="modal fade" id="rsModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>댓글을 작성 하시겠습니까?</p>
		        </div>
		        <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnClose" value="닫기">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnSub" value="작성">
		        </div>
		      </div>
		    </div>
		</div>
		</form>
		
	</div>
	
	<div class="container">
		<form action="community_qna_list.do" method="post">
			<input type="submit" value="QnA목록" class="btn btn-info btn-sm"/>
		</form>
		
		<form action="community_qna_mod.do" method="post">
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="hidden" name="com_qna_title" value="${vo.com_qna_title}"/>
			<input type="hidden" name="com_qna_content" value="${vo.com_qna_content}"/>
			<jl:if test="${vo.user_id eq user_id}"> 
			<input type="submit" value="QnA수정" class="btn btn-info btn-sm"/>
			</jl:if>
		</form>
		
		<form action="community_qna_del.do" method="post" id="Qna_delete">
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<jl:if test="${vo.user_id eq user_id}"> 
			<input type="button" value="QnA삭제" class="btn btn-info btn-sm" data-toggle="modal" data-target="#rdModal"/>
			</jl:if>
		<div class="modal fade" id="rdModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>QnA를 삭제 하시겠습니까?</p>
		        </div>
		        <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnClose" value="닫기">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnDelQna" value="삭제">
		        </div>
		      </div>
		    </div>
		</div>
		</form>
	</div>
	
	<div class="modal fade" id="repledeletecompleteModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>댓글 삭제 완료!</p>
		        </div>
		         <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" value="확인">
		        </div>
		      </div>
	    </div>
	</div>
	
		<div class="modal fade" id="qnadeletecompleteModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>QnA 삭제 완료!</p>
		        </div>
		         <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" value="확인">
		        </div>
		      </div>
	    </div>
	</div>
	
	<div class="modal fade" id="replemodcompleteModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>댓글 수정 완료!</p>
		        </div>
		         <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" value="확인">
		        </div>
		      </div>
	    </div>
	</div>
	
	<div class="modal fade" id="replewritecompleteModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>댓글 작성 완료!</p>
		        </div>
		         <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" value="확인">
		        </div>
		      </div>
	    </div>
	</div>
</body>
</html>