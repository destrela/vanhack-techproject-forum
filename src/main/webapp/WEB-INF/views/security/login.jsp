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

	<div class="container">
		<c:import url="/WEB-INF/views/tags/header.jsp"></c:import>
		<br />
		<div class="col-3 col-centered bd-content" role="main">
			<div class="card">
				<div class="card-header">
					<h4>Login</h4>
				</div>

				<div class="card-body">
					<form method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="form-group">
							<label for="username">Username</label> <input type="text"
								class="form-control" name="username" />
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" name="password" />
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-outline-success">Login</button>
							<a class="btn btn-outline-danger"
								href="${pageContext.request.contextPath}">Cancel</a>
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