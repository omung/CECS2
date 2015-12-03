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

<title>Modern Business - Start Bootstrap Template</title>

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
				<h1 class="page-header">Groups Info</h1>
			</div>
			<!-- Contact Form -->
			<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
			<div class="row">
				<div class="col-md-8">
					<h3>Registration page</h3>


					<form name="updateAttributeValues" id="updateAttributeValues"
						action="updateAttributesValues" method="post"
						class="control-group form-group" class="controls">


						<table class="table">
							<tr>
								<td>Group names</td>
								<td>Attributes Name</td>
								<td>Values for Attributes</td>
								<td>Submit</td>
							</tr>
							<c:forEach var="p" items="${arr}" varStatus="loop">
								<tr>
									<td name="groupname">${p.groupname}</td>
									<td name="attributename" >${p.attributename}</td>
									<td><input class="form-control" id="value${loop.index}"
										value="${p.value}" type="text" name="value" /></td>
					
									<td id="submit_char" name="submit_char"><input
										type="button" id="${p.combine_id},${loop.index}" onclick="updateValues(this.id)" 
										class="btn btn-primary" value="Update value" /></td>
								</tr>
							</c:forEach>
						</table>
					</form>
					<form name="backPage" id="backPage" action="backPage" method="Post">
						<input type="submit" id="button_backPage" class="form-control"
							onclick="backToProfilePage(this.id)" value="Go To Profile Page" />
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
		function updateValues(xyz) {
			alert(xyz);
			var str= xyz.split(",");
			var a= str[0];
			var b= str[1];
			alert(a);
			alert(b);
		var c= document.getElementById("value".concat(b)).value;
		alert(c);	
		window.location="/CECS2/updateAttributesValues?combine_id=".concat(a).concat("&&value=").concat(c);
		}
	</script>


	<script>
		function seeAttributes(id) {
			window.location = "/CECS2/seeAttributes?id=".concat(id);
		}
	</script>
	<script>
		function myFunc(abc) {
			var x = document.getElementById(abc).value;
			$.ajax({
				type : "GET",
				url : "/CECS2/storeChar?Characteristic=".concat(x).concat(
						"&&combine_id=").concat(abc),
				data : "{list: " + x + "}",
				contentType : "application/json;charset=utf-8",
				dataType : "json",
				success : function(result) {
					debugger;
					var json = result;
					if (result) {
						alert(result);
						document.getElementById(abc).disabled = true;
					} else {
						alert(result);
					}
				},
				error : function(response) {
					debugger;
					alert(response.responseText);
				}
			})
		}
	</script>

	<script>
		function backToProfilePage() {
			console.log("Back to profile page function chl ra h");
			document.getElementById("backPage").submit();

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
<!-- <title>Insert title here</title> -->
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
<%-- <form action="attributesValues" method="POST"> --%>
<!-- <table> <tr><td>Charachteristic Name</td><td> Input Type</td><td>Enter values for characteristic</td><td>Submit</td></tr> -->
<%-- <c:forEach var="p" items="${art}" > --%>
<!-- <tr > -->
<%-- <td>${p.charName}</td> --%>
<!-- <td> -->
<%-- ${p.inputType}</td> --%>
<!-- <td> -->
<%-- <input id="${p.combine_id}" type="text" name="name"/>  --%>
<!-- </td> -->
<%-- <td name="submit_char"><input type="button" id="but" onclick="myFunc(${p.combine_id})" value="Submit value" /></td> --%>
<!-- </tr> -->
<%-- </c:forEach> --%>
<!-- </table> -->
<%-- </form> --%>
<!-- </body> -->
<!-- </html> -->