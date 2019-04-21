<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*,java.sql.*" %>
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
<title>MedCloud | Prescription</title>
<style type="text/css">

</style>
</head>
<body>
<%@ include file="header.jsp" %>
<%
String pid=(String)session.getAttribute("patientID");
String email=(String)session.getAttribute("patientemailsession");

Registration r=new Registration();
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://medicaltreatment.cyd5gs2hapgv.ap-northeast-1.rds.amazonaws.com:3306/medicaltreatment","root","medcloud");
Statement st=con.createStatement();
ResultSet rs= st.executeQuery("select * from patientinformation where emailid='"+email+"'");
while(rs.next())
{
	r.setFirstname(rs.getString(2));
	

%>
First Name : <%=r.getFirstname() %>
<%} %>
<center>
<form action="prescriptionprocess" method="post">
<table>
<tr>
<td>
Medicine 1 </td><td><input type="text" name="medicine1"></td>
</tr>

<tr>
<td>
Med 2 </td><td> <input type="text" name="medicine2"></td></tr>
<tr>
<td>
Advice </td><td> <input type="text" name="advice"></td></tr>
<tr>
<td>&nbsp;
</td><td>
<input type="submit" value="submit data"></td></tr>
</table>
</form>
<h3>View the Report Of Patient<a href="Viewreport">Click Here</a></h3>
</center>

</body>
</html>