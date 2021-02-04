<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8"><meta http-equiv="refresh"  CONTENT="<%= session.getMaxInactiveInterval() %>;URL='<%= session.getServletContext().getContextPath() %>/expired'" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="static/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="static/assets/libs/css/style.css">
    <link rel="stylesheet" href="static/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <!-- leaflet -->
    
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>
  
    <title>Product</title>
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
                          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h3 class="mb-2">Product Form  </h3>
                                <p class="pageheader-text"></p>                               
                                 
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">${product.type}</li>
                                        </ol>
                                    </nav>
                                </div>
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
                         <form:form action="editproduct" modelAttribute="product" method="post" role="form" enctype="multipart/form-data" > 							     
                          <div class="row">
                           <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
                             <h3><span class="text-success"> ${product.name} <i class="fa fa-edit"></i></span></h3><hr>
                             
                              <form:input type="hidden" path="id"/> 
									                    <form:input type="hidden" path="users_id" />
									                    <form:input type="hidden" path="img" />
									                    <form:input type="hidden" path="email"  />
									                    <div class="form-row">
			                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
			                                                <label for="name">Product Name</label>
			                                                <form:input path="name" placeholder="Product Name" class="form-control" />
			                                            </div>
			                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
			                                                <label for="price">Price</label>
			                                                <form:input path="price" placeholder="Price" class="form-control" />
			                                            </div>
			                                          </div>
			                                            
			                                           <div class="form-row">
			                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
			                                                 <label for="size"> Size <span class="required">*</span></label>
			                                                <form:select path="size" class="form-control" >
			                                                   <form:option value="product.size">Select</form:option>
			                                                   <c:forEach items="${sizes}" var="item">
										                       <form:option value="${item}" > ${item}</form:option>
										                            </c:forEach>
			                                               </form:select>
			                                            </div>
			                                            
			                                             <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
			                                                 <label for="type"> Department <span class="required">*</span></label>
			                                                   <form:select  path="type" class="form-control" >
			                                                   <form:option value="product.type">Select</form:option>
												               <form:option value="Electronics" >Electronics</form:option>
										                       <form:option value="Clothing" >Clothing</form:option>
										                       <form:option value="Shoe" >Shoe</form:option>
										                            
			                                                </form:select>
			                                            
			                                            </div>
			                                            
			                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-2">
			                                               <label for="name"> Color<span class="required">*</span> </label>
									                           <form:select path="color" id="color" multiple="true" class="form-control"  required="required" > 
											                    <form:option value="product.color">Select (${product.color})</form:option>
											                    <c:forEach items="${cols}" var="item">			                        
										                        <form:option value="${item}" > ${item}</form:option>
											                    </c:forEach>
											                  </form:select>
			                                            </div>
			                                            </div>
			                                            <div class="row"> 
			                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-2">
			                                            <div class="form-group"> 
									                        <label for="des">Description<em class="required">*</em></label>
									                        <form:textarea path="des"  placeholder="Description" class="form-control" cols="6" rows="5"  required="required"/>
									                       </div>
									                     </div>
									                     </div>
									                   
									                    
			                                         
			                                            
                                
                          </div>
                         <div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12">
                            <h3 class="text-success">Product Images</h3><hr>
                             <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		                                    <div class="carousel-inner">		                                        
		                                        <c:forEach var="img" items="${product.getIfiles()}">
                                                <div class="carousel-item <c:if test="${product.getIfiles().indexOf(img) eq 0}">active</c:if>">
		                                            <img class="product-img" src="static/img/products/${product.id}/${img.image}" style="width:auto; max-height:400px;">
		                                            <div class="ribbons-text btn btn-default">		                                            
		                                            </div>
		                                            <div class=""><a href="#" class="product-wishlist-btn btn-light">
		                                            ${product.getIfiles().indexOf(img)+1}/${product.getIfiles().size()}</a></div>
		                                            
		                                        </div>
		                                        </c:forEach>
		                                    </div>
		                                    
		                                    <ol class="carousel-indicators">
                                               <c:forEach var="img" items="${product.getIfiles()}">
                                            
                                                <a href="#" data-target="#carouselExampleIndicators" data-slide-to="${product.getIfiles().indexOf(img)}"
                                                 class="<c:if test="${product.getIfiles().indexOf(img) eq 0}">active</c:if>">
                                                  <img src="static/img/products/${product.id}/${img.image}" style="width:50px; max-height:50px;">
                                                
                                                 </a>
                                               </c:forEach> 
                                            </ol>
		                                </div>  
		                       <div class="form-row">
									                     
                                           				 <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12 mb-2"> 
									                     <form:input path="file" type="file" name="file" class="custom-file-input"/>
				                                         <label class="custom-file-label" for="customFile">File 1st</label>
				                                         </div>
									                     
									                     <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12 mb-2"> 
									                     <form:input path="file" type="file" name="file" class="custom-file-input"/>
				                                         <label class="custom-file-label" for="customFile">File 2nd</label>
				                                         </div>
				                                         
				                                         <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12 mb-2"> 
									                     <form:input path="file" type="file" name="file" class="custom-file-input"/>
				                                         <label class="custom-file-label" for="customFile">File 3rd</label>
				                                         </div>
				                                         				                                        
				                                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12 mb-2"> 
									                     <form:input path="file" type="file" name="file" class="custom-file-input"/>
				                                         <label class="custom-file-label" for="customFile">File 4th</label>
				                                         </div>
				                                         
				                </div>    
                                  
                         </div>
                         
                       </div>
                       <hr>
                       <button class="btn btn-primary" type="submit">Submit</button>
			            <a href="shop" class="btn btn-danger"><span aria-hidden="true">Cancel</span></a>
					    </form:form>
                           
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
		var lat=-0.1192831131433293;
		var lon=34.75095748901367;
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