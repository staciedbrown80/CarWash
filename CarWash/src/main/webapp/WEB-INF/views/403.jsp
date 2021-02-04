<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>404</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="static/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="static/assets/libs/css/style.css">
    <link rel="stylesheet" href="static/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <style>
    html,
    body {
        height: 100%;
    }

    body {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
    }
    </style>
</head>

<body>
    <!-- ============================================================== -->
    <!-- login page  -->
    <!-- ============================================================== -->
    <div class="splash-container">
    <jsp:include page="components/header.jsp"/>
        
        <div class="card ">
            <div class="card-header text-center"><a href="home"></a>
            <h2 class="splash-description">Access Denied ${error}  </h2></div>
            <div class="card-body">
            				<sec:authorize access="isAuthenticated()">	
                               <a class="btn btn-success" href="profile"><i class="fas fa-user mr-2"></i>Account</a>
                               <a class="btn btn-outline-dark" href="profile"><i class="fas fa-shopping-bag mr-2"></i>Shop</a>	                                
                            </sec:authorize>
                            <sec:authorize access="!isAuthenticated()">
                              <a class="btn btn-secondary" href="logout"><i class="fas fa-power-off mr-2"></i>Logout</a>			           
                            </sec:authorize>
                  
            </div>
        </div>
    </div>
    
     											
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="static/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="static/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    
    
</body>
 
</html>