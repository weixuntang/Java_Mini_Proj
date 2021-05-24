<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css"/>


<!-- Bootstrap Css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

<!-- Option 1: Bootstrap Bundle with Popper -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>






</head>
<body style="background-image: url(${pageContext.request.contextPath}/resources/image/login_background.jpg)">




	<div class="center">

<h3>Welcome ${user.preferredName}</h3>


<br>

<div class = "img-container">
<img src="${pageContext.request.contextPath}/resources/image/green_tick.png" width="80" height = "80" />
</div>

<br>
<p align="left">
We're so glad that you decided to join us sincerely hope you enjoy our services.
</p>

<a href="${pageContext.request.contextPath}/user/login">Return to Login</a>
		
	



	</div>






</body>
</html>