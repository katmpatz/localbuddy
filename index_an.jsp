<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "omadiki2.Location"%>
<%@ page import = "omadiki2.LocationDAO"%>
<%@ page import = "omadiki2.LocalBuddyDAO"%>
<%@ page import = "omadiki2.LocalBuddy"%>
<%@ page import = "java.util.*"%>
<%@ page errorPage="error.jsp"%>



<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">


    <title>Localbuddy</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Alfa+Slab+One|Lobster|Saira+Semi+Condensed" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/agency.min.css" rel="stylesheet">
	
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	

  </head>

  <body id="page-top">

    <!-- Navigation -->
    <%@ include file="navbar.jsp"  %>
	
	
	
    <!-- Header -->
	
	<%	LocationDAO ld = new LocationDAO();
		List<Location> location = ld.getLocationsWithLocal();%>
	
	 <header class="masthead">
        <div class="intro-text">
		<div class="intro-heading text-uppercase">Are you planning a trip?</div>
          <div class="banner-input" id=search>
			<div class="container">
				<form class="form-inline" method="post" action="localb.jsp">
					<div class="form-group col-md-4">
						<label id="textf" for="city">Where:  </label>
							<select class="form-control" name="where" required>
							<option value="">City, Country</option>
							<%for(int i=0; i<location.size(); i++) { %>
							<option value="<%=location.get(i).getIdLocation()%>"><%=location.get(i).getCity()%>,<%=location.get(i).getCountry()%></option>
							<%}%>
			</select>
		</div>
		<div class="form-group col-md-4">
			<label id="textf" for="date">When:  </label>
			<input type="date" class="form-control" id="date" name="when" required>
		</div>
		<div class="form-group col-md-3">
			<label id="textf" for="email"> Why:   </label>
			<select class="form-control" name="why" >
							<option value="1">Travel</option>
							<option value="2">Study</option>
							<option value="3">Find a home</option>
			</select>
		</div>
		<div class="form-group col-md-1">
			<button type="submit" class="btn btn-primary btn-lg" id="find"><b>Find a local!</b></button>
			
		</div>
	</form>
	</div>
	</div>
         
        </div>
      </div>
    </header>
	
   

    <!-- Services -->
    <section id="services" class="bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Services</h2>
			<br>
          </div>
        </div>
        <div class="row text-center">
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-plane fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">Travel</h4>
            <p class="text-muted">Are you planning a trip ? Do you like art perfomances or clubs and bars? 
			Do you prefer sport activities and excursions or visits to museums and shopping?
			Do you want to visit traditional or fancy restaurants? Do you want to go sightseeing 
			with a local for free? Find a local with similar interests to yours and have an unforgettable experience!</p>
          </div>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-graduation-cap fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">Study</h4>
            <p class="text-muted"> Are you a student? Do you need help with your enrollment at your university?
			Do you wish to adapt to your new town? Meet students and find where local students go out!</p>
          </div>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fa fa-circle fa-stack-2x text-primary"></i>
              <i class="fa fa-home fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">Moving in</h4>
            <p class="text-muted">Did you find a job in another city? Are you moving out? 
			Do you need help finding your new home? Do you want to find out more about your new neighborhood ?
			Find a local to help you!</p>
          </div>
        </div>
      </div>
    </section>


    <!-- How -->
    <section id="about">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">How</h2>
            <h3 class="section-subheading text-muted">...it works?.</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <ul class="timeline">
              <li>
                <div class="timeline-image">
                  <img class="rounded-circle img-fluid" src="img/about/1.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4 class="subheading">1. Register as a traveller.</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">Fill in the form with your personal informations, name, surname, location, a description about yourself and your intrestings.
					Then, set up your account, fill in your email and your password.</p>
                  </div>
                </div>
              </li>
              <li class="timeline-inverted">
                <div class="timeline-image">
                  <img class="rounded-circle img-fluid" src="img/about/2.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4 class="subheading">2. Search a local in the city you are planning to visit.</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">Search a local by choosing the city you want to visit, the date and the reason in the search engine.</p>
                  </div>
                </div>
              </li>
              <li>
                <div class="timeline-image">
                  <img class="rounded-circle img-fluid" src="img/about/31.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4 class="subheading">3. See the list of local buddies and choose.</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted"> You can see the available local buddies and choose the one that you have similar interests with.</p>
                  </div>
                </div>
              </li>
              <li class="timeline-inverted">
                <div class="timeline-image">
                  <img class="rounded-circle img-fluid" src="img/about/4.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4 class="subheading">4. Send a request and contact him.</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">You can send a request to the local buddy. He will accept or decline your request. If your request is
					  accepted the system will provide the email of your local buddy so you can contact him.</p>
                  </div>
                </div>
              </li>
              <li class="timeline-inverted">
                <div class="timeline-image">
                  <h4>Let the
                    <br>Experience
                    <br>Begin!</h4>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>
	
	
	
	


    

    <!-- Footer -->
    <%@ include file="footer.jsp"  %>


  </body>

</html>
