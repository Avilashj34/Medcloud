 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
<html>

<head>
  <!--Import Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!--Import materialize.css-->
  <link type="text/css" rel="stylesheet" href="<c:url value="resources/css/materialize.min.css" />" media="screen,projection" />
  <link type="text/css" rel="stylesheet" href="<c:url value="resources/css/main.css " />" />
  <link rel="stylesheet" href="<c:url value="resources/css/view.css " />">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <!--Let browser know website is optimized for mobile-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
  <title>Admin Panel</title>
    <style>

    header, main, footer,.content {
      padding-left: 300px;
    }

    @media only screen and (max-width : 992px) {
      header, main, footer,.content {
        padding-left: 0;
      }
    }
  </style>
</head>
<body>

<!--SideNav Finished-->

<table>
      <tr>
        <th scope="col">Id</th>
        <th scope="col">First Name</th>
        <th scope="col">Middle Name</th>
        <th scope="col">Last Name</th>
        <th scope="col">Phone Number</th>
        <th scope="col">Email id</th>
        <th scope="col">Password</th>
        <th scope="col">Address</th>
        <th scope="col">Photo</th>
        <th scope="col">age</th>
      </tr>
      <c:forEach items="${list}" var="p">
      <tr>
      <td>${p.userid}</td>
      <td>${p.firstname}</td>
      <td>${p.middlename}</td>
      <td>${p.lastname}</td>
      <td>${p.phonenumber}</td>
      <td>${p.emailid}</td>
      <td>${p.password}</td>
      <td>${p.address}</td>
      <td><img width="100" height="100" src="GetPic/<c:out value='${p.userid}'/>"></td>
      <td>${p.age}</td>
      </tr>
      </c:forEach>
  </table>




</body>

</html>
