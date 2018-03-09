<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-112826214-1', 'auto');
	ga('send', 'pageview');

</script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	

<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	
<script type="text/javascript" src="./Resources/js/jquery.js"></script>
<script type="text/javascript" src="./Resources/js/main.js"></script>


 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="common.js" type="text/javascript"></script>
 <script>
 
 	$(document).ready(function(){
 		if("${user.grade}" == "2"){
 			$("#add_space").css("display","block");
 		}
 		
 		$('#boy').on("load",function(){
 			var h = this.contentWindow.document.body.offsetHeight;
 			$(this).height(h);
 		});
 		

 		if("${space_code }"=="20007"){
			$("#status-modal-body").html("판매자만 공간 등록이 가능합니다");
			$("#status-modal").modal('show');
		}else if("${space_code}"=="20006"){
			$("#status-modal-body").html("게시글이 삭제되었습니다.");
			$("#status-modal").modal('show');
		}
 		
 		$("#status-modal").on("hidden.bs.modal",function(){
			location.replace("space_home.do");
		});
 		
 		var scOffset = $( '.navbar-Menu' ).offset();
 		$( window ).scroll( function() {
 		if ( $( document ).scrollTop() > scOffset.top ) {
 			$( '.navbar' ).addClass( 'navbar-fixed-top' );
 		}else {
 			$( '.navbar' ).removeClass( 'navbar-fixed-top' );
 		}
 		});
 		var url = "chk_login.do";
	 	 	ajaxGet(url,function(rt){	
	 	 	 // 로그인 실패시 : rt값 -> ("/main_html.do")에서 10002 return
	 	 	 if(rt =="10002"){ 
	 	 		$("#login_nav").hide();				$("#non_login_nav").show();
	 	 	}
	 	 	 					
	 	 	 // 로그인 시 : rt값 -> user_name
	 	 	else if(rt!=""){ 
	 	 	$("#login_nav").show();
	 	 	$("#non_login_nav").hide(); 
	 	 	$("#user_name").text(rt+"님");
	 	 		}
 	 	 });
	 	 	
	 	 	
 	});
 </script>
</head>
<body>
	<!-- *********************  header  ************************ -->
    <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ -->
	
	
	<div class="form_back" >
		<div class="form-wrapper">
			<form target="boy" action="space_home_iframe.do">
				<br/><h3>지역별 선택</h3>
					<div class="c_div" >
						<jl:forEach var="local" items="${local_list}" varStatus="i">
							<%-- <label class="radio-inline"><input type="radio" name="l_category_no" value="${local.l_category_no }">${local.l_category_name }</label> --%>
							<input id="l_${i.count}" name="l_category_no" value="${local.l_category_no}" type="radio"> 
							<label for="l_${i.count}" class="category_label"><span></span>
								${local.l_category_name}
							</label>
						</jl:forEach>
					</div>
				<br/>
				<br/><h3>분야별 선택</h3>
				<div class="c_div">
					<jl:forEach var="category" items="${category_list }" varStatus="i">
						<%-- <label class="radio-inline"><input type="radio" name="s_category_no" value="${category.s_category_no }">${category.s_category_name }</label> --%>
						<input id="s_${i.count}" name="s_category_no" value="${category.s_category_no}" type="radio"> 
						<label for="s_${i.count}" style="margin-right: 20px;"><span></span>
							${category.s_category_name}
						</label>
					</jl:forEach>
				</div><br/>
				<div class="club_home_select_div0">
					<div class="club_home_selectdiv1">
						<div class="club_home_select_div2">
							<select name="search_option" class="form-control">
								<option value="0"></option>
								<option value="1">제목</option>
								<option value="2">내용</option>
								<option value="3">제목+내용</option>
							</select>
						</div>
						<div class="club_home_select_div3">
							<input type="text" name="search_content" class="form-control selectdiv3"/>
						</div>
						<div class="club_home_select_div4">
							<input type="submit" id="submitBtn" value="검색" class="btn">
						</div>
					</div>
				</div>
			<!-- 	
				<select name="search_option">
					<option value="0"></option>
					<option value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">제목+내용</option>
				</select>
				<input type="text" name="search_content"/>
				<input type="submit" value="제출"> -->
			</form>
		</div>
	</div>
	
	<div class="container">
		<section class="listings">
			<div class="wrapper">
				<div class="properties_list">
					<hr/>
					<iframe name="boy" id="boy" src="space_home_iframe.do" class="iframe-design" scrolling="no" frameborder="0"></iframe>
					<div class="text-right">
						<a href="space_add.do" class="sh_a" id="add_space" style="display: none;"><button class="btn_square">공간 등록</button></a>
					</div>
				</div>
				<!-- 상태 모달 -->
				<div class="modal fade" id="status-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span>
									<span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title">진행상태</h4>
							</div>
							<div class="modal-body">
								<h2 id="status-modal-body">XX 완료</h2>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
		
		
		<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
		<!--  end footer  -->
		
			
		
</body>
</html>