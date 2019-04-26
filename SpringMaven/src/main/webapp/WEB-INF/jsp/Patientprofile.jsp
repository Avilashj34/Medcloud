<%@page import="com.medcloud.Model.Registration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html >

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

	<title>${fname} profile</title>
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
String email=(String)session.getAttribute("patientemailsession");
Registration r = new Registration();

if(email==null)
{
	response.sendRedirect("Patientlogin");
}
else
{
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://medicaltreatment.cyd5gs2hapgv.ap-northeast-1.rds.amazonaws.com:3306/medicaltreatment","root","medcloud");
	Statement st=con.createStatement();
	ResultSet rs= st.executeQuery("select * from doctor where emailid='"+email+"'");
	while(rs.next())
	{
	System.out.println(rs.getString(2));
	r.setFirstname(rs.getString(2));
	r.setLastname(rs.getString(4));
	r.setGender(rs.getString(3));
	}
	}catch(Exception e){
	  System.out.println("No data found");
	}
	
	System.out.println(email);
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
								<i class="fas fa-sign-in-alt mr-2"></i> Logout </a>
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
						<a href="logout">
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
					<h5 class="modal-title">FeedBack</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="feedback" method="post">
						<div class="form-group">
							<label class="col-form-label">Your Name</label>
							<input type="text" class="form-control" placeholder=" " name="feedbackname" required="">
						</div>
						<div class="form-group">
							<label class="col-form-label">Email</label>
							<input type="email" class="form-control" placeholder=" " name="feedbackemail" required="">
						</div>
						<div class="form-group">
							<label class="col-form-label">Message</label>
							<input type="text" class="form-control" placeholder=" " name="feedbackmessage"  required="">
						</div>
						
						<div class="right-storesl">
							<input type="submit" class="form-control" value="Submit">
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
					<a href="#"><h5>Home</h5></a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
				    aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto text-center mr-xl-5">
						<li class="nav-item mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link" href="Patientprofile">Home
								<span class="sr-only">(current)</span>
							</a>
						</li>
						
						<li class="nav-item mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link" href="about.html">About Us</a>
						</li>
						<li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								View Profile
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="Patientprofile">Profile</a>
							</div>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="contact">Contact Us</a>
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
						<a href="Patientprofile">Home</a>
						<i>|</i>
					</li>
					<li>Patient Information</li>
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
				<span>P</span>atient
				<span>I</span>nformation</h3>
			<!-- //tittle heading -->
			<div class="row">
				<div class="col-lg-5 col-md-8 single-right-left ">
					<div class="grid images_3_of_2">
						<div class="flexslider">
							<ul class="slides">
								<li data-thumb="${si}">
									<div class="thumb-image">
										<img src="GetPic/<c:out value='${userid }'/>" data-imagezoom="true" class="img-fluid" /> </div>
								</li>
							</ul>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>

				<div class="col-lg-7 single-right-left simpleCart_shelfItem">
					<h3 class="mb-3">${fname} ${mname} ${lname}</h3>
					<h4 class="mb-3">Age is : ${age}</h4>
					<p class="mb-3">
						<span class="item_price">Email-Id is : ${emailid}</span><br><br>
						<label>Additional Information</label>
					</p>
					<div class="single-infoelectronics">
						<ul>
							<li class="mb-3">
							<b>${medcineerror}</b>
								The Medicine table 
								<table bordercolor="#00FDDF" border="5" cellpadding="15">
							<tr>
							<th>
							Medicine 1 </th>
							<th>
							Medicine 2 </th>
							<th>
							Advice</th>
							
							
							<tr>
							<td> ${medicine1}
							</td>
							<td> ${medicine2 }
							</td>
							<td> ${advice } </td>
							
							</tr>
							</table>
							</li>
							<!--Add More -->
						</ul>
					</div>
					<div class="product-single-storesl">
						<p class="my-3">
							<i class="far fa-hand-point-right mr-2"></i>
							<label>Doctor</label>Information</p>
						<ul>
							<li class="mb-1">
								Doctor Name :${docname}
							</li>
							<li class="mb-1">
								Doctor Description : ${description}
							</li>
							<li class="mb-1">
								Email-Id : ${email}
							</li>
						</ul>
						<p class="my-sm-4 my-3">
							<i class="fas fa-retweet mr-3"></i>Doctor Specialty : ${speciality}
						</p>
					</div>
					<div class="product-single-storesl">
						<p class="my-3">
							<i class="far fa-hand-point-right mr-2"></i>
							<label>Hospital </label>Information</p>
						<ul>
							<li class="mb-1">
								 Hospital Name : Aashirwad Hospital
							</li>
							<li class="mb-1">
								 City : Thane
							</li>
						</ul>
						
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
								<h6>Iot</h6>
								<h4 class="mt-2 mb-3">Secured Data</h4>
								<p>Acess Anywhere</p>
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
								<h6>Data in Cloud</h6>
								<h4 class="mt-2 mb-3">Secured</h4>
								<p>Paperless Record</p>
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
	<footer>
		
		<!-- footer third section -->
		<div class="storesl-middlefooter-sec">
			<div class="container py-md-5 py-sm-4 py-3">
				<div class="row footer-info stores-electronicsits-info">
					<!-- footer categories -->
					<div class="col-md-3 col-sm-6 footer-grids">
						<h3 class="text-white font-weight-bold mb-3">Categories</h3>
						<ul>
							<li class="mb-3">
								<a href="Updatereport">Update Report </a>
							</li>
							<li class="mb-3">
								<a href="Patientprofile">Profile</a>
							</li>
							
							
						</ul>
					</div>
					<!-- //footer categories -->
					<!-- quick links -->
					<div class="col-md-3 col-sm-6 footer-grids mt-sm-0 mt-4">
						<h3 class="text-white font-weight-bold mb-3">Quick Links</h3>
						<ul>
							<li class="mb-3">
								<a href="about">About Us</a>
							</li>
							<li class="mb-3">
								<a href="contact">Contact Us</a>
							</li>
							<li class="mb-3">
								<a href="help">Help</a>
							</li>
							<li class="mb-3">
								<a href="faqs">Faqs</a>
							</li>
							<li class="mb-3">
								<a href="terms">Terms of use</a>
							</li>
							<li>
								<a href="privacy">Privacy Policy</a>
							</li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-6 footer-grids mt-md-0 mt-4">
						<h3 class="text-white font-weight-bold mb-3">Get in Touch</h3>
						<ul>
							<li class="mb-3">
								<i class="fas fa-map-marker"></i>India</li>
							
							<li>
								<i class="fas fa-envelope-open"></i>
								<a href="mailto:example@mail.com"> finalyearbeproject2019@example.com</a>
							</li>
						</ul>
					</div>
					
				</div>
				<!-- //quick links -->
			</div>
		</div>
		<!-- //footer third section -->

		<!-- footer fourth section -->
		<div class="electronics-sometext py-md-5 py-sm-4 py-3">
			<div class="container">
				<!-- brands -->
				<div class="sub-some">
					<h5 class="font-weight-bold mb-2">Patient Dashboard :</h5>
					<ul>
						<li class="m-sm-1">
							<a href="Updatereport" class="border-right pr-2">Update Report</a>
						</li>
						<li class="m-sm-1">
							<a href="logout" class="border-right pr-2">Logout</a>
						</li>
						
					</ul>
				</div>
				

				
				<!-- //payment -->
			</div>
		</div>
		<!-- //footer fourth section (text) -->
	</footer>
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