<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "omadiki2.TravellerDAO"%>
<%@ page import = "omadiki2.InterestsDAO"%>
<%@ page import = "omadiki2.LocationDAO"%>
<%@ page import = "omadiki2.DataValidation"%>
<%@ page import = "omadiki2.Interests"%>
<%@ page import = "omadiki2.Location"%>
<%@ page import = "omadiki2.Traveller"%>
<%@ page errorPage="error.jsp"%>

<!--String photo = request.getParameter("pic");-->
<% 
   String first_name = request.getParameter("first_name");
	 String last_name = request.getParameter("last_name");
	 String city = request.getParameter("city");
	 String country = request.getParameter("country");
	 String description = request.getParameter("description");
	 String photo = "default";
	 String email = request.getParameter("email");
	 String password1 = request.getParameter("password1");
	 String password2 = request.getParameter("password2");

	 TravellerDAO td = new TravellerDAO();
	 InterestsDAO ind = new InterestsDAO();
	 LocationDAO ld = new LocationDAO();
	 DataValidation dv = new DataValidation();
	 
	 Boolean wrongInput = true;
	 
	 List<Interests> interests = ind.getInterests();
		 List<Interests> myInterests = new  ArrayList<Interests>();
		 String anInterest;
		 String name;
		 for(int i=0; i<interests.size(); i++) {
				 name = ind.getInterests().get(i).getName();
				 anInterest = request.getParameter(name);
				 Interests in = ind.getInterestbyName(name);
				 if(!(anInterest == null)) {
					 myInterests.add(in);
				 }
	 }
	 
if(!(td.findTraveller(email)==null)) {
				request.setAttribute("message", "This email has been already used!");
				%>
			<jsp:forward page = "register2.jsp"/>
			<%} else {
			
			if(dv.isTextValid(first_name) && dv.isTextValid(last_name)&& dv.isTextValid(city) && dv.isTextValid(country) && dv.isTextValid(description) && dv.isValidEmailAddress(email)&& dv.isPasswordValid(password1) && dv.samePassword(password1, password2))
			{
			wrongInput = false;
			boolean flag=false;
			Location location=null;
			 
			 List<Location> loc= ld.getLocation();
			 for(int l=0;l<loc.size();l++) {
				if(loc.get(l).getCity().equals(city)) {
					flag=true;
					location = loc.get(l);
				}
			 }
			 if(flag==false) {
				location = new Location(city, country);
				ld.saveLocation(location);
			 }
			 
			 Traveller tra = new Traveller(first_name, last_name, email, password1, description, location, photo);
			 td.saveTraveller(tra);
			 
			 session.setAttribute("traveller-object" ,tra);

			 int travellerId = tra.getId();
			ind.saveMyInterests(myInterests, travellerId);%>
			<jsp:forward page = "profil.jsp"/>
			<%}%>
 <!DOCTYPE html>
<html lang="en" style = "height:100%;">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">


    <title>Register</title>

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
	
	<div class="container">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			
			<!-- Page Title -->
		
			<div class="page-header">
				<h1>Register Information</h1>
			</div>
		
				
		
		
		
			
			<div class="alert alert-danger" role="alert">
			<ol>
			<%if(!(dv.isTextValid(first_name) && dv.isTextValid(last_name)&& dv.isTextValid(city) && dv.isTextValid(country) && dv.isTextValid(description))) {%>
				<li>Input text must be at least 2 characters long</li>
			<%} 
			if(!(dv.isValidEmailAddress(email))) {%>
				<li> The email is not valid</li>
			<%}
			if(!(dv.isPasswordValid(password1))) {%>
				<li>The Password must be at least 6 characters long</li>
			<%}
			if(!(dv.samePassword(password1, password2))) {%>
				<li>First and second passwords are not the same</li>
			<%}%>
			</ol>
			</div>
			<div class='col-sm-offset-5'>
			<a class='btn btn-primary btn-lg' href='register2.jsp' id='find' role='button'><span class='glyphicon glyphicon-chevron-left'></span>Back to the form</a>
			</div>
			</div>
			<%}%>
		
		
		
	  
	
 

   
    
  </body>

</html>
