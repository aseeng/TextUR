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

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<link href="../css/business-casual.min.css" rel="stylesheet">

<link href="../css/sidebars.css" rel="stylesheet">
<link rel="stylesheet" href="../css/swal.css">
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
	
				<!-- user dropdown menu -->
				<li class="dropdown user user-menu">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<img src="../dist/img/user2-160x160.jpg" class="user-image"	alt="User Image">
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
								<a href="#" class="btn btn-default btn-flat">Profile</a>
							</div>
							<div class="pull-right">
								<a href="page?action=logout" class="btn btn-default btn-flat">Logout</a>
							</div>
						</li>
					</ul>
				</li>
				<li> <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a></li>
			</ul>
		</div>
	</nav> </header>
	
	<aside class="control-sidebar control-sidebar-dark control-sidebar-open">
	    <!-- Create the tabs -->
	    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
	      <li><a href="#control-sidebar-home-tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-home"></i></a></li>
	      <li><a href="#control-sidebar-settings-tab" data-toggle="tab" aria-expanded="false"><i class="fa fa-gears"></i></a></li>
	    </ul>
	    <!-- Tab panes -->
	    <div class="tab-content">
	      <!-- calendar tab content -->
	      <div class="tab-pane active" id="control-sidebar-home-tab">
	        <h3 class="control-sidebar-heading">CALENDAR</h3>
						<div class="box box-solid bg-red-gradient">
							<div class="box-header ui-sortable-handle" style="cursor: move;">
								<!-- tools box -->
								<div class="pull-right box-tools">
									<!-- button with a dropdown -->
									<div class="btn-group">
										<button type="button"
											class="btn btn-success btn-sm dropdown-toggle"
											data-toggle="dropdown">
											<i class="fa fa-bars"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><a href="#">Add new event</a></li>
											<li><a href="#">Clear events</a></li>
											<li class="divider"></li>
											<li><a href="#">View calendar</a></li>
										</ul>
									</div>
								</div>
								<!-- /. tools -->
							</div>
							<!-- /.box-header -->
							<div class="box-body no-padding" style="">
								<!--The calendar -->
								<div id="calendar" style="width: 100%">
									<div class="datepicker datepicker-inline">

										<div class="datepicker-days" style="">
											<table class="table-condensed">
												<thead>
													<tr>
														<th colspan="7" class="datepicker-title"
															style="display: none;"></th>
													</tr>
													<tr>
														<th class="prev">«</th>
														<th colspan="5" class="datepicker-switch">February
															2018</th>
														<th class="next">»</th>
													</tr>
													<tr>
														<th class="dow">Su</th>
														<th class="dow">Mo</th>
														<th class="dow">Tu</th>
														<th class="dow">We</th>
														<th class="dow">Th</th>
														<th class="dow">Fr</th>
														<th class="dow">Sa</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="old day" data-date="1517097600000">28</td>
														<td class="old day" data-date="1517184000000">29</td>
														<td class="old day" data-date="1517270400000">30</td>
														<td class="old day" data-date="1517356800000">31</td>
														<td class="day" data-date="1517443200000">1</td>
														<td class="day" data-date="1517529600000">2</td>
														<td class="day" data-date="1517616000000">3</td>
													</tr>
													<tr>
														<td class="day" data-date="1517702400000">4</td>
														<td class="day" data-date="1517788800000">5</td>
														<td class="day" data-date="1517875200000">6</td>
														<td class="active day" data-date="1517961600000">7</td>
														<td class="day" data-date="1518048000000">8</td>
														<td class="day" data-date="1518134400000">9</td>
														<td class="day" data-date="1518220800000">10</td>
													</tr>
													<tr>
														<td class="day" data-date="1518307200000">11</td>
														<td class="day" data-date="1518393600000">12</td>
														<td class="day" data-date="1518480000000">13</td>
														<td class="day" data-date="1518566400000">14</td>
														<td class="day" data-date="1518652800000">15</td>
														<td class="day" data-date="1518739200000">16</td>
														<td class="day" data-date="1518825600000">17</td>
													</tr>
													<tr>
														<td class="day" data-date="1518912000000">18</td>
														<td class="day" data-date="1518998400000">19</td>
														<td class="day" data-date="1519084800000">20</td>
														<td class="day" data-date="1519171200000">21</td>
														<td class="day" data-date="1519257600000">22</td>
														<td class="day" data-date="1519344000000">23</td>
														<td class="day" data-date="1519430400000">24</td>
													</tr>
													<tr>
														<td class="day" data-date="1519516800000">25</td>
														<td class="day" data-date="1519603200000">26</td>
														<td class="day" data-date="1519689600000">27</td>
														<td class="day" data-date="1519776000000">28</td>
														<td class="new day" data-date="1519862400000">1</td>
														<td class="new day" data-date="1519948800000">2</td>
														<td class="new day" data-date="1520035200000">3</td>
													</tr>
													<tr>
														<td class="new day" data-date="1520121600000">4</td>
														<td class="new day" data-date="1520208000000">5</td>
														<td class="new day" data-date="1520294400000">6</td>
														<td class="new day" data-date="1520380800000">7</td>
														<td class="new day" data-date="1520467200000">8</td>
														<td class="new day" data-date="1520553600000">9</td>
														<td class="new day" data-date="1520640000000">10</td>
													</tr>
												</tbody>
												<tfoot>
													<tr>
														<th colspan="7" class="today" style="display: none;">Today</th>
													</tr>
													<tr>
														<th colspan="7" class="clear" style="display: none;">Clear</th>
													</tr>
												</tfoot>
											</table>
										</div>
										<div class="datepicker-months" style="display: none;">
											<table class="table-condensed">
												<thead>
													<tr>
														<th colspan="7" class="datepicker-title"
															style="display: none;"></th>
													</tr>
													<tr>
														<th class="prev">«</th>
														<th colspan="5" class="datepicker-switch">2018</th>
														<th class="next">»</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td colspan="7"><span class="month">Jan</span><span
															class="month focused active">Feb</span><span
															class="month">Mar</span><span class="month">Apr</span><span
															class="month">May</span><span class="month">Jun</span><span
															class="month">Jul</span><span class="month">Aug</span><span
															class="month">Sep</span><span class="month">Oct</span><span
															class="month">Nov</span><span class="month">Dec</span></td>
													</tr>
												</tbody>
												<tfoot>
													<tr>
														<th colspan="7" class="today" style="display: none;">Today</th>
													</tr>
													<tr>
														<th colspan="7" class="clear" style="display: none;">Clear</th>
													</tr>
												</tfoot>
											</table>
										</div>
										<div class="datepicker-years" style="display: none;">
											<table class="table-condensed">
												<thead>
													<tr>
														<th colspan="7" class="datepicker-title"
															style="display: none;"></th>
													</tr>
													<tr>
														<th class="prev">«</th>
														<th colspan="5" class="datepicker-switch">2010-2019</th>
														<th class="next">»</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td colspan="7"><span class="year old">2009</span><span
															class="year">2010</span><span class="year">2011</span><span
															class="year">2012</span><span class="year">2013</span><span
															class="year">2014</span><span class="year">2015</span><span
															class="year">2016</span><span class="year">2017</span><span
															class="year active focused">2018</span><span class="year">2019</span><span
															class="year new">2020</span></td>
													</tr>
												</tbody>
												<tfoot>
													<tr>
														<th colspan="7" class="today" style="display: none;">Today</th>
													</tr>
													<tr>
														<th colspan="7" class="clear" style="display: none;">Clear</th>
													</tr>
												</tfoot>
											</table>
										</div>
										<div class="datepicker-decades" style="display: none;">
											<table class="table-condensed">
												<thead>
													<tr>
														<th colspan="7" class="datepicker-title"
															style="display: none;"></th>
													</tr>
													<tr>
														<th class="prev">«</th>
														<th colspan="5" class="datepicker-switch">2000-2090</th>
														<th class="next">»</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td colspan="7"><span class="decade old">1990</span><span
															class="decade">2000</span><span
															class="decade active focused">2010</span><span
															class="decade">2020</span><span class="decade">2030</span><span
															class="decade">2040</span><span class="decade">2050</span><span
															class="decade">2060</span><span class="decade">2070</span><span
															class="decade">2080</span><span class="decade">2090</span><span
															class="decade new">2100</span></td>
													</tr>
												</tbody>
												<tfoot>
													<tr>
														<th colspan="7" class="today" style="display: none;">Today</th>
													</tr>
													<tr>
														<th colspan="7" class="clear" style="display: none;">Clear</th>
													</tr>
												</tfoot>
											</table>
										</div>
										<div class="datepicker-centuries" style="display: none;">
											<table class="table-condensed">
												<thead>
													<tr>
														<th colspan="7" class="datepicker-title"
															style="display: none;"></th>
													</tr>
													<tr>
														<th class="prev">«</th>
														<th colspan="5" class="datepicker-switch">2000-2900</th>
														<th class="next">»</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td colspan="7"><span class="century old">1900</span><span
															class="century active focused">2000</span><span
															class="century">2100</span><span class="century">2200</span><span
															class="century">2300</span><span class="century">2400</span><span
															class="century">2500</span><span class="century">2600</span><span
															class="century">2700</span><span class="century">2800</span><span
															class="century">2900</span><span class="century new">3000</span></td>
													</tr>
												</tbody>
												<tfoot>
													<tr>
														<th colspan="7" class="today" style="display: none;">Today</th>
													</tr>
													<tr>
														<th colspan="7" class="clear" style="display: none;">Clear</th>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="input-group">
							<span class="input-group-btn">
								<button id="btnCreateEvents" class="btn btn-primary"
									onclick="insertEvent();">Create Events</button>
							</span>
						</div>
	      </div>
	      <!-- chat tab content -->
	      <div class="tab-pane" id="control-sidebar-settings-tab">
	          <h3 class="control-sidebar-heading">CHAT</h3>
	          <!-- chat dropdown menu -->
				<div class="box box-danger direct-chat direct-chat-danger">
					<div class="box-body" id="chatBox">
						<div class="direct-chat-messages" id="chat_zone"></div>
					</div>
				</div>
				<div class="input-group">
					<input type="text" name="message" placeholder="Write message ..."
						class="form-control" id="message"> <span
						class="input-group-btn">
						<button class="btn btn-danger" onclick="sendMessage();">Send</button>
					</span>
				</div>
	      </div>
	      <!-- /.tab-pane -->
	    </div>
	  </aside>
	<script src="https://apis.google.com/js/api.js"
		onload="this.onload=function(){};handleClientLoad()"
		onreadystatechange="if (this.readyState === 'complete') this.onload()">
		
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
	<script src="../javascript/chat.js"></script>
	<script src="../javascript/explorer.js"></script>
	<script src="../javascript/calendar.js"></script>
	<script src="../javascript/sidebars.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
</body>
</html>