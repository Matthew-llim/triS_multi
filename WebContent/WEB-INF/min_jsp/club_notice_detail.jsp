<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="common.js"></script>
	
	<style>
	</style>
</head>
<body>
<div class="container">

	<label>${vo.c_notice_title}</label><br/>
	<label>작성시간 : ${vo.the_time}	</label><label>작성자 : ${vo.user_id}</label>
	<label>조회수 : ${vo.view_count}</label><br/>
	<label>소개</label><textarea rows="15" cols="30" disabled="disabled">${vo.c_notice_content}</textarea><br/>
	<input id=textMod type="button" value="수정하기" style="display: none"><input id="prev" type="button" value="뒤로가기">
	<br/><hr>
	
	<form id="add_reple_frm">
		<div class="form-group" align="left">
			<label id="reple" class="l" style="width: 100px; font-size: 100%">의견쓰기 </label>
			<div class="input-group">
				<input id="c_notice_reple_content" name="c_notice_reple_content" type="text" style="height: 80px;" class="form-control"/>
				<span class="input-group-addon" style="background-color: #00C73C;">
				<input id="add_reple_btn" type="button" class="btn" value="등록" style="color:white; font-weight: bold; background-color: #00C73C;"/></span>
			</div>
			<input type="hidden" name="user_id" value="${user_id}">
			<input type="hidden" name="c_notice_no" value="${vo.c_notice_no}">
		</div>
	</form>
	<br/>
	<hr/>
	<div id="reple_list" class="form-group" align="left">
	</div>	
	
