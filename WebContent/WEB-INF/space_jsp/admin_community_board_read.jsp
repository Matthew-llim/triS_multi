<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
<style type="text/css">
.paginationdiv {
	text-align: right;
}

.select1 {
	float: left;
	padding : 15px;
}

.select2 {
	float: left;

}

.select3 {
	float: left;
	padding : 8px;
}

.btnheart{
	float: left;
	
}

p{
text-align: center;

}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<!-- Bootstrap Core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<script>
$(document).ready(function() {
	// 커뮤니티 댓글 수정 완료 모달 부분
	$("#btnreMod").on("click", function() {
		$("#repleModal").modal("hide");
		$("#basic_modal").modal("show");
	});
	$("#basic_mobody").html("<h4>댓글 수정이 완료 되었습니다.<h4>");
	$("#basic_modal_yes").on("click",function(){
		var dc = "?dc=" + new Date().getTime();
		var reple_no = $("#com_board_reple_no").val();		
		var com_board_reple_contents =  $("#content").val();
		var url = "admin_community_board_replemod.do"+dc+"&com_board_reple_no="+reple_no
		+"&com_board_reple_content=" + com_board_reple_contents;
		ajaxGet(url,function(rt){ });
		/*{com_board_reple_no : reple_no,
			com_board_reple_content : com_board_reple_contents }
			encodeURIComponent(com_board_reple_contents) */
		/* var url = "admin_community_board_replemod.do";
		$.post(url,
				{com_board_reple_no : reple_no,
				 com_board_reple_content : encodeURIComponent(com_board_reple_contents) },
			function(rt){ }); */
		location.reload();
	});

	
	// 댓글 수정 모달 뛰우기
	$(".modReple").on("click", function() {
		$("#com_board_reple_no").val($(this).attr("xyz"));
		$("#content").val($("#" + $(this).attr("abcd")).text() );
		$("#lblContent").text("글번호 :" + $(this).attr("xyz"));
		$("#repleModal").modal("show");
	});
	// 댓글 수정 모달 종료시
	$("#btnClose").on("click",function(){
		location.href = "admin_community_board_read.do?com_board_no=${vo.com_board_no}";
	});
	
	
	// 커뮤니티 글 삭제 모달 부분
	$("#remove_free").on("click",function(){
		$("#free_No").val( $(this).attr("free_no") );
		
		$("#text_modal").modal("show");
	});
	$("#text_modal_yes").on("click",function(){
		var del_free_no = $("#free_No").val();
			location.href = "admin_community_board_del.do?com_board_no=" + 
			del_free_no;
		$("#text_modal_modal").modal("hide");
	});
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});
	
	
	// 자유게시판 댓글 삭제 시 모달
	// <a> 태그로 값을 불러 올 때 class 했을 때 동작 됨.
	$(".remove_free_re").on("click",function(){
		$("#board_reple_No").val( $(this).attr("board_reple_no") );
		$("#board_No").val( $(this).attr("board_no") );
		
		$("#re_modal").modal("show");
	});
	$("#re_modal_yes").on("click",function(){
		var del_board_reple_no = $("#board_reple_No").val();
		var del_board_no = $("#board_No").val();
			location.href = "admin_community_board_repledel.do?com_board_reple_no=" + 
			del_board_reple_no +"&com_board_no=" + del_board_no;
		$("#re_modal_modal").modal("hide");
	});
	$("#re_modal_no").on("click",function(){
		$("#re_modal").modal('hide');
	});
	
});

