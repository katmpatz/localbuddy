<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "omadiki2.DataValidation"%>
<%@ page import = "omadiki2.LocalBuddyDAO"%>
<%@ page import = "omadiki2.TravellerDAO"%>
<%@ page import = "omadiki2.Traveller"%>
<%@ page import = "omadiki2.LocalBuddy"%>
<%@ page errorPage="error.jsp"%>

<!--String photo = request.getParameter("pic");-->
<%
	 String city_description = request.getParameter("city_description");
	 String quote = request.getParameter("quote");
	 String stud = request.getParameter("student");
	 String home = request.getParameter("findahome");
	 boolean student = false;
	 boolean findahome = false;

	 if(stud.equals("available")){
		 student = true;
	 }

	 if(home.equals("available")){
		 findahome = true;
	 }


	 TravellerDAO td = new TravellerDAO();
	 LocalBuddyDAO ld = new LocalBuddyDAO();
	 DataValidation dv = new DataValidation();

	  Traveller trav = (Traveller)session.getAttribute("traveller-object");
	  if(trav==null) {
		request.setAttribute("message","You have to login.");
		%>

		<jsp:forward page="login2.jsp"/>

		<%}
			LocalBuddyDAO lbd = new LocalBuddyDAO();
			LocalBuddy loc = lbd.getLocalBuddyByTraveller(trav.getId());
			if(dv.isTextValid(city_description) && dv.isTextValid(quote) && (loc==null) )
			{

			 LocalBuddy local = new LocalBuddy( trav.getId(), trav.getName(), trav.getSurname(), trav.getEmail(), trav.getPassword(), trav.getDescription(),
			 trav.getLocation(),trav.getPhoto(), student, findahome, city_description, quote);

			 ld.saveLocalBuddy(local);

			request.setAttribute("message", "You have been successfully registered as a localbuddy!");
			 %>
	 <jsp:forward page="profil.jsp"/>

			<% }else {
				if(!(loc==null)) {
					request.setAttribute("message", "You have been already registered as a localbuddy!!");
				} else {
					request.setAttribute("message", "Input text must not be null!");
				}
				%>
			<jsp:forward page = "registerlocal.jsp"/>
			<%}%>
