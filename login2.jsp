<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "omadiki2.*"%>
<%@ page errorPage="error.jsp"%>


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
	
	<br>
	<br>
	<br>
	<br>
	<div>
		<div class="heading">
			
			<div class="form-signin-heading text-center">
					<span class="fa-stack fa-3x">
						<i class="fa fa-circle fa-stack-2x text-primary"></i>
						<i class="fa fa-key fa-stack-1x fa-inverse"></i>
					</span>
				</div>
				<h2 class="form-signin-heading text-center" >Sign in!</h2>
				
			
		</div>
        <div class="container">
		<% if(request.getAttribute("message") != null) { %>		
			<div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
		<% } %>
		
			<hr>
          
			<form name='form1' method='post' action='login_controller.jsp' class="form-horizontal">
				
				<div class="form-group row">
                    <label for="email" class="col-sm-2 offset-sm-2 control-label" style="text-align:right"><b>Email:</b></label>
					<div class="col-sm-5">
						<input type="text" name="email" placeholder="Email" class="form-control" id="email">
					</div>
                </div>
                <div class="form-group row">
                    <label for="password" class="col-sm-2 offset-sm-2 control-label" style="text-align:right"><b>Password:</b></label>
					<div class="col-sm-5">
						<input type="password" name="password" placeholder="Password" class="form-control" id="password">
					</div>
					
                </div> 
				<div class="form-group row">
					<%Integer id = (Integer) request.getAttribute("local_id");
						if(id==null){id=0;}
					%>
					<input type="hidden" name="local_id" class="form-control" value=<%=id%>>
				</div>
				<br>
				<br>
				<div class="text-center">
                    <button type="submit" class="btn btn-lg btn-primary " id="find"><b>Sign in</b></button>
                </div> 
            </form>  
		
        </div>
        <br>
		
		<div class="text-center">
			<h6><small>Don't you have an account yet?</small></h6> 
			<a class="btn btn-link" href="register2.jsp" role="button">Register</a>
		</div>
    </div>
	  <br>
	  
	
      

   
    
  </body>

</html>
