<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="omadiki2.*" %>
<%@ page errorPage="error.jsp"%>


<%
	String traveller_id = request.getParameter("traveller_id");
    String localbuddy_id = request.getParameter("localbuddy_id");
	String mes = request.getParameter("mes");
	String when = (String)session.getAttribute("date");

  int trav_id = Integer.parseInt(traveller_id);
	int local_id = Integer.parseInt(localbuddy_id);

	TravellerDAO td = new TravellerDAO();
	LocalBuddyDAO lbd = new LocalBuddyDAO();
	CommunicationDAO cd = new CommunicationDAO();

	Traveller trav = td.getTravellerByID(trav_id);
	LocalBuddy local = lbd.getLocalBuddyById(local_id);

	Communication com= new Communication(trav ,local, when , false, mes);
	cd.saveCommunication(com);





	request.setAttribute("message", "Your message has been succesfully send!");
	request.setAttribute("id", local.getId());

	 %>
	<jsp:forward page="localprofil2.jsp"/>
