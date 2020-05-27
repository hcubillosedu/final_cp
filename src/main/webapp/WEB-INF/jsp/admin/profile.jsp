<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<title>CUBILLOS ENTERPRISE - Usuarios</title>
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
		<link rel="stylesheet" href="<c:url value="/assets/css/addons/datatablse2.min.css" /> ">
		<!-- Your custom styles (optional) -->
		<link rel="stylesheet" href="<c:url value="/assets/css/style.css" /> ">
		<style type="text/css">
			.double-nav .breadcrumb-dn {
  				color: #fff;
			}
		</style>
	</head>
	<body class="fixed-sn cyan-skin">
		<!-- Start your project here-->
		<header>
			<ul class="nav justify-content-end grey lighten-4 py-4">
				<li class="nav-item">
			    	<a class="nav-link " href="<c:url value="/home" /> "><i class="fas fa-home"></i> Inicio</a>
			  	</li>
		  		<li class="nav-item">
			    	<a class="nav-link " href="<c:url value="/account" /> "><i class="fas fa-user-cog"></i> Administrar Cuenta</a>
			  	</li>
			  	<li class="nav-item">
			    	<a class="nav-link" href="<c:url value="/database" /> "><i class="fas fa-database"></i> Bases de datos</a>
			  	</li>
			  	<li class="nav-item">
			    	<a class="nav-link" href="<c:url value="/logout" /> "><i class="fas fa-sign-out-alt"></i> Cerrar sesión</a>
			  	</li>
			</ul>
		</header>
			
	    <!--Main layout-->
	    <main>
      		<div class="container-fluid">		
				<div class="row">
					<form:form action="#" method="post" class="border border-light p-5 row col-10" modelAttribute="user_form" onsubmit="return false;">
						<form:hidden path="idUser" />
						
						<div class="col-6 col-md-6 col-sm-12">						    
						    <label for="nameUser">Nombres*</label>
						    <form:input path="nameUser" class="form-control mb-4" readonly="true" />
						    <form:errors path="nameUser"></form:errors>
						</div>
					    <div class="col-6 col-md-6 col-sm-12">
						    <label for="lastNameUser">Apellidos*</label>
						    <form:input path="lastNameUser" class="form-control mb-4" readonly="true" />
						    <form:errors path="lastNameUser"></form:errors>
					    </div>
					    <div class="col-6 col-md-6 col-sm-12">
						    <label for="emailUser">Email*</label>
						    <input type="email" name="emailUser" id="emailUser" class="form-control mb-4" value="<c:out value="${user_form.emailUser}"></c:out>" readonly="true" />
						    <form:errors path="emailUser"></form:errors>
					    </div>
					    <div class="col-6 col-md-6 col-sm-12">
						    <label for="enterpriseName">Empresa*</label>
						    <form:input path="enterpriseName" class="form-control mb-4" readonly="true" />
						    <form:errors path="enterpriseName"></form:errors>
						</div>
					</form:form>	
					<form:form action="/account" method="post" class="border border-light p-5 row col-10" modelAttribute="password_form">
						<div class="col-6 col-md-6 col-sm-12">
						    <label for="password">Antigua contraseña*</label>
						    <form:password path="password" class="form-control mb-4" required="true" />
						    <form:errors path="password"></form:errors>
						</div>
						<div class="col-6 col-md-6 col-sm-12">
						    <label for="newPassword">Nueva contraseña*</label>
						    <form:password path="newPassword" class="form-control mb-4" required="true" />
						    <form:errors path="newPassword"></form:errors>
						</div>
					    <div class="col-6 col-md-6 col-sm-12">
					    	<button class="btn btn-info btn-block my-4" type="submit">
					    		Cambiar contraseña
					    	</button>
					    </div>
					    <div class="col-6 col-md-6 col-sm-12">
					    	<c:if test="${param.error != null}">
							<div class="alert alert-warning alert-dismissible fade show" role="alert">
								<strong>La contraseña anterior no es correcta.</strong>
								<button type="button" class="close" data-dismiss="alert" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							</c:if>
							<c:if test="${param.success != null}">
							<div class="alert alert-warning alert-dismissible fade show" role="alert">
								<strong>Contraseña actualizada correctamente.</strong>
								<button type="button" class="close" data-dismiss="alert" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							</c:if>
					    </div>
					</form:form>
				</div>
				<!--/.content-->
	      	</div>
	    </main>
	    <!--/Main layout-->

		<!-- End your project here-->
		
		<!-- jQuery -->
		<script type="text/javascript" src="<c:url value="/assets/js/jquery.min.js" />"></script>
		<!-- Bootstrap tooltips -->
		<script type="text/javascript" src="<c:url value="/assets/js/popper.min.js" />"></script>
		<!-- Bootstrap core JavaScript -->
		<script type="text/javascript" src="<c:url value="/assets/js/bootstrap.min.js" />"></script>
		<!-- MDB core JavaScript -->
		<script type="text/javascript" src="<c:url value="/assets/js/mdb.min.js" />"></script>
		<script type="text/javascript" src="<c:url value="/assets/js/addons/datatables2.min.js" />"></script>
		<!-- Your custom scripts (optional) -->
		<script type="text/javascript">
			$(document).ready(function () {
			});
		</script>
	
	</body>
</html>