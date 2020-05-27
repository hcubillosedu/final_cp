<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="" />

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<title>CUBILLOS ENTERPRISE - Ingreso</title>
		<!-- MDB icon -->
		<link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon">
		<!-- Font Awesome -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
		<!-- Google Fonts Roboto -->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.min.css" />">
		<!-- Material Design Bootstrap -->
		<link rel="stylesheet" href="<c:url value="/assets/css/mdb.min.css" /> ">
		<!-- Your custom styles (optional) -->
		<!-- <link rel="stylesheet" href="css/style.css"> -->
	</head>

	<body class="fixed-sn cyan-skin">

		<div style="height: 90vh">
			<div class="flex-center flex-column row">

				<form method="POST" action="/login" class="border border-light col-4 p-5">
					<p class="h4 mb-4 text-center"><i class="fas fa-key"></i> Sign in</p>
					<input name="username" type="text" class="form-control mb-4" placeholder="Username" autofocus="true" required="true" />
					<input name="password" type="password" class="form-control mb-4" placeholder="Password" required="true" />
					
					<c:if test="${errorMsg != null}">
					<div class="alert alert-warning alert-dismissible fade show" role="alert">
						<strong>${errorMsg}</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					</c:if>
					
					<button class="btn btn-info btn-block my-4" type="submit">Sign In</button>
					
					<div class="text-center">
       					<p>¿No tienes una cuenta aún?
       						<a href="<c:url value="/register" />">Registrate</a>
       					</p>
					</div>
				</form>
				
			</div>
		</div>
	
	<!-- jQuery -->
		<script type="text/javascript" src="<c:url value="/assets/js/jquery.min.js" />"></script>
		<!-- Bootstrap tooltips -->
		<script type="text/javascript" src="<c:url value="/assets/js/popper.min.js" />"></script>
		<!-- Bootstrap core JavaScript -->
		<script type="text/javascript" src="<c:url value="/assets/js/bootstrap.min.js" />"></script>
		<!-- MDB core JavaScript -->
		<script type="text/javascript" src="<c:url value="/assets/js/mdb.min.js" />"></script>
		<!-- Your custom scripts (optional) -->
		<script type="text/javascript"></script>
	</body>
</html>