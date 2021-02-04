<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="static/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="static/assets/libs/css/style.css">
    <link rel="stylesheet" href="static/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <!-- leaflet -->
    
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>
  
    <title>Contact</title>
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
       <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <jsp:include page="components/header.jsp"/>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
        <jsp:include page="components/dashboard.jsp"/>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="influence-profile">
                <div class="container-fluid dashboard-content ">
                    <!-- ============================================================== -->
                    <!-- pageheader -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h3 class="mb-2"> Contact Us </h3>
                                <p class="pageheader-text">
                                ${error} ${msg} <span class="text-success">${success}</span>
                                </p>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"> Contact Us </li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end pageheader -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- content -->
                    <!-- ============================================================== -->
                    
                       <div class="card">                        
                         <div class="card-body">
                          <div class="row">
                           <div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12">
                             <h3>Send E-Mail <span class="text-success">${success}</span></h3><hr>
                                <form action="sendemail" method="post">
                                         <div class="form-group">
                                         <label for="name">Your Name</label>
                                           <input type="text" class="form-control form-control-lg" name="name" id="name" placeholder="Full Name" required>
                                         </div>
                                         <div class="form-group">
                                            <label for="email">Your Email</label>
                                            <input type="email" class="form-control form-control-lg" name="email" id="email" placeholder="" required>
                                         </div>
                                         <div class="form-group">
                                           <label for="subject">Subject</label>
                                           <input type="text" class="form-control form-control-lg" name="subject" id="subject" placeholder="" required>
                                         </div>
                                         <div class="form-group">
                                         <label for="messages">Message</label>
                                         <textarea class="form-control" name="message" id="messages" rows="3" required></textarea>
                                         </div>
                                         <button type="submit" id="send" class="btn btn-primary float-left">Send Message</button>                                                        
                                      </form>
                                  </div>
                                  <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
                                    <h3>Our Location</h3><hr>
                                   
                                  <div id="map" class="gmaps" style="width:auto; height:300px;"></div>
                                  <br>
                                  <p class="border-bottom pb-3">
	                                    <span class="d-xl-inline-block d-block mb-2"><i class="fa fa-map-marker-alt mr-2 text-primary "></i>
	                                  1234 Old Halls Ferry Road , St. Louis, MO 63034
	                                    <small class="mb-2 ml-xl-4 d-xl-inline-block d-block">
	                                    <a href="#" class="badge badge-light mr-1">
                                        <i class="fa fa-envelope mr-1 mr-1"></i>info@email.com</a>
	                                    <a href="tel:+1800 555 1234" class="badge badge-light mr-1"><i class="fas fa-mobile-alt mr-1"></i>800 555 1234</a> 	                                                       
	                                    </small>
	                                    </span>
	                                </p>
                                  </div>
                             </div>
                           
                        </div>
                        <!-- ============================================================== -->
                        <!-- end campaign data -->
                        <!-- ============================================================== -->
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end content -->
            <!-- ============================================================== -->
            
            
        </div>
        <!-- ============================================================== -->
        <!-- end wrapper -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->   
    <script src="static/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="static/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="static/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="static/assets/libs/js/main-js.js"></script>
   <script>
		var lat=38.817160;
		var lon=-90.281320;
		var options = {
		 center: [lat, lon],
		 zoom: 15
		}

		var map = L.map('map', options);
		var nzoom = 8;

		L.tileLayer('https://{s}.tile.osm.org/{z}/{x}/{y}.png', {attribution: 'OSM'}).addTo(map);

		var myMarker = L.marker([lat, lon], {title: "Coordinates", alt: "Coordinates", draggable: true}).addTo(map).on('dragend', function() {
		 var lat = myMarker.getLatLng().lat.toFixed(8);
		 var lon = myMarker.getLatLng().lng.toFixed(8);
		 var czoom = map.getZoom();
		 if(czoom < 9) { nzoom = czoom + 2; }
		 if(nzoom > 9) { nzoom = 9; }
		 if(czoom != 9) { map.setView([lat,lon], nzoom); } else { map.setView([lat,lon]); }
		 myMarker.bindPopup("Lat " + lat + "<br />Lon " + lon).openPopup();
		});
		

	 function confirmed(){
        if (confirm('You are about to delete, Do you want to proceed?')) {
              document.getElementById("del").submit();
              return true;
            } else {
               return false;
            }
         }
    	    
	 
</script>
</body>
 
</html>