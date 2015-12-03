<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JavaScript Practice</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  
<link rel="stylesheet" type="text/css"
	    href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />

</head>
<body>
	<table>
		<tr id="tr">
			<td id="td">Delete this node</td>
		</tr>
	</table>
	<input type="submit" onclick="myFunc(this.id)" id="yo" value="click me" />
	<input type="button" onclick="button2()" id="yo2" value="button2" />
	<input type="button" onclick="button3()" id="yo3" value="button3" />
	<p id="p">
		<a href="/">Home</a>
	</p>
	<h1 id="h1">
		<a href="www.google.com"> google</a>
	</h1>



	<script>

		function myFunc(abc) {
			this_node = document.getElementById("p");
		
			this_node.parentNode.removeChild("this_node");
		}

		function button2() {
			var the_node = document.getElementsByTagName("input")[0];
			the_node.parentNode.removeChild("the_node");
		}
	</script>

</body>
</html>