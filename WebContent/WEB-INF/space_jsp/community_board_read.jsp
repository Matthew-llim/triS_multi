<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
	
	<!-- Bootstrap Core CSS -->
	<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- MetisMenu CSS -->
	<link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
	
	<!-- DataTables CSS -->
	<link href="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
	
	<!-- DataTables Responsive CSS -->
	<link href="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
	
	<!-- Custom CSS -->
	<link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">
	
	<!-- Custom Fonts -->
	<link href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		.content{
			height : 100px;
		}
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
		.row {
			margin-left:10px;
			margin-right:10px;
		}
	.replecontent {
		width:98%;
		margin-left: 20px;
		float: left;
	}
	
	.repsumbtn {
		width: 100px;
		float: left;
	}
	
	.replesumtext {
		float: left;
		width: 800px;
	}
	
	
	
	.btnclass_mod {
		width: 300px;
		float: right;
	}
	
	.btnclass_mod .btnclass1, .btnclass_mod .btnclass2, .btnclass_mod .btnclass3
		{
		width: 100px;
		float: left;
	}
	</style>


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
							$("#mohead").html("<div class='modal-title'align='center'><h4>댓글수정</h4></div>");
							$("#mobody").text("댓글이 수정 되었습니다.");
							$("#modal").modal("show");
							$("#ft").html("<button type="+"'button"+"' class="+"'btn btn-default"+"' data-dismiss="+"'modal"+"'>닫기</button>");
							$("#modal").on("hidden.bs.modal",function(){
								$("#modal").modal("hide");
								$("#com_board_reple_content").val("");
								find_reple();
							});
						}else if(rt=="no"){
							$("#mohead").html("<div class='modal-title'align='center'><h4>댓글수정</h4></div>");
							$("#mobody").text("댓글 수정 처리가 실패 되었습니다.");
							$("#modal").modal("show");
							$("#ft").html("<button type="+"'button"+"' class="+"'btn btn-default"+"' data-dismiss="+"'modal"+"'>닫기</button>");
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
			$("#mobody").html("댓글을 삭제하시겠습니까?");
			$("#ft").html("<button type='button' class='btn btn-default' id='modal-del-Yes'>확인</button>"+
					"<button type='button' class='btn btn-primary' id='modal-del-No'>취소</button>");
			$("#modal").modal();
			$("#modal-del-Yes").on("click",function(){
				var url = "community_board_repledel.do?com_board_reple_no="+com_board_reple_no+"&com_board_no="+com_board_no;
				ajaxGet(url,function(rt){
					if(rt=="ok"){
						$("#mohead").html("<div class='modal-title'align='center'><h4>댓글삭제</h4></div>");
						$("#mobody").text("댓글이 삭제 되었습니다.");
						$("#ft").html("<button type="+"'button"+"' class="+"'btn btn-default"+"' data-dismiss="+"'modal"+"'>닫기</button>");
						$("#modal").modal("show");
						$("#modal").on("hidden.bs.modal",function(){
							$("#modal").modal("hide");
							find_reple();
						});
					}else if(rt=="no"){
						$("#mohead").html("<div class='modal-title'align='center'><h4>댓글삭제</h4></div>");
						$("#mobody").text("댓글 삭제 처리가 실패 되었습니다.");
						$("#ft").html("<button type="+"'button"+"' class="+"'btn btn-default"+"' data-dismiss="+"'modal"+"'>닫기</button>");
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
			var user_id=$(this).attr("user_id");
			var dc = "?dc=" + new Date().getTime();
			ajaxGet("community_board_recom.do" + dc	+ "&user_id="+user_id+"&com_board_no=${vo.com_board_no}", 
					function(rt) {
				if (rt != -1) {
					$("#recom_count").text(rt);
				} 
				else {
					$("#modalrecom").modal("show");
				}
			});
		});
		//추천끝
		
		/* 댓글 등록 부분 비동기 처리 */
		$("#submit_btn").on("click",function(){
			$("#mohead").html("<div class='modal-title'align='center'><h4>댓글등록</h4></div>");
			$("#mobody").html("댓글을 등록하시겠습니까?");
			$("#ft").html("<button type='button' class='btn btn-default' id='modal-del-Yes'>등록</button>"+
					"<button type='button' class='btn btn-primary' id='modal-del-No'>취소</button>");
			$("#modal").modal();
			
			$("#modal-del-Yes").on("click",function(){
		var formData = $("#add_reple_frm").serialize();
			$.ajax({
				type : "POST",
				url : "community_board_addreple.do",
				data : formData,
				success	: function(rt) {
					if(rt=="ok"){
						$("#mohead").html("<div class='modal-title'align='center'><h4>댓글등록</h4></div>");
						$("#mobody").text("댓글이 등록 되었습니다.");
						$("#ft").html("<button type="+"'button"+"' class="+"'btn btn-default"+"' data-dismiss="+"'modal"+"'>닫기</button>");
						$("#modal").modal("show");
						$("#modal").on("hidden.bs.modal",function(){
							$("#modal").modal("hide");
							$("#com_board_reple_content").val("");
							find_reple();
						});
					}else if(rt=="no"){
						$("#mohead").html("<div class='modal-title'align='center'><h4>댓글등록</h4></div>");
						$("#mobody").text("댓글 처리가 실패 되었습니다.");
						$("#ft").html("<button type="+"'button"+"' class="+"'btn btn-default"+"' data-dismiss="+"'modal"+"'>닫기</button>");
						$("#modal").modal("show");
						$("#modal").on("hidden.bs.modal",function(){
							$("#modal").modal("hide");
							find_reple();
						});
					}
			    }
			});
			});
			$("#modal-del-No").on("click",function(){
				$("#modal").modal("hide");
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
				 	var html = "";
			 		html +="<table class='"+"table-hover'"+">";
				 	for( var i = 0 ; i < list.data.length ; i++ ){
				 		html += "<tr><td width="+"150"+"><h4>"+list.data[i].user_id+"</h4></td>";
				 		html += "<td width="+"1000"+"><span id='rb_"+list.data[i].com_board_reple_no+"'><h4>"+list.data[i].com_board_reple_content+"</h4></span>";
				 		html += "<td width="+"250"+"><h5>"+list.data[i].the_time+"</h5></td>";
						if('${user_id}' == list.data[i].user_id){
				 			html += " <td width="+"50"+"><input type='button' class='modReple btn btn-info btn-xs' value='수정' abcd='rb_"+list.data[i].com_board_reple_no+"' xyz='"+list.data[i].com_board_reple_no+"' /></td>";
					 		html += " <td width="+"50"+"><input type='button' class='delRe btn btn-danger btn-xs' value='삭제' aa='"+list.data[i].com_board_reple_no+"' bb='"+list.data[i].com_board_no+"'/></td>";	
						}
						html +="</tr>";
				 	}//end for
					html +="</table>";
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
	
	<!-- *********************  header  ************************ -->
         <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ --> 
	<div class="head" id="header">
	
		<ul id="Navtab" class="nav nav-tabs commu_nav-tabs" role="tablist">
			<li ><a href="community_board_list.do" ><h3>FREE BOARD</h3></a></li>

			<li ><a href="community_qna_list.do"  ><h3>QnA BOARD</h3></a></li>

			<li ><a href="community_review_list.do" ><h3>REVIEW BOARD</h3></a></li>
		</ul>
	</div>
	
	<div class="row">
		<div class="col-lg-12">
		<hr style="border: solid 0.5px black;">
			<!-- 테이블 -->
			<div class="table-responsive">
						</br>

				<table class="table">
					<thead>
						<tr>
							<th><h4>번호</h4></th>
							<th><h4>제목</h4></th>
							<th><h4>글쓴이</h4></th>
							<th><h4>조회</h4></th>
							<th><h4>추천</h4></th>
							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><h4>${vo.com_board_no}</h4></td>
							<td><h4>${vo.com_board_title}</h4></td>
							<td><h4>${vo.user_id}</h4></td>
							<td><h4>${vo.view_count}</h4></td>
							<td>
							<div id="recomCount">
								<button user_id="${user_id}" type="button" id="btnrecom" class="btn btn-default btn-circle" ><i class="fa fa-heart"></i>
								</button>&emsp;<span id="recom_count">${vo.recom_count}</span>				
							</div>
							</td>
						</tr>
						<tr>
							<td class="table_content" colspan="5">
								<div class="pre"
									style="padding: 10px; height: auto; min-height: 200px; overflow: auto;">
									<pre style="white-space: pre-wrap;"><h4>${vo.com_board_content}</h4></pre>
								</div>
							</td>
						</tr>
						</tbody>
					</table>
					
					<table>
						<hr style="border: solid 0.5px black;">
					</table>
					<!-- 댓글 리스트가 추가될 영역 -->
				<div id="reple_tr" style=" height: auto; min-height: 5px; overflow: auto;">
			
				</div>
				<br><br>
			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.col-lg-12 -->
		
			<div class="replecontent">
		<form id="add_reple_frm">
			<jl:if test="${user_id ne ''}">
				<div class="replesumtext">
					<input class="form-control" type="text" id="com_board_reple_content"  name="com_board_reple_content" placeholder="댓글을 입력하세요."/>
					<input type="hidden" name="user_id" value="${user_id}"/>
					<input type="hidden" name="com_board_no" value="${vo.com_board_no}"/>
				</div>
				<div class="repsumbtn">
					<input id="submit_btn" type="button" value="댓글작성" class="btn btn-primary" user_id="${user_id}">
				</div>
			</jl:if>
		</form>
		<div class="btnclass_mod">
		<div class="btnclass1">
			<form action="community_board_list.do" method="post">
				<input type="submit" value="글목록" class="btn btn-basic"/>
			</form>
		</div>
		<div class="btnclass2">
			<form action="community_board_del.do" method="POST" id="textDelform">
				<input type="hidden" name="com_board_no" value="${vo.com_board_no}" />
				<jl:if test="${vo.user_id eq user_id}">
					<input type="button" class="btn btn-danger" value="글삭제" id="btnDel"/>
				</jl:if>
			</form>
		</div>
		<div class="btnclass3">
			<form action="community_board_mod.do" method="post">
				<input type="hidden" name="com_board_no" value="${vo.com_board_no}"/>
				<input type="hidden" name="com_board_title" value="${vo.com_board_title}"/>
				<input type="hidden" name="user_id" value="${vo.user_id}"/> 
				<input type="hidden" name="com_board_content" value='${vo.com_board_content}'>
				<jl:if test="${vo.user_id eq user_id}"> 
					<input type="submit" class="btn btn-info" id="mod" value="글수정" />
				</jl:if>
			</form>
		</div>	
		</div>
	</div>
	</div>
	</br>

	
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
						<input type="button" class="btn btn-default" id="btnMod" value="수정"/>
						<input type="button" class="btn btn-primary" id="btnClose" value="취소"/>
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
				<div class="modal-body">댓글이 수정 되었습니다.</div>
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
				<div class="modal-body">이미 추천하셨습니다</div>
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
				<div class="modal-body">글을 삭제 하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="delsuccess">확인</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
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
				<div class="modal-body">글 삭제 완료!</div>
				<div class="modal-footer">
					<button id="modalmodclose"type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- 글삭제 모달 확인 폼끝 -->

<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
	<!--  end footer  -->

</body>
</html>


