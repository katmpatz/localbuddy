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
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <script src="js/script2.js"></script>
      <style>

        textarea.ng-invalid
        {
          border: solid #ff3399 2px;
        }

      </style>

  </head>

  <body id="page-top" style="background-color=black;" ng-app="mainModule">

	<!-- Navigation -->
    <%@ include file="navbar.jsp"  %>
	<%  int trav;
	if(request.getAttribute("id")==null) {

		String id = request.getParameter("id");
		trav = Integer.parseInt(id);

	} else {
		trav = (Integer) request.getAttribute("id");
	}

		InterestsDAO intd = new InterestsDAO();
		LocalBuddyDAO lbd = new LocalBuddyDAO();

		LocalBuddy local = lbd.getLocalBuddyByTraveller(trav);
		traveller = (Traveller)session.getAttribute("traveller-object");
	if(traveller==null) {
		request.setAttribute("message","You have to login to show localbuddy 's profil!");
		request.setAttribute("local_id", local.getId());%>

		<jsp:forward page="login2.jsp"/>

	<%}%>

	<%
	 String mycity=local.getLocation().getCity();
	 String city_photo="city";
	 if(mycity.equals("Athens") || mycity.equals("Paris")|| mycity.equals("Stockholm")) {
		 city_photo = mycity;
	 }%>

	 <!-- Header -->
    <header class="masthead " style="background-image:url(img/<%=city_photo%>.jpg); max-height:200px; margin-top:-300px;;">
      <div class="container" style="padding-top: 200px;">
        <img class="img-thumbnail" src="img/<%=local.getPhoto()%>.jpg" alt="" style="width:200px;
		height:200px; margin-top:250px;">
        <div class="intro-text">
          <span class="name" style="color:black; font-size:30px; font-family: 'Indie Flower', cursive;"><b><%=local.getName()%></b></span><br>
		  <span class="name" style="color:black; font-size:25px; font-family: 'Indie Flower', cursive;"><%=local.getLocation().getCity()%>,<%=local.getLocation().getCountry()%>   </span><br>
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
            <p><%=local.getDescription()%></p>
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
				<%for(int i=0; i< intd.getMyInterests(local.getId()).size(); i++){%>
				<h5 class="btn btn-primary btn-xs " id="intrestings"><%=intd.getMyInterests(local.getId()).get(i).getName()%></h5>
				<%}%>
			</p>
		</div>
        </div>
      </div>
    </section>





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
            <p class="text-muted">Available like local buddy.</p>
          </div>
		  <%if(local.getStudent()) { %>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-graduation-cap fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">Study offers</h4>
            <p class="text-muted"> Available like student.</p>
          </div>
		  <%} else {%>
		  <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x" style = "color:#e6fff5;"></i>
              <i class="fa fa-graduation-cap fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading text-secondary">Study offers</h4>
            <p class="text-muted" > Not available like student.</p>
          </div>
		  <%}%>

		  <%if(local.getFindAHome()) { %>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-home fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">Find a home</h4>
            <p class="text-muted"> Available to help you find a home.</p>
          </div>
		  <%} else {%>
		  <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x" style = "color:#e6fff5;"></i>
              <i class="fa fa-home fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading text-secondary">Find a home</h4>
            <p class="text-muted" > Not available to help you find a home.</p>
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

	<section>
	<div class="container">
          <div class="col-lg-12 text-center">
                  <div id="success"></div>
				  <button id="sendMessageButton" class="btn btn-primary btn-xl text-uppercase" type="submit" data-toggle="modal" data-target="#communication"><b>Send request!</b></button>

                </div>
      </div>
	  </section>



	<!-- Message-->
	<div class="modal fade" id="communication" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content" >
		<div class="modal-heading" style="background-color: #14141F;">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<div class="form-signin-heading text-center">
			<br>
					<span class="fa-stack fa-3x">
						<i class="fa fa-circle fa-stack-2x text-primary"></i>
						<i class="fa fa-envelope fa-stack-1x fa-inverse"></i>
					</span>
					<h4 style="color:white;">Message</h4>
				</div>

			<br>
		</div>
        <div class="modal-body container-fluid" ng-controller="mainController">

			<form method="post" action="communication_controller.jsp" class="form-horizontal" name="form" novalidate>
				<div class="form-group row">
					<div class="col-sm-12">
						<textarea type="text" name="mes" rows="4" placeholder="Text a message to complete your request!" class="form-control" ng-model="myForm.message" required></textarea>
					</div>
                </div>
				<input type="hidden" name="traveller_id" class="form-control"  ng-model="myForm.traveller" value=<%=traveller.getId()%>>
				<input type="hidden" name="localbuddy_id" class="form-control" ng-model="myForm.local" value=<%=local.getIdLocal()%>>
				<hr>
				<div class="text-center">
					<button class="btn btn-info" data-dismiss="modal">Cancel</button>
					<button class="btn btn-primary" type="submit" id="find" ng-disabled="form.$invalid" ng-click="myForm.submitTheForm()">Send</button>
				</div>



			</form>
    </div>
  </div>
  </div>
  </div>

<%@ include file="footer.jsp"  %>

  </body>

</html>
