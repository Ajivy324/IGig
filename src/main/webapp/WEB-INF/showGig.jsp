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
<body >
	<div class="mb-3 bd-highlight">
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
		          <a class="nav-link active" aria-current="page" href="/gigs/new">New Gig</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="/users/account/${currentUser.id }">Account</a>
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
	<!-- 		finish show page -->
		<div class="mb-3 bd-highlight">
			<div class="border-end ">
				<div class="d-flex align-items-start mb-3 bd-highlight ">
					<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<a class="nav-link active text-dark" id="v-pills-home-tab" data-bs-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Gig Date</a>
					    <a class="nav-link text-dark" id="v-pills-profile-tab" data-bs-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Information</a>
					    <a class="nav-link text-dark" id="v-pills-messages-tab" data-bs-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Band Members</a>
					</div>
					<div class="tab-content" id="v-pills-tabContent ">
						<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab"><fmt:formatDate value="${gig.gigDate}" pattern="MM/dd/yyyy"/></div>
					    <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">${gig.gigInfo }</div>
					    
					    	<div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
					    		<c:forEach var="musician" items="${gig.gigMusicians}">
					    			<a href="/users/account/${musician.id }" class="text-decoration-none"><c:out value="${musician.name}"/></a>
					    		</c:forEach>
					    	</div>
					</div>
					</div>
				<div class="mb-5 bd-highlight">
					<c:if test="${gig.creator.id  == userId}"><a href="/gigs/edit/${gig.id}" class="btn btn-success text-dark">Edit</a> | <a href="/gigs/delete/${gig.id}" class="btn btn-danger text-dark">Delete</a> </c:if>
				</div>
			</div> 
			<div class="card text-black bg-light">
				<div class="card-header">Comments</div>
				<div class="card-body">
					<form:form action="/gigs/comment/${gig.id}" method="POST" modelAttribute="newComment">
						<div class="row mb-3">
							<form:label path="comment">Add a Comment:</form:label>
							<div class="col-sm-10">
								<form:errors path="comment"/>
								<form:textarea row="5" type="text" class="form-control" path="comment" />
							</div>
						</div>
					    <button class="btn btn-primary text-dark" class="">Submit</button>
					</form:form>
			<hr>
					<c:forEach var="comment" items="${gigComments}">
							<c:if test="${comment.gig.id  == gig.id}">
								<div>
									<h4><c:out value="Added by ${comment.creator.name} on " /> <fmt:formatDate value="${comment.createdAt}" pattern="MMMM dd"/></h4>
								</div>
							
								<c:out value="${comment.comment}"/>
							
								<c:if test="${comment.creator.id  == userId}">
									<td>| <a href="/comments/delete/${comment.id}" class="text-decoration-none">Delete</a></td>
								</c:if>
							</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>		
</body>
</html>