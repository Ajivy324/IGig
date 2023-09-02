<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<!-- <link rel="stylesheet" href="/css/style.css"/> -->
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title></title>
</head>
<meta charset="UTF-8">
<title>IGig</title>
</head>
<body>
	<div class="mb-5 bd-highlight">
		<nav class="navbar" style="background-color: #e3f2fd;">
		  <div class="container">
		    <a class="navbar-brand" href="/gigs">IGig</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarNav">
		      <ul class="navbar-nav">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="/gigs/new">New Gig</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="/gigs">Home</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="/users/logout">Log Out</a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
	</div>	
	<div class="container">
		<div>
			<h1 >Account Details</h1>
		</div>
		<div class="row">
		  <div class="col-5 col-lg-4">
		    <div class="list-group" id="list-tab" role="tablist">
		      <a class="list-group-item list-group-item-action" id="list-profile-list" data-bs-toggle="list" href="#list-profile" role="tab" aria-controls="Email">Name/Email</a>
		      <a class="list-group-item list-group-item-action" id="list-messages-list" data-bs-toggle="list" href="#list-messages" role="tab" aria-controls="Gig History">Gig History</a>
		      <a class="list-group-item list-group-item-action" id="list-settings-list" data-bs-toggle="list" href="#list-settings" role="tab" aria-controls="Future Gigs">Future Gigs</a>
		    </div>
		  </div>
		  <div class="col-7 col-lg-8">
		    <div class="tab-content" id="list-nav-tabContent">
		      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list"><p> Name: ${currentUser.name}</p> <p> Email: ${currentUser.email}</p></div>
		      <c:forEach var="gig" items="${currentUser.userGigs }">
		      	<c:if test="${true}">
		      		<div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">${gig.name}</div>
		      	</c:if>
		      	<c:if test="${true}">
		      		<div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">future gig</div>
		      	</c:if>
		      </c:forEach>
		    </div>
		  </div>
		</div>
	</div>
</body>
</html>