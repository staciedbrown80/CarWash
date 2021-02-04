<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="refresh"
	CONTENT="<%= session.getMaxInactiveInterval() %>;URL='<%= session.getServletContext().getContextPath() %>/expired'" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="static/assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="static/assets/vendor/fonts/circular-std/style.css"
	rel="stylesheet">
<link rel="stylesheet" href="static/assets/libs/css/style.css">
<link rel="stylesheet"
	href="static/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<title>Product Detail</title>
</head>

<body>

	<!-- ============================================================== -->
	<!-- main wrapper -->
	<!-- ============================================================== -->
	<div class="dashboard-main-wrapper">
		<jsp:include page="components/header.jsp" />
		<!-- ============================================================== -->
		<jsp:include page="components/dashboard.jsp" />
		<!-- ============================================================== -->
		<!-- end left sidebar -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="dashboard-wrapper">
			<div class="dashboard-influence">
				<div class="container-fluid dashboard-content">
					<!-- ============================================================== -->
					<!-- pageheader  -->
					<!-- ============================================================== -->
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="page-header">
								<!-- h3 class="mb-2">${item.type}:Product Detail</h3>-->
								<h3 class="mb-2">Product Detail</h3>
								
								<p class="pageheader-text"></p>

								<div class="page-breadcrumb">
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="#"
												class="breadcrumb-link">Dashboard</a></li>
											<li class="breadcrumb-item active" aria-current="page">${item.name}</li>
										</ol>
									</nav>
								</div>
							</div>
						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end pageheader  -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
					<!-- content  -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
					<!-- influencer profile  -->
					<!-- ============================================================== -->
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="card">
								<div class="card-body">

									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
										<div class="row">
											<div class="col-xl-5 col-lg-5 col-md-5 col-sm-12 col-12">

												<form method="POST" action="addOrder">
													<div
														>
														<label for="type">Type</label>
														<select class="form-control form-control-l" id="type" name="type" style="width: 100%">
														<option value="Basic Wash" ${basicSelect}>Basic Wash - $14.00</option>
														<option value="Ultimate Wash" ${ultimateSelect }>Ultimate Wash - $18.00</option>
														<option value="Brilliant Wash" ${brilliantSelect }>Brilliant Wash - $28.00</option>
														<option value="The Works" ${worksSelect}>The Works - $39.00</option>
														</select>
														</div>
													<div >
														<label for="car">Vehicle</label>
														<select id="car" class="form-control form-control-l" name="carId"  style="width: 100%">
														<c:forEach items="${loggedInUser.cars }" var="car">
														<option value="${car.id}">${car.make} ${car.model} ${car.licensePlate}</option>
														</c:forEach>
														</select>
														</div>
														<div >
														<label for="pay">Payment Method</label>
														<select id="pay" class="form-control form-control-l" name="payId"  style="width: 100%">
														<c:forEach items="${loggedInUser.paymentMethod }" var="pay">
														<option value="${pay.id}">${pay.type } ${pay.expiry}</option>
														</c:forEach>
														</select>
														</div>
													
														<button type="submit"  class="btn btn-success"><span>Submit</span></button>

												</form>

												</div>

											</div>


										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- ============================================================== -->
						<!-- end influencer profile  -->
						<!-- ============================================================== -->
						<!-- ============================================================== -->
						<!-- widgets   -->
						<!-- ============================================================== -->
						<div class="card">
							<div class="card-body">
								<div class="row">
									<div
										class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 m-b-10">
										<h3>Related Products</h3>
									</div>
									<c:forEach var="item" items="${list}">
										<div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
											<div class="product-thumbnail">
												<div class="product-img-head">
													<div class="product-img">
														<a href="productdetails?id=${item.id}"> <img
															src="static/img/products/${item.id}/${item.img}"
															class="img-fluid" style="width: 300px; height: 300px;"></a>
													</div>
													<div class="">
														<a href="#" class="product-wishlist-btn"><i
															class="fas fa-heart"></i></a>
													</div>
												</div>
												<div class="product-content">
													<div class="product-content-head">
														<h3 class="product-title">${item.name}</h3>
														<div class="product-price">
															$
															<fmt:formatNumber value="${item.price}"
																maxFractionDigits="2" minFractionDigits="2" />
														</div>
													</div>
													<div class="product-btn">
														<a href="productdetails?id=${item.id}"
															class="btn btn-primary btn-sm">Add to Cart</a>
														<c:if
															test="${item.email eq loggedInuser or fn:contains(role, 'ADMIN')}">
															<a href="edititem?id=${item.id}"
																class="btn btn-success btn-sm"> <i
																class="fas fa-pencil-alt" aria-hidden="true"></i>
															</a>
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- ============================================================== -->
				<!-- footer -->
				<!-- ============================================================== -->
				<div class="footer">
					<div class="container-fluid">
						<div class="row">
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
								Copyright © 2018 Concept. All rights reserved. Dashboard by <a
									href="#">Colorlib</a>.
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="text-md-right footer-links d-none d-sm-block">
									<a href="about">About</a> <a href="contact">Contact Us</a> <a
										href="home">Home</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end footer -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
			<!-- end wrapper  -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- end main wrapper  -->
		<!-- ============================================================== -->
		<!-- Optional JavaScript -->
		<!-- jquery 3.3.1 -->
		<script src="static/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
		<!-- bootstap bundle js -->
		<script src="static/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
		<!-- slimscroll js -->
		<script src="static/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
		<!-- main js -->
		<script src="static/assets/libs/js/main-js.js"></script>
		<script>
        jQuery('<div class="quantity-nav"><div class="quantity-button quantity-up">+</div><div class="quantity-button quantity-down">-</div></div>').insertAfter('.quantity input');
        jQuery('.quantity').each(function() {
            var spinner = jQuery(this),
                input = spinner.find('input[type="number"]'),
                btnUp = spinner.find('.quantity-up'),
                btnDown = spinner.find('.quantity-down'),
                min = input.attr('min'),
                max = input.attr('max');

            btnUp.click(function() {
                var oldValue = parseFloat(input.val());
                if (oldValue >= max) {
                    var newVal = oldValue;
                } else {
                    var newVal = oldValue + 1;
                }
                spinner.find("input").val(newVal);
                spinner.find("input").trigger("change");
            });

            btnDown.click(function() {
                var oldValue = parseFloat(input.val());
                if (oldValue <= min) {
                    var newVal = oldValue;
                } else {
                    var newVal = oldValue - 1;
                }
                spinner.find("input").val(newVal);
                spinner.find("input").trigger("change");
            });

        });
        </script>
</body>

</html>