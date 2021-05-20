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
		<title>SSAFY-글목록</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		function movewrite() {
			location.href="${root}/main?act=mvwrite";
		}
		function searchArticle() {
			if(document.getElementById("word").value == "") {
				alert("모든 목록 조회!!");
			}
			document.getElementById("searchform").action = "";
			document.getElementById("searchform").submit();
		}
		</script>
	</head>
	<body>	
	<div class="container" align="center">
		<div class="col-lg-8" align="right">
		<strong>${userinfo.userName }</strong>님 환영합니다.
		<a href="${root }/main?act=logout">로그아웃</a>
		</div>
	  <div class="col-lg-8" align="center">
	  <h2>글목록</h2>
	  <p>좋은글 많이 올려 주세요!!!!!</p>  
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right"><button type="button" class="btn btn-link" onclick="javascript:movewrite();">글쓰기</button></td>
	  	</tr>
	  </table>
	  <form id="searchform" method="get" class="form-inline" action="">
	  <input type="hidden" name="act" id="act" value="list">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="key" id="key">
			    <option value="userid" selected="selected">아이디</option>
			    <option value="articleno">글번호</option>
			    <option value="subject">제목</option>
			  </select>
			  <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="word">
			  <button type="button" class="btn btn-primary" onclick="javascript:searchArticle();">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
	  <c:if test="${list.size() != 0 }">
	  <c:forEach var="a" items="${list }">
	  <!-- 작성한 글이 있을경우 목록출력 -->
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info">
	        <td>작성자 : ${a.userId}</td>
	        <td align="right">작성일 : ${a.regtime}</td>
	      </tr>
	      <tr>
	        <td colspan="2" class="table-danger"><strong>${a.articleNo}. ${a.subject}</strong></td>
	      </tr>
	      <tr>
	        <td colspan="2">글내용 ${a.content}</td>
	      </tr>
	      <!-- 로그인 유저와 작성자가 일치 할 경우 -->
	      <c:if test="${userinfo.userId == a.userId }">
	      <tr>
	        <td colspan="2">
			<a href="${root }/main?act=mvarModify&articleNo=${a.articleNo}">수정</a>
			<a href="${root }/main?act=arDelete&articleNo=${a.articleNo}">삭제</a>
			</td>
	      </tr>
	      </c:if>
	    </tbody>
	  </table>
	  </c:forEach>
	  </c:if>
	  <c:if test="${list.size() == 0 }">
	  <!-- 작성한 글이 없을경우 출력 -->
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info" align="center">
	        <td>작성된 글이 없습니다.</td>
	      </tr>
	    </tbody>
	  </table>
	  </c:if>
	  </div>
	</div>
	</body>
</html>
</c:if>
