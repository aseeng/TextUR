<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="sidebars.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body class="hold-transition skin-red sidebar-mini sidebar-collapse">
	<!-- Site wrapper -->
	<div class="wrapper">

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content"> <!-- Default box -->
			<h2 class="site-heading text-center">
				<span class="site-heading-lower">Open or create your <b>project</b></span>
			</h2>
			<br>
			<form action="createProjects.jsp" class="btcenter">
				<div class="row">
					<button class="btn btn-block btn-flat bg-red" type="submit">
						<span class="info-box-icon bg-red"> <i
							class="fa fa-plus-square" style="padding-top: 20px"></i>
						</span>

						<div class="info-box-content">
							<span class="info-box-text">Create a new project</span>
						</div>
						<!-- /.info-box-content -->
						<!-- /.info-box -->
					</button>
					<button class="btn btn-block btn-flat bg-red" href=""
						class="sidebar-toggle" data-toggle="push-menu">
						<span class="info-box-icon bg-red"> <i
							class="fa fa-folder-open" style="padding-top: 20px"></i>
						</span>

						<div class="info-box-content">
							<span class="info-box-text">Open an existing project</span>
						</div>
						<!-- /.info-box-content -->
						<!-- /.info-box -->
					</button>
				</div>
			</form>

			</section>
	
		</div>
	</div>
	</div>

	</section>

		</div>
		<!-- /.content-wrapper -->
		<!-- 
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.4.0
			</div>
			<strong>Copyright &copy; 2014-2016 <a
				href="https://adminlte.io">Almsaeed Studio</a>.
			</strong> All rights reserved.
		</footer>
-->
	</div>
	<!-- ./wrapper -->
	<!-- jQuery 3 -->
	
	<script>
		$(document).ready(function() {
			$('.sidebar-menu').tree()
		})
	</script>
	
</body>
</html>