<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="model.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<link href="../css/settings.css" rel="stylesheet" />
</head>

<body class="skin-red-light" onload="loadCollaboratorPage('${project.getCreator().getUsername()}','${user.getUsername()}')">   

	<header class="main-header"> <!-- Logo -->
	<a href="page?action=homepage" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini">I<b>T</b></span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg">Instant<b>Text</b></span>
	</a> <!-- Header Navbar: style can be found in header.less --> 
	<nav class="navbar navbar-static-top"> <!-- Sidebar toggle button-->
	
	<div class="navbar-custom-menu">
		<ul class="nav navbar-nav">
			<!-- User Account: style can be found in dropdown.less -->
			<li class="dropdown user user-menu">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<img src="../dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
					<span id="username" class="hidden-xs">${user.getUsername()}</span>
				</a>
				<ul class="dropdown-menu">
					<!-- User image -->
					<li class="user-header">
						<img src="../dist/img/user2-160x160.jpg" class="img-circle"	alt="User Image">
						<p id="username">${user.getUsername()}<br>Java Developer </p>
					</li>

					<!-- Menu Footer-->
					<li class="user-footer">
						<div class="pull-left">
							<a href="#" class="btn btn-default btn-flat">Profile</a>
						</div>
						<div class="pull-right">
							<a onclick="logout();" class="btn btn-default btn-flat">Sign	out</a>
						</div>
					</li>
				</ul></li>
		</ul>
	</div>
	</nav> </header>

	<section class="box box-primary center">

	<div class="nav-tabs-custom">
		<ul class="nav nav-tabs">

			<li class="active"><a href="#tab_1" data-toggle="tab"> Checkpoint 
				<i class="fa fa-flag-checkered"></i>
			</a></li>
			<li onclick="findUsers();"><a href="#tab_2" data-toggle="tab"> Collaborator
				<i class="fa fa-user"></i>
			</a></li>

		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="tab_1">
				<a class="btn bg-blue" onclick="createCheckpoint();">Create Checkpoint</a> <br> <br>

				<ul class="timeline">
					<c:forEach var="check" items="${project.getCheckpoints()}">

						<li><i class="fa bg-blue"></i>
							<div class="timeline-item">
								<span class="time"><i class="fa fa-clock-o"></i>${check.getDate()}</span>
								<!-- data del checkpoint -->

								<h3 class="timeline-header">
									<a href="#">${check.getCreator().getUsername()} </a>
									<!-- utente checkpiont -->
								</h3>

								<div class="timeline-body">${check.getDescription()}</div>
								<div class="timeline-footer">
									<a class="btn btn-success btn-xs bg-green" onclick="restoreCheckpoint(${check.getId()});"> Restore</a>
								</div>
							</div></li>
					</c:forEach>
				</ul>
			</div>

			<div class="tab-pane" id="tab_2">
				<div class="form-group">
					<c:if test="${user.getUsername() == project.getCreator().getUsername()}">
						<label>Select Collaborator</label>
						<select	class="js-example-basic-multiple" id="selectUsers" name="states[]" multiple style="width:100%"> </select> <br> <br>
						<a class="btn btn-success btn bg-green" onclick="addCollaborator('${project.getId()}','${project.getCreator().getUsername()}','${user.getUsername()}');">Add</a>
					</c:if>
				</div>
				<div class="row" id="collaborators"></div>
			</div>
		</div>
	</div>
	</section>
	<script>
			$(document).ready(function() {
				$('.sidebar-menu').tree();
			});
	</script>
	<script src="../javascript/checkpoint.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

</body>
</html>