<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="sidebars.jsp"%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link href="../css/home.css" rel="stylesheet">
<title>InstanText - Welcome</title>

<!-- Custom fonts for this template -->
<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/business-casual.min.css" rel="stylesheet">
<link href="../css/index.css" rel="stylesheet">
<link rel="stylesheet" href="../css/createProject.css">
</head>

<body class="skin-red-light">
<c:choose>
    <c:when test="${user==null}">
		<h1 class="site-heading text-center text-white d-none d-lg-block title">
			<span class="site-heading-lower" id="text"><b>Text</b></span>
			<span class="site-heading-lower" id="upper"><b>UR</b></span>
			<span class="site-heading-upper text-primary mb-3" id="sub">A Free Java Online Editor</span>
		</h1>
		
		<div class="site-heading text-center d-none d-lg-block">
	
			<a id="login" href="page?action=login">Login</a>
			<a id="register" href="page?action=register">Register</a>
			
		</div>
	
		<section id="home" class="page-section clearfix">
			<div class="container">
				<div class="intro">
					<img class="intro-img img-fluid mb-3 mb-lg-0 rounded" src="../img/intro.jpg">
					<div class="intro-text left-0 text-center bg-faded p-5 rounded description">
						<h2 class="section-heading mb-4">
							<span class="section-heading-upper">TextUR</span>
							<span class="section-heading-lower">Create the future</span>
						</h2>
						<p class="mb-3 font">An innovative web editor to create your Java project online.
							Work with your collaborator and share with them your projects.</p>
						<div class="intro-button mx-auto">
							<a class="btn btn-primary btn-lg" href="page?action=register">Register Now!</a>
						</div>
					</div>
				</div>
			</div>
		</section>
    </c:when>    
    <c:otherwise>
		<div class="box box-danger center" id="explorer">
			<section class="content"> 
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
	
			<section class="content">
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
	<script src="../javascript/createProjects.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../javascript/explorer.js"></script>
	<script src="../javascript/index.js"></script>
	<script src="../javascript/loginController.js"></script>
</body>

</html>
