<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "omadiki2.*"%>
<%@ page errorPage="error.jsp"%>


<% InterestsDAO interests = new InterestsDAO(); %>
<!DOCTYPE html>
<html lang="en">

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
	<div >
		<div class="heading">
			
			<div class="form-signin-heading text-center">
					<span class="fa-stack fa-3x">
						<i class="fa fa-circle fa-stack-2x text-primary"></i>
						<i class="fa fa-user fa-stack-1x fa-inverse"></i>
					</span>
				</div>
				<h2 class="form-signin-heading text-center" >Let the experience begin!</h2>
				<hr>
			
		</div>
        <div class="container">
			<% if(request.getAttribute("message") != null) { %>		
			<div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
		<br>
		<% } %>
			
          
			<form method='post'  action='register_controller.jsp'>
				
				<section class="bg-light container">
				<h4 class="text-center">1. Personal information: </h4><hr>
				<div class="form-group row">
                    <label for="first-name" class="col-sm-2 col-md-2 col-lg-2 control-label" style="text-align:right"><b>First Name:</b></label>
					<div class="col-sm-10 col-md-4 col-md-4">
						<input type="text" name="first_name" placeholder="First name" class="form-control" id="first-name">
					</div>
               
               
                    <label for="last-name" class="col-sm-2 col-md-2 col-lg-2 control-label" style="text-align:right"><b>Last name:</b></label>
					<div class="col-sm-10 col-md-4 col-md-4">
						<input type="text" name="last_name" placeholder="Last name" class="form-control" id="last-name">
					</div>
                </div>
				<div class="form-group row">
                    <label for="city" class="col-sm-2 col-md-2 col-lg-2 control-label" style="text-align:right"><b>City:</b></label>
					<div class="col-sm-10 col-md-4 col-md-4">
						<input type="text" name="city" placeholder="City" class="form-control" id="city">
					</div>
              
				
                    <label for="country" class="col-sm-2 col-md-2 col-lg-2 control-label" style="text-align:right"><b>Country:</b></label>
					<div class="col-sm-10 col-md-4 col-md-4">
						<input type="text" name="country" placeholder="Country" class="form-control" id="country">
					</div>
                </div>
              
				<div class="form-group row ">
                    <label for="description" class="col-sm-2 control-label" style="text-align:right"><b>About yourself:</b></label>
					<div class="col-sm-10" >
						<textarea type="text" name="description" rows="4" placeholder="Tell us something about yourself!" class="form-control" id="description"></textarea>
					</div>
                </div>
				<br>
				
				
				</section>
				
				<section>
				<h4 class="text-center">2. Your interests: </h4><hr>
				
				<div class="form-group row">
					<div class="col-xs-12 col-sm-6 col-md-4">
					<h6 class="text-center">Sports</h6><hr>
						<ul  class="list-unstyled">
							<%for(int i=0; i< 5;i++) {%>
							<li><label class="checkbox-inline"><input type="checkbox" name= <%=interests.getInterests().get(i).getName()%>> <%=interests.getInterests().get(i).getName()%></label></li>
							<%}%>
						</ul>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-4">
					<h6 class="text-center">Entertainment</h6><hr>
						<ul class="list-unstyled">
							<%for(int i=5; i< 10;i++) {%>
							<li><label class="checkbox-inline"><input type="checkbox" name= <%=interests.getInterests().get(i).getName()%>><%=interests.getInterests().get(i).getName()%></label></li>
							<%}%>
						</ul>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-4">
					<h6 class="text-center">Hobbies</h6><hr>
						<ul class="list-unstyled">
							<%for(int i=10; i< 15;i++) {%>
							<li><label class="checkbox-inline"><input type="checkbox" name= <%=interests.getInterests().get(i).getName()%>> <%=interests.getInterests().get(i).getName()%></label></li>
							<%}%>
						</ul>
					</div>

				
				</div>
				
				</section>
				
				<br>
				
				<section class="bg-light">
				<h4 class="text-center"> 3. Account Information: </h4><hr>
				<div class="form-group row">
                    <label for="email" class="col-sm-2 offset-sm-2 control-label" style="text-align:right"><b>Email:</b></label>
					<div class="col-sm-5">
						<input type="text" name="email" placeholder="Email" class="form-control" id="email">
					</div>
                </div>
                <div class="form-group row">
                    <label for="password1" class="col-sm-2 offset-sm-2 control-label" style="text-align:right"><b>Password:</b></label>
					<div class="col-sm-5">
						<input type="password" name="password1" placeholder="Password" class="form-control" id="password1">
					</div>
                </div> 
				<div class="form-group row">
                    <label for="password2" class="col-sm-2 offset-sm-2 control-label" style="text-align:right"><b>Repeat password:</b></label>
					<div class="col-sm-5 ">
						<input type="password" name="password2" placeholder="Password" class="form-control" id="password2">
					</div>
                </div> 
				</section>
				
				<br>
				<br>
				<div class="text-center ">
                    <button type="submit" class="btn btn-lg btn-primary " id="find"><b>Register</b></button>
                </div> 
            </form>            
        </div>
        <br>
      </div>
      
	    <!-- Footer -->
     <%@ include file="footer.jsp"  %>

   
   
  </body>

</html>
