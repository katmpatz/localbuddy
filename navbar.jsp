<%@page language="java" contentType = "text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="omadiki2.Traveller"%>
<%@ page errorPage="error.jsp"%>

<% Traveller traveller = (Traveller)session.getAttribute("traveller-object");%>
 
 
 <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color:#14141f">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="index_an.jsp#page-top" id="title"> <i id="icon" class="fa fa-map-marker" aria-hidden="true"></i> Localbuddy</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="index_an.jsp#services">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="index_an.jsp#about">How it works</a>
            </li>
            
            
			<%if(traveller==null) {%>
			
			<li class="nav-item">
              <a  class="nav-link js-scroll-trigger" href="login2.jsp">Log in</a>
            </li>
			<li class="nav-item">
               <a class="nav-link js-scroll-trigger" href="register2.jsp?name=navbar">Register</a>
            </li>
			
			<%} else {%>
			
			<li class="dropdown nav-item">		
				<a href="#" data-toggle="dropdown" class="dropdown-toggle  nav-link js-scroll-trigger"> <%=traveller.getName()%> <b class="caret"></b></a>
				<ul class="dropdown-menu text-center"  style="background-color:#14141F;">
					<li>
						<a href="profil.jsp">My profile</a>
						
					</li>
					<hr>
					<li>
						<a href="communication.jsp">Messages</a>
						
					</li>
					<hr>
					<li>
						<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					</li>
				</ul>
							
			</li>
			
			<%}%>
			
          </ul>
        </div>
      </div>
    </nav>
	

	