<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>HappyHouse | SSAFY</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${root}/img/favicon.png" rel="icon">
<link href="${root}/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/vendor/venobox/venobox.css" rel="stylesheet">
<link href="/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="/vendor/aos/aos.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- =======================================================
    * Template Name: Bethany - v2.2.1
    * Template URL: https://bootstrapmade.com/bethany-free-onepage-bootstrap-theme/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85b89f0f53a0acf2a6b95c053dc85e9b&libraries=services"></script>
<script type="text/javascript" src="/js/dealResult.js"></script>
<script type="text/javascript" src="/js/sido.js"></script>

</head>

<body>
	
	<%@ include file="./include/header.jsp"%>
	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">
		<div class="container text-center position-relative"
			data-aos="fade-in" data-aos-delay="200">
			<h1>Happy House</h1>
			<h2>with SSAFY</h2>
		</div>
	</section>
	<!-- End Hero -->

	<main id="main">

	<div class="d-flex justify-content-center bg-light mb-3">
		<ul class="list-inline mt-4">
			<li class="list-inline-item">
				<div class="searchProvince">
				<div>sdfsdf</div>
					<form>
						<select class="form-control" name="sido" id="sido"
							style="width: auto;">
							<option value="none">=== 선택 ===</option>

						</select>
					</form>
				</div>
			</li>

			<li class="list-inline-item">
				<div class="searchCity">
					<form>
						<select class="form-control" name="gugun" id="gugun"
							style="width: auto;">
							<option value="none">시를 선택해주세요</option>

						</select>
					</form>
				</div>
			</li>

			<li class="list-inline-item">
				<div class="searchDong">
					<form>
						<select class="form-control" name="dong" id="dong"
							style="width: auto;">
							<option value="none">구군을 선택해주세요</option>

						</select>
					</form>
				</div>
			</li>
			<li class="list-inline-item">
				<button type="button" id="btn_search" class="btn btn-warning">Search</button>
				<c:if test="${userinfo ne null}">
					<button type="button" id="wish_btn" class="btn btn-warning">관심지역등록</button>
				</c:if>
			</li>
		</ul>
	</div>
	<section id="about1" class="about">
		<div class="container">
			<div id="indexmap" style="height: 400px"></div>
		</div>
	</section>
	<section id="about" class="about" style="display: none;">
		<div class="container">
		
			<div class="row content">
			
				<!-- 지도 왼쪽 부분 시작 -->
				<div class="aptResult col-lg-5" data-aos="fade-right"
					data-aos-delay="100" style="padding-right: 15px;">
					<h3>거래정보</h3>
					<ul class="list-group list-group-flush" id="ul_list">
						
					</ul>
				</div>
				<!-- 지도 왼쪽 부분 끝 -->
				
				<!-- ======= Map Section ======= -->
				<div class="col-lg-7 pt-4 pt-lg-0" data-aos="fade-up"
					data-aos-delay="100">
					<div id="mapsec" style="width: 500px; height: 400px;"></div>
				</div>
			</div>
		</div>
	</section>
	<section id="list" class="about">
		<div class="container">
			<table class="table" id="deallist">
				
			  </table>
		</div>
	</section>
	<!-- ======= Testimonials Section ======= -->
	<section id="testimonials" class="testimonials section-bg">
		<div class="container">

			<div class="row">
				<div class="col-lg-4">
					<div class="section-title" data-aos="fade-right">
						<h2>Today's News</h2>
						<p>Magnam dolores commodi suscipit uisquam quos quisquam
							cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat
							sit in iste officiis commodi quidem hic quas.</p>
					</div>
				</div>
				<div class="col-lg-8" data-aos="fade-up" data-aos-delay="100">
					<div class="owl-carousel testimonials-carousel">

						<div class="testimonial-item">
							<p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Proin
								iaculis purus consequat sem cure digni ssim donec porttitora
								entum suscipit rhoncus. Accusantium quam, ultricies eget id,
								aliquam eget nibh et. Maecen aliquam, risus at semper. <i
									class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>
							<img src="assets/img/testimonials/testimonials-1.jpg"
								class="testimonial-img" alt="">
							<h3>Saul Goodman</h3>
							<h4>Ceo &amp; Founder</h4>
						</div>

						<div class="testimonial-item">
							<p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Export
								tempor illum tamen malis malis eram quae irure esse labore quem
								cillum quid cillum eram malis quorum velit fore eram velit sunt
								aliqua noster fugiat irure amet legam anim culpa. <i
									class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>
							<img src="assets/img/testimonials/testimonials-2.jpg"
								class="testimonial-img" alt="">
							<h3>Sara Wilsson</h3>
							<h4>Designer</h4>
						</div>

						<div class="testimonial-item">
							<p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Enim nisi
								quem export duis labore cillum quae magna enim sint quorum nulla
								quem veniam duis minim tempor labore quem eram duis noster aute
								amet eram fore quis sint minim. <i
									class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>
							<img src="assets/img/testimonials/testimonials-3.jpg"
								class="testimonial-img" alt="">
							<h3>Jena Karlis</h3>
							<h4>Store Owner</h4>
						</div>

						<div class="testimonial-item">
							<p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Fugiat
								enim eram quae cillum dolore dolor amet nulla culpa multos
								export minim fugiat minim velit minim dolor enim duis veniam
								ipsum anim magna sunt elit fore quem dolore labore illum veniam.
								<i class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>
							<img src="assets/img/testimonials/testimonials-4.jpg"
								class="testimonial-img" alt="">
							<h3>Matt Brandon</h3>
							<h4>Freelancer</h4>
						</div>

						<div class="testimonial-item">
							<p>
								<i class="bx bxs-quote-alt-left quote-icon-left"></i> Quis
								quorum aliqua sint quem legam fore sunt eram irure aliqua veniam
								tempor noster veniam enim culpa labore duis sunt culpa nulla
								illum cillum fugiat legam esse veniam culpa fore nisi cillum
								quid. <i class="bx bxs-quote-alt-right quote-icon-right"></i>
							</p>
							<img src="assets/img/testimonials/testimonials-5.jpg"
								class="testimonial-img" alt="">
							<h3>John Larson</h3>
							<h4>Entrepreneur</h4>
						</div>

					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- End Testimonials Section --> <!-- ======= Contact Section ======= -->
	<section id="contact" class="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-4" data-aos="fade-right">
					<div class="section-title">
						<h2>Contact</h2>
						<p>Magnam dolores commodi suscipit. Necessitatibus eius
							consequatur ex aliquid fuga eum quidem. Sit sint consectetur
							velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit
							suscipit alias ea. Quia fugiat sit in iste officiis commodi
							quidem hic quas.</p>
					</div>
				</div>

			</div>

		</div>
	</section>
	<!-- End Contact Section --> </main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">

		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6 footer-contact">
						<h3>Bethany</h3>
						<p>
							A108 Adam Street <br> New York, NY 535022<br> United
							States <br>
							<br> <strong>Phone:</strong> +1 5589 55488 55<br> <strong>Email:</strong>
							info@example.com<br>
						</p>
					</div>

					<div class="col-lg-2 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">About
									us</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Terms
									of service</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Privacy
									policy</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Services</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web
									Design</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web
									Development</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Product
									Management</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Graphic
									Design</a></li>
						</ul>
					</div>

					<div class="col-lg-4 col-md-6 footer-newsletter">
						<h4>Join Our Newsletter</h4>
						<p>Tamen quem nulla quae legam multos aute sint culpa legam
							noster magna</p>
						<form action="" method="post">
							<input type="email" name="email"><input type="submit"
								value="Subscribe">
						</form>
					</div>

				</div>
			</div>
		</div>

		<div class="container d-md-flex py-4">

			<div class="mr-md-auto text-center text-md-left">
				<div class="copyright">
					&copy; Copyright <strong><span>Bethany</span></strong>. All Rights
					Reserved
				</div>
				<div class="credits">
					<!-- All the links in the footer should remain intact. -->
					<!-- You can delete the links only if you purchased the pro version. -->
					<!-- Licensing information: https://bootstrapmade.com/license/ -->
					<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/bethany-free-onepage-bootstrap-theme/ -->
					Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
				</div>
			</div>
			<div class="social-links text-center text-md-right pt-3 pt-md-0">
				<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
					href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
					href="#" class="instagram"><i class="bx bxl-instagram"></i></a> <a
					href="#" class="google-plus"><i class="bx bxl-skype"></i></a> <a
					href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="assets/vendor/counterup/counterup.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/venobox/venobox.min.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>
</html>