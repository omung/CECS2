<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  
<link rel="stylesheet" type="text/css"
	    href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />
	 
	<title>Delete A Group</title>
</head>
<body><form action="Delete">
Search the group you want to delete by its name: <input type="text" name="deleteGroup" id="deleteGroup" required/> <br/><br/>
<input type="button" onclick="GroupExist(this.id)" name="g_button" id="g_button" value="Check Group Name" />
</form>
<p> ${error_message}</p>
<p> ${success_message}></p>

<script>

function GroupExist(value) {
	var x=document.getElementById("deleteGroup").value;

	var answer= confirm("Press Ok to delete the Group")
	if(answer){
	debugger;
	        $.ajax({
	        	  type: "GET",     
	              url: "/CECS2/DeleteGroupSearch?search=".concat(x),
	            		  data: "{characteristic: " + x + "}",
	            contentType: "application/json;charset=utf-8",
	            dataType: "json",
	            success: function (response) {
	                debugger;
	           	 
			var json=response;
	           if(response){
	        	   $("#error_message").text("name is available");}
	 else
	  {
	  $("#error_message").text("Duplicate characterstic name, choose another");
	  }        
	            
	            
	         
	             },
	            error: function (response) {
	                debugger;
	                alert(response.responseText);
	            }
	        });}
	else{
		
		window.location="/CECS2/DeleteGroup"
	}
	    }</script>

</body>
</html>