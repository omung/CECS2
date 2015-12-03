<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  
<link rel="stylesheet" type="text/css"
	    href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />
	    
<title>New group</title>
</head>
<body>
<h1>Create a New Group</h1>
</br>
</br>

<form id="form" name="form" action="GroupSubmit" method="get">
<label> Group Name:</label> 
<input type="text" id="name" name="name"> 
<input type="Button" id="button" name ="button" onclick="checkGroupName()" value="Check Availability" />
<p id="error_message"></p>
<input type="text" id="search" name="search" value="" />
<input type="button" onclick="searchGroup()" name="search_button" id="search_button" value="Search"/>
<input type="button" id="sub" onclick="s2()" name ="sub" value="Submit" />
<table id="myTable">
<c:forEach  var="i" items="${arr}">

<tr>
<td id="${i}" name="${i}" value="${i}"> ${i} </td>
<td> <input name="SelectAtrributes" type="checkbox">  </td>
</tr>
</c:forEach>
</table>

<div id="div_ar">

</div>
<div id="div_arr2">
</div>
  

</form>
<script>

</script>

<script>
function s2(){
	var i=0;
	var a=document.getElementById("name").value
	
	var myArr=[];
	alert("Please chal jha");
	for(i=0; i<document.form.att.length;i++){
		
		var x= document.form.att[i];
		if(x.checked){
			alert("yes");
			myArr.push(x.id);
		}
		else{ alert("No");}
	}
	
	alert(myArr);
	

	$("#div_arr2").html('')
	var t="<input type=hidden value="+x+" name=cstics>"
	$(t).appendTo("#div_arr2")
	window.location="/CECS2/GroupSubmit?name=".concat(a)+"&&cstics=".concat(myArr)
	
}

</script>

<script>

function searchGroup()
{
	alert("Working")
	var x= document.getElementById("search").value
	debugger;
alert(x);
	$.ajax({
		TYPE: "GET",
		url: "/CECS2/AdminGroupSearch?search=".concat(x),
		  data: "{search: " + x + "}",
          contentType: "application/json;charset=utf-8",
          dataType: "json",
          success: function (result) {
              debugger;
           
          
              var json=result;
         
              $("#div_ar").html('<table border="2">');
         
          
       $.each(result, function(index, element) {
    	   alert(element.name+index+element);
        var div_data="<tr  value="+element.mid+"><td> <input type=checkbox name=att id="+element.mid+" /></td><td>"+element.name+"</td><td>"+element.inputType+"</td><td>"+element.min+"</td><td>"+element.max+"</td><td>"+element.maxD+"</td><td>"+element.minD+"</td><td>"+element.length+"</td><td>"+element.date+"</td><td>"+element.date1+"</td><td>"+element.mon+"</td><tr>";
               $(div_data).appendTo('#div_ar'); 
  					alert(div_data);
       })              ('</table>').appendTo('#div_ar');
       
       },      error: function (response) {
   	                debugger;
   	                alert(response.responseText);
   	            }
   	        })
   	 

		}

</script>


<script>

</script>



<script> 
function checkGroupName(){
	var x= document.getElementById("name").value
	alert(x);
	debugger;
	
	$.ajax({
		TYPE: "GET",
		url: "/CECS2/validateGroup?characteristic=".concat(x),
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
   	        });
   	      
   	    }</script>
   	    
   	    
   	   
<script> 
function GroupSubmit(){
	
	var x= document.getElementById("gName").value
	debugger;
	
	$.ajax({
		TYPE: "GET",
		url: "/cecs2/validateGroup?characteristic=".concat(x),
		  data: "{characteristic: " + x + "}",
          contentType: "application/json;charset=utf-8",
          dataType: "json",
          success: function (response) {
              debugger;
         	 
		var json=response;
         if(response){
        	 $("#form").submit()}
         else
   	  {
   	  $("#error_message").text("Duplicate characterstic name, choose another");
   	  }        
   	            
   	            
   	         
   	             },
   	            error: function (response) {
   	                debugger;
   	                alert(response.responseText);
   	            }
   	        });
   	      
   	    }</script>
   	    
   	    <script> function abc( )
   	    {
   	    	var rows = document.getElementById("myTable").rows;
            
   	    	for(var i = 0, ceiling = rows.length; i < ceiling; i++) {
                 {
                	 alert(rows[i])
                	 
                	console.log(rows[i].cells[0].value);
                    console.log(rows[i].cells[1].value);
                    }
   	    	
            }
            }
   	    </script>




</body>
</html>