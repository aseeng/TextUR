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
	
	<div id="gtco-features">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-4 col-sm-4">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-eye"></i>
						</span>
						<h3>Retina Ready</h3>
						<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
						<p><a href="#" class="btn btn-primary">Learn More</a></p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-command"></i>
						</span>
						<h3>Fully Responsive</h3>
						<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
						<p><a href="#" class="btn btn-primary">Learn More</a></p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="icon-power"></i>
						</span>
						<h3>Web Starter</h3>
						<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
						<p><a href="#" class="btn btn-primary">Learn More</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
    </div>
    
    
		
    </c:when>    
    <c:otherwise>
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
	
	<footer class="footer text-faded text-center py-5">
	<div class="container">
		<p class="m-0 small"> Text<b>UR</b> 2018 </p>
	</div>
	</footer>

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