<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script type="text/javascript" src="common.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<style type="text/css">
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	
		
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://70.12.113.229:8088/msspace_01/mypage_css/Mybookmark.css">
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#del").on("click",function(){
				$("#lblContent").text("삭제하시겠습니까?");
				$("#modal").modal("show");
			});
			
			//삭제하시겠습니까? 확인버튼
			$("#success").on("click",function(){
				var str = $("form").serialize();
				$.ajax({
					type : "POST",
					url : "bookmark_del.do",
					data : str,
					success : function(rt) {
						if(rt == 321){
							$("#modalSuccess").modal("show");
						}else{
							$("#dv").html("삭제할 공간을 선택해주세요.");
						}
					},
					error : function(shr,option,error){
						alert(error);
					}
				});
			});
			
			//삭제완료 버튼
			$("#success1").on("click",function(){
				location.reload();
			});
			
			$("#close").on("click",function(){
				$("#modal").modal("hide");
			})
		});
	</script>
</head>
<body>
	<h3>즐겨찾기</h3>
	<div class="totaldiv">
	<form name="frm">
		<%-- <table border="1" cellspacing="1" cellpadding="1">
			<jl:forEach var="ab" items="${rl}" varStatus="i" begin="0">
			<jl:if test="${(i.count-1) % 3 eq 0}">
				<tr>
			</jl:if>
				<td>	
				${ab.space_no}
				<input type="checkbox" class="space_no" name="check" value="${ab.space_no}" abc="${ab.space_no}"/><br/>
				<img src="img/${ab.space_thumb_img}" width="100px"/><br/>
				<a href="space_detail.do?space_no=${ab.space_no}" target="_parent">${ab.space_title}</a><br/>
				</td>
			</jl:forEach>
		</table> --%>
		<div id="dv"></div>
		
		
		
		<div class="mybookmarkdiv">
		 <ul>
		<jl:forEach var="ab" items="${rl}" varStatus="i" begin="0">

		    <li>
			<div class="bookmark_chkbox">
		    <input type="checkbox" class="space_no" name="check" value="${ab.space_no}" abc="${ab.space_no}"/>
		    </div>
		    <div class="bookmark_img">
		    <a href="space_detail.do?space_no=${ab.space_no}" target="_parent">
		    <img src="space_img/${ab.space_thumb_img}" width="140px" height="140px" onerror="this.src='img/no_img.jpg'"></a>
		    </div>
		    
		    </li>
		</jl:forEach>
		</ul> 
		</div>
		<div class="bookmark_div">
			<input type="button" value="삭제하기" id="del" class="btn btn-default"/>
		</div>
	</form>
	</div>
	
	<div id="modal" class="modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="text_mohead" class="modal-header"align="center"><h4>글 삭제</h4></div>
				<div id="text_mobody" class="modal-body" align="center">
					<h4 id="lblContent"></h4>
				</div>
				<div id="text_ft" class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal" id="success">확인</button>
					<button class="btn btn-default" data-dismiss="modal" id="close">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<div id="modalSuccess" class="modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<label>삭제되었습니다.</label>
				</div>
				<div class="modal-footer">
						<button class="btn btn-default" data-dismiss="modal" id="success1">확인</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>