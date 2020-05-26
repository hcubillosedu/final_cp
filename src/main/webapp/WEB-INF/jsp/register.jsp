<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
		<div style="height: 100vh">
			<div class="flex-center flex-column">
				<form:form action="/register" method="post" modelAttribute="user" class="border border-light p-5">
					<p class="h4 mb-4 text-center"><i class="fas fa-user-plus"></i> Register New User</p>
					
					<label for="nameUser">Nombres*</label>
					<form:input path="nameUser" class="form-control mb-4" placeholder="Nombres" />
					<form:errors path="nameUser"></form:errors>
					
					<label for="lastNameUser">Apellidos*</label>
					<form:input path="lastNameUser" class="form-control mb-4" placeholder="Apellidos" />
					<form:errors path="lastNameUser"></form:errors>
					
					<label for="emailUser">Email*</label>
					<form:input path="emailUser" class="form-control mb-4" placeholder="@"/>
					<form:errors path="emailUser"></form:errors>
					
					<label for="enterpriseName">Empresa*</label>
					<form:input path="enterpriseName" class="form-control mb-4" placeholder="Empresa"/>
					<form:errors path="enterpriseName"></form:errors>
					
					<label for="password">Contraseña*</label>
					<form:password path="password" class="form-control mb-4" placeholder="*****"/>
					<form:errors path="password"></form:errors>
					
					<button class="btn btn-info my-4 btn-block" type="submit">Sign up</button>
					
					<hr>

			        <p>By clicking
			            <em>Sign up</em> you agree to our
			            <a href="" target="_blank">terms of service</a> and
			            <a href="" target="_blank">terms of service</a>.
			        </p>
			        
			        <hr>
			        
			        <p class="text-center font-weight-bold">¿Ya tienes una cuenta?
						<a href="<c:url value="/login" />">Ingresa</a>
					</p>
        
				</form:form>
			</div>
		</div>
</body>
</html>