<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
					<h4>New Topic</h4>
				</div>
				
				<div class="card-body">
				<form method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<div class="form-group">
					<label for="textHeadline">Headline</label>
					<input type="text" class="form-control" name="headline" />
				</div>
				<div class="form-group">
					<label for="textDescription">Description</label>
					<textarea class="form-control" rows="5" name="text"></textarea>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-outline-success">Create</button>
					<a class="btn btn-outline-danger" href="${pageContext.request.contextPath}">Cancel</a>
				</div>
			</form>
				</div>
			</div>
		</div>
	</div>

	<!-- ADD LATER JS -->
	<c:import url="/WEB-INF/views/tags/bootstrap.jsp"></c:import>
</body>
</html>