<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.io.*,java.sql.*" %>
    
    <%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=(String)session.getAttribute("patientemailsession");
if(email==null)
{
	response.sendRedirect("Patientlogin");
}
else{
%>

<form:form action="routineprocess" method="post">	
	
	<form:hidden path="id" name="id"/><br>
	Weight : <form:input path="weight"/><br>
	Blood Pressure : <form:input path="bloodpressure"/><br>
	Height : <form:input path="height"/><br>
	Pulse : <form:input path="pulse"/><br>
	Sugar : <form:input path="sugar"/><br>
	
	<input type="submit" value="Update">
	
</form:form>

</body>
<%} %>
</html>