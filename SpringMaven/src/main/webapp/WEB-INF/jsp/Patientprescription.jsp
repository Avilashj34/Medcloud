<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*" %>
    <%@page import="java.util.*" %>
    <%@page import="com.medcloud.Controller.*" %>
    <%@page import="com.medcloud.Dao.*" %>
    <%@page import="com.medcloud.Model.Registration" %>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String pid=(String)session.getAttribute("patientID");
System.out.println(pid);
if(pid==null)
{
	response.sendRedirect("Doctorlogin");
}
else
{
%>
First Name:${sessionScope.Data}
${pid}
<form action="prescriptionprocess" method="post">
Medicine 1 :<input type="text" name="medicine1"><br>
Med 2<input type="text" name="medicine2"><br>
Advice <input type="text" name="advice"><br>
<input type="submit" value="submit data">
</form>
<%} %>
</body>
</html>