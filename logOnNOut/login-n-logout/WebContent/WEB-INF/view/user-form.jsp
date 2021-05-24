<!-- https://www.tutorialspoint.com/jsp/jstl_core_if_tag.htm -->
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!-- Add support for spring mvc form tags -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>

<title>User Creation</title>

<!-- Bootstrap Css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">


<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>


<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/add-customer-style.css"/>




<!-- Option 1: Bootstrap Bundle with Popper -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>


</head>


<body>

<br>
	<div id="wrapper">

		<div id="header">
			<h2>Add User</h2>

		</div>

<c:if test="${true == saveStatus}">
	<br><br><br><br>
	<div class="alert alert-danger" role="alert">
  	${user.emailAddress} has been taken.
	</div>
</c:if>
	</div>
	
	<br><br><br>
	<div id="container">
	
	
	
	
	
	<form:form action="saveUser" modelAttribute="user" method="POST">
	
	<!-- To associate with customer id -->
	<form:hidden path="id"/>
	
	<table>
	<tbody>
	<tr>
	<td><label>Preferred Name</label></td>
	<td><form:input path="preferredName" class="form-control" placeholder="Preferred Name"/></td>
	</tr>
	
	<tr>
	<td><label>Email Address</label></td>
	<td><form:input path="emailAddress" value="${param.emailAddress}" class = "form-control" placeholder = "name@example.com"/></td>
	</tr>
	
	<tr>
	<td><label>Password</label></td>
	<td><form:input path="password" class = "form-control" placeholder = "Password"/></td>
	</tr>
	
	<form:hidden path="active" value="1"/>
	
	<form:hidden path="admin" value="0"/>
	
	
	<tr>
	<td><label></label></td>
	<td><br><input type="submit" value="save" class="btn btn-primary"/></td>
	</tr>
	</tbody>
	
	
	</table>
	
		</form:form>
		
		
		<div style="clear; both;">
		
		
		<p>
		
			<a href="${pageContext.request.contextPath}/user/login">Back to Login</a>
		
		</p>
		
		
		
		</div>
	
	</div>

</body>



</html>