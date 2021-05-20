<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${cookie.save_id.value ne null}">
	<c:set var="saveid" value="${cookie.save_id.value}"/>
	<c:set var="idck" value=" checked=\"checked\""/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>HappyHouse | SSAFY</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="/img/favicon.png" rel="icon">
    <link href="/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/vendor/icofont/icofont.min.css" rel="stylesheet">
    <link href="/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="/vendor/venobox/venobox.css" rel="stylesheet">
    <link href="/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/vendor/aos/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Template Main CSS File -->
    <link href="/css/style.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: Bethany - v2.2.1
    * Template URL: https://bootstrapmade.com/bethany-free-onepage-bootstrap-theme/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/dealResult.js"></script>
	<script type="text/javascript">
		function login() {
			if(document.getElementById("userId").value == "") {
				alert("아이디 입력!!!");
				return;
			} else if(document.getElementById("userPwd").value == "") {
				alert("비밀번호 입력!!!");
				return;
			} else {
				document.getElementById("loginform").action = "${root}/user/login";
				document.getElementById("loginform").submit();
			}
		}
	
	</script>
</head>
<body>
<ul id="drop-down-login1" class="drop-down-login" aria-labelledby="login" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px;left: 0px; transform: translate3d(1200px, 60px, 0px); display: none;">
  <li class="dropdown">
      <form id="loginform" action="" method="post">
          <div class="form-group has-feedback">
              <label class="control-label">아 이 디</label>
              <input type="text" class="form-control" id="userId" name="userId" placeholder="" value="${saveid}">
          </div>
          <div class="form-group has-feedback">
              <label class="control-label">비밀번호</label>
              <input type="password" class="form-control" placeholder="" id="userPwd" name="userPwd" onkeydown="javascript:if(event.keyCode == 13) {login();}">
          </div>
          <button type="button" class="btn btn-warning" onclick="javascript:login();">로그인</button>
          <div class="form-group form-check" align="right">
		    <label class="form-check-label">
		      <input class="form-check-input" type="checkbox" id="idsave" name="idsave" value="saveok"${idck}> 아이디저장
		    </label>
		  </div>
          <ul class="pagination">
            <li><a href="#" class="btn btn-default btn-sm">아이디 찾기</a></li>
            <li><a href="#" class="btn btn-default btn-sm">비밀번호 찾기</a></li>
          </ul>
      </form>
  </li>
</ul>
</body>
