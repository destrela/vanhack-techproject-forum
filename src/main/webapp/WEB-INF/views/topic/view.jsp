<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
	<c:import url="/WEB-INF/views/tags/head.jsp"></c:import>
</head>
<body>

	<c:import url="/WEB-INF/views/tags/header.jsp"></c:import>

	<div class="container-fluid">
		<div class="row flex-xl-nowrap">
			<main class="col-12 py-md-3 pl-md-3 bd-content" role="main">

			<h1 class="bd-title" id="content"><c:out value="${topic.headline}" /></h1>
			<p><c:out value="${topic.text}" /></p>
			<h6 class="card-subtitle mb-2 text-muted">by <c:out value="${topic.author}" /> -
				<c:out value="${topic.created}" /></h6>
			<br />

			<ul class="list-group list-group-flush">
				<c:forEach items="${topic.posts}" var="post">
				<li class="list-group-item">
					<p><i class="fa fa-reply" aria-hidden="true"></i>&nbsp;&nbsp;<c:out value="${post.text}" /></p>
					<h6 class="card-subtitle mb-2 text-muted">by <c:out value="${post.author}" /> -
						<c:out value="${post.created}" /></h6>
				</li>
				</c:forEach>
				<li class="list-group-item">
					<form method="post" action="${pageContext.request.contextPath}/topic/post">
						<div class="form-group">
							<label for="postText">New Post</label>
							<textarea class="form-control" name="text"
								rows="3"></textarea>
						</div>
						<input type="hidden" name="topic" value="${topic.id}" />
						<button type="submit" class="btn btn-outline-success">Post</button>
					</form>
				</li>
			</ul>
			</main>
		</div>
	</div>

	<!-- ADD LATER JS -->
	<c:import url="/WEB-INF/views/tags/bootstrap.jsp"></c:import>
</body>
</html>