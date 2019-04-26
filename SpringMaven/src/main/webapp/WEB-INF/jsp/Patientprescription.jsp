<%@page import="com.medcloud.Model.Prescription"%>
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
Prescription p=new Prescription();
Registration r=new Registration();
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://medicaltreatment.cyd5gs2hapgv.ap-northeast-1.rds.amazonaws.com:3306/medicaltreatment","root","medcloud");
Statement st=con.createStatement();
ResultSet rs= st.executeQuery("select * from patientinformation where emailid='"+email+"'");
while(rs.next())
{
	r.setFirstname(rs.getString(2));
	r.setMiddlename(rs.getString(3));
	r.setLastname(rs.getString(4));
	r.setUserid(rs.getInt(1));
}
%>


<%
ResultSet rs1=st.executeQuery("select * from prescription where userid='"+r.getUserid()+"'");
while(rs1.next()){
	p.setMedicine1(rs1.getString(2));
	p.setMedicine2(rs1.getString(3));
	p.setAdvice(rs1.getString(4));
	p.setDate(rs1.getTimestamp(5));
}
%>

<center>
Patient Name : <%=r.getFirstname()%> <%=r.getMiddlename() %> <%=r.getLastname() %> 
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
<br>
<br>
<h5>View the Report Of Patient : <a href="Viewreport">Click Here</a></h5>
<br>
<br>

<table border="2" bordercolor="#00FDDF" cellpadding="10">
<tr>
<th>Medicine1
</th>
<th>Medicine 2
</th>
<th>Advice
</th>
<th>Date & Time
</th>
</tr>
<tr>
	<td><%=p.getMedicine1() %>
	</td>
	<td><%=p.getMedicine2() %>
	</td>
	<td><%=p.getAdvice() %>
	</td>
	<td><%=p.getDate() %>
	</td>	
</tr>
</table>
</center>



</body>
</html>