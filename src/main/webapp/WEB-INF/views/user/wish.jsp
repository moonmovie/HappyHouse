<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>찜 목록</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        //찜 목록
        $.ajax({
          url: "${root}/wish/list",
          type: "GET",
          contentType: "application/json;charset=utf-8",
          dataType: "json",
          success: function (wishs) {
            makeList(wishs);
          },
          error: function (xhr, status, msg) {
            console.log("상태값 : " + status + " Http에러메시지 : " + msg);
          }
        });

        // $("#registerBtn").click(function () {
        //   let registerinfo = JSON.stringify({
        //     userId: $("#userId").val(),
        //     userName: $("#userName").val(),
        //     userPwd: $("#userPwd").val(),
        //     userEmail: $("#userEmail").val(),
        //     userPhone: $("#userPhone").val(),
        //     userAddress: $("#userAddress").val(),
        //     userType: $("#userType").val()
        //   });
        //   $.ajax({
        //     url: "${root}/admin/member",
        //     type: "POST",
        //     contentType: "application/json;charset=utf-8",
        //     dataType: "json",
        //     data: registerinfo,
        //     success: function (members) {
        //       $("#userId").val(""),
        //         $("#userName").val(""),
        //         $("#userPwd").val(""),
        //         $("#userEmail").val(""),
        //         $("#userPhone").val(""),
        //         $("#userAddress").val(""),
        //         $("#userRegModal").modal("hide");
        //       makeList(members);
        //     },
        //     error: function (xhr, status, msg) {
        //       console.log("상태값 : " + status + " Http에러메시지 : " + msg);
        //     }
        //   });
        // });

        // $(document).on("dblclick", "tr.view", function () {
        //   // 동적  생성된것은 on
        //   let vid = $(this).attr("data-id");
        //   $.ajax({
        //     url: "${root}/admin/member/" + vid,
        //     type: "GET",
        //     contentType: "application/json;charset=utf-8",
        //     success: function (member) {
        //       $("#vname").text(member.userName),
        //         $("#vpwd").text(member.userPwd),
        //         $("#vemail").text(member.userEmail),
        //         $("#vphone").text(member.userPhone),
        //         $("#vid").text(member.userId),
        //         $("#vtype").text(member.userType),
        //         $("#vaddress").text(member.userAddress),
        //         $("#vjoindate").text(member.joindate),
        //         $("#userViewModal").modal();
        //     },
        //     error: function (xhr, status, msg) {
        //       console.log("상태값 : " + status + " Http에러메시지 : " + msg);
        //     }
        //   });
        // });

        // 회워 탈퇴.
        $(document).on("click", ".delBtn", function () {
          if (confirm("정말 삭제?")) {
            let aptName = $(this).parents("tr").attr("data-id");
            console.log(aptName);
            $.ajax({
              url: "${root}/wish/delete/" + aptName,
              type: "DELETE",
              contentType: "application/json;charset=utf-8",
              dataType: "json",
              success: function (wishs) {
                makeList(wishs);
              },
              error: function (xhr, status, msg) {
                console.log("상태값 : " + status + " Http에러메시지 : " + msg);
              }
            });
          }
        });
      });

      function makeList(wishs) {
        $("#wishlist").empty();
        $(wishs).each(function (index, wish) {
          let str = `
            <tr id="view_${"${wish.aptName}"}" class="view" data-id="${"${wish.aptName}"}" align="center">
              <td>${"${wish.dong}"}</td>
              <td>${"${wish.aptName}"}</td>
              <td>${"${wish.buildYear}"}</td>
              <td>
                <button type="button" class="comBtn btn btn-outline-primary btn-sm">비교</button>
                <button type="button" class="delBtn btn btn-outline-danger btn-sm">삭제</button>
              </td>
            </tr>
            `;
          $("#wishlist").append(str);
        }); //each
      }
    </script>
  </head>
  <body>
    <%@ include file="../include/header.jsp"%>
    <div class="container" align="center">
      <h2>찜 목록</h2>
      <table class="table table-hover">
        <colgroup>
          <col width="90" />
          <col width="170" />
          <col width="100" />
          <col width="30" />
          <col width="30" />
        </colgroup>
        <thead>
          <tr>
            <th class="text-center">동</th>
            <th class="text-center">아파트명</th>
            <th class="text-center">건축년도</th>
            <th class="text-center">비교</th>
            <th class="text-center">삭제</th>
          </tr>
        </thead>
        <tbody id="wishlist"></tbody>
      </table>
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
                <col width="120" />
                <col width="*" />
                <col width="120" />
                <col width="*" />
                <col width="120" />
                <col width="*" />
                <col width="120" />
                <col width="*" />
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
