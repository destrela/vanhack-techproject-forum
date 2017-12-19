<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="en">
<head>
<c:import url="/WEB-INF/views/tags/head.jsp"></c:import>

<style>
h4 a:active, h4 a {
	color: black;
}
</style>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/tags/header.jsp"></c:import>
		<br />
		<div class="bd-content" role="main">
			<div class="card">
				<div class="card-header">
					<a class="btn btn-outline-success pull-right"
						href="${pageContext.request.contextPath}/topic/new">New Topic</a>
					<h4>Topics</h4>
				</div>
				<c:if test="${topics.size() eq 0}">
					<div class="alert alert-warning" role="alert">
						<c:if test="${search ne null}">Oops.. perhaps I should implement a better SEARCH, right? o/</c:if>
						<c:if test="${search eq null}">So empty! Why don't you start a discussion?</c:if>
					</div>
				</c:if>
				<ul class="list-group list-group-flush">
					<c:forEach items="${topics}" var="topic">
						<li
							class="list-group-item d-flex justify-content-between align-items-top">
							<div>
								<h4 class="card-title">
									<a
										href="${pageContext.request.contextPath}/topic/view/${topic.id}"><c:out
											value="${topic.headline}" /></a>
								</h4>
								<p class="card-subtitle mb-1 text-muted">
									by
									<c:out value="${topic.author}" />
									-
									<fmt:formatDate pattern="HH:mm:ss MM/dd/yyyy"
										value="${topic.created}" />
								</p>
							</div>
							<div>
								<span class="badge badge-light">${topic.posts.size()}</span> <i
									class="fa fa-reply" aria-hidden="true"></i>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<!-- ADD LATER JS -->
	<c:import url="/WEB-INF/views/tags/bootstrap.jsp"></c:import>
</body>
</html>