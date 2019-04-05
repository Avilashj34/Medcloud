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
String email=(String)session.getAttribute("doctoremailsession");
if(email==null){
	response.sendRedirect("Doctorlogin");
	
}
else
{
	
 %>
 <h1>Doctor dashboard</h1>
${msg}
<form action="prescription" method="post">
Enter Mail Id :
<input type="text" name="pemail">
<input type="submit" value="Submit">
</form>
<br>
<a href="Doctorprofile">View Profile</a>
<a href="logout">Logout</a>
<%} %>
</body>
</html>