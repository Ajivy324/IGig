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
	<div id="box" class="container">
		<div class="text-center">
			<h1>IGig</h1>
			<p>Free Gig Planner and Organizer</p>
		</div>
		<h2>Register</h2>
		<form:form action="/users/register" method="POST" modelAttribute="newUser">
			  <div class="row mb-3">
			    <form:label path="name">Name:</form:label>
			    <div class="col-sm-10">
			    	<form:errors path="name"/>
			    	<form:input type="text" class="form-control" path="name" />
			    </div>
			  </div>
			  <div class="row mb-3">
			    <form:label path="email">Email:</form:label>
			    <div class="col-sm-10">
			    	<form:errors path="email"/>	
			      	<form:input type="text" class="form-control" path="email"/>
			    </div>
			  </div>
			  <div class="row mb-3">
			    <form:label path="password">Password:</form:label>
			    <div class="col-sm-10">
			    	<form:errors path="password"/>
			      	<form:input type="password" class="form-control" path="password"/>
			    </div>
			  </div>
			  <div class="row mb-3">
			    <form:label path="confirm">Confirm Password:</form:label>
			    <div class="col-sm-10">
			    	<form:errors path="confirm"/>
			      	<form:input type="password" class="form-control" path="confirm"/>
			    </div>
			  </div>
			  <button class="btn btn-primary text-dark">Submit</button>
			</form:form>
			
			<hr>
			
			<h2>Login</h2>
			<form:form action="/users/login" method="POST" modelAttribute="loginUser">
			  <div class="row mb-3">
			    <form:label path="email">Email:</form:label>
			    <div class="col-sm-10">
			    	<form:errors path="email"/>	
			      	<form:input type="text" class="form-control" path="email"/>
			    </div>
			  </div>
			  <div class="row mb-3">
			    <form:label path="password">Password:</form:label>
			    <div class="col-sm-10">
			    	<form:errors path="password"/>
			      	<form:input type="password" class="form-control" path="password"/>
			    </div> 
			  </div>	
			  <button class="btn btn-primary text-dark">Submit</button>
			</form:form>
	</div>
<!-- 	<img alt="band img" src="/css/images/rocco-dipoppa-_uDj_lyPVpA-unsplash.jpg"> -->
</body>
</html>