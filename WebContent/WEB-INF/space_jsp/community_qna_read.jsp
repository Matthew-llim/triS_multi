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
			$("#com_qna_reple_no").val($(this).attr("xyz"));
			$("#content").val($("#" + $(this).attr("abcd")).text());
			$("lblcontent").text("글번호 :" + $(this).attr("xyz"));
			$("#repleModal").modal("show");
			
			$("#btnMod").on("click",function(){
				var formData = $("#reple_form").serialize();
				$.ajax({
					type : "POST",
					url : "community_qna_reple_mod.do",
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
								$("#com_qna_reple_content").val("");
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
 			var com_qna_reple_no = $(this).attr("aa");
			var com_qna_no = $(this).attr("bb");
			$("#mohead").html("<div class='modal-title'align='center'><h4>댓글삭제</h4></div>");
			$("#mobody").html("댓글을 삭제하시겠습니까?");
			$("#ft").html("<button type='button' class='btn btn-default' id='modal-del-Yes'>확인</button>"+
					"<button type='button' class='btn btn-primary' id='modal-del-No'>취소</button>");
			$("#modal").modal();
			$("#modal-del-Yes").on("click",function(){
				var url = "community_qna_reple_del.do?com_qna_no="+com_qna_no + "&com_qna_reple_no=" + com_qna_reple_no;
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
		$(document).on("click",".recom", function() {
			var user_id=$(this).attr("user_id");
			var com_qna_reple_no=$(this).attr("com_qna_reple_no");
			var dc = "?dc=" + new Date().getTime();
			var url ="community_qna_reple_recom.do" + dc +"&com_qna_reple_no="+com_qna_reple_no+"&user_id="+user_id;
			ajaxGet(url, function(rt) {
				$("#recom_count"+com_qna_reple_no).html("<h5>"+rt+"</h5>");
				find_reple();
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
				reple_submit();
			});
			$("#modal-del-No").on("click",function(){
				$("#modal").modal("hide");
			}); 
		});
		var reple_submit = function(){
			var formData = $("#add_reple_frm").serialize();
			$.ajax({
				type : "POST",
				url : "community_qna_reple_add.do",
				data : formData,
				success	: function(rt) {
					if(rt=="ok"){
						$("#mohead").html("<div class='modal-title'align='center'><h4>댓글등록</h4></div>");
						$("#mobody").text("댓글이 등록 되었습니다.");
						$("#ft").html("<button type="+"'button"+"' class="+"'btn btn-default"+"' data-dismiss="+"'modal"+"'>닫기</button>");
						$("#modal").modal("show");
						$("#modal").on("hidden.bs.modal",function(){
							$("#modal").modal("hide");
							$("#com_qna_reple_content").val("");
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
		}
			
		/* 댓글 등록 부분 비동기 처리 */

	
	/* 댓글 조회 비동기 처리 */
	function find_reple(){
			var url = "community_qna_read_reple.do?com_qna_no="+${vo.com_qna_no};
		 	ajaxGet(url,function(rt){
			 	if(rt!=''){
				 	var list = window.eval("("+rt+")");
				 	var html = "";
			 		html +="<table class='"+"table-hover'"+">";
				 	for( var i = 0 ; i < list.data.length ; i++ ){
				 		html += "<tr><td width="+"150"+"><h4>"+list.data[i].user_id+"</h4></td>";
				 		html += "<td width="+"1000"+"><span id='rb_"+list.data[i].com_qna_reple_no+"'><h4>"+list.data[i].com_qna_reple_content+"</h4></span>";
				 		html += "<td width="+"250"+"><h5>"+list.data[i].the_time+"</h5></td>";
				 		html += "<td width="+"30"+"><span id='recom_count+"+list.data[i].com_qna_reple_no+"'><h5>"+list.data[i].recom_count+"</h5></span></td>";
				 		html += " <td width="+"50"+"><input type='button' class='recom btn btn-warning btn-xs' value='추천' user_id='${user_id}' com_qna_reple_no='"+list.data[i].com_qna_reple_no+"' /></td>";
						if('${user_id}' == list.data[i].user_id){
				 			html += " <td width="+"50"+"><input type='button' class='modReple btn btn-info btn-xs' value='수정' abcd='rb_"+list.data[i].com_qna_reple_no+"' xyz='"+list.data[i].com_qna_reple_no+"' /></td>";
					 		html += " <td width="+"50"+"><input type='button' class='delRe btn btn-danger btn-xs' value='삭제' aa='"+list.data[i].com_qna_reple_no+"' bb='"+list.data[i].com_qna_no+"'/></td>";	
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
});
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
	
	<div class="row comm_qna_read">
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
							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><h4>${vo.com_qna_no}</h4></td>
							<td><h4>${vo.com_qna_title}</h4></td>
							<td><h4>${vo.user_id}</h4></td>
							<td><h4>${vo.view_count}</h4></td>
						</tr>
						<tr>
							<td class="table_content" colspan="5">
								<div class="pre"
									style="padding: 10px; height: auto; min-height: 200px; overflow: auto;">
									<pre style="white-space: pre-wrap;"><h4>${vo.com_qna_content}</h4></pre>
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
		
			<div class="replecontent_qna">
		<form id="add_reple_frm">
			<jl:if test="${user_id ne ''}">
				<div class="replesumtext">
					<input class="form-control" type="text" id="com_qna_reple_content"  name="com_qna_reple_content" placeholder="댓글을 입력하세요."/>
					<input type="hidden" name="user_id" value="${user_id}"/>
					<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
				</div>
				<div class="repsumbtn">
					<input id="submit_btn" type="button" value="댓글작성" class="btn btn-primary" user_id="${user_id}">
				</div>
			</jl:if>
		</form>
		<div class="btnclass_mod">
		<div class="btnclass1">
			<form action="community_qna_list.do" method="post">
				<input type="submit" value="글목록" class="btn btn-basic"/>
			</form>
		</div>
		<div class="btnclass2">
			<form action="community_qna_del.do" method="POST" id="textDelform">
				<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}" />
				<jl:if test="${vo.user_id eq user_id}">
					<input type="button" class="btn btn-danger" value="글삭제" id="btnDel"/>
				</jl:if>
			</form>
		</div>
		<div class="btnclass3">
			<form action="community_qna_mod.do" method="post">
				<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
				<input type="hidden" name="com_qna_title" value="${vo.com_qna_title}"/>
				<input type="hidden" name="user_id" value="${vo.user_id}"/> 
				<input type="hidden" name="com_qna_content" value='${vo.com_qna_content}'>
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
			<input type="hidden" id="com_qna_no" value="${vo.com_qna_no}"
				name="com_qna_no" /> <input id="com_qna_reple_no" type="hidden" name="com_qna_reple_no" />
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<div class="form-group">
							<label id="lblContent" for="content"></label>
							<textarea name ="com_qna_reple_content" class="form-control" id="content" rows="7"></textarea>
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


