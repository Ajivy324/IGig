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
<link rel="stylesheet" href="/css/style.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title></title>
</head>
<meta charset="UTF-8">
<title>IGig</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-#e3f2fd" style="background-color: #e3f2fd;">
	  <div class="container">
	    <a class="navbar-brand" href="/gigs">IGig</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav">
	      <ul class="navbar-nav">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="/gigs">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/users/account/${currentUser.id}">Account</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/users/logout">Log Out</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>	
	<div id=box class="container-sm">
		<h1>Edit Your Gig</h1>
		<div>
			<form:form action="/gigs/edit/${editedGig.id}" method="PUT" modelAttribute="editedGig">
			  <div class="row mb-3">
			    <form:label path="name" for="inputEmail3" class="col-sm-2 col-form-label">Gig Name:</form:label>
			    <div class="col-sm-10">
			    	<form:errors path="name"/>
			    	<form:input type="text" class="form-control" id="inputEmail3" path="name" />
			    </div>
			  </div>
			  <div class="row mb-3">
			    <form:label path="location" for="inputEmail3" class="col-sm-2 col-form-label">Gig Location</form:label>
			    <div class="col-sm-10">
			    	<form:errors path="location"/>
			    	<form:input type="text" class="form-control" id="inputEmail3" path="location" />
			    </div>
			  </div>
			  <div class="row mb-3">
			    <form:label path="size" for="inputEmail3" class="col-sm-2 col-form-label">Band Size:</form:label>
			    <div class="col-sm-10">
			    	<form:errors path="size"/>	
			      	<form:input type="Number" class="form-control" id="inputEmail3" path="size"/>
			    </div>
			  </div>
			  <div class="row mb-3">
			    <form:label path="gigDate" for="inputEmail3" class="col-sm-2 col-form-label">Gig Date:</form:label>
			    <div class="col-sm-10">
			    	<form:errors path="gigDate"/>
			    	<form:input type="date" class="form-control" id="inputEmail3" path="gigDate" />
			    </div>
			  </div>
			  <div class="row mb-3">
			    <form:label path="gigInfo">Gig Information:</form:label>
			    <div class="col-sm-10">
			    	<form:errors path="gigInfo"/>
			      	<form:textarea row="5" type="text" class="form-control" path="gigInfo"/>
			    </div>
			  </div>
			   <button class="btn btn-primary text-dark">Submit</button> | <a href="/gigs/delete/${editedGig.id }" class="btn btn-danger">Delete</a>
			</form:form>
		</div>
	</div>
</body>
</html>