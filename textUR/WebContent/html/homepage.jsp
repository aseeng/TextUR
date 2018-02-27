<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="sidebars.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="../css/home.css" rel="stylesheet">

<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>InstanText | Showcase</title>
</head>

<body class="skin-red-light">
	<div class="box box-danger center" id="explorer">
		<section class="content">
		<button class="btn btn-danger" onclick="back();" id="returnButton">
			<i class="fa fa-arrow-left"></i>
		</button>
		<div class="input-group-btn" id="options">
			<button class="btn btn-sm btn-success dropdown-toggle" data-toggle="dropdown">Options
				<span class="fa fa-caret-down"></span>
			</button>
			<ul class="dropdown-menu" id="options_menu">
				<li id="addLi"><a id="add" onclick="addPackage();">Add Package</a></li>
				<c:if test="${project.getCreator().getUsername() == user.getUsername()}">
					<li><a id="rename" onclick="renameProject();">Rename project</a></li>
					<li><a id="delete" onclick="removeProject();">Delete project</a></li>
				</c:if>
				<li><a href="page?action=settings">Settings</a></li>
				<li><a onclick="compile();">Compile</a></li>
				<li><a onclick="execute();">Execute</a></li>
			</ul>
		</div>
		<h3 class="site-heading text-center">
			<span class="site-heading-lower" id="name">${project.getName()}</span>
		</h3>
		<div class="text-center" id="contentDiv"> 
			<c:forEach var="pack" items="${project.getPackages().values()}">
				<button class="btn btn-warning buttonName" onclick="showContent('${pack.getName()}')"> 
					<span class="info-box-icon bg-yellow">
						<i class="fa fa-folder icon_folder"><br> </i> 
						<p class="names">${pack.getName()}</p> 
					</span>
				</button>
			</c:forEach></div>
		</section>
	</div>

</body>
<script src="../js/compiler.js"></script>
</html>
