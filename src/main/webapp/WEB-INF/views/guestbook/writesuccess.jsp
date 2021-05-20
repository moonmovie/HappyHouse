<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>    
<!-- 로그인 안했을 경우 index page로 이동 -->
<c:if test="${userinfo eq null}">
	<script>
	alert("로그인이 필요한 페이지입니다.\n로그인 페이지로 이동합니다.");
	location.href = "${root}";
	</script>
</c:if>
<!-- 로그인 했을 경우 아래 출력 -->
<c:if test="${userinfo ne null}">
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>SSAFY-글작성성공</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" align="center">
	<div class="col-lg-6">
	  <div class="jumbotron">
	    <h1>글작성 성공!!!</h1>      
	  </div>  
	  <p><a href="">글목록</a></p>
	</div>
</div>
</body>
</html>
</c:if>