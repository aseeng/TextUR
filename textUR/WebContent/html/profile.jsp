<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="sidebars.jsp"%>
<html>
<head>
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
<link href="../css/home.css" rel="stylesheet">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<link href="../css/business-casual.min.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TextUR</title>
</head>
<body>
	<section class="content">
        <div class="col-md-3">
          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">

              <h3 class="profile-username text-center" id="profile">${visitor.getUsername()}</h3>

              <p class="text-muted text-center">Java Developer</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>His projects</b> <a class="pull-right">${visitor.getProjects().size()}</a>
                </li>
                <li class="list-group-item">
                  <b>Collaborator in</b> <a class="pull-right">${visitor.getOtherProjects().size()}</a>
                </li>
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
		<div class="box box-primary">Options
			<button class="btn" onclick="changeUsername();">change username</button>
			<button class="btn" onclick="changeEmail();">change email</button>
			<button class="btn" onclick="changePassword();">change password</button>
		</div>
          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">About Me</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i> Education</strong>

              <p class="text-muted">
                B.S. in Computer Science from the University of Tennessee at Knoxville
              </p>

              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> Location</strong>

              <p class="text-muted">Malibu, California</p>

              <hr>

              <strong><i class="fa fa-pencil margin-r-5"></i> Skills</strong>

              <p>
                <span class="label label-danger">UI Design</span>
                <span class="label label-success">Coding</span>
                <span class="label label-info">Javascript</span>
                <span class="label label-warning">PHP</span>
                <span class="label label-primary">Node.js</span>
              </p>

              <hr>

              <strong><i class="fa fa-file-text-o margin-r-5"></i> Notes</strong>

              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      <!-- /.row -->
      <div class="col-md-9">
		<div class="box box-danger center" id="explorer">
			<section class="content"> 
				<h2 class="site-heading text-center">	</h2>
				<div class=" text-center">
					<c:forEach var="project" items="${visitor.getProjects().values()}">
						<button class="btn btn-warning buttonName"> 
							<span class="info-box-icon bg-yellow">
								<i class="fa fa-folder icon_folder"><br> </i> 
								<p class="names">${project.getName()}</p> 
							</span>
						</button>
					</c:forEach>
				</div>
			</section>
		</div>
	</div>
	</section>
</body>
<script src="../javascript/profile.js"></script>
</html>