// 추천 뛰우기 모달
window.onload = function() {
	e("btn").onclick = function() {
		var dc = "?dc=" + new Date().getTime();
		ajaxGet("admin_community_board_recom.do" + dc
				+ "&user_id=${user_id}&com_board_no=${vo.com_board_no}", function(rt) {
			if (rt == -1) {
				alert('이미 이 글을 추천하셨습니다');
				location.reload();
			} else {
				location.reload();
				
			}
		});
	};
};
</script>
</head>
<body>
<body>

	<br>
	<div class="row">
		<div class="col-lg-12">
		 <p> <label> 글보기 </label></p> 
			<hr style="border: solid 0.5px black;">
			<!-- 테이블 -->

			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>NO</th>
							<th>SUBJECT</th>
							<th>ID</th>
							<th>VIEW</th>
							<th>LIKE</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>${vo.com_board_no}</td>
							<td>${vo.com_board_title}</td>
							<td>${vo.user_id}</td>
							<td>${vo.view_count}</td>
							<td>
							
							<button type="button" id="btn" class="btn btn-default btn-circle" ><i class="fa fa-heart"></i>
							</button>&emsp; ${vo.recom_count}						
							</td>
						</tr>
						<tr>
							<td class="table_content" colspan="5">
								<div class="pre"
									style="padding: 10px; height: auto; min-height: 100px; overflow: auto;">
									<pre style="white-space: pre-wrap;">${vo.com_board_content}</pre>
								</div>
								
						
								
							</td>
						</tr>
					<thead>
						<tr>
							<td>
							<form action="admin_community_board_mod.do" method="POST">
								<input type="hidden" name="com_board_no" value="${vo.com_board_no}" /> 
								<input type="hidden" name="com_board_title" value="${vo.com_board_title}" /> 
								<input type="hidden" name="user_id" value="${vo.user_id}" /> 
								<input type="hidden" name="com_board_content" value="${vo.com_board_content}" /> 
								<input type="submit" id="mod"  class="btn btn-primary" value="글 수정하기" /> &nbsp;
								<input type="button" id="remove_free" free_no="${vo.com_board_no}" class="btn btn-primary" value="글 삭제하기" />
							</form>
							</td>
						</tr>
					<thead>
						<jl:forEach var="vo2" items="${rl}">
							<tr>
								<td>ID : ${vo2.user_id}</td>
								<td colspan="3"><span id="rb_${vo2.com_board_reple_no}">${vo2.com_board_reple_content}</span>
								<a abcd="rb_${vo2.com_board_reple_no}" xyz="${vo2.com_board_reple_no}" class="modReple" href="#">수정</a>
								<a class="remove_free_re" board_reple_no="${vo2.com_board_reple_no}" board_no="${vo2.com_board_no}" href="#" >[x] </a></td>
								<td>${vo2.the_time}</td>
							</tr>
						</jl:forEach>
					</tbody>
					
				</table>
			</div>



			<!-- /.table-responsive -->




		</div>
		<!-- /.col-lg-12 -->
	</div>
<hr style="border: solid 0.5px black;">
	<form action="admin_community_board_addreple.do" method="POST">
<div class="select1">
		<label> 댓글달기 </label>
</div>
<div class="select2">	
		<input type="text" name="com_board_reple_content" style="width: 600px; height:50px;" class="form-control"/>
		<input type="hidden" name="com_board_no" value="${vo.com_board_no}" /> 
		<input type="hidden" name="user_id" value="${user_id}" /> 
	</div>	
<div class="select3">	
		<input type="submit" class="btn" value="댓글달기" />
</div>
	</form>
<!-- <div class="select3">	
	<input type="button" id="btn" class="btn" value="추천버튼" />
</div>	 -->
	
<!-- 모달 -->	
	<form action="admin_community_board_replemod.do" id="reple_form" method="post" id="frm">
		<div id="repleModal" class="modal" role="dialog">
			<input type="hidden" id="com_board_no" value="${vo.com_board_no}" name="com_board_no" /> 
			<input id="com_board_reple_no" type="hidden" name="com_board_reple_no" />
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<div class="form-group">
							<label id="lblContent" for="content"></label>
							<textarea name="com_board_reple_content" class="form-control" id="content" rows="7"></textarea>
						</div>

						<input type="button"  class="btn btn-primary btn-sm" id="btnClose" value="닫기">
						<input type="button" class="btn btn-primary btn-sm" id="btnreMod" value="수정">
					</div>
				</div>
			</div>
		</div>
	</form>


<!-- 글 삭제 모달 -->	
<div id="text_modal" class="modal fade" role="dialog">
	<input type="hidden" id="board_reple_No" value="0"/>
	<input type="hidden" id="board_No" value="0"/>
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="text_mohead" class="modal-header"align="center"><h4>글 삭제</h4></div>
			<div id="text_mobody" class="modal-body" align="center">
				<h4>글을 삭제 하시겠습니까?</h4>
			</div>
			<div id="text_ft" class="modal-footer">
				<button type='button' class='btn btn-default' id='text_modal_yes'>확인</button>
				<button type='button' class='btn btn-primary' id='text_modal_no'>취소</button>
			</div>
		</div>
	</div>
</div>

<!-- 댓글 삭제 모달 -->		
<div id="re_modal" class="modal fade" role="dialog">
	<input type="hidden" id="free_No" value="0"/>
	<input type="hidden" id="free_No" value="0"/>
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="re_mohead" class="modal-header"align="center"><h4>댓글 삭제</h4></div>
			<div id="re_mobody" class="modal-body" align="center">
				<h4>댓글을 삭제 하시겠습니까?</h4>
			</div>
			<div id="re_ft" class="modal-footer">
				<button type='button' class='btn btn-default' to-delete2="delete_${vs2.count}"  id='re_modal_yes'>확인</button>
				<button type='button' class='btn btn-primary' id='re_modal_no'>취소</button>
			</div>
		</div>
	</div>
</div>

<!-- 확인 완료용 모달 -->
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

</body>
</html>


