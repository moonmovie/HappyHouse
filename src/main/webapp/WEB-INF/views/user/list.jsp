<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>SSAFY-글작성</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		
		//회원 목록
		$.ajax({
			url:'${root}/admin/member',  
			type:'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			success:function(members) {
				makeList(members);
			}
/* 			error:function(xhr,status,msg){
				console.log("상태값 : " + status + " Http에러메시지 : "+msg);
			},
			statusCode: {
				404: function() {
					alert("에러 페이지 입니다.");
					// location.href = "error/e404";
				}
			} */
		});
		
		$("#registerBtn").click(function() {
			let registerinfo = JSON.stringify({
				"userId" : $("#userId").val(), 
				"userName" : $("#userName").val(), 
				"userPwd" : $("#userPwd").val(), 
				"userEmail" : $("#userEmail").val(), 
				"userPhone" : $("#userPhone").val(), 
				"userAddress" : $("#userAddress").val(), 
				"userType" : $("#userType").val(), 
			   });
			$.ajax({
				url:'${root}/admin/member',  
				type:'POST',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				data: registerinfo,
				success:function(members) {
					$("#userId").val(''), 
					$("#userName").val(''), 
					$("#userPwd").val(''), 
					$("#userEmail").val(''), 
					$("#userPhone").val(''), 
					$("#userAddress").val(''), 
					$("#userRegModal").modal("hide");
					makeList(members);
				},
				error:function(xhr,status,msg){
					console.log("상태값 : " + status + " Http에러메시지 : "+msg);
				}
			});
		});
		
		$(document).on("dblclick", "tr.view", function() { // 동적  생성된것은 on
			let vid = $(this).attr("data-id");
			$.ajax({
				url:'${root}/admin/member/' + vid,  
				type:'GET',
				contentType:'application/json;charset=utf-8',
				success:function(member) {
					$("#vname").text(member.userName), 
					$("#vpwd").text(member.userPwd), 
					$("#vemail").text(member.userEmail), 
					$("#vphone").text(member.userPhone), 
					$("#vid").text(member.userId), 
					$("#vtype").text(member.userType), 
					$("#vaddress").text(member.userAddress), 
					$("#vjoindate").text(member.joindate),
					$("#userViewModal").modal();
				},
				error:function(xhr,status,msg){
					console.log("상태값 : " + status + " Http에러메시지 : "+msg);
				}
			});			
		});
		
		// 회워 정보 수정 보기.
		$(document).on("click", ".modiBtn", function() {
			let mid = $(this).parents("tr").attr("data-id");
			$("#view_" + mid).css("display", "none");
			$("#mview_" + mid).css("display", "");
		});
		
		// 회워 정보 수정 실행.
		$(document).on("click", ".modifyBtn", function() {
			let mid = $(this).parents("tr").attr("data-id");
			let modifyinfo = JSON.stringify({
						"userId" : mid, 
						"userName" : $("#userName" + mid).val(), 
						"userPwd" : $("#userPwd" + mid).val(), 
						"userEmail" : $("#userEmail" + mid).val(), 
						"userPhone" : $("#userPhone" + mid).val(), 
						"userAddress" : $("#userAddress" + mid).val(), 
						"userType" : $("#userType" + mid).val(), 
					   });
			$.ajax({
				url:'${root}/admin/member',  
				type:'PUT',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				data: modifyinfo,
				success:function(members) {
					makeList(members);
				},
				error:function(xhr,status,msg){
					console.log("상태값 : " + status + " Http에러메시지 : "+msg);
				}
			});
		});
		
		// 회워 정보 수정 취소.
		$(document).on("click", ".cancelBtn", function() {
			let mid = $(this).parents("tr").attr("data-id");
			$("#view_" + mid).css("display", "");
			$("#mview_" + mid).css("display", "none");
		});
		
		// 회워 탈퇴.
		$(document).on("click", ".delBtn", function() {
			if(confirm("정말 삭제?")) {
				let delid = $(this).parents("tr").attr("data-id");
				$.ajax({
					url:'${root}/admin/member/' + delid,  
					type:'DELETE',
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					success:function(members) {
						makeList(members);
					},
					error:function(xhr,status,msg){
						console.log("상태값 : " + status + " Http에러메시지 : "+msg);
					}
				});
			}
		});
	});
	
	function makeList(members) {
		$("#memberlist").empty();
		$(members).each(function(index, member) {		
 			let str = "<tr id=\"view_" + member.userId + "\" class=\"view\" data-id=\"" + member.userId + "\">"
			+ "	<td>" + member.userId + "</td>"
			+ "	<td>" + member.userName + "</td>"
			+ "	<td>" + member.userPwd + "</td>"
			+ "	<td>" + member.userEmail + "</td>"
			+ "	<td>" + member.userPhone + "</td>"
			+ "	<td>" + member.userAddress + "</td>"
			+ "	<td>" + member.userType + "</td>"
			+ "	<td>" + member.joindate + "</td>"
			+ "	<td><button type=\"button\" class=\"modiBtn btn btn-outline-primary btn-sm\">수정</button> "
			+ "		<button type=\"button\" class=\"delBtn btn btn-outline-danger btn-sm\">삭제</button></td>"
			+ "</tr>"
			+ "<tr id=\"mview_" + member.userId + "\" data-id=\"" + member.userId + "\" style=\"display: none;\">"
			+ "	<td>" + member.userId + "</td>"
			+ "	<td><input type=\"text\" name=\"userName\" id=\"userName" + member.userId + "\" value=\"" + member.userName + "\"></td>"
			+ "	<td><input type=\"text\" name=\"userPwd\" id=\"userPwd" + member.userId + "\" value=\"" + member.userPwd + "\"></td>"
			+ "	<td><input type=\"text\" name=\"userEmail\" id=\"userEmail" + member.userId + "\" value=\"" + member.userEmail + "\"></td>"
 			+ "	<td><input type=\"text\" name=\"userPhone\" id=\"userPhone" + member.userId + "\" value=\"" + member.userPhone + "\"></td>" 
 			+ "	<td><input type=\"text\" name=\"userAddress\" id=\"userAddress" + member.userId + "\" value=\"" + member.userAddress + "\"></td>" 
 			+ "	<td><input type=\"text\" name=\"userType\" id=\"userType" + member.userId + "\" value=\"" + member.userType + "\"></td>" 
 			+ "	<td>" + member.joindate + "</td>" 
			+ "	<td><button type=\"button\" class=\"modifyBtn btn btn-primary btn-sm\">수정</button> "
			+ "		<button type=\"button\" class=\"cancelBtn btn btn-danger btn-sm\">취소</button></td>"
			+ "</tr>";
			
/*  			let str = `
			<tr id="view_${'${product.id}'}" class="view" data-id="${'${product.id}'}">
				<td>${'${product.id}'}</td>
				<td>${'${product.name}'}</td>
				<td>${'${product.price}'}</td>
				<td>${'${product.description}'}</td>
				<td>
					<button type="button" class="modiBtn btn btn-outline-primary btn-sm">수정</button>
					<button type="button" class="delBtn btn btn-outline-danger btn-sm">삭제</button>
				</td>
			</tr>
			<tr id="mview_${'${product.id}'}" data-id="${'${product.id}'}" style="display: none;">
				<td>${'${product.id}'}</td>
				<td><input type="text" name="name" id="name${'${product.id}'}" value="${'${product.name}'}"></td>
				<td><input type="text" name="price" id="price${'${product.id}'}" value="${'${product.price}'}"></td>
				<td><input type="text" name="description" id="description${'${product.id}'}" value="${'${product.description}'}"></td>

				<td>
					<button type="button" class="modifyBtn btn btn-primary btn-sm">수정</button>
					<button type="button" class="cancelBtn btn btn-danger btn-sm">취소</button>
				</td>
			</tr>
			`; */

			$("#memberlist").append(str);
		});//each
	}
	</script>	  
