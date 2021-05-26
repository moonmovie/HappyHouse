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
	<link rel="icon" type="image/png" sizes="32x32" href="${root}/favicon.png">
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
          <div class="col-lg-8" data-aos="fade-up" data-aos-delay="100">
            <div class="owl-carousel testimonials-carousel">
              <div class="testimonial-item">
                <img src="/img/apt/apt1.jpg" class="testimonial-img" alt="" />
                <h3>솔하임아파트</h3>
                <h4>실거래가 | 2억 3000만원</h4>
                <!-- <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i> Proin
                  iaculis purus consequat sem cure digni ssim donec porttitora
                  entum suscipit rhoncus. Accusantium quam, ultricies eget id,
                  aliquam eget nibh et. Maecen aliquam, risus at semper.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p> -->

                <!-- <h3>Saul Goodman</h3>
                <h4>Ceo &amp; Founder</h4> -->
              </div>

              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i> Export
                  tempor illum tamen malis malis eram quae irure esse labore
                  quem cillum quid cillum eram malis quorum velit fore eram
                  velit sunt aliqua noster fugiat irure amet legam anim culpa.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img
                  src="/img/testimonials/testimonials-2.jpg"
                  class="testimonial-img"
                  alt=""
                />
                <h3>Sara Wilsson</h3>
                <h4>Designer</h4>
              </div>

              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i> Enim
                  nisi quem export duis labore cillum quae magna enim sint
                  quorum nulla quem veniam duis minim tempor labore quem eram
                  duis noster aute amet eram fore quis sint minim.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img
                  src="/img/testimonials/testimonials-3.jpg"
                  class="testimonial-img"
                  alt=""
                />
                <h3>Jena Karlis</h3>
                <h4>Store Owner</h4>
              </div>

              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i> Fugiat
                  enim eram quae cillum dolore dolor amet nulla culpa multos
                  export minim fugiat minim velit minim dolor enim duis veniam
                  ipsum anim magna sunt elit fore quem dolore labore illum
                  veniam.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img
                  src="/img/testimonials/testimonials-4.jpg"
                  class="testimonial-img"
                  alt=""
                />
                <h3>Matt Brandon</h3>
                <h4>Freelancer</h4>
              </div>

              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i> Quis
                  quorum aliqua sint quem legam fore sunt eram irure aliqua
                  veniam tempor noster veniam enim culpa labore duis sunt culpa
                  nulla illum cillum fugiat legam esse veniam culpa fore nisi
                  cillum quid.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <img
                  src="/img/testimonials/testimonials-5.jpg"
                  class="testimonial-img"
                  alt=""
                />
                <h3>John Larson</h3>
                <h4>Entrepreneur</h4>
              </div>
            </div>
          </div>
        </div>
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
  <script></script>
</html>