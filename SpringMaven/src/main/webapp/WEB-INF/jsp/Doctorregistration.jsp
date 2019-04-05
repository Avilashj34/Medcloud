<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*" %>
    
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctor Registration</title>
</head>
<%

%>
<body>
<form action="doctorprocess" method="post"  enctype="multipart/form-data">
<table>
         <tr>    
          <td>First Name : </td>   
          <td><input name="firstname" type="text" /></td>  
         </tr>      
         <tr>    
          <td>Last Name : </td>   
          <td><input name="lastname" type="text" /></td>  
         </tr>    
         <tr>    
          <td>Email Id :</td>    
          <td><input name="emailid" type="text" /></td>  
         </tr>  
         <tr>    
          <td>Password : </td>   
          <td><input type="password" name="password"  /></td>  
         </tr> 
          
         <tr>    
          <td>Photo :</td>    
          <td><input type="file" name="photo"  accept="image/*" /></td>  
         </tr>   
         <tr>    
          <td>Description : </td>   
          <td><input name="description" type="text" /></td>  
         </tr>    
         <tr>    
          <td>Specialty  :</td>    
          <td><input name="specialty" type="text" /></td>  
         </tr>  
         <tr>    
          <td> </td>    
          <td><input type="submit" value="Save" /></td>    
         </tr>    
        </table>  
        <a href="Doctorlogin">Already registered? Login Here</a>  
</form>
</body>

<%

%>
</html>