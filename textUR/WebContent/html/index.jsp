<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="sidebars.jsp"%>

<html lang="en">
<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Free HTML5 Website Template by gettemplates.co" />
<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="gettemplates.co" />
<meta property="og:title" content=""/>
<meta property="og:image" content=""/>
<meta property="og:url" content=""/>
<meta property="og:site_name" content=""/>
<meta property="og:description" content=""/>
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link href="../css/home.css" rel="stylesheet">
<title>TextUR - Welcome</title>

<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet">
<link href="../css/business-casual.min.css" rel="stylesheet">
<link href="../css/index.css" rel="stylesheet">
<link href="../css/createProject.css" rel="stylesheet">



<!-- Animate.css -->
<link rel="stylesheet" href="../css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="../css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="../css/bootstrap.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="../css/magnific-popup.css">

<!-- Owl Carousel  -->
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/owl.theme.default.min.css">

<!-- Theme style  -->
<link rel="stylesheet" href="../css/style.css">

<!-- Modernizr JS -->
<script src="../js/modernizr-2.6.2.min.js"></script>


</head>

<body class="skin-red-light">
<c:choose>
    <c:when test="${user==null}">
    
    <div class="gtco-loader"></div>
    
    <div id="page">
		<nav class="gtco-nav" role="navigation">
			<div class="gtco-container">
				<div class="row">
					<div class="col-xs-12 text-right hidden-xs menu-2">
					<ul>
						<li class="btn-cta"><a href="page?action=login"><span>Login</span></a></li>
						<li class="btn-cta"><a href="page?action=register"><span>Register</span></a></li>
					</ul>
					</div>
				</div>
				
			</div>
		</nav>
		
		<header id="gtco-header" class="gtco-cover" role="banner" style="background-image: url(../img/background.jpg);">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<div class="display-t">
							<div class="display-tc animate-box" data-animate-effect="fadeIn">
								<h1 class="site-heading text-center text-white d-none d-lg-block title">
									<span class="site-heading-lower" id="text"><b>Text</b></span>
									<span class="site-heading-lower" id="upper"><b>UR</b></span>
									<span class="site-heading-upper text-primary mb-3" id="sub">A Free Java Online Editor</span>
								</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		
		<div id="gtco-features" class="myArea">
			<div class="myArea">
				<div class="row">
					<div class="col-md-4 col-sm-4">
						<div class="feature-center animate-box" data-animate-effect="fadeIn">
							<span class="icon">
								<i class="fa fa-plus"></i>
							</span>
							<h3>create</h3>
							<p>Create your projects and save the status of your projects whenever you want.</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="feature-center animate-box" data-animate-effect="fadeIn">
							<span class="icon">
								<i class="fa fa-share-alt"></i>
							</span>
							<h3>share</h3>
							<p>Share your projects with other users and work with them to get the most out of your work.</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="feature-center animate-box" data-animate-effect="fadeIn">
							<span class="icon">
								<i class="fa fa-upload"></i>
							</span>
							<h3>upload</h3>
							<p>Upload and download your projects online and work anywhere thanks to the web platform.</p>
						</div>
					</div>
					
					<div class="col-md-4 col-sm-4">
						<div class="feature-center animate-box" data-animate-effect="fadeIn">
							<span class="icon">
								<i class="fa fa-gear"></i>
							</span>
							<h3>compile</h3>
							<p>Find and correct any errors thanks to the online java compiler.</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="feature-center animate-box" data-animate-effect="fadeIn">
							<span class="icon">
								<i class="fa fa-calendar-o"></i>
							</span>
							<h3>plans</h3>
							<p>Plan your meetings and other events thanks to the calendar so you will not miss a single moment.</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="feature-center animate-box" data-animate-effect="fadeIn">
							<span class="icon">
								<i class="fa fa-comments"></i>
							</span>
							<h3>chat</h3>
							<p>Communicate with other users through the chat so you can share your ideas instantly.</p>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div id="gtco-counter" class="gtco-bg gtco-counter gradient">
			<div class="gtco-container">
				<div class="row">
					<div class="display-t">
						<div class="display-tc">
							<div class="col-md-3 col-sm-6 animate-box">
								<div class="feature-center">
									<span class="icon">
										<i class="fa fa-users"></i>
									</span>
	
									<span class="counter js-counter" data-from="0" data-to="40" data-speed="5000" data-refresh-interval="50">1</span>
									<span class="counter-label">users</span>
	
								</div>
							</div>
							<div class="col-md-3 col-sm-6 animate-box">
								<div class="feature-center">
									<span class="icon">
										<i class="fa fa-file-code-o"></i>
									</span>
	
									<span class="counter js-counter" data-from="0" data-to="97" data-speed="5000" data-refresh-interval="50">1</span>
									<span class="counter-label">projects</span>
								</div>
							</div>
							<div class="col-md-3 col-sm-6 animate-box">
								<div class="feature-center">
									<span class="icon">
										<i class="fa fa-calendar-o"></i>
									</span>
									<span class="counter js-counter" data-from="0" data-to="72" data-speed="5000" data-refresh-interval="50">1</span>
									<span class="counter-label">events created</span>
								</div>
							</div>
							<div class="col-md-3 col-sm-6 animate-box">
								<div class="feature-center">
									<span class="icon">
										<i class="icon-clock"></i>
									</span>
	
									<span class="counter js-counter" data-from="0" data-to="2120" data-speed="5000" data-refresh-interval="50">1</span>
									<span class="counter-label">Hours Spent</span>
	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div id="gtco-testimonial">
			<div class="gtco-container">
				<!-- <div class="row"> -->
					<div class="row animate-box">
						<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
							<h2>Developers</h2>
						</div>
					</div>
					<div class="row animate-box">
						
					
						<div class="owl-carousel owl-carousel-fullwidth ">
							<div class="item">
								<div class="testimony-slide active text-center">
									<figure>
										<img src="../img/gaetano.jpg" alt="user">
									</figure>
									<span>Donadio Gaetano</span>
									<blockquote>
										<p>&ldquo;Web developer&rdquo;</p>
									</blockquote>
								</div>
							</div>
							<div class="item">
								<div class="testimony-slide active text-center">
									<figure>
										<img src="../img/alessandro.jpg" alt="user">
									</figure>
									<span>Marrazzo Alessandro</span>
									<blockquote>
										<p>&ldquo;Web developer&rdquo;</p>									
									</blockquote>
								</div>
							</div>
							
						</div>
					</div>
				<!-- </div> -->
			</div>
		</div>
		
		<div id="gtco-started">
			<div class="gtco-container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
						<a href="page?action=register"><h2>Get Started</h2></a>
					</div>
				</div>
			</div>
		</div>
	
    </div>
    		<footer id="gtco-footer" role="contentinfo" class="myArea footer">
			<div class="gtco-container myArea">
	
				<div class="row copyright">
					<div class="col-md-12">
						<p class="pull-left">
							<small class="block">&copy; 2018 TextUR. All Rights Reserved.</small> 
							<small class="block">Designed by : Donadio Gaetano & Marrazzo Alessandro</small>
						</p>
					</div>
				</div>
	
			</div>
		</footer>
	</c:when>    
    
    
    
    
    <c:otherwise>
     <div class="gtco-loader"></div>
		<div class="box box-danger center" id="explorer">
			<section class="content" id="yours"> 
				<div class="input-group-btn">
					<button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"> New project
						 <span class="fa fa-caret-down"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a id="empty"> Empty Project</a></li>
						<li><a id="hello"> HelloWorld Project</a></li>
						<li><a onclick="uploadRequest();">Upload your project</a></li>
					</ul>
				</div>
		
				<h2 class="site-heading text-center">
				<span class="site-heading-lower">Your <b>projects</b></span> 	</h2>
					<div class=" text-center">
						<c:forEach var="project" items="${user.getProjects().values()}">
							<button class="btn btn-warning buttonName" onclick="showContent('${project.getName()}', true);"> 
								<span class="info-box-icon bg-yellow">
									<i class="fa fa-folder icon_folder"><br> </i> 
									<p class="names">${project.getName()}</p> 
								</span>
							</button>
						</c:forEach>
					</div>
			</section>
	
			<section class="content" id="others">
				<h2 class="site-heading text-center">	<span class="site-heading-lower">Other <b>projects</b></span>	</h2>
		
				<div class="text-center">
					<c:forEach var="project" items="${user.getOtherProjects().values()}">
						<button class="btn btn-warning buttonName" onclick="showContent('${project.getName()}', false);">
							<span class="info-box-icon bg-yellow">
								<i class="fa fa-folder icon_folder"><br></i>
								<p class = "names">${project.getName()}</p>
							</span>
						</button>
					</c:forEach>
				</div>
			</section>
		</div>

    </c:otherwise>
</c:choose>
	


	<!-- Bootstrap core JavaScript -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../js/createProjects.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../js/explorer.js"></script>
	<script src="../js/index.js"></script>
	<script src="../js/loginController.js"></script>
	
	
		<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="../js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="../js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="../js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="../js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="../js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="../js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="../js/main.js"></script>
	
	
</body>

</html>