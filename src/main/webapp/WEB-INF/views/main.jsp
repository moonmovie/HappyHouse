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

    <!-- Vendor CSS Files -->
    <!-- Favicons -->
    <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="${root}/favicon.png"
    />
    <!-- Vendor CSS Files -->
    <link
      href="${root}/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link href="${root}/vendor/icofont/icofont.min.css" rel="stylesheet" />
    <link
      href="${root}/vendor/boxicons/css/boxicons.min.css"
      rel="stylesheet"
    />
    <link href="${root}/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="${root}/vendor/venobox/venobox.css" rel="stylesheet" />
    <link
      href="${root}/vendor/owl.carousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />
    <link href="${root}/vendor/aos/aos.css" rel="stylesheet" />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
      rel="stylesheet"
    />
    <script src="/js/mainpage.js"></script>
  </head>
	
  <body>
    <%@ include file="./include/header.jsp"%>
    <section id="hero" class="d-flex align-items-center">
      <div
        class="container text-center position-relative"
        data-aos="fade-in"
        data-aos-delay="200"
        id="goindex"
        onclick="location.href='/index'"
      >
        <h1>Happy House</h1>
        <h2>실매물 거래 확인하러 가기</h2>
      </div>
    </section>
    <div class="container">
      <img
        src="${root}/img/mainbn.jpg"
        width="80%"
        height="auto"
        style="margin-left: 100px"
      />
    </div>

    <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials section-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="section-title" data-aos="fade-right">
              <h2>실거래 정보 HOT 매물</h2>
              <p>현재 사용자들의 실거래 조회가 높은 매물들입니다.</p>
            </div>
          </div>
          <div
            class="col-lg-8"
            data-aos="fade-up"
            data-aos-delay="100"
            id="hlike"
          >
            <div class="owl-carousel testimonials-carousel">
              <c:forEach items="${infolist}" var="info">
                <div class="testimonial-item">
                  <img src="/img${info.img}" class="testimonial-img" onclick="link(${info.lng},${info.lat},'${info.aptName}','${info.dong}')" alt="" />
                  <h3>${info.aptName}</h3>
                  <p>완공년도 | ${info.buildYear}</p>
                  <p>서울시  ${info.jibun}</p>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </section>
  </body>

  <script src="/vendor/counterup/counterup.min.js"></script>
  <script src="/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/vendor/venobox/venobox.min.js"></script>

  <script src="/vendor/aos/aos.js"></script>
  <!-- <script type="text/javascript" src="${root}/js/mainpage.js"></script> -->
  <!-- Template Main JS File -->
  <!-- <script type="text/javascript" src="/js/mainpage.js"></script> -->
  <script src="/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="/js/main.js"></script>
  <script></script>
</html>
