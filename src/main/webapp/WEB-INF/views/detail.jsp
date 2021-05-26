<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>HAPPYHOUSE</title>

    <script src="/vendor/jquery/jquery.min.js"></script>
<link rel="icon" type="image/png" sizes="32x32" href="${root}/favicon.png">
    <!-- Vendor CSS Files -->
    <link
      href="${root}/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
      rel="stylesheet"
    />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link href="${root}/css/detail.css" rel="stylesheet" />
    <link href="${root}/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85b89f0f53a0acf2a6b95c053dc85e9b&libraries=services"
    ></script>
    <script type="text/javascript" src="${root}/js/detail.js"></script>

    <script type="text/javascript" src="${root}/js/searchHtoC.js"></script>
  </head>

  <body>
    <%@ include file="./include/header.jsp"%>
    <section>
      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <img src="${root}/img/apt.jpg" style="width: 100%; height: auto" />
          </div>
          <div class="col-sm-8">
            <div class="row">
              <div class="col dtitle">
                대상매물
                <div class="dcontent"></div>
              </div>
              <div class="col dtitle">
                매물평균가격
                <div class="dcontent"></div>
              </div>
              <div class="col dtitle">
                찜하기
                <div class="dcontent" id="wish">
                  <i class="ri-heart-line"></i><i class="ri-heart-fill"></i>
                </div>
              </div>
            </div>

            <div class="dtitle">
              주소지
              <div class="dcontent" id="addressdetail"></div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <div class="container content-center">
      <div class="text-center">
        <h3>매매 정보</h3>
      </div>
      <table
        class="table"
        id="deallist"
        style="width: 800px; margin-left: auto; margin-right: auto"
      ></table>
    </div>

    <section>
      <div class="container">
        <div class="dcontent">
          <i class="ri-home-4-line" style="font-size: 40px"></i>
          <i class="ri-arrow-left-right-fill" style="font-size: 40px"></i>
          <i class="ri-building-line" style="font-size: 40px"></i>
          <div>얼마나 걸릴까요? 출근 시간을 확인해보세요</div>
        </div>
        <div class="input-group col mt-4">
          <input
            type="text"
            class="form-control"
            id="address"
            placeholder="출근지 주소를 입력"
          />
          <span class="input-group-btn">
            <button class="btn btn-default" id="loadsearch" type="button">
              <i class="ri-search-line"></i>
            </button>
          </span>
        </div>
        <div id="archeck" style="display: none">주소지를 재 확인해주세요.</div>
        <div id="map" style="width: 100%; height: 500px"></div>
        <div class="dcontent">상세정보</div>
        <div class="searchinfo"></div>
        <div class="searchinfo"></div>
        <div class="searchinfo"></div>
      </div>
    </section>
  </body>

  <script src="/vendor/counterup/counterup.min.js"></script>
  <script src="/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/vendor/venobox/venobox.min.js"></script>
  <script src="/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="/js/main.js"></script>
</html>
