<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
	<c:import url="/WEB-INF/views/tags/head.jsp"></c:import>
	<style>
	.col-centered{
	    float: none;
	    margin: 0 auto;
	}
	</style>
</head>
<body>

	<c:import url="/WEB-INF/views/tags/header.jsp"></c:import>

	<div class="container-fluid">
		<div class="row flex-xl-nowrap">
			<div class="col-3 py-md-3 pl-md-3 bd-content col-centered" role="main">

			<h1 class="bd-title" id="content">Login</h1>
			<br />

			<form method="post"	>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<div class="form-group">
					<label for="username">Username</label>
					<input type="text" class="form-control" name="username" />
				</div>
				<div class="form-group">
					<label for="password">Password</label>
					<input type="password" class="form-control" name="password" />
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-outline-success">Login</button>
					<a class="btn btn-outline-danger" href="${pageContext.request.contextPath}">Cancel</a>
				</div>
			</form>
			</div>
		</div>
	</div>

	<!-- ADD LATER JS -->
	<c:import url="/WEB-INF/views/tags/bootstrap.jsp"></c:import>
</body>
</html>