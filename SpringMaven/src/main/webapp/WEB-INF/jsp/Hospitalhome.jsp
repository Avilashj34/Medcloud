<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

%>

<h1>Welcome</h1>
Patient Queue :${hospitalmsg}

<a href="Hospitalregistration">Register Hospital Details</a> </br>
<a href="Hospitallogin">Hospital Login</a> </br>
<a href="Doctorregistration">New Doctor Register here</a> </br>
<a href="Doctorlogin">Doctor login here</a> </br>
<a href="Patientverification"> Update Patient Report</a>
</br>

<a href="List_Of_Doctor">See Doctor List</a>
<!-- Controller is VERIFYSENDCONTROLLER -->
<form action="SendPatientToDoctor" method="post">
<b>Enter the E-Mail  of Patient</b>
<input type="text" name="sendpatientemail">
<input type="submit" value="Send Patient">
</form>
<a href="logout">Logout</a>
</body>
</html>