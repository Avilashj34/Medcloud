<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
${msg}
<form id="login" method="post" action="hospitallogin" >
 
            <label >Enter your HospitalID</label>
            <input type="text" id="email" name="hospId"  /><br>
            <label >Please enter your password</label>
            <input type="password" name="password" id="password" /><br>
            <input type="submit" value="Submit" />
        </form>
</body>
</html>