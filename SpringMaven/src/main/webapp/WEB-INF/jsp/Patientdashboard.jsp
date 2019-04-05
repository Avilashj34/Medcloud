<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"  %>
    <%@page import="java.io.OutputStream" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=(String)session.getAttribute("patientemailsession");
if(email==null){
	response.sendRedirect("Patientlogin");
	
}
else
{
	

%>
<h1>Patient Dashboard</h1>

${msg}
<a href="logout">Logout</a>

<br><br>

<a href="Updatereport">Update Report</a>
<br>

<a href="Patientprofile">View Profile</a>
<%} %>
</body>
</html>