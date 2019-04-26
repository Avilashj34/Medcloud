<%@page import="com.medcloud.Model.RoutineMedicalRecord"%>
<%@page import="com.medcloud.Model.Registration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@page import="java.util.*"  %>
    <%@page import="java.io.OutputStream" %>
    <%@page import="com.medcloud.Dao.BlManager" %>
     <%@page import="com.medcloud.Controller.*" %>
      <%@page import="com.medcloud.Model.Hospital" %>
      <%@page import="java.sql.*"%>
       <%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>

<html>

<head>

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

	<title>MedCloud System | Routine</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Electro Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"
	/>
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- //Meta tag Keywords -->

	<!-- Custom-Files -->
	<link href="${bootstrap}" rel="stylesheet" type="text/css" media="all" />
	<!-- Bootstrap css -->
	<link href="${style}" rel="stylesheet" type="text/css" media="all" />
	<!-- Main css -->
	<link rel="stylesheet" href="${fontawesome}">
	<!-- Font-Awesome-Icons-CSS -->
	<link href="${popuo-box}" rel="stylesheet" type="text/css" media="all" />
	<!-- pop-up-box -->
	<link href="${menu}" rel="stylesheet" type="text/css" media="all" />
	<!-- menu style -->
	<!-- //Custom-Files -->
	<!-- web fonts -->
	<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	    rel="stylesheet">
	<!-- //web fonts -->

</head>

<body>

<%


Hospital d=new Hospital();
Registration r=new Registration();
RoutineMedicalRecord rou=new RoutineMedicalRecord();
BlManager bl=new BlManager();

String email=(String)session.getAttribute("patientemailsession");
System.out.println("Email is :"+email);

