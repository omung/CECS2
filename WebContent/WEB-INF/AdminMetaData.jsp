<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  
<link rel="stylesheet" type="text/css"
	    href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />
	 
	

<title>Admin Data</title>
</head>
<body>
<form id= "form" action="AdminStore2" method="get"  >
NAME : <input type="text" name="name" id="name"/> <input type="Button" name="abc" id="abc" onclick="check(this.id)" value="Check Availability"/>
<p id="error_message"> </p>


<select value="test" id="inputType" name="inputType" > <option>Select a Type</option>
<c:forEach var="i" items="${arr}">
  <option id="${i}" onclick="InputSelectType(this.id)" value="${i}"> ${i} </option>
</c:forEach>
</select>


<label id="l1">Minimum Value for Integer :</label> <input type="number" value="0" name="min" id="min"/>
<label id=l2>Maximum Value for Integer :</label> <input type="number" value="0" name="max" id="max"/>

<div id= "test"></div>

<label id="l3">Minimum Value for Double :</label> <input type="number" value="0" name="minD" id="minD"/>
<label id=l4>Maximum Value Double :</label> <input type="number"  value="0" name="maxD" id="maxD"/>

<label id=l5>Length: </label> <input type="number" name="length" value="0" id="length"/>

<table> <div id="ar">

</div>
</table> 
<label id=l6>List Of Integers: </label> <input type="number" name="list" value="0" id="list"/> 
<input type="button" onclick="getList()" id="bu" name="bu" value="Add more"/>
<label id=l7>Earlier Date: </label> <input type="date" name="date" id="date"/>
<label id=l8>latest Date: </label> <input type="date" name="date1" id="date1"/>
<label id="l9">Money :</label> <input type="number" name="mon" value="0" id="mon"/>

<input type="Button" id="sub" onclick="submitform(this.id)" value="Submit"/>
</form>

<script>
function getList(){
	var li= document.getElementById("list").value;

	debugger;
    $.ajax({
    	  type: "GET",     
          url: "/CECS2/list?list=".concat(li),
        		  data: "{list: " + li + "}",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            debugger;
         
        
            var json=result;
       
            $("#ar").html('');
       
        
     $.each(result, function(index, element) {
      var div_data="<tr><td value="+element+">"+element+"</td><tr>";
             $(div_data).appendTo('#ar'); 
    
});
        },
        
        error: function (response) {
            debugger;
            alert(response.responseText);
        }

    })

};
</script>

<script>function check(value) {
	var x=document.getElementById("name").value;
	
	  debugger;
	        $.ajax({
	        	  type: "GET",     
	              url: "/CECS2/validatemetadata?characterstic=".concat(x),
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
	    
	    
	    <script>function submitform(value) {
	var x=document.getElementById("name").value;
	
	  debugger;
	        $.ajax({
	        	  type: "GET",     
	              url: "/CECS2/validatemetadata?characterstic=".concat(x),
	            		  data: "{characteristic: " + x + "}",
	            contentType: "application/json;charset=utf-8",
	            dataType: "json",
	            success: function (response) {
	                alert(response)
	            	debugger;
	           	 
			var json=response;
	           if(response){
	        	   document.getElementById("form").submit();}
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
function InputSelectType(value){
	
	if(value==="Integer"){
		document.getElementById('min').style.visibility= 'visible';
		document.getElementById('l1').style.visibility= 'visible';
		document.getElementById('max').style.visibility= 'visible';
		document.getElementById('l2').style.visibility= 'visible';

	}
	else{
		document.getElementById('min').style.visibility= 'hidden';
		document.getElementById('max').style.visibility= 'hidden';
		document.getElementById('l1').style.visibility= 'hidden';
		document.getElementById('l2').style.visibility= 'hidden';
	}
	

	if(value==="Double"){
		document.getElementById('minD').style.visibility= 'visible';
		document.getElementById('l3').style.visibility= 'visible';
		document.getElementById('maxD').style.visibility= 'visible';
		document.getElementById('l4').style.visibility= 'visible';

	}
	else{
		document.getElementById('minD').style.visibility= 'hidden';
		document.getElementById('maxD').style.visibility= 'hidden';
		document.getElementById('l3').style.visibility= 'hidden';
		document.getElementById('l4').style.visibility= 'hidden';
	}
	
	if(value==="String"){
		document.getElementById('length').style.visibility= 'visible';
		document.getElementById('l5').style.visibility= 'visible';
		
	}
	else{
		document.getElementById('length').style.visibility= 'hidden';
		document.getElementById('l5').style.visibility= 'hidden';
		}
	if(value==="Money"){
		document.getElementById('mon').style.visibility= 'visible';
		document.getElementById('l9').style.visibility= 'visible';
		
	}
	else{
		document.getElementById('mon').style.visibility= 'hidden';
		document.getElementById('l9').style.visibility= 'hidden';
		
		
	}
	
	if(value==="List of Integers"){
		document.getElementById('list').style.visibility= 'visible';
		document.getElementById('l6').style.visibility= 'visible';
		document.getElementById('bu').style.visibility= 'visible';
		
		
	}
	
	else
		{document.getElementById('list').style.visibility= 'hidden';
		document.getElementById('l6').style.visibility= 'hidden';
		document.getElementById('bu').style.visibility= 'hidden';
		
		}
	
	if(value==="Date"){
		
		document.getElementById('date').style.visibility= 'visible';
		document.getElementById('l7').style.visibility= 'visible';
		$("#date").datepicker();
		document.getElementById('date1').style.visibility= 'visible';
		document.getElementById('l8').style.visibility= 'visible';
		$("#date1").datepicker();
		}
	else{
			document.getElementById('date').style.visibility= 'hidden';
			document.getElementById('l7').style.visibility= 'hidden';
			document.getElementById('date1').style.visibility= 'hidden';
			document.getElementById('l8').style.visibility= 'hidden';
			
			
		}
		
	

}
</script>
<script>
document.getElementById('min').style.visibility= 'hidden';
document.getElementById('max').style.visibility= 'hidden';

document.getElementById('l1').style.visibility= 'hidden';
document.getElementById('l2').style.visibility= 'hidden';

document.getElementById('minD').style.visibility= 'hidden';
document.getElementById('maxD').style.visibility= 'hidden';
document.getElementById('l3').style.visibility= 'hidden';
document.getElementById('l4').style.visibility= 'hidden';

document.getElementById('length').style.visibility= 'hidden';
document.getElementById('l5').style.visibility= 'hidden';
document.getElementById('date').style.visibility= 'hidden';
document.getElementById('l7').style.visibility= 'hidden';
document.getElementById('date1').style.visibility= 'hidden';
document.getElementById('l8').style.visibility= 'hidden';
document.getElementById('mon').style.visibility= 'hidden';
document.getElementById('l9').style.visibility= 'hidden';
document.getElementById('list').style.visibility= 'hidden';
document.getElementById('l6').style.visibility= 'hidden';
document.getElementById('bu').style.visibility= 'hidden';

</script>


 

	    
</body>
</html>