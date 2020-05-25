<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<title>CUBILLOS ENTERPRISE - Bases de datos</title>
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
	          	<!-- content-->
	          	<div class="wow row" data-wow-delay="0.2s">
		          	<div class="col-md-8 col-sm-12">
		          		<div class="border border-light p-5">
		          			<p class="h4 mb-4 text-center"><i class="fas fa-database"></i> Tus Bases de datos</p>
		          			
		          			<table class="table table-striped">
		          				<thead class="bg-info" style="color:white;">
		          					<th>Fecha</th>
		          					<th>Nombre base de datos</th>
		          					<th>Observación</th>
		          					<th>Estado</th>
		          					<th></th>
		          				</thead>
		          				<tbody>
		          					<c:forEach items="${databases_user}" var="database">
		          					<tr>
    									<td>${database.createdAt}</td>
    									<td>${database.databaseName}</td>
    									<td>${database.description}</td>
    									<td>
    										<c:if test="${database.state == 1}"><span class="badge badge-success">Activo</span></c:if>
    										<c:if test="${database.state == 0}"><span class="badge badge-danger">Inactivo</span></c:if>
    									</td>
    									<td>
    										<div class="btn-group-vertical" role="group" aria-label="Acciones">
    											<c:if test="${database.state == 1}">
    												<a class="btn btn-sm btn-primary" title="Administrar" href="<c:url value="/database/manage/${database.idUserDatabase}" />"><i class="far fa-edit"></i></a>
    												<a class="btn btn-sm btn-danger" title="Inactivar" href="<c:url value="/database/delete/${database.idUserDatabase}" />"><i class="fas fa-trash"></i></a>
    											</c:if>
    											<c:if test="${database.state != 1}">
    												<a class="btn btn-sm btn-info" title="Activar" href="<c:url value="/database/undelete/${database.idUserDatabase}" />"><i class="fas fa-check"></i></a>
    											</c:if>
    										</div>
    									</td>
    								</tr>
    								</c:forEach>
		          				</tbody>
		          			</table>
		          		</div>
		          	</div>
	          		<div class="col-md-4 col-sm-12">
			            <form:form action="/database/save" method="post" class="border border-light p-5" modelAttribute="database_form">
						    <p class="h4 mb-4 text-center"><i class="fas fa-database"></i> Crear Base de datos</p>
						
						    <label for="enterprise_name_txt">Empresa</label>
						    <input value="<c:out value="${enterprise_name_txt}" ></c:out> " class="form-control mb-4" readonly />
						    
						    <label for="databaseName">Nombre base de datos*</label>
						    <form:input path="databaseName" class="form-control mb-4" />
						    <form:errors path="databaseName"></form:errors>
						    
						    <label for="description">Observación*</label>
						    <form:textarea path="description" type="text" class="form-control mb-4" />
						    <form:errors path="description"></form:errors>
						
						    <button class="btn btn-info btn-block my-4" type="submit">Crear</button>
						
						</form:form>
					</div>
		          <!--/.content-->
				</div>
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
		<!-- Your custom scripts (optional) -->
		<script type="text/javascript"></script>
	
	</body>
</html>