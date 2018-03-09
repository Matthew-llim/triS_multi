<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="./Resources/css/bootstrap.css">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

	
		<br>
	<div class="row">
		<div class="col-lg-12">
		 <p> <label> QnA 글보기 </label></p> 
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
							
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>${vo.com_qna_no}</td>
							<td>${vo.com_qna_title}</td>
							<td>${vo.user_id}</td>
							<td>${vo.view_count}</td>
						</tr>
						
						<tr>
							<td class="table_content" colspan="4">
								<div class="pre"
									style="padding: 10px; height: auto; min-height: 100px; overflow: auto;">
									<pre style="white-space: pre-wrap;">${vo.com_qna_content}</pre>
								</div>
								
						
								
							</td>
						</tr>
					<thead>
						<tr>
							<td>
							
									
							<form action="admin_community_qna_mod.do" method="post">
								<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
								<input type="hidden" name="com_qna_title" value="${vo.com_qna_title}"/>
								<input type="hidden" name="com_qna_content" value="${vo.com_qna_content}"/>
								<input type="submit" value="QnA수정"/>
							</form>
							</td>
						</tr>
						
						<tr>
							<td>
								<input type="button" class="qna_remove" com_qna_no="${vo.com_qna_no}"  value="QnA삭제"/>
							</td>
						</tr>
					<thead>
					
					
					<jl:forEach var="rpl" items="${rp}">
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
				<td>[<a href="#" class="remove_qna_re" com_qna_no="${rpl.com_qna_no }" com_qna_reple_no="${rpl.com_qna_reple_no}" >삭제</a>]</td>
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
<form action="admin_community_qna_reple_add.do" method="POST">
<div class="select1">
		<label> 댓글달기 </label>
</div>
<div class="select2">	
		<input type="text" name="com_qna_reple_content" style="width: 600px; height:50px;" class="form-control"/>
		<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}" /> 
		<input type="hidden" name="user_id" value="${user_id}" /> 
	</div>	
<div class="select3">	
		<input type="submit" class="btn" value="댓글달기" />
</div>
</form>



<!-- 모달시작 -->
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
<!-- 모달끝 -->	

<!-- 폼-->
		<form action="admin_community_qna_reple_add.do" method="post">
		
			<input type="hidden" name="user_id" value="${user_id}"/>
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			
		</form>
		

		
		<form action="admin_community_qna_mod.do" method="post">
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="hidden" name="com_qna_title" value="${vo.com_qna_title}"/>
			<input type="hidden" name="com_qna_content" value="${vo.com_qna_content}"/>

		</form>
		
		<form action="admin_community_qna_del.do" method="post">
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
		
		</form>
<!-- 폼끝 -->		

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

</body>
</html>