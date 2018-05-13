<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "omadiki2.LocalBuddyDAO"%>
<%@ page import = "omadiki2.InterestsDAO"%>
<%@ page import = "omadiki2.LocalBuddy"%>
<%@ page import = "omadiki2.Traveller"%>
<%@ page import = "omadiki2.Interests"%>
<%@ page import= "java.util.*"%>
<%@ page errorPage="error.jsp"%>

<% 
	int location_id;
	int reason;
	
	if(request.getAttribute("message") != null) {
		location_id = (Integer)request.getAttribute("where");
		reason = (Integer)request.getAttribute("why");
	} else {
		String where = request.getParameter("where");
		String when = request.getParameter("when");
		String why = request.getParameter("why");
		
		session.setAttribute("date" , when);
		
		location_id=Integer.parseInt(where);
		reason =Integer.parseInt(why);
	}
	
	boolean study;
	boolean home;
	boolean exist=false;
	int count_study=0;
	int count_home=0;
	
	LocalBuddyDAO lbd= new LocalBuddyDAO();
	InterestsDAO intd = new InterestsDAO();
	List<LocalBuddy> locals=lbd.findLocals(location_id, reason);
	LocalBuddy local = null;
	
	

%>


<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Localbuddies</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Lobster|Saira+Semi+Condensed" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Indie+Flower" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/agency.min.css" rel="stylesheet">

  </head>

  <body id="page-top">

    <!-- Navigation -->
    <%@ include file="navbar.jsp"  %>
	<%
		traveller = (Traveller)session.getAttribute("traveller-object");
		
		
	%>

  

    
    <!-- Portfolio Grid -->
    <section class="bg-light" id="portfolio">
      <div class="container">
		<div class="col-lg-12 col-lg-3" style="margin-top: 55px;">
			<a href="index_an.jsp" class="btn btn-primary btn-lg" role="button" id="find"><i class="fa fa-arrow-left" aria-hidden="true"></i><b> Back</b></a>
		<br>
		<br>
		</div>
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Local buddies!</h2>
            <h3 class="section-subheading text-muted">Choose your buddie. Send a message. Let the experience begin!</h3>
          </div>
        </div>
        <div class="row">
		<% if(request.getAttribute("message") != null) { %>		
			<div class="alert alert-danger col-lg-12 text-center"><strong><%=(String)request.getAttribute("message") %></strong> </div><br>
		<% } %>
          <%if (locals.size()==0) {
			  if(reason==2) { %>
			  <div class="alert alert-danger col-lg-12 text-center">
				"<strong>Unfortunately there is no student in this city.</strong> 
				You may choose a local buddy to assist and guide you!"
			  </div><br>
			  <%locals=lbd.findLocals(location_id, 1);%>
		  <% } if(reason==3) { %>
				<div class="alert alert-danger col-lg-12 text-center">
				"<strong>Unfortunately there is no one to help you find a home in this city.</strong> 
				You may choose a local buddy to assist and guide you!"
			  </div><br>
			   <%locals=lbd.findLocals(location_id, 1);%>
		  <%
		  } } int size=locals.size();
		  
		  if(!(traveller==null)){
		  if((locals.size()==1) && (locals.get(0).getId() == traveller.getId())){
			 size=0;
			 %>
			  <div class="alert alert-danger col-lg-12 text-center">
				"<strong>Maybe you are the only local buddy in this city!</strong> 
			  </div><br>
		  
		  <%
		  }
		local = lbd.getLocalBuddyByTraveller(traveller.getId()); 
		  } 
			for(int i=size-1; i>=0; i--) {
				if(!(traveller==null)){
				if(locals.get(i).getId()==traveller.getId() && i>=1) {
					i--;
					exist=true;
				}
				}
				%>
			
		  <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" href="localprofil2.jsp?id=<%=locals.get(i).getId()%>">
              <div class="portfolio-hover">
				
			<%	List<Interests> my_interests = new ArrayList<Interests>();
				int trav_id=locals.get(i).getId();
				my_interests = intd.getMyInterests(trav_id);
				for(int j=0; j< my_interests.size(); j++) {%>
				<h5 class="btn btn-primary btn-xs " id="intrestings"><%=my_interests.get(j).getName()%></h5>
				<%}%>
				
				<hr> 
				
				<% if(locals.get(i).getStudent()) {%>
					<span class="fa-stack fa-2x" >
						<i class="fa fa-circle fa-stack-2x" style="color:#14141F;"></i>
						<i class="fa fa-graduation-cap fa-stack-1x fa-inverse"></i>
					</span>
					
				<%}%>
				<% if(locals.get(i).getFindAHome()) {%>
					<span class="fa-stack fa-2x" >
						<i class="fa fa-circle fa-stack-2x" style="color:#14141F;"></i>
						<i class="fa fa-home fa-stack-1x fa-inverse"></i>
					</span>
				<%}%>
				<hr>
				<div class="portfolio-hover-content">
					<i style="text-align:center" class="fa fa-plus fa-3x"></i>
                </div>
				
              </div>
              <img class="img-fluid" src="img/<%=locals.get(i).getPhoto()%>.jpg" alt="" id="photo">
            </a>
            <div class="portfolio-caption">
              <h4><%=locals.get(i).getName()%></h4>
              <p class="text-muted"><%=locals.get(i).getMyDescription()%></p>
            </div>
          </div>
          
		 
        
		  <%
		  if(!(traveller==null)){
			if(i==1 && traveller.getLocation().getIdLocation()==location_id && local!=null && exist==false){
					i=0;
			}
			}}%>
		</div>
      </div>
    </section>


    

    
  </body>

</html>
