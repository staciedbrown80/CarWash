
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
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
<link rel="stylesheet"
	href="static/assets/vendor/charts/chartist-bundle/chartist.css">
<link rel="stylesheet"
	href="static/assets/vendor/charts/morris-bundle/morris.css">
<link rel="stylesheet"
	href="static/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="static/assets/vendor/charts/c3charts/c3.css">
<link rel="stylesheet"
	href="static/assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
<title>Home</title>

</head>

<body>
	<!-- ============================================================== -->
	<!-- main wrapper -->
	<!-- ============================================================== -->
	<div class="dashboard-main-wrapper">
		<!-- ============================================================== -->
		<!-- navbar -->
		<!-- ============================================================== -->
		<jsp:include page="components/header.jsp" />

		<!-- ============================================================== -->
		<!-- end navbar -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- left sidebar -->
		<!-- ============================================================== -->
		<jsp:include page="components/dashboard.jsp" />
		<!-- ============================================================== -->
		<!-- end left sidebar -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="dashboard-wrapper">
			<div class="dashboard-ecommerce">
				<div class="container-fluid dashboard-content ">
					<!-- ============================================================== -->
					<!-- pageheader  -->
					<!-- ============================================================== -->
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="page-header">
								<!-- h2 class="pageheader-title">Car Wash Menu </h2>-->
								<!-- p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>-->
								<div class="page-breadcrumb">
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="#"
												class="breadcrumb-link">Dashboard</a></li>
											<li class="breadcrumb-item active" aria-current="page">Menu</li>
										</ol>
									</nav>
								</div>
							</div>
						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end pageheader  -->
					<!-- ============================================================== -->
					<div class="ecommerce-widget">

						<p class="aligncenter">
							<img src="resources/images/LOGO2.PNG" alt="Logo" width="700" height="400"
								alt="centered image" class="center">
						</p>

						<div class="row">
						<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
						
								<div class="responsive">
									<div class="gallery">
									<a href="itemdetail?type=1">
									    <button type="submit">
											<img src="resources/images/1DELUXE_1-31.PNG" alt="Deluxe Wash" width="250" height="340">
										</button>
											</a>
										<!-- div class="desc">CLICK HERE</div>-->
									</div>
								</div>
								
						</div>
						<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
							<div class="responsive">
									<div class="gallery">
									<a href="itemdetail?type=2">
									    <button type="submit">
											<img src="resources/images/2ULTIMATE_1-31.PNG" alt="Ultimate Wash" width="250" height="370">
										</button>
											</a>
										<!-- ->div class="desc">CLICK HERE</div>-->
									</div>
								</div>
							
						</div>
						<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
							<div class="responsive">
									<div class="gallery">
									<a href="itemdetail?type=3">
									    <button type="submit">
											<img src="resources/images/3BRILLIANCE_1-31.PNG" alt="Brilliance Wash" width="250" height="400">
										</button>
											</a>
										<!-- div class="desc">CLICK HERE</div>-->
									</div>
								</div><!-- div class="card">-->
								
						</div>
						<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
							<div class="responsive">
									<div class="gallery">
									<a href="itemdetail?type=4">
									    <button type="submit">
											<img src="resources/images/4THEWORKS_1-31.PNG" alt="The Works Wash" width="250" height="440">
										</button>
											</a>
										<!-- ->div class="desc">CLICK HERE</div>-->
									</div>
								</div>
							
					</div>
					<!-- div class="row">-->
					
						<!-- ============================================================== -->

						<!-- ============================================================== -->

						<!-- recent orders  -->
						<!-- ============================================================== -->
						<div class="col-xl-9 col-lg-12 col-md-6 col-sm-12 col-12">	</div>					
							<div class="card"  style="width: 100%; margin-top:15px;">
								<h5 class="card-header">Recent Orders</h5>
								<div class="card-body p-0">
									<div class="table-responsive">
										<table class="table">
											<thead class="bg-light">
												<tr class="border-0">
													<th class="border-0">#</th>
													<th class="border-0">ID</th>
													<th class="border-0">Type</th>
													<th class="border-0">Price</th>
													
												</tr>
											</thead>
											<tbody>
											<c:forEach var="products" items="${allOrders}" end="4">
												<c:set var="count" value="${count+1}"/>
													<tr>
										
													<td>${count}.</td>
													<td>${products.id}</td>
													<td>${products.type}</td>
													<td>$${products.price}</td>
													
													
												</tr>
												</c:forEach>
												
									
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- ============================================================== -->
						<!-- end recent orders  -->


		<!-- ============================================================== -->
		<!-- footer -->
		<!-- ============================================================== -->
		<div class="footer">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
						Copyright © 2018 Concept. All rights reserved. Dashboard by <a
							href="https://colorlib.com/wp/">Colorlib</a>.
					</div>
					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="text-md-right footer-links d-none d-sm-block">
							<a href="javascript: void(0);">About</a> <a
								href="javascript: void(0);">Support</a> <a
								href="javascript: void(0);">Contact Us</a>
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
	<!-- chart chartist js -->
	<script
		src="static/assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
	<!-- sparkline js -->
	<script src="static/assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
	<!-- morris js -->
	<script src="static/assets/vendor/charts/morris-bundle/raphael.min.js"></script>
	<script src="static/assets/vendor/charts/morris-bundle/morris.js"></script>
	<!-- chart c3 js -->
	<script src="static/assets/vendor/charts/c3charts/c3.min.js"></script>
	<script src="static/assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
	<script src="static/assets/vendor/charts/c3charts/C3chartjs.js"></script>
	<script src="static/assets/libs/js/dashboard-ecommerce.js"></script>
</body>

</html>