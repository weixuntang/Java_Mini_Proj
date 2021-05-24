<!-- Add support for spring mvc form tags -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- https://www.tutorialspoint.com/jsp/jstl_core_if_tag.htm -->
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<meta charset="ISO-8859-1">
<title>User Login</title>



<!-- Bootstrap Css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">


<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>


</head>



<body class="text-center" style="background-image: url(${pageContext.request.contextPath}/resources/image/login_background.jpg)">





<script>


window.onload = function() {
	 if(${false!=loginStatus}){
		 document.getElementById('userSpaceDiv').style.display = 'block';
		 document.getElementById('passwordDiv').style.display = 'none';
	 } else {
		 document.getElementById('userSpaceDiv').style.display = 'none';
	 }
	 
	 
	 emailFunction();
	
};


<c:set var ="userContainsCom" scope = "session"/>

function emailFunction() {
	<!--https://stackoverflow.com/questions/940577/javascript-regular-expression-email-validation-->
	var pattern = /^\w.+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/; 
	
	var emailAddress = document.getElementById("emailAddress").value;
	
	if(pattern.test(emailAddress)){
		

		document.getElementById('userSpaceDiv').style.display = 'none';
	    document.getElementById('passwordDiv').style.display = 'block';
	    document.getElementById('createOneDiv').style.display = 'none';
	    
	    <!--
	    var str = "Create One!";
	    var result = str.link("${pageContext.request.contextPath}/user/showFormToAddUser?emailAddress="+emailAddress);
	    document.getElementById("linkToCreateAccount").innerHTML = result;
		-->
	}
}


</script>



<!-- Option 1: Bootstrap Bundle with Popper -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

<main class="form-signin">


<c:if test="${false == loginStatus}">
<br><br><br><br>
<div class="alert alert-danger" role="alert">
  Invalid Credentials <br>
  Forgot Password?  <a href="/user/forgotPassword">click me</a>
</div>
</c:if>


<div class="container">


<form:form action="logOn" modelAttribute="user" method="POST">


    <h6 class="h3 mb-3 fw-normal" align="left"><b>Sign in</b></h6>
   	<div id="userSpaceDiv"><br><br></div>
    <label for="userName" class="visually-hidden">Email address</label>
   	<form:input path="emailAddress" id="emailAddress" class="form-control" placeholder="Email Address" oninput="emailFunction()"/>
   	<br>
   	<!-- <p id="linkToCreateAccount"/> -->
   	<div id="createOneDiv" style="width:80%" class="row"><div class="col-sm">No Account?</div> <div class="col-sm"><a href="${pageContext.request.contextPath}/user/showFormToAddUser">Create One!</a></div></div>
   	
   
   	
   
   	<div id="passwordDiv">
   	<label for="inputPassword" class="visually-hidden">Password</label>
    <form:input path="password" class="form-control" placeholder="Password" />
   	<br>
   	<div id="resetPasswordDiv" style="width:80%;font-size:11px" class="row"><div class="col-sm">Forget Password?</div> <div class="col-sm"><a href="${pageContext.request.contextPath}/user/forgetPassword">Reset Password!</a></div></div>
	<br>
  	<input type="Submit" value="Sign In" class="btn btn-primary btn-sm"/>
  	</div>
   <br>
    <p class="mt-5 mb-3 text-muted">&copy; 2021</p>



</form:form>
</div>
</main>




</body>
</html>