</div>



	<!-- 댓글 수정 modal창 시작 -->
	<form id="mod_frm" method="post" action="club_mod_notice_reple.do">
		<div id="mod_modal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="mohead" class="modal-header"><h4>댓글수정</h4></div>
					<div id="mobody" class="modal-body" align="center">
						<textarea id="reple_content" name='c_notice_reple_content'class='form-control' rows='7'></textarea>
					</div>
					<div id="ft" class="modal-footer">
						<button type='button' class='btn btn-default' id='mod_modal_Yes'>수정</button>
						<button type='button' class='btn btn-primary' id='mod_modal_No'>취소</button>
					</div>
				</div>
			</div>
		</div>
		<input id="c_notice_reple_no" name='c_notice_reple_no' type='hidden'/>
	</form>
	<!-- 댓글 수정 modal창 끝 -->
	
	<!-- 댓글 삭제 modal창 시작 -->
	<form id="del_frm" method="post" action="club_del_notice_reple.do">
		<div id="del_modal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="mohead" class="modal-header" align="center"><h4>댓글 삭제</h4></div>
					<div id="mobody" class="modal-body" align="center">
						댓글을 삭제하시겠습니까?
					</div>
					<div id="ft" class="modal-footer">
						<button type='button' class='btn btn-default' id='del_modal_Yes'>삭제</button>
						<button type='button' class='btn btn-primary' id='del_modal_No'>취소</button>
					</div>
				</div>
			</div>
		</div>
		<input id="del_notice_reple_no" name='c_notice_reple_no' type='hidden'/>
		<input id="del_notice_no" name='c_notice_no' type='hidden'/>
	</form>
	<!-- 댓글 삭제 modal창 끝 -->
	
	<!-- 기본 modal창 시작 -->
	<div id="basic_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="basic_mobody" class="modal-body" align="center">
				</div>
				<div id="basic_ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='basic_modal_Yes'>확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 기본 modal창 끝 -->
	
	<!-- 자바스크립트에서 사용할 값 -->
	<!-- 자바스크립트 import -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			/* 시작하자마자 댓글 조회 */
			find_reple();
			
			// 기본 모달창 확인 버튼 클릭 시 이벤트 발생
			$("#basic_modal_Yes").on("click",function(){
				$("#basic_modal").modal("hide");
			});
			
			// 접속한 유저와 글의 유저를 비교해 수정하기 버튼 보여지기(어드민은 다보여주게).
			if('${user_id}'=='${vo.user_id}'||'${user_id}'=='admin'){
				$("#textMod").attr("style","display: inline;");
			}
			
			// 뒤로가기 버튼 클릭 시 이벤트 발생
			$("#prev").on("click",function(){
				location.href="club_community.do?club_no="+'${vo.club_no}';
			});
			// 수정하기 버튼 클릭 시 이벤트 발생
			$("#textMod").on("click",function(){
				location.href="club_mod_notice_detail.do?c_notice_no="+'${vo.c_notice_no}';
			});
			// 댓글 등록 버튼 클릭 시 이벤트 발생
			$("#add_reple_btn").on("click",function(){
				var formData = $("#add_reple_frm").serialize();
				$.ajax({
					type : "POST",
					url : "club_add_notice_reple.do",
					data : formData,
					success	: function(rt) {
						if(rt=="ok"){
							$("#basic_mobody").text("댓글이 등록 되었습니다.");
							$("#basic_modal").modal("show");
							$("#basic_modal").on("hidden.bs.modal",function(){
								$("#basic_modal").modal("hide");
								$("#c_notice_reple_content").val("");
								find_reple();
							});
						}else if(rt=="no"){
							$("#basic_mobody").text("댓글 처리가 실패 되었습니다.");
							$("#basic_modal").modal("show");
							$("#basic_modal").on("hidden.bs.modal",function(){
								$("#basic_modal").modal("hide");
								find_reple();
							});
						}
				    }
				});
			});
			
			// 댓글 삭제 버튼 눌렀을 때 이벤트 발생
			$(document).on("click",".delRe",function(){ 
				var reNo = $(this).attr("reNo");
				$("#del_modal").modal("show");
				$("#del_modal_Yes").on("click",function(){
					var url = "club_del_notice_reple.do?c_notice_reple_no="+reNo;
					ajaxGet(url,function(rt){
						if(rt=="ok"){
							$("#del_modal").modal("hide");
							$("#basic_mobody").text("댓글이 삭제 되었습니다.");
							$("#basic_modal").modal("show");
							$("#basic_modal_Yes").on("click",function(){
								$("#basic_modal").modal("hide");
								find_reple();
							});
						}else{
							$("#del_modal").modal("hide");
							$("#basic_mobody").text("댓글 삭제 처리가 실패 되었습니다.");
							$("#basic_modal").modal("show");
							$("#basic_modal_Yes").on("click",function(){
								$("#basic_modal").modal("hide");
								find_reple();
							}); 
						}
					});
				});
				$("#del_modal_No").on("click",function(){
					$("#del_modal").modal("hide");
				});
			});
			
			// 댓글 수정 버튼 눌렀을 때 이벤트 발생
			$(document).on("click",".modRe",function(){ 
				var reText = $(this).attr("reText");
				var reNo = $(this).attr("reNo");
				$("#reple_content").text(reText);
				$("#c_notice_reple_no").attr("value",reNo)
				$("#mod_modal").modal("show");
				$("#mod_modal_Yes").on("click",function(){
					var formData = $("#mod_frm").serialize();
					$.ajax({
						type : "POST",
						url : "club_mod_notice_reple.do",
						data : formData,
						success	: function(rt) {
							if(rt=="ok"){
								$("#mod_modal").modal("hide");
								$("#basic_mobody").text("댓글이 수정 되었습니다.");
								$("#basic_modal").modal("show");
								$("#basic_modal_Yes").on("click",function(){
									$("#basic_modal").modal("hide");
									find_reple();
								});
							}else{
								$("#mod_modal").modal("hide");
								$("#basic_mobody").text("댓글 수정 처리가 실패 되었습니다.");
								$("#basic_modal").modal("show");
								$("#basic_modal_Yes").on("click",function(){
									$("#basic_modal").modal("hide");
									find_reple();
								}); 
							}
					    }
					});
				});
				$("#mod_modal_No").on("click",function(){
					$("#mod_modal").modal("hide");
				});
			});
		});
		
		function find_reple(){
			var url = "club_find_notice_reple.do?c_notice_no="+${vo.c_notice_no};
		 	ajaxGet(url,function(rt){
			 	var list = window.eval("("+rt+")");
			 	var html = "";
			 	for( var i = 0 ; i < list.data.length ; i++ ){
			 		html += "<label id='repleId' class='l' style='font-size: 120%; font-weight: bold;'>"+list.data[i].user_id +"</label><br/>";
			 		html += "<label id='repleContent' class='l' style='font-size: 100%;'>"+list.data[i].c_notice_reple_content +"</label><br/>";
					html += "<label id='repletime' class='l' style='font-size: 100%; color: gray;'>"+list.data[i].the_time ;
					if(list.data[i].user_id=='${user_id}'){
						html += "<a class='delRe' reNo='"+list.data[i].c_notice_reple_no+"' noticeNo='"+list.data[i].c_notice_no+"' user_id='"+list.data[i].user_id+ 
							"'href='#'><span class='glyphicon glyphicon-remove'></span></a>"+
							"<a reNo='"+list.data[i].c_notice_reple_no+"'  reText='"+list.data[i].c_notice_reple_content+"' class='modRe' href='#'>"+
							"<span class='glyphicon glyphicon-pencil'></span></a>";
					}//end if
					html += "</label><br/><hr/>";
			 	}//end for
                   $('#reple_list').html(html);
		 	});
		}
	</script>
	
</body>
</html>