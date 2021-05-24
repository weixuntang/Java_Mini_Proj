<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!-- Add support for spring mvc form tags -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>


<!-- Bootstrap Css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">



<!-- Option 1: Bootstrap Bundle with Popper -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

</head>
<body>


<table>
<tr>
<th>user_preferred_name</th>
<th>email_address</th>
<th>password</th>
<th>active</th>
<th>admin</th>
<th>update</th>
<th>delete</th>
</tr>



<c:forEach var="user" items="${lsOfUsers}">

<tr>
<td>${user.preferredName}</td>
<td>${user.emailAddress}</td>
<td>${user.password}</td>
<td>${user.active}</td>
<td>${user.admin}</td>
<td>
<!-- https://www.w3schools.com/js/tryit.asp?filename=tryjs_function2 -->
<input type="button" onclick="setUpdateModal('${user.id}','${user.preferredName}','${user.emailAddress}','${user.password}','${user.active}','${user.admin}')" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateModal" value="Update" >
</td>
<td>
<input type="button" onclick="setDeleteModal('${user.id}','${user.preferredName}')"  class="btn btn-danger" value="Delete" data-bs-toggle="modal" data-bs-target="#deleteModal"/>
</td>
</tr>

</c:forEach>

</table>


<script>
function setUpdateModal(id, preferredName, emailAddress, password, active, admin) {
	document.getElementById("userId").value = id;
	document.getElementById("user_preferred_name").value = preferredName;
	document.getElementById("email_address").value = emailAddress;
	document.getElementById("password").value = password;
	document.getElementById("active").value = active;
	document.getElementById("admin").value = admin;
}


function setDeleteModal(id, preferredName) {
	document.getElementById("deleteId").value = id;
	document.getElementById("deleteUserName").innerHTML = "Seek delete confirmation for  : " + preferredName;
	
}
</script>


<!-- Delete Modal -->


<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
  <form:form  action="deleteUser" modelAttribute="user"  method="POST">
  	<form:hidden path="id" id="deleteId"/>
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete User</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <br>
      <p id = "deleteUserName">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <input type="submit" value="Delete" class="btn btn-danger"/>
      </div>
    </div>
    </form:form>
  </div>
</div>




<!-- Update Modal -->


<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update User</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form:form action="updateUser" modelAttribute="user" method="POST">
        
         <form:hidden path="id" id="userId"/>
        
          <div class="mb-3">
            <label for="user_preferred_name" class="col-form-label">User Preferred Name :</label>
            <form:input type="text" path="preferredName" class="form-control" id="user_preferred_name"/>
          </div>
          <div class="mb-3">
            <label for="email_address" class="col-form-label">Email Address :</label>
            <form:input type="text" path="emailAddress" class="form-control" id="email_address"/>
          </div>
          <div class="mb-3">
            <label for="password" class="col-form-label">Password :</label>
            <form:input type="text" path="password" class="form-control" id="password"/>
          </div>
          <div class="mb-3">
            <label for="Active" class="col-form-label">Active :</label>
            <form:input type="text" path="active" class="form-control" id="active"/>
          </div>
           <div class="mb-3">
            <label for="Admin" class="col-form-label">Admin :</label>
            <form:input type="text" path="admin" class="form-control" id="admin"/>
          </div>
          <div class="modal-footer">
        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        	<input type="submit" class="btn btn-primary" value="Update User"/>
      	</div>
        </form:form>
      	</div>
    </div>
  </div>
</div>

</body>
</html>