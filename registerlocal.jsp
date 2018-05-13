<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "omadiki2.*"%>
<%@ page errorPage="error.jsp"%>



<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">


    <title>Register as a localbuddy</title>

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

	<script src="vendor/js/jquery-1.11.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>

      textarea.ng-invalid
      {
        border: solid #ff0055 2px;
      }

    </style>

    <script src="js/script.js"></script>


  </head>

  <body id="page-top" ng-app="mainModule">

    <!-- Navigation -->
    <%@ include file="navbar.jsp"  %>

	<br>
	<br>
	<br>

		<div class="heading">

			<div class="form-signin-heading text-center">
					<span class="fa-stack fa-3x">
						<i class="fa fa-circle fa-stack-2x text-primary"></i>
						<i class="fa fa-user fa-stack-1x fa-inverse"></i>
					</span>
				</div>
				<h2 class="form-signin-heading text-center" >Discover the world of localbuddy!</h2>
				<hr>

		</div>
        <div class="container" ng-controller="mainController">
          <% if(request.getAttribute("message") != null) { %>
			<div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
		<br>
		<% } %>



			<form  name="local" method='post'  action='registerlocal_controller.jsp' novalidate>
				<div class="form-group row ">
            <label for="city_description" class="col-sm-2 control-label" style="text-align:right"><b> City description:</b></label>
					<div class="col-sm-10" >
						<textarea type="text" id="city_description" name="city_description" rows="4" placeholder="Tell us about your city and the things you like to do" class="form-control" ng-model="localForm.city_description" required></textarea>
					</div>
                </div>
				<br>

				<div class="form-group row ">
            <label for="lquote" class="col-sm-2 control-label" style="text-align:right"><b> Quote:</b></label>
					<div class="col-sm-10" >
						<textarea type="text" name="quote" rows="1" placeholder="Tell us a quote that expresses you" class="form-control" id="lquote" ng-model="localForm.quote" required></textarea>
					</div>
                </div>
				<br>
				<div class = "form-group-row">
					<label for="students" class="col-sm-2 control-label" style="text-align:right"><b> For student:</b></label>

				<label for="student" class="radio-inline">
					<input type="radio" name="student" ng-model="localForm.student" value="available" > Yes
				</label>
				<label for="student" class="radio-inline">
					<input type="radio" name="student" ng-model="localForm.student" value="not available" > No
				</label><br>
				<label class="offset-lg-1">
          <i>"You are <strong>{{localForm.student}}</strong> to help a student with his registration and suggest him places to go out!"</i>
				<!--<h6> <small> <i> Please choose if you are willing to help a student with his registration and suggest him places to go out!</i></small></h6>-->
				</label>
				</div>
      </br>
				<div class = "form-group">
					<label for="findahome" class="col-sm-2 control-label" style="text-align:right"><b> Find a home: </b></label>

				<label for="home" class="radio-inline">
					<input id="home" type="radio" name="findahome" ng-model="localForm.findahome" value="available"> Yes
				</label>
				<label for="nohome" class="radio-inline">
					<input id="nohome" type="radio" name="findahome" ng-model="localForm.findahome" value="not available" > No
				</label><br>
				<label class="offset-lg-1">
          <i>"You are <strong>{{localForm.findahome}}</strong> to help someone find a home in your town!""</i>
				<!--<h6> <small><i> Please choose if you are willing to help someone find a home in your town!</i></small>-->
      </label></br>

				</div>
				<div class="text-center ">
                    <button type="submit" class="btn btn-lg btn-primary " id="find"  ng-click="localForm.submitTheForm()" ng-disabled="local.$invalid"><b>Register as local</b></button>
                </div>
            </form>
        </div>
        <br>
		<br>



  </body>

</html>
