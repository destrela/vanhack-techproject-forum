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

			<h1 class="bd-title" id="content">New Topic</h1>
			<br />

			<form method="post">
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
			</main>
		</div>
	</div>

	<!-- ADD LATER JS -->
	<c:import url="/WEB-INF/views/tags/bootstrap.jsp"></c:import>
</body>
</html>