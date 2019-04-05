<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="patientauthentication" method="post">
<b>Enter the registered Email or Mobile Number</b>
<input type="text" name="authenticationemail">
<input type="submit" value="Send Otp">
</form>
${otpmsg}
<form action="otpprocess" method="get">
<input type="text" name="otp" />
<input type="submit" value="Submit" />
</form>
</body>
</html>