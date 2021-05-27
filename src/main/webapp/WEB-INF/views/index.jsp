<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>HappyHouse | SSAFY</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

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

    <!-- =======================================================
    * Template Name: Bethany - v2.2.1
    * Template URL: https://bootstrapmade.com/bethany-free-onepage-bootstrap-theme/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85b89f0f53a0acf2a6b95c053dc85e9b&libraries=services"
    ></script>
    <script type="text/javascript" src="${root}/js/category.js"></script>
    <script type="text/javascript" src="${root}/js/dealResult.js"></script>
    <script type="text/javascript" src="${root}/js/pagination.js"></script>
    <script type="text/javascript" src="${root}/js/stationarea.js"></script>
    <script type="text/javascript" src="${root}/js/detail.js"></script>
    <script type="text/javascript" src="${root}/js/sido.js"></script>

    <script
      type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"
    ></script>
    <script
      type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
    ></script>
    <style>
      .map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
      .map_wrap {position:relative;width:100%;height:350px;}
      #category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
      #category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
      #category li.on {background: #eee;}
      #category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
      #category li:last-child{margin-right:0;border-right:0;}
      #category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
      #category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
      #category li .bank {background-position: -10px 0;}
      #category li .mart {background-position: -10px -36px;}
      #category li .pharmacy {background-position: -10px -72px;}
      #category li .oil {background-position: -10px -108px;}
      #category li .cafe {background-position: -10px -144px;}
      #category li .store {background-position: -10px -180px;}
      #category li.on .category_bg {background-position-x:-46px;}
      .placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
      .placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
      .placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
      .placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
      .placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
      .placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
      .placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
      .placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
      .placeinfo .tel {color:#0f7833;}
      .placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
    </style>
  </head>

  <body>
    <%@ include file="./include/header.jsp"%>

    <!-- End Hero -->

    <main id="main">
      <div class="d-flex justify-content-center bg-light mb-3">
        <ul class="list-inline mt-4">
          <li class="list-inline-item">
            <div class="searchProvince">
              <form>
                <select
                  class="form-control"
                  name="sido"
                  id="sido"
                  style="width: auto"
                >
                  <option value="none">=== 선택 ===</option>
                </select>
              </form>
            </div>
          </li>

          <li class="list-inline-item">
            <div class="searchCity">
              <form>
                <select
                  class="form-control"
                  name="gugun"
                  id="gugun"
                  style="width: auto"
                >
                  <option value="none">시를 선택해주세요</option>
                </select>
              </form>
            </div>
          </li>

          <li class="list-inline-item">
            <div class="searchDong">
              <form>
                <select
                  class="form-control"
                  name="dong"
                  id="dong"
                  style="width: auto"
                >
                  <option value="none">구군을 선택해주세요</option>
                </select>
              </form>
            </div>
          </li>
          <li class="list-inline-item">
            <button type="button" id="btn_search" class="btn btn-warning">
              Search
            </button>
          </li>
        </ul>
      </div>
      <!-- <section id="about1" class="about">
        <div class="container">
          <div id="indexmap" style="height: 400px"></div>
        </div>
      </section> -->
      <section id="about" class="about">
        <div>
          <div class="row content">
            <!-- 지도 왼쪽 부분 시작 -->
            <div
              class="aptResult col-lg-4 ml-5 mr-5"
              data-aos="fade-right"
              data-aos-delay="100"
              style="padding-right: 15px"
            >
              <h3>거래정보</h3>
              <ul class="list-group list-group-flush" id="ul_list"></ul>
              <ul class="pagination" id="paging"></ul>
              <!-- <div class="justify-content-center">
						<ul class="pagination" id="paging"></ul>
					</div> -->
            </div>
            <!-- 지도 왼쪽 부분 끝 -->

            <!-- ======= Map Section ======= -->
            <div
              class="col-lg-7 pt-4 pt-lg-0"
              data-aos="fade-up"
              data-aos-delay="100"
            >
              <div class="map_wrap">
                <div
                  id="mapsec"
                  style="
                    width: auto;
                    height: 700px;
                    position: relative;
                    overflow: hidden;
                  "
                ></div>
                 <div class="mt-4 mb-4 text-center" id="chartarea"></div>
                 <div class="container row text-center" id="chart">
                 
          <div class="col">
            <canvas id="myChart" width="auto" height="300px"></canvas>
          </div>
          <div class="col" style="padding-top: 50px">
            <canvas id="stationChart" width="500px" height="auto"></canvas>
          </div>
        </div>
                <ul id="category">
                  <li id="BK9" data-order="0">
                    <span class="category_bg bank"></span>
                    은행
                  </li>
                  <li id="MT1" data-order="1">
                    <span class="category_bg mart"></span>
                    마트
                  </li>
                  <li id="PM9" data-order="2">
                    <span class="category_bg pharmacy"></span>
                    약국
                  </li>
                  <li id="OL7" data-order="3">
                    <span class="category_bg oil"></span>
                    주유소
                  </li>
                  <li id="CE7" data-order="4">
                    <span class="category_bg cafe"></span>
                    카페
                  </li>
                  <li id="CS2" data-order="5">
                    <span class="category_bg store"></span>
                    편의점
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </section>
      
      <section id="list" class="about container text-center">
        <!-- <div class="mb-4" id="chartarea"></div> -->
       <%--  <div class="container row text-center" id="chart">
          <div class="col">
            <canvas id="myChart" width="auto" height="300px"></canvas>
          </div>
          <div class="col" style="padding-top: 50px">
            <canvas id="stationChart" width="500px" height="auto"></canvas>
          </div>
        </div> --%>
        <div class="container" style="display: none">
          <table class="table" id="deallist"></table>
        </div>
      </section>
      <!-- ======= Testimonials Section ======= -->
     

    <!-- ======= Footer ======= -->
    <footer id="footer">
      <div class="container d-md-flex py-4">
        <div class="mr-md-auto text-center text-md-left">
          <div class="copyright">
            &copy; Copyright <strong><span>SSAFY5GUMI</span></strong
            >. All Rights Reserved
          </div>
          <div class="credits">
            <!-- All the links in the footer should remain intact. -->
            <!-- You can delete the links only if you purchased the pro version. -->
            <!-- Licensing information: https://bootstrapmade.com/license/ -->
            <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/bethany-free-onepage-bootstrap-theme/ -->
            Created by 박범진 문영화
          </div>
        </div>
        <div class="social-links text-center text-md-right pt-3 pt-md-0">
          <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
          <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
          <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
          <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
          <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
        </div>
      </div>
    </footer>
    <!-- End Footer -->

    <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

    <!-- Vendor JS Files -->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/vendor/jquery.easing/jquery.easing.min.js"></script>
    <script src="/vendor/php-email-form/validate.js"></script>
    <script src="/vendor/waypoints/jquery.waypoints.min.js"></script>
    <script src="/vendor/counterup/counterup.min.js"></script>
    <script src="/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="/vendor/venobox/venobox.min.js"></script>
    <script src="/vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="/vendor/aos/aos.js"></script>

    <!-- Template Main JS File -->
    <script src="/js/main.js"></script>
  </body>
</html>
