 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
         
 <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg fixed-top">
                <a class="navbar-brand" href="home">Valet Service Car Wash</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item">
                        <form action="search" method="post">
                            <div class="top-search-bar input-group mb-3" id="custom-search">                               
                               <input type="text" name="keyword" placeholder="Search.." class="form-control">
                                  <div class="input-group-append">
                                      <button type="submit" class="btn btn-outlook-light"><i class="fas fa-search"></i></button>
                                   </div>
                            </div>
                          </form>          
                        </li>
                        <li class="nav-item dropdown notification">
                            <a class="nav-link nav-icons" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-fw fa-bell"></i> <span class="indicator"></span></a>
                            <ul class="dropdown-menu dropdown-menu-right notification-dropdown">
                                <li>
                                    <div class="notification-title"> Notification</div>
                                    <div class="notification-list">
                                        <div class="list-group">
                                            <a href="#" class="list-group-item list-group-item-action active">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="static/assets/images/avatar-2.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Jeremy Rakestraw</span>accepted your invitation to join the team.
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="static/assets/images/avatar-3.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">John Abraham </span>is now following you
                                                        <div class="notification-date">2 days ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="static/assets/images/avatar-4.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Monaan Pechi</span> is watching your main repository
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="static/assets/images/avatar-5.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Jessica Caruso</span>accepted your invitation to join the team.
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="list-footer"> <a href="#">View all notifications</a></div>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                        <a class="nav-link" href="shop" id="navbarDropdown" role="button" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-shopping-bag"></i> </a>
                           
                        </li>
                        <li class="nav-item dropdown connection">
                            <a class="nav-link" href="#" id="pages" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-fw fa-th"></i> </a>
                            <ul class="dropdown-menu dropdown-menu-right connection-dropdown">
                                <li class="connection-list">
                                    <div class="row">
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="home" id="home" class="connection-item"> <span>Home</span></a>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="about" id="about" class="connection-item"> <span>About</span></a>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="contact" id="contact" class="connection-item"> <span>Contact</span></a>
                                        </div>
                                    </div>
                                    
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="acc" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           <c:choose>
                           <c:when test="${not empty avatar }">
                           <img src="${avatar}" class="user-avatar-md rounded-circle">
                           </c:when>
                           <c:otherwise>
                           <i class="fa fa-user user-avatar-md rounded-circle"></i>                            
                           </c:otherwise>
                           </c:choose>
                           </a>
                            
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                               <sec:authorize access="isAuthenticated()">	
                               <a class="dropdown-item" href="profile"><i class="fas fa-user mr-2"></i>Account</a>	    
                               <sec:authorize access="hasAnyAuthority('ADMIN','DBA')">                            
                               <a class="dropdown-item" href="admin"><i class="fas fa-cog mr-2"></i>Admin</a>
                               </sec:authorize>
                                <a class="dropdown-item" href="users"><i class="fas fa-users mr-2"></i> Members</a>
                                 <a class="dropdown-item" href="logout"><i class="fas fa-power-off mr-2"></i>Logout</a> 
                                </sec:authorize>
                                <sec:authorize access="!isAuthenticated()">
                                	<a class="dropdown-item" href="register"><i class="fas fa-user-plus mr-2"></i> Register</a>
						            <a class="dropdown-item" href="login"><i class="fas fa-sign-in-alt mr-2"></i> Login</a>						           
                                </sec:authorize>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>