<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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

	<title>MedCloud System</title>
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
					<form action="#" method="post">
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
							<input type="text" class="form-control" placeholder=" " name="Password" id="password1" required="">
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
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
				    aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto text-center mr-xl-5">
						<li class="nav-item mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link" href="Home">Home
								<span class="sr-only">(current)</span>
							</a>
						</li>
						<li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Patient
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="Patientlogin">Patient Login</a>
								<a class="dropdown-item" href="registration">Patient Register</a>
							</div>
						</li>
						<li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Doctor
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="DoctorLogin">Doctor Login</a>
								<a class="dropdown-item" href="Doctorregistration">Doctor Register</a>
							</div>
						</li>
						</li>
						<li class="nav-item mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link" href="about">About Us</a>
						</li>
						<li class="nav-item dropdown mr-lg-2 mb-lg-0 mb-2">
							<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Hospital
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="Hospitallogin">Hospital Login</a>
								<a class="dropdown-item" href="Hospitalregistration">Hospital Register</a>
							</div>
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
						<a href="#">Home</a>
						<i>|</i>
					</li>
				<li>Message Page</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- //page -->

	<div class="privacy py-sm-5 py-4">
		<div class="container py-xl-4 py-lg-2">
			<!-- tittle heading -->
			<h3 class="tittle-storesl text-center mb-lg-5 mb-sm-4 mb-3">
				<span></span>
			</h3>
		
			<div class="checkout-left">
				<div class="address_form_electronics mt-sm-5 mt-4">
					<h4>${warning }</h4><br>
					<h5>${msg}</h5>
						<div class="creditly-wrapper electronics-stroe, stores_electronicsits_wrapper">
							<div class="information-wrapper">
								<div class="first-row">
									
									<div class="stores_electronicsits_card_number_grids">								
										${status}
${addoctor}
${otperror}
${msg}
<b>${resendotp }</b>
<b>${feedbackmsg}</b><br>
<b>${numberexception}</b>
<h5>${hospId}</h5>
Return to Home Page <a href="Home">here</a>
<br>
<br>
${adminerror}
									
										
										</div>
										
										
									</div>
															
									
								</div>
							</div>
						</div>
					
					
				</div>
			</div>
		</div>
		<div class="electronics-sometext py-md-5 py-sm-4 py-3">
			<div class="container">
				<!-- brands -->
				<div class="sub-some">
					<h5 class="font-weight-bold mb-2">Doctor :</h5>
					<ul>
						<li class="m-sm-1">
							<a href="Doctorregistration" class="border-right pr-2">Registration</a>
						</li>
						<li class="m-sm-1">
							<a href="Doctorlogin" class="border-right pr-2">Login</a>
						</li>
						
					</ul>
				</div>
				<div class="sub-some mt-4">
					<h5 class="font-weight-bold mb-2">Patient :</h5>
					<ul>
						<li class="m-sm-1">
							<a href="registration" class="border-right pr-2">Registration </a>
						</li>
						<li class="m-sm-1">
							<a href="Patientlogin" class="border-right pr-2">Login</a>
						</li>
						
					</ul>
				</div>
				<div class="sub-some mt-4">
					<h5 class="font-weight-bold mb-2">Hospital :</h5>
					<ul>
						<li class="m-sm-1">
							<a href="Hospitalregistration" class="border-right pr-2">Registration</a>
						</li>
						<li class="m-sm-1">
							<a href="Hospitallogin" class="border-right pr-2">Login</a>
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
			<p class="text-center text-white">© 2018 Med-Cloud.</p>
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

</body>

</html>