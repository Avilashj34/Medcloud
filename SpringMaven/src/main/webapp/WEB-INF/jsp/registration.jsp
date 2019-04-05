<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Registration</title>
</head>
<body>
<h1>Register</h1>
<form action="register" method="post" enctype="multipart/form-data">
<table>
<tr><th>
<!-- HEere the name should be same as the database attribute name  -->
First Name	</th><th><input type="text" name="firstname">
</th></tr>
<tr><th>Middle Name	</th><th><input type="text" name="middlename"></th></tr>
<tr><th>Last Name </th><th><input type="text" name="lastname"></th></tr>
<tr><th>
Mobile No. </th><th><input type="text" name="phonenumber"></th></tr>
<tr><th>
Email Id  </th><th>	<input type="text" name="emailid"></th></tr>
<tr><th>
Country  </th><th>	<input type="text" name="country" required> </th></tr>	
<tr><th>
Address  </th><th>	<input type="text" name="address" required> </th></tr>
<tr><th>
Photo    </th><th>	<input type="file" name="photo" required accept="image/*"> </th></tr>
<tr><th>
Kyc		</th> <th>	<input type="text" name="kyc"> </th></tr>
<tr><th>
Password </th> <th>	<input type="text" name="password"> </th></tr>
<tr><th>
Age </th> <th>	<input type="text" name="age"></th></tr>



 <tr><th></th><th>
 
 <input type="submit" name="register" value="Register"></th></tr>
</table>

<a href="Patientlogin">Already registered? Login Here</a>
</form>
</body>
</html>