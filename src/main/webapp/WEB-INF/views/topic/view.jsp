<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">
<head>
	<c:import url="/WEB-INF/views/tags/head.jsp"></c:import>
</head>
<body>

	<div class="container">
		<c:import url="/WEB-INF/views/tags/header.jsp"></c:import>
		<br />
		<div class="bd-content" role="main">
			<div class="card">
				<div class="card-header">
					<h4>
						<c:out value="${topic.headline}" />
					</h4>
					<p>
						<c:out value="${topic.text}" />
					</p>
					<h6 class="card-subtitle mb-2 text-muted">
						by
						<c:out value="${topic.author}" />
						-
						<fmt:formatDate pattern="HH:mm:ss MM/dd/yyyy"
							value="${topic.created}" />
					</h6>
				</div>

				<ul class="list-group list-group-flush">
					<c:forEach items="${topic.posts}" var="post">
						<li class="list-group-item justify-content-between align-items-top">
							<p>
								<i class="fa fa-reply" aria-hidden="true"></i>&nbsp;&nbsp;
								<c:out value="${post.text}" />
							</p>
							<h6 class="card-subtitle mb-2 text-muted"> by <c:out value="${post.author}" /> - <c:out value="${post.author}" /> - <fmt:formatDate pattern="HH:mm:ss MM/dd/yyyy" value="${post.created}" /></h6>
						</li>
					</c:forEach>
					<li class="list-group-item">
						<form method="post"
							action="${pageContext.request.contextPath}/topic/post">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="form-group">
								<label for="postText">New Post</label>
								<textarea class="form-control" name="text" rows="3"></textarea>
							</div>
							<input type="hidden" name="topic" value="${topic.id}" />
							<button type="submit" class="btn btn-outline-success">Post</button>
						</form>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<!-- ADD LATER JS -->
	<c:import url="/WEB-INF/views/tags/bootstrap.jsp"></c:import>
</body>
</html>