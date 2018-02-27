<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="sidebars.jsp"%>

<html lang="en" >
<head>
<meta charset="utf-8">
<meta name="viewport" content="user-scalable=no,width=device-width,initial-scale=1">
<link href="../css/home.css" rel="stylesheet">
<title>TextUR - Welcome</title>

<!-- Custom fonts for this template -->
<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/business-casual.min.css" rel="stylesheet">
<link href="../css/index.css" rel="stylesheet">
<link href="../css/createProject.css" rel="stylesheet">

<!-- template first page -->

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />

<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/style-xlarge.css" />

</head>

<body class="skin-red-light landing" style="overflow:scroll;">
<c:choose>
    <c:when test="${user==null}">

		<div id="skel-layers-wrapper" style="position: relative; left: 0px; right: 0px; top: 0px; backface-visibility: hidden; transition: -webkit-transform 0.5s ease, opacity 0.5s ease;">

			<header id="header">
				<nav id="nav">
					<ul>
						<li><a href="page?action=login" class="button special">Login</a></li>
						<li><a href="page?action=register" class="button special">Register</a></li>
					</ul>
				</nav>
			</header>

			<section id="banner">
				<h1 class="site-heading text-center text-white d-none d-lg-block title">
					<span class="site-heading-lower" id="text" ><b>Text</b></span>
					<span class="site-heading-lower" id="upper" ><b>UR</b></span>
					<span class="site-heading-upper text-primary mb-3" id="sub">A Free Java Online Editor</span>
				</h1>
			</section>
			
			<section id="one" class="wrapper style1 special">
				<div class="container">
					<header class="major">
						<h2>Create the future</h2>
						<p>Work with your collaborator and share with them your projects!</p>
					</header>
					<div class="row 150%">
						<div class="4u 12u$(medium)">
							<section class="box">
								<i class="icon big rounded color1 fa-cloud"></i>
								<h3>Lorem ipsum dolor</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim quam consectetur quibusdam magni minus aut modi aliquid.</p>
							</section>
						</div>
						<div class="4u 12u$(medium)">
							<section class="box">
								<i class="icon big rounded color9 fa-desktop"></i>
								<h3>Consectetur adipisicing</h3>
								<p>Work with your collaborator and share with them your projects</p>
							</section>
						</div>
						<div class="4u$ 12u$(medium)">
							<section class="box">
								<i class="icon big rounded color6 fa-rocket"></i>
								<h3>Adipisicing elit totam</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque eaque eveniet, nesciunt molestias. Ipsam, voluptate vero.</p>
							</section>
						</div>
					</div>
				</div>
			</section>
			
			<section id="two" class="wrapper style2 special">
				<div class="container">
					<header class="major">
						<h2>Project Manager</h2>
						<p>creator and sofware developer of the project</p>
					</header>
					<section class="profiles">
						<div class="row">
						
							<section class="3u 6u$(medium) 12u$(xsmall) profile">
								<img src="../img/gaetano.jpg" height="92" width="92">
								<h4>Donadio Gaetano</h4>
								<p>programmer</p>
							</section>
							
							<section class="3u 6u(medium) 12u$(xsmall) profile">
								<img src="../img/alessandro.jpg" height="92" width="92">
								<h4>Marrazzo Alessandro</h4>
								<p>programmer</p>
							</section>
							

						</div>
					</section>
					<footer>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quibusdam dolore illum, temporibus veritatis eligendi, aliquam, dolor enim itaque veniam aut eaque sequi qui quia vitae pariatur repudiandae ab dignissimos ex!</p>
						<ul class="actions">
							<li>
								<a href="#" class="button big">Lorem ipsum dolor sit</a>
							</li>
						</ul>
					</footer>
				</div>
			</section>

	</div>
	<div id="skel-layers-hiddenWrapper" style="height: 100%;"></div>
	<div id="skel-layers-visibleWrapper" style="position: relative;"></div>
    </c:when> 
   

 
    
      
    <c:otherwise>
		<div class="box box-danger center" id="explorer">
			<section class="content"> 
				<div class="input-group-btn">
					<button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"> New project
						 <span class="fa fa-caret-down"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a id="create" onclick="createProject();"> Create a project</a></li>
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
	
<!--  <footer class="footer text-faded text-center py-5">
	<div class="container">
		<p class="m-0 small"> Text<b>UR</b> 2018 </p>
	</div>
	</footer>-->

	

	<!-- Bootstrap core JavaScript -->
	<script src="../javascript/skel.min.js"></script>
	<script src="../javascript/skel-layers.min.js"></script>
	<script src="../javascript/init.js"></script>
	<script src="../javascript/jquery.min.js"></script>
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../javascript/createProjects.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../javascript/explorer.js"></script>
	<script src="../javascript/index.js"></script>
	<script src="../javascript/loginController.js"></script>

</body>

</html>
