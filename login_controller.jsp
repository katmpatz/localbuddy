<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="omadiki2.*" %>
<%@ page errorPage="error.jsp"%>


<% 
   String email = request.getParameter("email");
   String password = request.getParameter("password");
   String lid = request.getParameter("local_id");
	
   int id = Integer.parseInt(lid);
 
   TravellerDAO td = new TravellerDAO();
   
   try {
	   td.authenticate(email,password);
   } catch(Exception e) {
	   request.setAttribute("message", e.getMessage());
	   request.setAttribute("local_id", id);
%>
<jsp:forward page = "login2.jsp"/>
<%
   }
    Traveller trav = td.findTraveller(email);
	session.setAttribute("traveller-object" , trav);
	if(trav.getId()==id) {
		request.setAttribute("message", "You can not send request to yourself!");
		request.setAttribute("where", trav.getLocation().getIdLocation());
		request.setAttribute("why", 1);
		%>
		<jsp:forward page = "localb.jsp"/>
		<%
	}
   
	if(!(id==0)) { 
	request.setAttribute("id", id);
	%>
	<jsp:forward page = "localprofil2.jsp"/>
	<%} else {%>
	<jsp:forward page = "index_an.jsp"/>	
	<%}%>