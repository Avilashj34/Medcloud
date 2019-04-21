<%@page import="com.medcloud.Dao.BlManager"%>
<%@page import="com.medcloud.Model.Report"%>
<%@page import="com.medcloud.Model.Registration" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<spring:url value="resources/css/bootstrap.css" var="bootstrap"></spring:url>
<spring:url value="resources/css/style.css" var="style"></spring:url>
<spring:url value="resources/css/fontawesome-all.css" var="fontawesome"></spring:url>
<spring:url value="resources/css/popuo-box.css" var="popuo-box"></spring:url>
<spring:url value="resources/css/menu.css" var="menu"></spring:url>
<spring:url value="resources/css/flexslider.css" var="flexslidercss"></spring:url>
<spring:url value="resources/js/imagezoom.js" var="imagezoom"></spring:url>
<spring:url value="resources/img/si1.jpg" var="si"></spring:url>
<spring:url value="resources/img/off1.png" var="off1"></spring:url>
<spring:url value="resources/img/off2.png" var="off2"></spring:url>
<spring:url value="resources/img/logo2.png" var="logo2"></spring:url>
<spring:url value="resources/js/bootstrap.js" var="boot"></spring:url>
<spring:url value="resources/js/easing.js" var="easing"></spring:url>
<spring:url value="resources/js/move-top.js" var="move"></spring:url>
<spring:url value="resources/js/jquery.flexslider.js" var="flexsliderjs"></spring:url>
<spring:url value="resources/js/minicart.js" var="mini"></spring:url>
<spring:url value="resources/js/scroll.js" var="scroll"></spring:url>
<spring:url value="resources/js/jquery.magnific-popup.js" var="magnificpopup"></spring:url>
<spring:url value="resources/js/jquery-2.2.3.min.js" var="jquery"></spring:url>
<spring:url value="resources/js/SmoothScroll.min.js" var="Smooth"></spring:url>
<title>View Report</title>
</head>
<body>
<%
Report r= new Report();
Registration register=new Registration();
BlManager bl=new BlManager();

String email=(String)session.getAttribute("patientemailsession");
System.out.println("Email is :"+email);
if(email==null){
	response.sendRedirect("Doctorlogin");
	
}
else
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://medicaltreatment.cyd5gs2hapgv.ap-northeast-1.rds.amazonaws.com:3306/medicaltreatment","root","medcloud");
	Statement st=con.createStatement();
	ResultSet rs= st.executeQuery("select * from patientinformation where emailid='"+email+"'");
	while(rs.next())
	{
	System.out.println(rs.getString(2));
	register.setUserid(rs.getInt(1));
	register.setFirstname(rs.getString(2));
	}
	int id=register.getUserid();
	ResultSet rs1=st.executeQuery("select id from report where userid="+id+" ");
	System.out.println("Report Id"+id);
	
	//d=bl.SearchDoctor(email);
	
 %>
 <!-- EntryController -->
 <%@include file="header.jsp" %>
 
 <%while(rs1.next()){
	 r.setId(rs1.getInt(1));
	 int id1=r.getId();
%>
   <img src="GetReportPic/<c:out value='<%=id1 %>'/>" data-imagezoom="true" class="img-fluid" width="150" height="200" /> 
 
 <%} %>
<%
con.close();
} %>


<script src="${imagezoom}"></script>
</body>

</html>