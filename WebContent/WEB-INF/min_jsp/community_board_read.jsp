<%@ page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"%><%@
taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

</style>
<script src="common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<script>

$(document).ready(function() {

		/* 시작했을 때 find_reple() 이벤트 실행 */
		find_reple();
		
		//글삭제
		$("#btnDel").on("click",function(){
			$("#deltext").modal("show");
			$("#delsuccess").on("click",function(){
				$("#deltext").modal("hide");
				$("#modaldel").modal("show");
				$("#modaldel").on("hidden.bs.modal",function(){
					$("#textDelform").submit();
				});  
			});
		});
		//글삭제끝
	
	
	    $("#btnClose").on("click",function(){
	    	$("#repleModal").modal("hide");
	    });

		/* 댓글 수정 비동기 처리 */
		$(document).on("click",".modReple",function() {
			$("#com_board_reple_no").val($(this).attr("xyz"));
			$("#content").val($("#" + $(this).attr("abcd")).text());
			$("lblcontent").text("글번호 :" + $(this).attr("xyz"));
			$("#repleModal").modal("show");
			
			$("#btnMod").on("click",function(){
				var formData = $("#reple_form").serialize();
				$.ajax({
					type : "POST",
					url : "community_board_replemod.do",
					data : formData,
					success	: function(rt) {
						$("#repleModal").modal("hide");
						if(rt=="ok"){
							$("#mobody").text("댓글이 수정 되었습니다.");
							$("#modal").modal("show");
							$("#ft").html("");
							$("#modal").on("hidden.bs.modal",function(){
								$("#modal").modal("hide");
								$("#com_board_reple_content").val("");
								find_reple();
							});
						}else if(rt=="no"){
							$("#mobody").text("댓글 수정 처리가 실패 되었습니다.");
							$("#modal").modal("show");
							$("#ft").html("");
							$("#modal").on("hidden.bs.modal",function(){
								$("#modal").modal("hide");
								find_reple();
							});
						}
				    }
				});	
			});
		});

	    $(".abcd").on("click",function(e){
	           alert();
	    });
	    /* 댓글 수정 비동기 처리 */
    
		/* 댓글 삭제 부분 비동기 처리 */
		$(document).on("click",".delRe",function(){
 			var com_board_reple_no = $(this).attr("aa");
			var com_board_no = $(this).attr("bb");
			$("#mohead").html("<div class='modal-title'align='center'><h4>댓글삭제</h4></div>");
			$("#mobody").html("<h3>댓글을 삭제하시겠습니까?</h3>");
			$("#ft").html("<button type='button' class='btn btn-default' id='modal-del-Yes'>확인</button>"+
					"<button type='button' class='btn btn-primary' id='modal-del-No'>취소</button>");
			$("#modal").modal();
			$("#modal-del-Yes").on("click",function(){
				var url = "community_board_repledel.do?com_board_reple_no="+com_board_reple_no+"&com_board_no="+com_board_no;
				ajaxGet(url,function(rt){
					if(rt=="ok"){
						$("#mobody").text("댓글이 삭제 되었습니다.");
						$("#ft").html("");
						$("#modal").modal("show");
						$("#modal").on("hidden.bs.modal",function(){
							$("#modal").modal("hide");
							find_reple();
						});
					}else if(rt=="no"){
						$("#mobody").text("댓글 삭제 처리가 실패 되었습니다.");
						$("#ft").html("");
						$("#modal").modal("show");
						$("#modal").on("hidden.bs.modal",function(){
							$("#modal").modal("hide");
							find_reple();
						});
					}
				});
			});
			$("#modal-del-No").on("click",function(){
				$("#modal").modal("hide");
			}); 
		});
		/* 댓글 삭제 부분 비동기 처리 */
	
		//추천
		$("#btnrecom").on("click",function(){
			var dc = "?dc=" + new Date().getTime();
			ajaxGet("community_board_recom.do" + dc	+ "&user_id=aav&com_board_no=${vo.com_board_no}", 
					function(rt) {
				if (rt == -1) {
					$("#modalrecom").modal("show");
				} 
				else {e("recomCount").innerHTML = rt;}
			});
		});
		//추천끝
		
		/* 댓글 등록 부분 비동기 처리 */
		$("#submit_btn").on("click",function(){
			var formData = $("#add_reple_frm").serialize();
			$.ajax({
				type : "POST",
				url : "community_board_addreple.do",
				data : formData,
				success	: function(rt) {
					if(rt=="ok"){
						$("#mobody").text("댓글이 등록 되었습니다.");
						$("#ft").html("");
						$("#modal").modal("show");
						$("#modal").on("hidden.bs.modal",function(){
							$("#modal").modal("hide");
							$("#com_board_reple_content").val("");
							find_reple();
						});
					}else if(rt=="no"){
						$("#mobody").text("댓글 처리가 실패 되었습니다.");
						$("#ft").html("");
						$("#modal").modal("show");
						$("#modal").on("hidden.bs.modal",function(){
							$("#modal").modal("hide");
							find_reple();
						});
					}
			    }
			});	
		});
		/* 댓글 등록 부분 비동기 처리 */
	})
	
	/* 댓글 조회 비동기 처리 */
	function find_reple(){
			var url = "community_board_read_reple.do?com_board_no="+${vo.com_board_no};
		 	ajaxGet(url,function(rt){
			 	if(rt!=''){
				 	var list = window.eval("("+rt+")");
				 	var html = "<tr><th>NO</th><th>CONTENT</th><th>TIME</th><th>USERID</th></tr>";
				 	for( var i = 0 ; i < list.data.length ; i++ ){
				 		html += "<tr><td>"+list.data[i].com_board_reple_no+"</td>";
				 		html += "<td> <span id='rb_"+list.data[i].com_board_reple_no+"'>"+list.data[i].com_board_reple_content+"</span>";
						if('${user_id == list.data[i].user_id}'){
				 			html += " <input type='button' class='modReple' value='수정' abcd='rb_"+list.data[i].com_board_reple_no+"' xyz='"+list.data[i].com_board_reple_no+"' />";
					 		html += " <input type='button' class='delRe' value='삭제' aa='"+list.data[i].com_board_reple_no+"' bb='"+list.data[i].com_board_no+"'/>";
						}
						html +="</td></tr>";
				 	}//end for
	                $('#reple_tr').html(html);
			 	}else{
			 		$('#reple_tr').html("");
			 	}
		 	});
		}
	/* 댓글 조회 비동기 처리 */
