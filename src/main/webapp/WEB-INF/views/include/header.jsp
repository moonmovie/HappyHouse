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

<!-- Template Main CSS File -->
<link href="${root}/css/style.css" rel="stylesheet">

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
<header id="header" class="fixed-top d-flex align-items-center">
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
					<li><a href="/notice.html">Notice</a></li>
					<li><a href="#services">Today's News</a></li>
					<li><a href="#contact">Contact</a></li>
					<c:if test="${user eq null}"> <%-- 로그인이 안 되어 있다면 --%>
						<li class="get-started"><a href="${root}/user/regist">SignUp</a> <%-- 회원가입 jsp 이동 --%>
						<li class="get-started"><a id="login" onclick="javascript:openlogin();">Login</a></li> <%-- 로그인 화면 생성 --%>
					</c:if>
					<c:if test="${user ne null}">
						<div>
							<li><strong>${user.userName}</strong>님 환영합니다.</li>
						</div>
						<li><a href="${root}/user/logout">로그아웃</a></li>
						<c:if test="${user.userType eq '관리자'}">
							<li><a href="${root}/user/list">회원 관리</a></li>
						</c:if>
						<li><a href="${root}/user/select">개인정보 조회</a></li>
					</c:if>

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
				</ul>
			</nav>
			<!-- nav-menu -->
		</div>
		<!-- End Header Container -->
	</div>
	<!-- End Header Container -->
	</div>
</header>
<!-- End Header -->
</body>
<br><br><br><br><br>