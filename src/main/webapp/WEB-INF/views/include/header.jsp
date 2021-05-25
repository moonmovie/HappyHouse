<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${cookie.save_id.value ne null}">
	<c:set var="idsave" value="${cookie.save_id.value}"/>
	<c:set var="idck" value=" checked=\"checked\""/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- Template Main CSS File -->
<link href="${root}/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

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
	
	function openlogin(){ // 로그인 화면
		if(document.getElementById('drop-down-login1').style.display == 'none'){
			document.getElementById('drop-down-login1').style.display = 'block';
		} else {
			document.getElementById('drop-down-login1').style.display = 'none';
		}
	}
</script>
</head>
<body>
<!-- ======= Header ======= -->
<header id="header" class="fixed-top d-flex align-items-center" style="top: 0px;">
	<div class="container">
		<div class="header-container d-flex align-items-center">
			<div class="logo mr-auto">
				<%-- 로고 및 홈페이지 링크 --%>
				<h1 class="text-light">
					<a href="${root}/"><span>HappyHouse</span></a>
				</h1>
			</div>

			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li class="active"><a href="#header">Home</a></li>
					<li><a href="/notice">Notice</a></li>
					<li><a href="#">Today's News</a></li>
					<li><a href="#contact">Contact</a></li>
					<c:if test="${user eq null}"> <%-- 로그인이 안 되어 있다면 --%>
						<li class="get-started"><a href="${root}/user/regist">SignUp</a> <%-- 회원가입 jsp 이동 --%>
						<li class="get-started"><a id="login" onclick="javascript:openlogin();">Login</a></li> <%-- 로그인 화면 생성 --%>
					</c:if>
					<c:if test="${user ne null}">
						<li><strong>${user.userName}</strong></li>
						<c:choose>
							<c:when test="${user.userType eq 'kakao'}">
								<li><a href="${root}/user/kakao/logout">로그아웃</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${root}/user/logout">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
	
						<c:if test="${user.userType eq '관리자'}">
							<li><a href="${root}/user/list">회원 관리</a></li>
						</c:if>
						<li><a href="${root}/user/select">개인정보 조회</a></li>
					</c:if>
				</ul>
			</nav>
			<!-- nav-menu -->
		</div>
		<!-- End Header Container -->
	</div>
</header>
<!-- End Header -->
<div class="text-center" id="drop-down-login1" style="padding:50px; transform: translate3d(1400px, 60px, 0px);display: none;">
	<!-- Main Form -->
	<div class="login-form-1">
		<form id="loginform" class="text-left" action="" method="post">
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<label for="userId" class="sr-only">Username</label>
						<input type="text" class="form-control" id="userId" name="userId" placeholder="username">
					</div>
					<div class="form-group">
						<label for="userPwd" class="sr-only">Password</label>
						<input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="password" onkeydown="javascript:if(event.keyCode == 13) {login();}">
					</div>
					<div class="form-group login-group-checkbox">
						<input type="checkbox" id="idsave" name="idsave" value="saveok"${idck}>
						<label for="lg_remember">remember</label>
					</div>
				</div>
				<button type="button" class="login-button" onclick="javascript:login();"><i class="fa fa-chevron-right"></i></button>
			</div>
			<div class="etc-login-form">
				<img src="${root}/img/kakao_login_medium_narrow.png" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=9c9ede5a1425643a41ffb678af09ee7d&redirect_uri=http://localhost//user/kakao/login&response_type=code'">
				<p>forgot your password? <a href="#">click here</a></p>
				<p>new user? <a href="#">create new account</a></p>
			</div>
		</form>
	</div>
	<!-- end:Main Form -->
</div>
</body>
<br><br><br><br><br>