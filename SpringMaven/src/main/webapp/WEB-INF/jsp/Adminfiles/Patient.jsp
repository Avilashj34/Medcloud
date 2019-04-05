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
  <title>Admin Pannel</title>
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
<nav class="blue">
  <div class="nav wrapper">
    <div class="container">
      <a href="admin.html" class="brand-logo center">Admin</a>

<a href="" class="button-collapse show-on-large" data-activates="sidenav"><i class="material-icons">menu</i></a>
<ul class="right collection hide-on-small-and-down" style="margin:0px;
      border: 0px solid transparent">
        <li class="collection-item avatar" style="background-color: transparent;min-height: 60px;">
          <a href="" class="tooltipped" data-tooltip="Notifications" data-position="top">
            <i class="material-icons circle white blue-text">notifications_active</i></a>
        </li>

      </ul>
    </div>
  </div>
</nav>

<ul class="side-nav fixed" id="sidenav">
  <li>
    <div class="user-view">
<div class="background">
  <img src="img/img11.jpg" alt="" class="responsive-img">
</div>
<a href="">
  <img src="img/user.png" alt="" class="circle">
</a>
<span class="white-text name">Admin Name</span>

    </div>
  </li>
  <ul class="mainmenu">
  <li>
    <a href=""><i class="material-icons blue-text">dashboard</i>View Data
    </a>
    <ul class="submenu1">
      <li><a href="Hospital">Hospital data</a></li>
    <li><a href="Doctor">Doctor data</a></li>
    <li><a href="Patient">Patient data</a></li>
    <li><a href="Prescription">Prescription data</a></li>
    <li><a href="Routine">Routine data</a></li>
        </ul>
  </li>


  <li>
      <a href=""><i class="material-icons blue-text">description</i>Add
      </a>
      <ul class="submenu2">
        <li><a href="AddHospital">Add Hospital</a></li>
          <li><a href="AddDoctor">Add Doctor</a></li>
          </ul>
  </li>
  </ul>

<div class="divider"></div>

<li>
    <a href=""><i class="material-icons blue-text">help</i>Help
    </a>
</li>
<li>
    <a href=""><i class="material-icons blue-text">exit_to_app</i>Logout
    </a>
</li>
</ul>




<!--SideNav Finished-->

<div class="content">
  <div class="container">
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th scope="col">#</th>
        <th scope="col">First Name</th>
        <th scope="col">Middle Name</th>
        <th scope="col">Last Name</th>
        <th scope="col">Phone Number</th>
        <th scope="col">Email id</th>
        <th scope="col">Contry</th>
        <th scope="col">Address</th>
        <th scope="col">Photo</th>
        <th scope="col">age</th>
      </tr>
      <c:forEach items="${list}" var="p">
      <tr>
      <td>${p.userid}</td>
      <td>${p.firstname}</td>
      <td>${p.lastname}</td>
      <td>${p.emailid}</td>
      <td>938482093</td>
      <td>andapav@nonveg.com</td>
      <td>Hindustan</td>
      <td>Thane</td>
      <td><img width="100" height="100" src="GetPic/<c:out value='${p.userid}'/>"></td>
      <td>iske badle Dob krel database mein</td>
      </tr>
      </c:forEach>
    </thead>
  </table>
</div>
</div>





</body>

</html>