</script>


</head>
<body>
	<div class="jumbotron" style="background-color: green"> 
		<h1>자유게시판 글보기 </h1>
	</div>
	<table class="table ">
<!--  글테이블-->
		<tr>
			<td >NO : ${vo.com_board_no} </td>
			
			<td colspan="2"> 제목 : ${vo.com_board_title}</td>
			
		</tr>
		
		<tr>
			<td >ID : ${vo.user_id} </td>
			<td colspan="2">VIEW : ${vo.view_count} LIKE : <div id="recomCount">${vo.recom_count}</div></td>
		</tr>
		
		<tr>
			<td colspan="3">${vo.com_board_content}</td>
		</tr>
		<tr>
		<td colspan="6" align="center"></td>
		</tr>
		
		
		
		<!-- 댓글테이블 -->
		<!-- 댓글 리스트가 추가될 영역 -->
		<table class="table" id="reple_tr">
		
		</table>
	</table>

<!--  글수정-->
	<form action="community_board_mod.do" method="POST">
		<input type="hidden" name="com_board_no" value="${vo.com_board_no}" /> 
		<input type="hidden" name="com_board_title" value="${vo.com_board_title}" /> 
		<input type="hidden" name="user_id" value="${vo.user_id}" /> 
		<input type="hidden" name="com_board_content" value="${vo.com_board_content}" /> 
		<jl:if test="${vo.user_id eq user_id}"><input type="submit" id="mod"  class="btn btn-primary" value="글 수정하기" />
		</jl:if>
	</form>
