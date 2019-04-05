<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
else
{
%>

<form action="reportprocess" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" />
<input type="file" name="image" />

<input type="submit" value="Update Report" />

</form>
<%} %>
</body>
</html>