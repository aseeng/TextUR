<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>textUR | Showcase</title>
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="../bootstrap/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="../bootstrap/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="../bootstrap/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css">

<!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<link rel="stylesheet" href="../css/business-casual.min.css">

<link rel="stylesheet" href="../css/sidebars.css">
<link rel="stylesheet" href="../css/swal.css">
<link rel="stylesheet" href="../css/calendar.css">
</head>
<body>

  <header class="main-header" id ="sidebar"> <!-- Logo -->
	<a href="page?action=index" class="logo" id="logo_nav"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini">I<b>T</b></span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg">Text<b>UR</b></span>
	</a> <!-- Header Navbar: style can be found in header.less -->
	
	<nav class="navbar navbar-static-top" id="navbar"> <!-- Sidebar toggle button-->
		<!-- Messages: style can be found in dropdown.less-->
		<div class="navbar-custom-menu" id="navbar_menu">
			<ul class="nav navbar-nav">
				<span id="project">${project.getName()}</span>
				<!-- user dropdown menu -->
				<li class="dropdown user user-menu">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<img src="../dist/img/avatar5.png" class="user-image" alt="User Image">
						<span id="user" class="hidden-xs">${user.getUsername()}</span>
					</a>
	
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header">
							<img src="../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
							<p id="username">${user.getUsername()}<br>Java Developer</p>
						</li>
	
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="page?action=openProfile&name=${user.getUsername()}" class="btn btn-default btn-flat">Profile</a>
							</div>
							<div class="pull-right">
								<a onclick="logout();" class="btn btn-default btn-flat">Logout</a>
							</div>
						</li>
					</ul>
				</li>
				<li> <a id="sidebarButton" data-toggle="control-sidebar" onclick="handleClientLoad();"><i class="fa fa-gears"></i></a></li>
				
				
			</ul>
		</div>
	</nav> </header>
	

<div class="control-sidebar-bg"></div>

	<aside class="control-sidebar control-sidebar-light" id="aside">
  
		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
			<li class="active"><a href="#control-sidebar-calendar-tab" data-toggle="tab" aria-expanded="false"><i class="fa fa-calendar"></i></a></li>
			<li><a href="#control-sidebar-chat-tab" data-toggle="tab" aria-expanded="false"><i class="fa fa-envelope"></i></a></li>
		</ul>
		
		<div class="tab-content">
			
			<div class="tab-pane active" id="control-sidebar-calendar-tab">
				<h3 class="control-sidebar-heading"></h3>
				<div id="calendar"></div>
					<div id ="calendarButton">
						<div id="createEvent" class="input-group-btn">
							<div class="legend">
								<span class="entry blue">conference</span>
								<span class="entry orange">reunion</span>
								<span class="entry red">deadline</span>
								<span class="entry yellow">other</span>
							</div>
						</div>
					</div>
				</div>
			
			<div class="tab-pane" id="control-sidebar-chat-tab">
				<h3 class="control-sidebar-heading"></h3>
				
				<div class="box box-danger direct-chat direct-chat-danger">
					<div class="box-body" id="chatBox">
						<div class="direct-chat-messages" id="chat_zone"></div>
					</div>
				</div>
				
				<div class="input-group">
					<input type="text" name="message" placeholder="Write message ..."
						class="form-control" id="message"> <span
						class="input-group-btn">
						<button class="btn btn-danger" id="sendMessage" onclick="sendMessage();">Send</button>
					</span>
				</div>
			</div>
		</div>
	</aside>
		
	</script>
	<!-- jQuery 3 -->
	<script src="../bootstrap/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="../bootstrap/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script src="../bootstrap/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="../bootstrap/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="../dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../dist/js/demo.js"></script>
	<script src="../js/chat.js"></script>
	<script src="../js/explorer.js"></script>
	<script src="../js/calendar.js"></script>
	<script src="../js/sidebars.js"></script>
	<script src="../js/loginController.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
	<script src="../js/myCalendar.js"></script>
	<script async defer src="https://apis.google.com/js/api.js"
   		onreadystatechange="if (this.readyState === 'complete') this.onload()">
	</script>	
	
</body>
</html>