<!--  글수정끝 -->	


<!--  글삭제-->	
	<form action="community_board_del.do" method="POST" id="textDelform">
		<input type="hidden" name="com_board_no" value="${vo.com_board_no}" /> 
		<jl:if test="${vo.user_id eq user_id}"><input type="button" id="btnDel" class="btn btn-primary" value="글 삭제하기" />
		</jl:if>
	</form>
<!--  글삭제끝 -->	
	
	
<!-- 추천버튼 -->
	<input type="button" id="btnrecom"  class="btn btn-primary" value="추천버튼" />
	
<!--  댓글추가 -->
	<form id="add_reple_frm">
		댓글: <input type="text" id="com_board_reple_content" name="com_board_reple_content" size="30"/> 
		<input type="hidden" name="com_board_no" value="${vo.com_board_no}"/> 
		<input type="hidden" name="user_id" value="${vo.user_id}" /> 
		<input id="submit_btn" type="button" class="btn btn-primary" value="댓글달기!" />
	</form>
<!--  댓글추가끝 -->	
	
<!-- 모달부분 -->

<!-- 리플수정모달폼 -->
	<form id="reple_form">
		<div id="repleModal" class="modal" role="dialog">
			<input type="hidden" id="com_board_no" value="${vo.com_board_no}"
				name="com_board_no" /> <input id="com_board_reple_no" type="hidden" name="com_board_reple_no" />
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<div class="form-group">
							<label id="lblContent" for="content"></label>
							<textarea name ="com_board_reple_content" class="form-control" id="content" rows="7"></textarea>
						</div>
						<input type="button" class="btn btn-primary btn-sm" id="btnMod" value="수정"/>
						<input type="button" class="btn btn-primary btn-sm" id="btnClose" value="닫기"/>
					</div>
				</div>
			</div>
		</div>
	</form>
<!-- 리플수정모달폼끝-->


<!-- 리플모달수정버튼_모달창 -->
	<div class="modal fade" id="modalmod" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">알림</h4>
				</div>
				<div class="modal-body">당신의 훌륭한 댓글이 수정되었습니다 !</div>
				<div class="modal-footer">
					<button id="modalmodclose"type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				
				</div>
			</div>
		</div>
	</div>
<!-- 리플모달수정버튼_모달창끝 -->

<!-- 모달창 리플-->
<form id="frm" method="post" action="club_mod_board_reple.do">
		<div id="modal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="mohead" class="modal-header"></div>
					<div id="mobody" class="modal-body" align="center"></div>
					<div id="ft" class="modal-footer"></div>
				</div>
			</div>
		</div>
	</form>
<!-- 모달창 리플끝-->	

	
<!-- 추천모달창 -->
	<div class="modal fade" id="modalrecom" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">알림</h4>
				</div>
				<div class="modal-body">글을 이미 추천하셨습니다</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
<!-- 추천모달창끝 -->
	

<!-- 글삭제모달부분 -->

<!-- 글삭제모달폼 -->

<div class="modal fade" id="deltext" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">알림</h4>
				</div>
				<div class="modal-body">글을 정말로 정말로 삭제하시겠습니깡?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="delsuccess">확인</button>
				</div>
			</div>
		</div>
</div>
	
<!-- 글삭제모달폼-->


<!-- 글삭제 모달 확인 폼 -->
	<div class="modal fade" id="modaldel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">알림</h4>
				</div>
				<div class="modal-body">시원하게 삭제되었습니다</div>
				<div class="modal-footer">
					<button id="modalmodclose"type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- 글삭제 모달 확인 폼끝 -->



</body>
</html>


