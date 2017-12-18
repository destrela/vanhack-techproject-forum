<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
	<c:import url="/WEB-INF/views/tags/head.jsp"></c:import>
	
	<style>
		h4 a:active,
		h4 a {
			color: black;
		}
	</style>
</head>
<body>

	<c:import url="/WEB-INF/views/tags/header.jsp"></c:import>

	<div class="container-fluid">
		<div class="row flex-xl-nowrap">
			<main class="col-12 py-md-3 pl-md-3 bd-content" role="main"> <a
				class="btn btn-outline-success my-2 my-sm-0 float-right"
				href="${pageContext.request.contextPath}/topic/new">New Topic</a>
			<h1 class="bd-title" id="content">Topics</h1>
			<br />
			
			<c:if test="${topics.size() eq 0}">
			<div class="alert alert-warning" role="alert">
				<c:if test="${search ne ''}">
				No luck! Nothing found! Try search again.
				</c:if>
			  	<c:if test="${not search}">
			  	Oh... It looks like a desert! Create a new Topic! =)
			  	</c:if>
			</div>
			</c:if>

			<ul class="list-group list-group-flush">
				<c:forEach items="${topics}" var="topic">
				<li class="list-group-item d-flex justify-content-between align-items-top">
					<div>
						<h4 class="card-title"><a href="${pageContext.request.contextPath}/topic/view/${topic.id}"><c:out value="${topic.headline}" /></a></h4>
						<h6 class="card-subtitle mb-2 text-muted">by <c:out value="${topic.author}" /> - <c:out value="${topic.created}" /></h6>
					</div>
					<div>
						<span class="badge badge-light">${topic.posts.size()}</span>
						<i class="fa fa-reply" aria-hidden="true"></i>
					</div>
				</li>
				</c:forEach>
			</ul>
			</main>
		</div>
	</div>

	<!-- ADD LATER JS -->
	<c:import url="/WEB-INF/views/tags/bootstrap.jsp"></c:import>
</body>
</html>