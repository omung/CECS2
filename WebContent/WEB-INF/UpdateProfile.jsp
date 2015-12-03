<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

<title>Update Profile</title>

<!-- Bootstrap Core CSS -->
<link href="<c:url value="/Resources/css/bootstrap.min.css" />"
	rel="stylesheet" />
<!-- Custom CSS -->
<link href="<c:url value="/Resources/css/modern-business.css" />"
	rel="stylesheet" />

<!-- Custom Fonts -->
<link
	href="<c:url value="/Resources/font-awesome/css/font-awesome.min.css" />"
	rel="stylesheet" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">Start Bootstrap</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/CECS2/register">Register</a></li>
					<li><a href="/CECS2/login">Login</a></li>
					<li><a href="/About">About Us</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Portfolio <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="portfolio-1-col.html">1 Column Portfolio</a></li>
							<li><a href="portfolio-2-col.html">2 Column Portfolio</a></li>
							<li><a href="portfolio-3-col.html">3 Column Portfolio</a></li>
							<li><a href="portfolio-4-col.html">4 Column Portfolio</a></li>
							<li><a href="portfolio-item.html">Single Portfolio Item</a>
							</li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Blog <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="blog-home-1.html">Blog Home 1</a></li>
							<li><a href="blog-home-2.html">Blog Home 2</a></li>
							<li><a href="blog-post.html">Blog Post</a></li>
						</ul></li>
					<li><a href="/CECS2/j_spring_security_logout">Logout</a></li>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Header Carousel -->
	<header id="myCarousel" class="carousel slide">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<div class="fill"
					style="background-image: url('http://placehold.it/1900x1080&amp;text=Slide One');"></div>
				<div class="carousel-caption">
					<h2>Caption 1</h2>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url('http://placehold.it/1900x1080&amp;text=Slide Two');"></div>
				<div class="carousel-caption">
					<h2>Caption 2</h2>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url('http://placehold.it/1900x1080&amp;text=Slide Three');"></div>
				<div class="carousel-caption">
					<h2>Caption 3</h2>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</header>

	<!-- Page Content -->
	<div class="container">

		<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Welcome to Modern Business</h1>
			</div>
			<!-- Contact Form -->
			<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
			<div class="row">
				<div class="col-md-8">
					<h3>Profile</h3>




					<%-- <form id="updateform" action="UpdateUser" name="updateform" method="post" > --%>
					<%-- <c:forEach var="p" items="${arr}" > --%>
					<%-- First Name : <input type="text" name="firstname" id="firstname" value="${p.firstname}" required /> </br> </br> --%>
					<%-- Last Name : <input type="text" name="lastname" id="lastname" value="${p.lastname}" required /> </br> </br> --%>
					<%-- Username : <input type="text" name="username" id="username" value="${p.username}" readonly required /> </br> </br> --%>
					<%-- <input type="hidden" name="password" id="password" value="${p.password}" readonly required /> --%>
					<%-- Institution : <input type="text" name="institution" id="institution" value="${p.institution}" required >  </br> </br> --%>
					<%-- Department : <input type="text" name="department" id="department" value="${p.department}" required >  </br> </br> --%>
					<%-- City : <input type="text" name="city" id="city" value="${p.city}" required >  </br> </br> --%>
					<%-- State : <input type="text" name="state" id="state" value="${p.state}" required >  </br> </br> --%>
					<%-- Country : <input type="text" name="country" id="country" value="${p.country}" required />  </br> </br> --%>
					<%-- </c:forEach>  --%>
					<!-- <input type="submit"  id="submit_updateIt" name="submit_updateIt" value="Update"/> -->
					<%-- </form> --%>



					<form name="updateform" id="updateform" action="UpdateUser"
						method="post">
						<div class="control-group form-group">
							<div class="controls">
								<c:forEach var="p" items="${arr}">
									<label>First Name:</label>
									<input type="text" name="firstname" class="form-control"
										id="firstname" value="${p.firstname}" required
										data-validation-required-message="Please enter your first name.">
									<p class="help-block"></p>
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>Last Name:</label> <input type="text"
									class="form-control" name="lastname" id="lastname"
									value="${p.lastname}" required
									data-validation-required-message="Please enter your last name.">
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>Username: </label> <input type="text"
									class="form-control" name="username" id="username"
									value="${p.username}" readonly required
									data-validation-required-message="Please enter your username.">
								<input type="hidden" name="password" id="password"
									value="${p.password}" readonly required />
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>Institution: </label> <input type="text"
									class="form-control" name="institution" id="institution"
									value="${p.institution}" required
									data-validation-required-message="Please enter your institution.">
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>Department: </label> <input type="text"
									class="form-control" name="department" id="department"
									value="${p.department}" required
									data-validation-required-message="Please enter your institution.">
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>City: </label> <input type="text" class="form-control"
									name="city" id="city" value="${p.city}" required
									data-validation-required-message="Please enter your city.">
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>State: </label> <input type="text" class="form-control"
									name="state" id="state" value="${p.state}" required
									data-validation-required-message="Please enter your state.">
							</div>
						</div>



						<div class="control-group form-group">
							<div class="controls">
								<label>Country: </label> <input type="text" class="form-control"
									name="country" id="country" value="${p.country}" required
									data-validation-required-message="Please enter your country.">
							</div>
						</div>

						</c:forEach>

						<!-- <input type="submit"  id="submit_updateIt" name="submit_updateIt" value="Update"/> -->
						<div id="success"></div>
						<!-- For success/fail messages -->
						<button type="button" onclick="submitFunc(this.id)"
							id="submit_update_It" name="submit_updateIt"
							class="btn btn-primary">Update Profile</button>

					</form>


				</div>

			</div>
			<!-- /.row -->

			<hr>

			<!-- Call to Action Section -->
			<div class="well">
				<div class="row">
					<div class="col-md-8">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Molestias, expedita, saepe, vero rerum deleniti beatae veniam
							harum neque nemo praesentium cum alias asperiores commodi.</p>
					</div>
					<div class="col-md-4">
						<a class="btn btn-lg btn-default btn-block" href="#">Call to
							Action</a>
					</div>
				</div>
			</div>

			<hr>

			<!-- Footer -->
			<footer>
				<div class="row">
					<div class="col-lg-12">
						<p>Copyright &copy; Your Website 2014</p>
					</div>
				</div>
			</footer>

		</div>
		<!-- /.container -->

		<!-- jQuery -->
		<script src="<c:url value="/Resources/js/jquery.js" />"></script>


		<!-- Bootstrap Core JavaScript -->
		<script src="<c:url value="/Resources/js/bootstrap.min.js" />"></script>


		<script src="<c:url value="/Resources/js/jqBootstrapValidation.js" />"></script>


		<script src="<c:url value="/Resources/js/contact_me.js" />"></script>


		<!-- Script to Activate the Carousel -->
		<script>
			$('.carousel').carousel({
				interval : 5000
			//changes the speed
			})
		</script>

		<script>
			function submitFunc(abc) {

				document.getElementById("updateform").submit();
			}
		</script>
