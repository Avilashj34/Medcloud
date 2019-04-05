<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Login</title>
</head>
<body>
<h1>Login Page</h1>
<!-- Here I got error due to the name (Because in controller i have declared PatientLogin and it has two field email and password and here i have written username and password 
So we got to knoe thst the name and the getter setter method should be  same
) -->
${warning}
<form id="login" method="post" action="login" >
 
            <label >Enter your EmailId</label>
            <input type="text" id="email" name="emailid"  /><br>
            <label >Please enter your password</label>
            <input type="password" name="password" id="password" /><br>
            <input type="submit" value="Submit" />
        </form>
       <h1> ${msg } </h1>
        
</body>
</html>