<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
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
	          <a class="nav-link active" aria-current="page" href="/gigs/new">New Gig</a>
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
	<div class="container">
		<div>
			<h1>Welcome, ${currentUser.name}</h1>
		</div>
		
		<div>
		<p>My Gigs</p>
			<table class="table table-striped">
			  <thead>
			    <tr>
			      <th scope="col">Gig Name</th>
			      <th scope="col">Location</th>
			      <th scope="col">Band Size</th>
			      <th scope="col">Creator</th>
			      <th scope="col">Date</th>
			      <th scope="col">Actions</th>
			    </tr>
			  </thead>
			  <tbody>
			  	  <c:forEach var="gig" items="${currentUser.userGigs}">
					  <tr>
						  <td><a href="/gigs/${gig.id}" class="text-decoration-none">${gig.name}</a></td>
						  <td><c:out value="${gig.location}"/></td>
						  <td><c:out value="${gig.size}"/></td>
						  <td><c:out value="${gig.creator.name}"/></td>
						  <td><fmt:formatDate value="${gig.gigDate}" pattern="MM/dd/yyyy"/></td>
						  <td><a href="/gigs/quit/${gig.id}" class="text-decoration-none">Quit Gig</a></td>
					  </tr>
			    </c:forEach>
			  </tbody>
	  		</table>
		</div>
		<div>
		<p>Available Gigs to Join!</p>
			<table class="table table-striped">
			  <thead>
			    <tr>
			      <th scope="col">Gig Name</th>
			      <th scope="col">Location</th>
			      <th scope="col">Band Size</th>
			      <th scope="col">Creator</th>
			      <th scope="col">Date</th>
			      <th scope="col">Actions</th>
			    </tr>
			  </thead>
			  <tbody>
			  	  <c:forEach var="gig" items="${NotJoinedGigs}">
					  <tr>
						  <td><a href="/gigs/${gig.id}" class="text-decoration-none">${gig.name}</a></td>
						  <td><c:out value="${gig.location}"/></td>
						  <td><c:out value="${gig.size}"/></td>
						  <td><c:out value="${gig.creator.name}"/></td>
						  <td><fmt:formatDate value="${gig.gigDate}" pattern="MM/dd/yyyy"/></td>
						   <c:choose>
						  <c:when test="false">
						  	<td><a href="#">Gig Full</a></td>
						  </c:when>
						  <c:otherwise>
						  	<td><a href="/gigs/join/${gig.id}" class="text-decoration-none">Join Gig!</a></td>
						  	</c:otherwise>
						  </c:choose>
					  </tr>
			    </c:forEach>
			  </tbody>
	  		</table>
		</div>
	</div>
	
</body>
</html>