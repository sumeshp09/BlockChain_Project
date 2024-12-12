<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@page import="com.connection.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- Site Metas -->
<title>Life Care - Responsive HTML5 Multi Page Template</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<!-- Site Icons -->
<link rel="shortcut icon" href="images/fevicon.ico.png"
	type="image/x-icon" />
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="style.css">
<!-- Colors CSS -->
<link rel="stylesheet" href="css/colors.css">
<!-- ALL VERSION CSS -->
<link rel="stylesheet" href="css/versions.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">
<!-- Modernizer for Portfolio -->
<script src="js/modernizer.js"></script>
<!-- [if lt IE 9] -->
</head>
<body class="clinic_version">
	<!-- LOADER -->
	<div id="preloader">
		<img class="preloader" src="images/loaders/heart-loading2.gif" alt="">
	</div>
	<!-- END LOADER -->
	<header>
		<div class="header-top wow fadeIn">
			<div class="container">
				<a class="navbar-brand" href="index.html"><img
					src="images/logo.png" alt="image"></a>

			</div>
		</div>
		<div class="header-bottom wow fadeIn">
			<div class="container">
				<nav class="main-menu">


					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li><a href="HospitalHomePage.jsp">Home</a></li>
							<li><a data-scroll href="H_DataPage.jsp">Data Show</a></li>
							
							<li><a class="active" data-scroll
								href="H_Add_Patient_infoPage.jsp">Add Patient Info</a></li>
							<!-- <li><a class="active" data-scroll href="AnalysisPage.jsp">Analysis</a></li> -->
							<li><a data-scroll href="loginpage">Logout</a></li>

						</ul>
					</div>
				</nav>
				<div class="serch-bar">
					<div id="custom-search-input"></div>
				</div>
			</div>
		</div>
	</header>
	<div>
		<br /> <br />
	</div>
	<div>
		<br /> <br />
	</div>
	<div id="service" class="services wow fadeIn">
		<div class="container">
			<div class="row">
				<div>
					<div class="appointment-form" align="center">
						<h3>
							<span>+</span> Register
						</h3>
						<div class="form">
							<fieldset>
								<form action="H_Add_Patient_infoPage.jsp" method="post">

									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="row">
											<div class="form-group">
												<select class="form-control" name="id" id="id"
													required="required" onchange="this.form.submit();">
													<option value="">Select Info</option>
													<%
														try {

															int i = 1;
															String query = "select * from tblregister";
															Connection conn = Dbconn.conn();
															Statement stmt = conn.createStatement();
															ResultSet rs = stmt.executeQuery(query);
															while (rs.next()) {
													%>
													<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>

													<%
														}
														} catch (Exception e) {
															e.printStackTrace();
														}
													%>
												</select>
											</div>
										</div>
									</div>
								</form>
								<%
								String uname="";
								String uemail="";
									String id = request.getParameter("id");
									if (id == null) {
									} else {
										try {

											int i = 1;
											String query = "select * from tblregister where pid='"+id+"'";
											Connection conn = Dbconn.conn();
											Statement stmt = conn.createStatement();
											ResultSet rs = stmt.executeQuery(query);
											if (rs.next())
											{
												uname=rs.getString("Full_Name");
												uemail=rs.getString("Email_Id");
											}
										} catch (Exception e) {
											e.printStackTrace();
										}
								%>
								<form action="addpatientinfo" method="post">
									<table class="form-group">
										<tr>
											<td>User Name</td>
											<td><input type="text" required="required" id="uname"
												name="uname" readonly="readonly" value="<%=uname %>" /></td>
											<td>&nbsp;&nbsp;User Email-ID</td>
											<td><input type="text" required="required" name="uemail"
												id="uemail" readonly="readonly" value="<%=uemail %>"/></td>
										</tr>
										<tr>
											<td>Enter Systolic BP</td>
											<td><input type="number" required="required"
												id="systolic_bp" name="systolic_bp"
												placeholder="Enter Systolic BP" /></td>
											<td>&nbsp;&nbsp;Enter diastolic BP</td>
											<td><input type="number" required="required"
												placeholder="Enter diastolic_bp" name="diastolic_bp"
												id="diastolic_bp" /></td>
										</tr>
										<tr>
											<td>Enter Heart Rate</td>
											<td><input type="number" required="required"
												placeholder="Enter heart_rate" name="heart_rate"
												id="heart_rate" /></td>
											<td>&nbsp;&nbsp; Enter QT Interval</td>
											<td><input type="number" required="required"
												placeholder="Enter QT_interval" name="QT_interval"
												id="QT_interval" /></td>
										</tr>
										<tr>
											<td>Enter PR Interval</td>
											<td><input type="number" required="required"
												placeholder="Enter PR_interval" name="PR_interval"
												id="PR_interval" /></td>
											<td>&nbsp;&nbsp;Enter oxy saturation</td>
											<td><input type="number" required="required"
												placeholder="Enter oxy_saturation" name="oxy_saturation"
												id="oxy_saturation" /></td>
										</tr>
										<tr>
											<td>Select Info</td>
											<td><select class="form-control" name="Info" id="Info"
												required="required">
													<option value="">Select Info</option>
													<option value="Normal">Normal</option>
													<option value="Critical">Critical</option>

											</select></td>

											<td>&nbsp;&nbsp;Enter Temperature</td>
											<td><input type="number" required="required"
												placeholder="Enter temperature" name="temperature"
												id="temperature" /></td>
										</tr>
										<tr>
											
											<td colspan="2" align="center"><input type="hidden"  name="id"
												id="id" value="<%=id %>" readonly="readonly" /></td>
										</tr>
										<tr>
										<td colspan="4" align="center"><button type="submit">Submit</button></td>
										</tr>
									</table>

								</form>
								<%
									}
								%>
							</fieldset>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end section -->

	<!-- doctor -->



	<!-- end section -->
	<footer id="footer" class="footer-area wow fadeIn">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="logo padding">
						<a href=""><img src="images/logo.png" alt=""></a>
						<p>Locavore pork belly scen ester pine est chill wave
							microdosing pop uple itarian cliche artisan.</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="footer-info padding">
						<h3>CONTACT US</h3>
						<p>
							<i class="fa fa-map-marker" aria-hidden="true"></i> PO Box 16122
							Collins Street West Victoria 8007 Australia
						</p>
						<p>
							<i class="fa fa-paper-plane" aria-hidden="true"></i>
							info@gmail.com
						</p>
						<p>
							<i class="fa fa-phone" aria-hidden="true"></i> (+1) 800 123 456
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="subcriber-info">
						<h3>SUBSCRIBE</h3>
						<p>Get healthy news, tip and solutions to your problems from
							our experts.</p>
						<div class="subcriber-box">
							<form id="mc-form" class="mc-form">
								<div class="newsletter-form">
									<input type="email" autocomplete="off" id="mc-email"
										placeholder="Email address" class="form-control" name="EMAIL">
									<button class="mc-submit" type="submit">
										<i class="fa fa-paper-plane"></i>
									</button>
									<div class="clearfix"></div>
									<!-- mailchimp-alerts Start -->
									<div class="mailchimp-alerts">
										<div class="mailchimp-submitting"></div>
										<!-- mailchimp-submitting end -->
										<div class="mailchimp-success"></div>
										<!-- mailchimp-success end -->
										<div class="mailchimp-error"></div>
										<!-- mailchimp-error end -->
									</div>
									<!-- mailchimp-alerts end -->
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<div class="copyright-area wow fadeIn">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="footer-text">
						<p>© 2018 Lifecare. All Rights Reserved.</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="social">
						<ul class="social-links">
							<li><a href=""><i class="fa fa-rss"></i></a></li>
							<li><a href=""><i class="fa fa-facebook"></i></a></li>
							<li><a href=""><i class="fa fa-twitter"></i></a></li>
							<li><a href=""><i class="fa fa-google-plus"></i></a></li>
							<li><a href=""><i class="fa fa-youtube"></i></a></li>
							<li><a href=""><i class="fa fa-pinterest"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end copyrights -->
	<a href="#home" data-scroll class="dmtop global-radius"><i
		class="fa fa-angle-up"></i></a>
	<!-- all js files -->
	<script src="js/all.js"></script>
	<!-- all plugins -->
	<script src="js/custom.js"></script>
	<!-- map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNUPWkb4Cjd7Wxo-T4uoUldFjoiUA1fJc&callback=myMap"></script>
</body>
</html>
