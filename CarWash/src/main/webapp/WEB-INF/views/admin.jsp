<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"><meta http-equiv="refresh"  CONTENT="<%= session.getMaxInactiveInterval() %>;URL='<%= session.getServletContext().getContextPath() %>/expired'" />
 
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="static/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="static/assets/libs/css/style.css">
    <link rel="stylesheet" href="static/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <title>Admin</title>
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
                                <h3 class="mb-2"> Admin </h3>
                                <p class="pageheader-text">
                                <!--${msg} ${success}-->
                                ${msg}  ${success} ${list.size()} 
                                </p>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"> Admin </li>
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
                    <div class="row">
                       
                        <!-- ============================================================== -->
                        <div class="col-xl-9 col-lg-8 col-md-8 col-sm-12 col-12">
                            <div class="card">
                            <h5 class="card-header">Accounts</h5>                            
                            <div class="card-body">
                            <form class="form-inline" action="customesearch" method="post" class="col-md-5">
							  <input id="searchnow" class="form-control form-control-lg mr-sm-2" type="text" name="name" placeholder="Name">
							  <input class="form-control form-control form-control-lg mr-sm-2" type="email" name="email" placeholder="E-Mail">
							<button class="btn btn btn-rounded btn-dark" type="submit">Search</button>
							</form><br>
                                <div class="table-responsive">
                                    <table class="table table-striped ">
                                         <thead>
										   <tr>
										   <th>#</th>
										   <th>Name</th>
										   <th>Email</th>
										   <th>Roles</th>
										   <th>Action</th>
										   </tr>
									   </thead>
									   <tbody>
									   <c:set var="k" value="0"/>
									   <c:forEach var="item" items="${list}">
									   <c:set var="k" value="${k+1}"/>
									   <tr>
									   <td>${k}.<%-- ${list.indexOf(item)+1} --%> </td>
									   <td> ${item.fname} ${item.lname} ${item.password}</td>
									   <td> ${item.email} <a href="removeaccount?email=${item.email}"  onclick="confirmed(); return false;" ><i class="fa fa-times"></i></a></td>   
									   <td>
									   <form method="POST" action="editrole" >		    									
											<input type="hidden" name="id" value="${item.id}" />		    	 
												<!-- select onchange="this.form.submit()" name="role"  class="form-control form-control-sm" required>-->
												<select onchange="this.form.submit()" name="role"  class="input-text required-entry" required>
												
												<option value="">
												<c:forEach var="r" items="${item.getRoles()}">
									    		 ${r.role}
									    	    </c:forEach>				    	    
												<option value="USER">USER </option>
												<option value="DBA">DBA</option>
												<option value="ADMIN">ADMIN</option>												  
												</select>												
									   </form>
									   </td>
									   <td> 
									   <a href="deleteaccount?id=${item.id}"  onclick="confirmed(); return false;" ><i class="far fa-trash-alt"></i></a>
									   <a href="#" data-toggle="modal" data-target="#edits${item.id}" > <i class="fas fa-pencil-alt"></i></a> 
									   </td>
									   </tr>
									   </c:forEach>
									   </tbody>
                                        
                                        
                                    </table>
                                </div>
                            </div>
                        </div> 
                                
                                
					            
                            </div>
                            <!-- ============================================================== -->
                            <!-- influencer sidebar  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-3 col-lg-4 col-md-4 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body border-top">
                                        <h3 class="font-16"> Sorting By Category </h3>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customCheck15">
                                            <label class="custom-control-label" for="customCheck15">Business</label>
                                        </div>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customCheck16">
                                            <label class="custom-control-label" for="customCheck16">Lifestyle</label>
                                        </div>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customCheck17">
                                            <label class="custom-control-label" for="customCheck17">Fitness</label>
                                        </div>
                                    </div>
                                    <div class="card-body border-top">
                                        <h3 class="font-16">Age Demographics</h3>
                                        <select class="form-control">
                                            <option selected>Select the Age</option>
                                            <option value="20-30">20-30</option>
                                            <option value="30-40">30-40</option>
                                            <option value="40-50">40-50</option>
                                        </select>
                                    </div>
                                    <div class="card-body border-top">
                                        <a href="#" class="btn btn-secondary btn-lg btn-block">Submit</a>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end influencer sidebar  -->
                            <!-- ============================================================== -->
                        </div>
            <!-- ============================================================== -->
            <!-- end content -->
            <!-- ============================================================== -->
            
          </div>
          </div>  
        </div>
        <!-- ============================================================== -->
        <!-- end wrapper -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <!-- jquery 3.3.1  -->
    <script src="static/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <!-- bootstap bundle js -->
    <script src="static/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- slimscroll js -->
    <script src="static/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <!-- main js -->
    <script src="static/assets/libs/js/main-js.js"></script>
    
    <script>
        function confirmed(){
            if (confirm('You are about to delete, Do you want to proceed?')) {
                  document.getElementById("del").submit();
                  return true;
            } else {
               return false;
            }
         }
            
    $("#searchnow").keyup(function () {
        var value = this.value.toLowerCase().trim();

        $("table tr").each(function (index) {
            if (!index) return;
            $(this).find("td").each(function () {
                var id = $(this).text().toLowerCase().trim();
                var not_found = (id.indexOf(value) == -1);
                $(this).closest('tr').toggle(!not_found);
                return not_found;
            });
        });
    });
    </script>
   
   <c:forEach var="item" items="${list}">
       <div class="modal fade" id="edits${item.id}">
		 <div class="modal-dialog modal-sm">
			 <div class="modal-content">	
				<div class="modal-header">
			        <h5 class="modal-">Edit User</h5>
			         <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
			         </div>      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		  
			    		  <form:form action="updateUsers" modelAttribute="user" method="post">
								<div class="form-group">
									<label for="fn">First Name</label>
									<form:input path="fname" value="${item.fname}"
										class="form-control" placeholder="First Name" />
									<form:input type="hidden" path="id" value="${item.id}"/>
									
								</div>
								<div class="form-group">
									<label for="lname">Last Name</label>
									<form:input path="lname" value="${item.lname}"
										class="form-control" placeholder="Last Name" />
								</div>
								
								<div>
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-user"></i> Save
									</button>
									<button type="button" data-dismiss="modal" aria-label="Close"
										class="btn btn-danger">Close</button>
								</div>
							</form:form>
			    		  
			    		</div>
			       </div>
			</div>
		 </div>
	</c:forEach>    
</body>
 
</html>