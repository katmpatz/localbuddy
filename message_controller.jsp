<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="omadiki2.*" %>
<%@ page errorPage="error.jsp"%>


<% 
   String answer = request.getParameter("answer");
   String id = request.getParameter("id");
   int com_id = Integer.parseInt(id);
   CommunicationDAO cd = new CommunicationDAO();
   
   if(answer.equals("delete")) {
	   cd.deleteRequest(com_id);
   } else if (answer.equals("accept")) {
	   cd.acceptRequest(com_id);
   }
	
   
%>
<jsp:forward page = "communication.jsp"/>