</head>
<body>
<%@ include file="../include/header.jsp"%>
<div class="container" align="center">
	<h2>회원 목록</h2>
	<div align="right"><button type="button" class="modiBtn btn btn-outline-info" data-toggle="modal" data-target="#userRegModal">등록</button></div>
  	<table class="table table-hover">
  		<colgroup>
            <col width="130">
            <col width="100">
            <col width="130">
            <col width="140">
            <col width="140">
            <col width="150">
            <col width="100">
            <col width="150">
            <col width="150">
        </colgroup>
    	<thead>
	      	<tr>
	        	<th class="text-center">아이디</th>
	        	<th class="text-center">이름</th>
	        	<th class="text-center">비밀번호</th>
	        	<th class="text-center">이메일</th>
	        	<th class="text-center">전화번호</th>
	        	<th class="text-center">주소</th>
	        	<th class="text-center">타입</th>
	        	<th class="text-center">가입일</th>
	        	<th class="text-center">수정 / 삭제</th>
	      	</tr>
    	</thead>
    	<tbody id="memberlist"></tbody>
	</table>
</div>

<!-- 회원 등록 모달 -->
<div class="modal" id="userRegModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원등록</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form id="memberform" method="post" action="">
			<div class="form-group" align="left">
				<label for="id">아이디</label>
				<input type="text" class="form-control" id="userId" name="userId" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="name">이름</label>
				<input type="text" class="form-control" id="userName" name="userName" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="name">비밀번호</label>
				<input type="text" class="form-control" id="userPwd" name="userPwd" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="name">이메일</label>
				<input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="name">전화번호</label>
				<input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">주소</label>
				<input type="text" class="form-control" id="userAddress" name="userAddress" placeholder="">
			</div>
			<div class="form-group" align="left">
				<label for="">유저 타입</label><br>
				<input type="text" class="form-control" id="userType" name="userType" placeholder="">
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-primary" id="registerBtn">회원가입</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</div>
		</form>
      </div>
    </div>
  </div>
</div>

<!-- 회원 정보 모달 -->
<div class="modal" id="userViewModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원정보</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       	<table class="table table-bordered">
            <colgroup>
                <col width="120">
                <col width="*">
                <col width="120">
                <col width="*">
                <col width="120">
                <col width="*">
                <col width="120">
                <col width="*">
            </colgroup>
            <tbody>
            <tr>
                <th class="text-center">ID</th>
                <td class="text-left" id="vid"></td>
                <th class="text-center">회원명</th>
                <td class="text-left" id="vname"></td>
            </tr>
            <tr>
				<th class="text-center">가입일</th>
                <td class="text-left" colspan="3" id="vjoindate"></td>
            </tr>
            <tr>
                <th class="text-center">비밀번호</th>
                <td class="text-left" id="vpwd"></td>
                <th class="text-center">이메일</th>
                <td class="text-left" id="vemail"></td>
            </tr>
            <tr>
            	<th class="text-center">전화번호</th>
                <td class="text-left" id="vphone"></td>
                <th class="text-center">타입</th>
                <td class="text-left" id="vtype"></td>
            </tr>
            <tr>
                <th class="text-center">주소</th>
                <td class="text-left" colspan="3" id="vaddress"></td>
            </tr>
            </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</body>
</html>