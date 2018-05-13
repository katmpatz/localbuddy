<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "omadiki2.*"%>
<%@ page errorPage="error.jsp"%>



<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>My profile</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Lobster|Saira+Semi+Condensed" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=Indie+Flower" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/agency.min.css" rel="stylesheet">

  </head>

  <body id="page-top" style="background-color=black;">

	<!-- Navigation -->
    <%@ include file="navbar.jsp"  %>
	<%
		InterestsDAO intd = new InterestsDAO();
		TravellerDAO td = new TravellerDAO();
		int trav_id=0;
		String id = request.getParameter("id");
		if(!(id==null)) {
			trav_id = Integer.parseInt(id);
			traveller = td.getTravellerByID(trav_id);
		} else {
			traveller = (Traveller)session.getAttribute("traveller-object");
			if(traveller==null) {
				request.setAttribute("message","Please login"); %>

				<jsp:forward page="login2.jsp"/>
		<%}
			trav_id = traveller.getId();
		}%>



	 <!-- Header -->
	 <%
	 String mycity=traveller.getLocation().getCity();
	 String city_photo="city";
	 if(mycity.equals("Athens") || mycity.equals("Paris")|| mycity.equals("Stockholm")) {
		 city_photo = mycity;
	 }%>

    <header class="masthead " style="background-image:url(img/<%=city_photo%>.jpg); max-height:200px; margin-top:-300px;;">
      <div class="container" style="padding-top: 200px;">
        <img class="img-thumbnail" src="img/<%=traveller.getPhoto()%>.jpg" alt="" style="width:200px;
		height:200px; margin-top:250px;">
        <div class="intro-text">
          <span class="name" style="color:black; font-size:30px; font-family: 'Indie Flower', cursive;"><b><%=traveller.getName()%></b></span><br>
		  <span class="name" style="color:black; font-size:25px; font-family: 'Indie Flower', cursive;"><%=traveller.getLocation().getCity()%>,<%=traveller.getLocation().getCountry()%>   </span><br>
        </div>
      </div>
    </header>

	<br>
	<br>

	<section  style="margin-top:100px; ">
      <div class="container">
	  <% if(request.getAttribute("message") != null) { %>
			<div class="alert alert-success text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
		<br>
		<% } %>
        <h2 class="text-center">About me</h2><hr>
		<div class="row">
          <div class="col-lg-12 ml-auto text-center">
            <p><%=traveller.getDescription()%></p>
          </div>
        </div>
      </div>
	</section>

	<section class="bg-light">
      <div class="container">
        <h2 class="text-center">My Intrestings</h2><hr>
        <div class="row">
          <div class="col-lg-12 ml-auto text-center">
            <p>
				<%for(int i=0; i< intd.getMyInterests(trav_id).size(); i++){%>
				<h5 class="btn btn-primary btn-xs " id="intrestings"><%=intd.getMyInterests(trav_id).get(i).getName()%></h5>
				<%}%>
			</p>
		</div>
        </div>
      </div>
    </section>



	<%	LocalBuddyDAO lbd = new LocalBuddyDAO();
		LocalBuddy local = lbd.getLocalBuddyByTraveller(trav_id);
		if(local!=null) {
		%>

	<section>
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="text-center">Offers</h2><hr>
			<br>
          </div>
        </div>
        <div class="row text-center">
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-plane fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">Local Buddy</h4>
            <p class="text-muted">You are available like local buddy.</p>
          </div>
		  <%if(local.getStudent()) { %>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-graduation-cap fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">Study offers</h4>
            <p class="text-muted"> You are available like student.</p>
          </div>
		  <%} else {%>
		  <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x" style = "color:#e6fff5;"></i>
              <i class="fa fa-graduation-cap fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading text-secondary">Study offers</h4>
            <p class="text-muted" > You are not available like student.</p>
          </div>
		  <%}%>

		  <%if(local.getFindAHome()) { %>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-home fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">Find a home</h4>
            <p class="text-muted"> You are available to help someone find a home.</p>
          </div>
		  <%} else {%>
		  <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x" style = "color:#e6fff5;"></i>
              <i class="fa fa-home fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading text-secondary">Find a home</h4>
            <p class="text-muted"> You are not available to help someone find a home.</p>
          </div>
		  <%}%>

        </div>
      </div>
    </section>




	<section class="bg-light">
      <div class="container">
        <h2 class="text-center">My City</h2><hr>
        <div class="row">
          <div class="col-lg-12 ml-auto">
            <p><%=local.getCityDescription()%></p>
          </div>
        </div><hr>
      </div>
    </section>
	<%} else if(local==null && id==null) {%>
	<section>
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Discover the local buddy world!</h2>
            <h3 class="section-subheading text-muted">Share your favorite spots, restaurants, cafes, bars, museums and avtivities with travelers.
			Meet new cultures  and guide travelers to the unique sites of your city. Live the experience of a local buddy and become a part of our community.</h3>

                  <div id="success"></div>
                  <a href="registerlocal.jsp" role="button"  class="btn btn-primary btn-xl" type="submit" style="background-color:#00ffaa; font-family:'Lobster', cursive; border-radius: 8px;">Become Localbuddy</a>
                </div>
				</div>
      </div>
    </section>
	<%}%>

<%@ include file="footer.jsp"  %>

  </body>

</html>
