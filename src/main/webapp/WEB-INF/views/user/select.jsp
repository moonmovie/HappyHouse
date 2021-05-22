<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>    

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원 정보 조회</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	</script>
</head>
<body>
<%@ include file="../include/header.jsp"%>

<div class="container" align="center">
	<h2>회원 정보</h2>
	<div class="col-lg-3"></div>
	<div class="col-lg-7" align="center">
		<div class="form-group" align="left">
			<label for="name">이름</label>
			<input type="text" class="form-control" value="${user.userName }" readonly>
		</div>
		<div class="form-group" align="left">
			<label for="">아이디</label>
			<input type="text" class="form-control" value="${user.userId}" readonly>
		</div>
		<div class="form-group" align="left">
			<label for="">전화번호</label>
			<input type="text" class="form-control" value="${user.userPhone}" readonly>
		</div>
		<div class="form-group" align="left">
			<label for="">유저타입</label>
			<input type="text" class="form-control" value="${user.userType}" readonly>
		</div>
		<div class="form-group" align="left">
			<label for="">주소</label>
			<input type="text" class="form-control" value="${user.userAddress}" readonly>
		</div>
		
		<div class="form-group" align="center">
			<button type="button" class="btn btn-primary" id="registerBtn" onclick="location.href='${root }/user/modify'">수정</button>
			<button type="button" class="btn btn-warning" id="deleteBtn" onclick="location.href='${root }/user/delete?userId=${user.userId}'">탈퇴</button>
		</div>
	</div>
</div>
</body>
</html>
