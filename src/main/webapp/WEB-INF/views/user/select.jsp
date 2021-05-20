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
  <div class="col-lg-8" align="center">
  <h2>회원 정보</h2>

  <table class="table table-active">
    <tbody>
      <tr class="table-info">
        <td>이름 : ${user.userName}</td>
        <td>가입일 : ${user.joindate}</td>
      </tr>
      <tr>
        <td>id : ${user.userId}</td>
        <td>이메일 : ${user.userEmail}</td>
      </tr>
      <tr>
        <td>전화번호 : ${user.userPhone}</td>
        <td>유저 타입 : ${user.userType}</td>
      </tr>
      <tr>
        <td>주소 : ${user.userAddress}</td>
      </tr>
      <tr>
        <td colspan="2">
		<a href="${root }/user/modify">수정</a>
		<a href="${root }/user/delete?userId=${user.userId}">회원탈퇴</a>
		</td>
      </tr>
    </tbody>
  </table>
  </div>
</div>
</body>
</html>
