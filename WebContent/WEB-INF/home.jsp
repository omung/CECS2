<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="AdminMetaData">Admin Attributes</a>
<a href="AdminGroup">Admin Groups</a>
<a href="DeleteGroup">Delete A Group</a>
<a href="MaintainGroup">Maintain existing Group</a>

<table border="1">
<tr><td></td></tr>
<tr>
<td>First Name</td>
<td>Last Name</td>
<td>Username</td>
<td>Department</td>
<td>Institution</td>
<td>City</td>
<td>State</td>
<td>Country</td>
<td>enabled</td>
</tr>
<c:forEach var="p" items="${user}" >
<tr>
<td>"${p.firstname}"</td>
<td>"${p.lastname}"</td>
<td>"${p.username}"</td>
<td>"${p.department}"</td>
<td>"${p.institution}"</td>
<td>"${p.city}"</td>
<td>"${p.state}"</td>
<td>"${p.country}"</td>
<td>"${p.enabled}"</td>
</tr>
</c:forEach>

</table>
</body>
</html>