if(email==null)
{
	response.sendRedirect("Patientlogin");
}
else
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://medicaltreatment.cyd5gs2hapgv.ap-northeast-1.rds.amazonaws.com:3306/medicaltreatment","root","medcloud");
	Statement st=con.createStatement();
		ResultSet rs1=st.executeQuery("select * from patientinformation where emailid='"+email+"'");
	while(rs1.next())
	{
		r.setUserid(rs1.getInt(1));
		r.setFirstname(rs1.getString(2));
		r.setLastname(rs1.getString(3));
		r.setAge(rs1.getInt(13));
		r.setEmailid(rs1.getString(6));
	}
	System.out.println( "The Session id"+r.getUserid());
	//d=bl.SearchDoctor(email);
	
 %>
 

	<!-- top-header -->
	<div class="electronics-main-top">
		<div class="container-fluid">
			<div class="row main-top-storesl py-2">
				<div class="col-lg-4 header-most-top">
					<p class="text-white text-lg-left text-center">Info
						<i class="fas fa-shopping-cart ml-1"></i>
					</p>
				</div>
				<div class="col-lg-8 header-right mt-lg-0 mt-2">
					<!-- header lists -->
					<ul>
						<li class="text-center border-right text-white">
							<i class="fas fa-phone mr-2"></i> +91-8097810652
						</li>
						<li class="text-center border-right text-white">
							<a href="#" data-toggle="modal" data-target="#exampleModal" class="text-white">
								<i class="fas fa-sign-in-alt mr-2"></i> Log Out </a>
						</li>
						<li class="text-center text-white">
							<a href="#" data-toggle="modal" data-target="#exampleModal2" class="text-white">
								<i class="fas fa-sign-out-alt mr-2"></i>Give FeedBack </a>
						</li>
					</ul>
					<!-- //header lists -->
				</div>
			</div>
		</div>
	</div>

	<!-- Button trigger modal(select-location) -->

	<!-- modals -->
	<!-- log in -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-center">Are You Sure You Want To Logout</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
						
						<div class="right-storesl">
						<a href="plogout">
							<input type="submit" class="form-control" value="Confirm">
						</a>
						</div>
						
				</div>
			</div>
		</div>
	</div>
	<!-- register -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">FeedBack Form</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="feedback" method="post">
						<div class="form-group">
							<label class="col-form-label">Your Name</label>
							<input type="text" class="form-control" placeholder=" " name="Name" required="">
						</div>
						<div class="form-group">
							<label class="col-form-label">Email</label>
							<input type="email" class="form-control" placeholder=" " name="Email" required="">
						</div>
						<div class="form-group">
							<label class="col-form-label">Message</label>
							<input type="password" class="form-control" placeholder="Enter  " name="Confirm Password" id="password2" required="">
						</div>
						<div class="right-storesl">
							<input type="submit" class="form-control" value="Register">
						</div>
						<div class="sub-storesl">
							<div class="custom-control custom-checkbox mr-sm-2">
								<input type="checkbox" class="custom-control-input" id="customControlAutosizing2">
								<label class="custom-control-label" for="customControlAutosizing2">I Accept to the Terms & Conditions</label>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- //modal -->
	<!-- //top-header -->

	<!-- header-bottom-->
	
	<!-- shop locator (popup) -->
	<!-- //header-bottom -->
	<!-- navigation -->
	<div class="navbar-inner">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="electronicsits-navi_search">
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
				    aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto text-center mr-xl-5">
						
						<li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Patient
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="Patientprofile">View Profile</a>
							</div>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="registration">Patient Register</a>
							</div>
						</li>
						
						<li class="nav-item mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link" href="about">About Us</a>
						</li>
						
						<li class="nav-item">
							<a class="nav-link" href="contact.html">Contact Us</a>
						</li>
						
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<!-- //navigation -->

	<!-- banner-2 -->
	<div class="page-head_electronics_info_storesl">

	</div>
	<!-- //banner-2 -->
	<!-- page -->
	<div class="services-breadcrumb">
		<div class="electronics_inner_breadcrumb">
			<div class="container">
				<ul class="stores_short">
					<li>
						<i>|</i>
					</li>
					<li>Update Page</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- //page -->

	<!-- Single Page -->
	<div class="banner-bootom-stores-electronicsits py-5">
		<div class="container py-xl-4 py-lg-2">
			<!-- tittle heading -->
			<h3 class="tittle-storesl text-center mb-lg-5 mb-sm-4 mb-3">
				<span>|</span>Routine
				<span>|</span>Page</h3>
			<!-- //tittle heading -->
			<div class="row">
				<div class="col-lg-5 col-md-8 single-right-left ">
					<div class="grid images_3_of_2">
						<div class="single-infoelectronics">
							<ul >
								
								<li class="mb-3">
								
								<b>Patient Name</b> :<%=r.getFirstname() +"  "+ r.getLastname()%><br>
								<b>Your Registered Email </b> : <%=r.getEmailid() %>
								<b>
								<br>
								Age is </b>: <%=r.getAge() %>
								
								
								</li>
							</ul>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>

				
					<div class="product-single-storesl">
						<p class="my-sm-4 my-3">
							<i class="fas fa-retweet mr-3"></i>Update Data
							
<form action="routineprocesss" method="post">	
	<table>
	<tr><th><br></th></tr>
	<tr><th>
	Weight </th> <td><input type="text" name="weight" required/></td></tr>
	<tr><th>
	Blood Pressure </th> <td> <input type="text" name="bloodpressure" required/></td></tr>
	<tr><th>
	Height </th>  <td><input  type="text" name="height" required/></td></tr>
	<tr><th>
	Pulse </th>  <td><input type="text"  name="pulse" required/></td></tr>
	<tr><th>
	Sugar </th><td><input type="text" name="sugar" required/></td></tr>
	<tr><td><input type="reset" value="Reset"/></td><td>
	<input type="submit" value="Submit"></td></tr>
	</table>
