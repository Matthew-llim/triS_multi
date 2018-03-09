<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<!-- Google Analytics -->
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-112826214-1', 'auto');
ga('send', 'pageview');
</script>
<!-- End Google Analytics -->
<title>Welcome to Multi Space</title>
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
	
	<script>
	$(document).ready(function(){


		var url = "chk_login.do";
 		ajaxGet(url,function(rt){
 			
 				// 로그인 실패시 : rt값 -> ("/main_html.do")에서 10002 return
 				if(rt =="10002"){ 
					$("#login_nav").hide();
					$("#non_login_nav").show();
				}
 					
 				// 로그인 시 : rt값 -> user_name
				else if(rt!=""){
					$("#login_nav").show();
					$("#non_login_nav").hide();
					$("#user_name").text(rt+"님");
				}
 			});	
		
	 		var scOffset = $('.navbar').offset();
	 		$(window).scroll(function() {
	 			if ($(document).scrollTop() > scOffset.top + 500) {
	 				$('.navbar').addClass('navbar-fixed-top');
	 				$('.navbar').addClass('navbar-color');
	 			} else {
	 				$('.navbar').removeClass('navbar-fixed-top');
	 				$('.navbar').removeClass('navbar-color');
	 			}
	 		});
	 		
	 		
			

			ajaxGet("best_space.do",function(rt){
				var seoul_best = eval("("+rt+")");			
				var html ="";
				
				 for(var i=0; i<seoul_best.data.length; i++){
					 html += "<li>";
					 html += "<a href='#'>";
					 html += "<img src='./Resources/img/property_1.jpg'  class='property_img'/>";
					 html += "</a>";
					 html += "<span class='price'>서울</span>";
					 html += "<div class='property_details'>";
					 html += "<h1>";	
					 html += "<a href='#'>"+seoul_best.data[i].space_title+"</a>";	
					 html += "</h1>";	
					 html += "<div class='property_details_box'>";	
					 html += "<div class='property_sub_details_left'>";	
					 html += "<h2>"+seoul_best.data[i].price+"원/시간 </h2>";	
					 html += "</div>";	
					 html += "<div class='property_sub_details_right'>";	
					 html += "<h2><span class='property_size'>즐찾수 "+seoul_best.data[i].count+"</span></h2>";	
					 html += "</div>";	
					 html += "</div>";	
					 html += "</div>";	
					 html += "</li>";	
						
					// alert(seoul_best.data[i].space_title);
				} 
				 $("#seoulbest_properties_list").html(html);
				
			});
			
			ajaxGet("best_space2.do",function(rt){
				var party_best = eval("("+rt+")");
				var html2 ="";
				
				 for(var i=0; i<party_best.data.length; i++){
					 html2 += "<li>";
					 html2 += "<a href='#'>";
					 html2 += "<img src='./Resources/img/property_1.jpg'  class='property_img'/>";
					 html2 += "</a>";
					 html2 += "<span class='price'>서울</span>";
					 html2 += "<div class='property_details'>";
					 html2 += "<h1>";	
					 html2 += "<a href='#'>"+party_best.data[i].space_title+"</a>";	
					 html2 += "</h1>";	
					 html2 += "<div class='property_details_box'>";	
					 html2 += "<div class='property_sub_details_left'>";	
					 html2 += "<h2>"+party_best.data[i].price+"원/시간 </h2>";	
					 html2 += "</div>";	
					 html2 += "<div class='property_sub_details_right'>";	
					 html2 += "<h2><span class='property_size'>즐겨찾기 "+party_best.data[i].count+"</span></h2>";	
					 html2 += "</div>";	
					 html2 += "</div>";	
					 html2 += "</div>";	
					 html2 += "</li>";	
				 }
				 $("#partybest_properties_list").html(html2);
			});
			
			ajaxGet("best_club.do",function(rt){
				var best_club = eval("("+rt+")");
				var html3 ="";
				
				 for(var i=0; i<best_club.data.length; i++){
					 
					 html3 += "<div class='main_club_wrapper main_club_wrapper"+[i]+"'>";
					 html3 += "<div class='main_club_wrapper_content'>";
					 html3 += "<div class='main_club_img'>";
					 html3 += "<img src='./Resources/img/property_1.jpg' class='best_club_img'/>";
					 html3 += "</div>";
					 html3 += "<div class='main_club_content'>";
					 html3 += "<div class='main_club_content_title'>";
					 html3 += "<div class='main_club_content_score'>";
					 html3 += i+1+"위";
					 html3 += "</div>";
					 html3 += "<div class='main_club_content_title_content'><a href='club_detail.do?club_no="+best_club.data[i].club_no+"'>[ "+best_club.data[i].club_name+" ] "+best_club.data[i].club_title+"</a></div>";			 
					 html3 += "</div>";
					 html3 += "<div class='main_club_content_member'>";
					 html3 += "회원수 : " + best_club.data[i].count;
					 html3 += "</div>";
					 html3 += "</div>";
					 html3 += "</div>";
					 html3 += "</div>";
					 


				 }
				 $("#main_club_list").html(html3);
				 
			});
			
			ajaxGet("best_community.do",function(rt){
				var best_community = eval("("+rt+")");
				var html4 ="";
				
				 for(var i=0; i<best_community.data.length; i++){
					 html4 += "<div class='main_community_wrapper'>";
					 html4 += "<div class='main_community_content"+[i]+"'>";
					 html4 += "<div class='main_community_content_title'><a href='community_board_read.do?com_board_no="+best_community.data[i].com_board_no+"'>";
					 html4 += best_community.data[i].com_board_title;			 
					 html4 += "</a></div>";
					 html4 += "<div class='main_community_content_view_recom'>";
					 html4 += "<span>작성자 :" +best_community.data[i].user_name+
					 " | 조회수 :" + best_community.data[i].view_count + " | 추천수 : "+ best_community.data[i].recom_count+"</span>";
					 html4 += "</div>";			 
					 html4 += "</div>";
					 html4 += "</div>";
				 }
				 $("#main_community_list").html(html4);
			});
		});
	</script>
</head>
<body>

	<!-- *********************  header  ************************ -->
         <%@include file="./jsp/header_main.jsp"%>  
	<!-- *********************  header - end  ************************ -->

	<jl:if test="${ckAdmin eq 3}">
		<a href="admin_main.do">관리자 페이지 이동</a>
	</jl:if>


	<section class="listings">
		<div class="wrapper">

			<div class="c_cate_list">
				<div class="c_cate_list_name">서울 BEST</div>
				<ul id="seoulbest_properties_list" class="properties_list">

				</ul>

				<div class="c_cate_list_name">파티룸 BEST</div>
				<ul id="partybest_properties_list" class="properties_list">

				</ul>
			</div>
		</div>
		<div class="c_cover">
			<div class="c_wrapper">
				<div class="c_wrapper_sub">

					<div class="c_wrapper_sub_title">
						<div class="main_list_club_commu_left">( 클럽 BEST )</div>
						<div class="main_list_club_commu_right">( 인기글 BEST )</div>
					</div>

					<div class="c_wrapper_sub_main_left">
						<div class="main_club">

							<div id="main_club_list" class="c_wrapper_ul"></div>

						</div>
					</div>
					<div class="c_wrapper_sub_main_right">
						<div class="main_community">

							<div id="main_community_list" class="c_wrapper_ul"></div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
		<!--  end footer  -->
	

</body>
</html>