</body>

</html>




































<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%--     pageEncoding="ISO-8859-1"%> --%>
<%--     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%--     <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%> --%>
<%--     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   --%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<!-- <title>User profile</title> -->

<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<!--   <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
<!--   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!--   <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script> -->
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	    href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" /> -->

<!-- 	<script type="text/javascript" -->
<!--     src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> -->
<!-- </head> -->
<!-- <body> -->
<%-- <form id="updateform" action="UpdateUser" name="updateform" method="post" > --%>
<%-- <c:forEach var="p" items="${arr}" > --%>
<%-- First Name : <input type="text" name="firstname" id="firstname" value="${p.firstname}" required /> </br> </br> --%>
<%-- Last Name : <input type="text" name="lastname" id="lastname" value="${p.lastname}" required /> </br> </br> --%>
<%-- Username : <input type="text" name="username" id="username" value="${p.username}" readonly required /> </br> </br> --%>
<%-- <input type="hidden" name="password" id="password" value="${p.password}" readonly required /> --%>
<%-- Institution : <input type="text" name="institution" id="institution" value="${p.institution}" required >  </br> </br> --%>
<%-- Department : <input type="text" name="department" id="department" value="${p.department}" required >  </br> </br> --%>
<%-- City : <input type="text" name="city" id="city" value="${p.city}" required >  </br> </br> --%>
<%-- State : <input type="text" name="state" id="state" value="${p.state}" required >  </br> </br> --%>
<%-- Country : <input type="text" name="country" id="country" value="${p.country}" required />  </br> </br> --%>
<%-- </c:forEach>  --%>
<!-- <input type="submit"  id="submit_updateIt" name="submit_updateIt" value="Update"/> -->
<%-- </form> --%>
<!-- </body> -->
<!-- </html> -->