</form>

						</p>
						
						
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<!-- //Single Page -->

	<!-- middle section -->
	<div class="join-storesl1 py-sm-5 py-4">
		<div class="container py-xl-4 py-lg-2">
			<div class="row">
				<div class="col-lg-6">
					<div class="join-electronics text-left p-4">
						<div class="row">
							<div class="col-sm-7 offer-name">
								<h6>Smooth, Rich & Loud Audio</h6>
								<h4 class="mt-2 mb-3">Branded Headphones</h4>
								<p>Sale up to 25% off all in store</p>
							</div>
							<div class="col-sm-5 offerimg-storesl">
								<img src="${off1}" alt="" class="img-fluid">
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 mt-lg-0 mt-5">
					<div class="join-electronics text-left p-4">
						<div class="row ">
							<div class="col-sm-7 offer-name">
								<h6>A Bigger Phone</h6>
								<h4 class="mt-2 mb-3">Smart Phones 5</h4>
								<p>Free shipping order over $100</p>
							</div>
							<div class="col-sm-5 offerimg-storesl">
								<img src="${off2 }" alt="" class="img-fluid">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- middle section -->

	<!-- footer -->
	
	<!-- //footer -->
	<!-- copyright -->
	<div class="copy-right py-3">
		<div class="container">
			<p class="text-center text-white">© 2018 Med-Cloud. All rights reserved.</p>
		</div>
	</div>

	<!-- js-files -->
	<!-- jquery -->
	<script src="${jquery}"></script>
	<!-- //jquery -->

	<!-- nav smooth scroll -->
	<script>
		$(document).ready(function () {
			$(".dropdown").hover(
				function () {
					$('.dropdown-menu', this).stop(true, true).slideDown("fast");
					$(this).toggleClass('open');
				},
				function () {
					$('.dropdown-menu', this).stop(true, true).slideUp("fast");
					$(this).toggleClass('open');
				}
			);
		});
	</script>
	<!-- //nav smooth scroll -->

	<!-- popup modal (for location)-->
	<script src="${magnificpopup}"></script>
	<script>
		$(document).ready(function () {
			$('.popup-with-zoom-anim').magnificPopup({
				type: 'inline',
				fixedContentPos: false,
				fixedBgPos: true,
				overflowY: 'auto',
				closeBtnInside: true,
				preloader: false,
				midClick: true,
				removalDelay: 300,
				mainClass: 'my-mfp-zoom-in'
			});

		});
	</script>
	<!-- //popup modal (for location)-->

	<!-- cart-js -->
	<script src="${mini}"></script>
	<script>
		paypals.minicarts.render(); //use only unique class names other than paypals.minicarts.Also Replace same class name in css and minicart.min.js

		paypals.minicarts.cart.on('checkout', function (evt) {
			var items = this.items(),
				len = items.length,
				total = 0,
				i;

			// Count the number of each item in the cart
			for (i = 0; i < len; i++) {
				total += items[i].get('quantity');
			}

			if (total < 3) {
				alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
				evt.preventDefault();
			}
		});
	</script>
	<!-- //cart-js -->

	<!-- password-script -->
	<script>
		window.onload = function () {
			document.getElementById("password1").onchange = validatePassword;
			document.getElementById("password2").onchange = validatePassword;
		}

		function validatePassword() {
			var pass2 = document.getElementById("password2").value;
			var pass1 = document.getElementById("password1").value;
			if (pass1 != pass2)
				document.getElementById("password2").setCustomValidity("Passwords Don't Match");
			else
				document.getElementById("password2").setCustomValidity('');
			//empty string means no validation error
		}
	</script>
	<!-- //password-script -->

	<!-- imagezoom -->
	<script src="${imagezoom}"></script>
	<!-- //imagezoom -->

	<!-- flexslider -->
	<link rel="stylesheet" href="${flexslidercss}" type="text/css" media="screen" />
	

	<script src="${flexsliderjs}"></script>
	<script>
		// Can also be used with $(document).ready()
		$(window).load(function () {
			$('.flexslider').flexslider({
				animation: "slide",
				controlNav: "thumbnails"
			});
		});
	</script>
	<!-- //FlexSlider-->

	<!-- smoothscroll -->
	<script src="${Smooth}"></script>
	<!-- //smoothscroll -->

	<!-- start-smooth-scrolling -->
	<script src="${move}"></script>
	<script src="${easing}"></script>
	<script>
		jQuery(document).ready(function ($) {
			$(".scroll").click(function (event) {
				event.preventDefault();

				$('html,body').animate({
					scrollTop: $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //end-smooth-scrolling -->

	<!-- smooth-scrolling-of-move-up -->
	<script>
		$(document).ready(function () {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			*/
			$().UItoTop({
				easingType: 'easeOutQuart'
			});

		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->

	<!-- for bootstrap working -->
	<script src="${boot}"></script>
	<!-- //for bootstrap working -->
	<!-- //js-files -->
<%} %>
</body>

</html>