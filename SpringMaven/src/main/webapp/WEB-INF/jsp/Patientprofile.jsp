<%@page import="com.medcloud.Model.Registration"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.medcloud.Model.*"  %>
    <%@ page import="java.util.*" %>
    <%@page import="com.medcloud.Controller.*" %>
    <%@page import="java.io.OutputStream"%>
    <%@page import="com.medcloud.Dao.*" %>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${fname} profile</title>
</head>
<body>

<%
String email=(String)session.getAttribute("patientemailsession");
Registration r;
if(email==null)
{
	response.sendRedirect("Patientlogin");
}
else
{
	System.out.println(email);
%>
<h1>Profile</h1>
The UserId is:${userid}
 Name : <b>
${fname} ${mname} ${lname}</b><br>

<br>
The Medicine which you have to take is  : ${medicine}
Your Doctor :${docname}

<img src="GetPic/<c:out value='${userid }'/>" width="200" height="150"/>

<a href="logout">Logout</a>


<%} %>
</body>
</html>