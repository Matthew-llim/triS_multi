<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />

<link rel="stylesheet" type="text/css"
   href="./Resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
<link rel="stylesheet" type="text/css"
   href="./Resources/css/responsive.css">
<link rel="stylesheet" type="text/css"
   href="./Resources/css/event_hover.css">


<script type="text/javascript" src="./Resources/js/jquery.js"></script>
<script type="text/javascript" src="./Resources/js/main.js"></script>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./common.js"></script>


<script>
   $(document).ready(function() {

      //ctrlLogin에서 chkcode 받아와서 조건에 맞으면 모달 show

      var chkcode = ${chkcode};
      if (chkcode == "10001") {
         $("#loginModal").modal('show');
      }
   });
</script>
</head>
<body>

   <section class="hero_page">
      <header>
         <div class="container-fluid">

            <nav class="navbar navbar-default">
            <a href="main.html" class="logo sh_a" alt="" titl="">Multi Space</a>

               <div id="navbar">
               
               
                  <ul id="non_login_nav" class="nav navbar-right">
                     <li><a href="home_moveLoginPage.do">로그인</a></li>
                  </ul>

                  <ul class="top_nav navbar-right">
                     <li><a href="space_home.do">공간</a></li>
                     <li><a href="club_home.do">모임</a></li>
                     <li><a href="community_list.do">커뮤니티</a></li>
                     <li><a href="event_user_list.do">이벤트</a></li>
                     <li><a href="notice_list.do">공지사항</a></li>
                     <li><a href="faq_list.do">FAQ</a></li>
                  </ul>
               </div>
            </nav>
         </div>
      </header>
      <!--  end header section  -->
   </section>


   <div class="login_div">

      <div class="wrapper">
         <div class="login_form1">
            <form method="POST" action="home_login.do" class="form-signin">
               <div class="loginform1_head">
                  <h2 class="form-signin-heading">Please login</h2>
               </div>
               <div class="loginform1_body">
                  <input type="text" class="form-control" name="user_id"
                     placeholder="Email Address" autofocus="" />
               </div>
               <div class="loginform1_body">
                  <input type="password" class="form-control" name="passwd"
                     placeholder="Password" />
               </div>
               <div class="loginform1_body">
                  <button class="btn btn-lg btn-blue btn-block" type="submit">Login</button>
               </div>
            </form>
         </div>

         <div class="login_form2">

            <div class="loginform2_body_join">
               <a id="sub-btn" class="btn btn-lg btn-blue sub-btn"
                  href="home_user_join.do" role="button">회원가입 </a>
            </div>
            <div class="loginform2_body_findId">
               <a id="sub-btn" class="btn btn-lg btn-blue sub-btn"
                  href="home_moveFindIdPage.do" role="button">ID 찾기 </a>
            </div>
            <div class="loginform2_body_findPasswd">
               <a id="sub-btn" class="btn btn-lg btn-blue sub-btn"
                  href="home_moveFindPasswdPage.do" role="button">Passward 찾기 </a>
            </div>
         </div>
      </div>
   </div>


   <!-- **************************************** loginModal *************************************** -->

   <div id="loginModal" class="modal " role="dialog">
      <div class="modal-dialog">
         <div class="modal-content">
            <div id="modal_text" class="modal-body">ID 가 없거나 암호가 틀립니다.</div>
            <div class="modal-footer">
               <button class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
         </div>
      </div>
   </div>


   <!-- ******************************* footer ******************************* -->
   <%@include file="./jsp/footer.jsp"%>
   <!--  end footer  -->



</body>
</html>