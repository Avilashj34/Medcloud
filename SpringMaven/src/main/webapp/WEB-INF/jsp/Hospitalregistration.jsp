<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="hospitalprocess" method="post"  enctype="multipart/form-data">
<table>
         <tr>    
          <td>Hospital Name : </td>   
          <td><input name="hospname" type="text" /></td>  
         </tr> 
         <tr>    
          <td>Password : </td>   
          <td><input type="password" name="password"  /></td>  
         </tr>     
         <tr>    
          <td>Address : </td>   
          <td><input name="hospaddress" type="text" /></td>  
         </tr>    
         <tr>    
          <td>City :</td>    
          <td><input name="city" type="text" /></td>  
         </tr>  
          
          
         <tr>    
          <td>Phone Number :</td>    
          <td><input type="text" name="mobile"   /></td>  
         </tr>   
         <tr>    
          <td>Description : </td>   
          <td><input name="longnote" type="text" /></td>  
         </tr>    
 
         <tr>    
          <td> </td>    
          <td><input type="submit" value="Register" /></td>    
         </tr>    
        </table> 
        <a href="Hospitallogin">Already registered? Login Here</a>   
</form>


</body>
</html>