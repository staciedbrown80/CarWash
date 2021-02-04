
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                              
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link active" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>Dashboard <span class="badge badge-success">6</span></a>
                                <div id="submenu-1" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                         
	                                        
                                        <li class="nav-item">
                                            <a class="nav-link" href="home">Home</a>
                                        </li>
                                        	
                                        <!-- li class="nav-item">
                                            <a class="nav-link" href="about">About Us</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="contact">Contact Us</a>
                                        </li>-->
                                        
                                         <li class="nav-item">
	                                            <a class="nav-link" href="users"><i class="fa fa-users mr-2"></i> Members</a>
	                                        </li>	
			                                <li class="nav-item">
			                                <a class="nav-link"href="about"><i class="fas fa-info-circle mr-2"></i> About</a>
			                                </li>
			                              <li class="nav-item">
			                              <a class="nav-link" href="contact"><i class="fas fa-paper-plane mr-2"></i> Contact</a>
			                              </li>
			                              
			                              
                                        
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1-1" aria-controls="submenu-1-1"></a>
                                            <div id="submenu-1-1" class="collapse submenu" style="">
                                                <ul class="nav flex-column">
                                                    <!-- li class="nav-item">
                                                        <a class="nav-link" href="dashboard-influencer.html">Influencer</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="influencer-finder.html">Influencer Finder</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="influencer-profile.html">Influencer Profile</a>
                                                    </li>-->
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <!-- a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2"><i class="fas fa-bars"></i>Pages</a>-->
                                <div id="submenu-2" class="collapse submenu" style="">
                                    <ul class="nav flex-column">                                        
                                        <c:choose>
								           <c:when test="${not empty loggedInuser}">
									           
			                                <li class="nav-item">
                                            <a class="nav-link" href="profile"><i class="fas fa-user mr-2"></i>Account</a>
                                            </li>
                                            <sec:authorize access="hasAnyAuthority('ADMIN','DBA')">                            
			                                <li class="nav-item">
                                             <a class="nav-link" href="admin"><i class="fas fa-cog mr-2"></i>Admin</a>
                                            </li>
			                                </sec:authorize>
								           </c:when>						           
								           <c:otherwise>
								            
								           </c:otherwise> 
		                                </c:choose>
		                                   <!-- li class="nav-item">
			                                 <a class="nav-link" href="shop"><i class="fas fa-shopping-bag mr-2"></i></a>
			                                </li>-->
			                                
		                                    <li class="nav-item">
	                                            <a class="nav-link" href="users"><i class="fa fa-users mr-2"></i> Members</a>
	                                        </li>	
			                                <li class="nav-item">
			                                <a class="nav-link"href="about"><i class="fas fa-info-circle mr-2"></i> About</a>
			                                </li>
			                              <li class="nav-item">
			                              <a class="nav-link" href="contact"><i class="fas fa-paper-plane mr-2"></i> Contact</a>
			                              </li>
                           				 
                                    </ul>
                                </div>
                            </li>
                            
                            <li class="nav-divider">
                                Features
                            </li>
                        
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-7" aria-controls="submenu-7"><i class="fas fa-fw fa-inbox"></i>Apps <span class="badge badge-secondary">New</span></a>
                                <div id="submenu-7" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Inbox</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Email Detail</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Email Compose</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Message Chat</a>
                                        </li>
                                    </ul>
                                </div>
                            </li> 
                               <sec:authorize access="!isAuthenticated()">
                                <!-- li class="nav-item">
								 <a class="nav-link" href="register"><i class="fas fa-user-plus mr-2"></i> Register</a>
						       </li>
								<li class="nav-item">
								 <a class="nav-link" href="login"><i class="fas fa-sign-in-alt mr-2"></i> Login</a>
								</li>-->
							</sec:authorize>
                              <sec:authorize access="isAuthenticated()">	
                                <!-- li class="nav-item">
                                <a class="nav-link" href="logout"><i class="fas fa-power-off mr-2"></i>Logout</a>                                
						        </li>-->
						     </sec:authorize>
                            
                                      
		                                 
                            			           
						                                
                        </ul>
                    </div>
                </nav>
            </div>
        </div>