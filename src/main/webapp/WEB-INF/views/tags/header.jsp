<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<header class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
	<a class="navbar-brand" href="${pageContext.request.contextPath}">Dead
		Simple Forum (not so dead)</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
		</ul>

		<ul class="navbar-nav">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fa fa-user-circle"
					aria-hidden="true"></i></a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<sec:authorize access="hasRole('USER')">
						<a class="dropdown-item" href="#"><sec:authentication
								property="principal.username" /></a>
						<div class="dropdown-divider"></div>
					</sec:authorize>
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/security/login?logout">Logout</a>
				</div></li>
		</ul>

		<form class="form-inline my-2 my-lg-0" method="post"
			action="${pageContext.request.contextPath}/topic/list">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input class="form-control mr-sm-2"
				type="search" placeholder="Search" aria-label="Search" name="search"
				value="${search}">
			<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
</header>
