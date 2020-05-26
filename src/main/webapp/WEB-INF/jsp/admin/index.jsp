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
	          	<!-- content-->
	          	<div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">

				  <!-- Accordion card -->
				  <div class="card">
				
				    <!-- Card header -->
				    <div class="card-header" role="tab" id="headingOne1">
				      <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
				        <h5 class="mb-0">
				          <i class="fas fa-user"></i> Usuarios registrados <i class="fas fa-angle-down rotate-icon"></i>
				        </h5>
				      </a>
				    </div>
				
				    <!-- Card body -->
				    <div id="collapseOne1" class="collapse <c:if test="${user_form.idUser == 0}">show</c:if>" role="tabpanel" aria-labelledby="headingOne1" data-parent="#accordionEx">
						<div class="card-body">
			        		<table id="usersTale" class="table table-striped table-bordered" cellspacing="0" width="100%">
		          				<thead class="bg-info" style="color:white;">
		          					<th>Email</th>
		          					<th>Nombres</th>
		          					<th>Apellidos</th>
		          					<th>Empresa</th>
		          					<th>Estado</th>
		          					<th></th>
	 		          				</thead>
		          				<tbody>
		          					<c:forEach items="${users}" var="user">
		          					<tr>
	   									<td>${user.emailUser}</td>
	   									<td>${user.nameUser}</td>
	   									<td>${user.lastNameUser}</td>
	   									<td>${user.enterpriseName}</td>
	   									<td>
	   										<c:if test="${user.state == 1}"><span class="badge badge-success">Activo</span></c:if>
	   										<c:if test="${user.state == 0}"><span class="badge badge-danger">Inactivo</span></c:if>
	   									</td>
	   									<td>
	   										<div class="btn-group-vertical" role="group" aria-label="Acciones">
	   											<c:if test="${user.state == 1}">
	   												<a class="btn btn-sm btn-primary" title="Editar" href="<c:url value="/admin_user/edit/${user.idUser}" />"><i class="far fa-edit"></i></a>
	   												<a class="btn btn-sm btn-danger" title="Inactivar" href="<c:url value="/admin_user/delete/${user.idUser}" />"><i class="fas fa-trash"></i></a>
	   											</c:if>
	   											<c:if test="${user.state != 1}">
	   												<a class="btn btn-sm btn-info" title="Activar" href="<c:url value="/admin_user/undelete/${user.idUser}" />"><i class="fas fa-check"></i></a>
	   											</c:if>
	   										</div>
	   									</td>
	   								</tr>
	   								</c:forEach>
		          				</tbody>
		          			</table>
				      	</div>
					</div>
				  </div>
				  <!-- Accordion card -->
				
				  <!-- Accordion card -->
				  <div class="card">
				
				    <!-- Card header -->
				    <div class="card-header" role="tab" id="headingTwo2">
				      <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo2">
				        <h5 class="mb-0">
				          <i class="fas fa-database"></i>
				          	<c:if test="${user_form.idUser== 0}">Crear</c:if> 
				          	<c:if test="${user_form.idUser != 0}">Actualizar</c:if>
				          	Usuario 
				          	<i class="fas fa-angle-down rotate-icon"></i>
				        </h5>
				      </a>
				    </div>
				
				    <!-- Card body -->
				    <div id="collapseTwo2" class="collapse <c:if test="${user_form.idUser != 0}">show</c:if>" role="tabpanel" aria-labelledby="headingTwo2" data-parent="#accordionEx">
						<div class="card-body">
							<form:form action="/admin_user" method="post" class="border border-light p-5 row" modelAttribute="user_form">
								<form:hidden path="idUser" />
								<form:hidden path="userRole.emailUser" />
								
								<div class="col-6 col-md-6 col-sm-12">						    
								    <label for="nameUser">Nombres*</label>
								    <form:input path="nameUser" class="form-control mb-4" />
								    <form:errors path="nameUser"></form:errors>
								</div>
							    <div class="col-6 col-md-6 col-sm-12">
								    <label for="lastNameUser">Apellidos*</label>
								    <form:input path="lastNameUser" class="form-control mb-4" />
								    <form:errors path="lastNameUser"></form:errors>
							    </div>
							    <div class="col-6 col-md-6 col-sm-12">
								    <label for="emailUser">Email*</label>
								    <input type="email" name="emailUser" id="emailUser" class="form-control mb-4" value="<c:out value="${user_form.emailUser}"></c:out>" />
								    <form:errors path="emailUser"></form:errors>
							    </div>
							    <div class="col-6 col-md-6 col-sm-12">
								    <label for="enterpriseName">Empresa*</label>
								    <form:input path="enterpriseName" class="form-control mb-4" />
								    <form:errors path="enterpriseName"></form:errors>
								</div>
								<div class="col-6 col-md-6 col-sm-12">
								    <label for="userRole.role">Rol*</label>
								    <form:select path="userRole.role" class="form-control mb-4" >
								    	<form:option value="">Seleccione</form:option>
								    	<form:option value="ROLE_USER" >USER</form:option>
								    	<form:option value="ROLE_ADMIN" >ADMIN</form:option>
								    </form:select>
								    <form:errors path="userRole.role"></form:errors>
								</div>
							    <div class="col-6 col-md-6 col-sm-12">
							    	<button class="btn btn-info btn-block my-4" type="submit">
							    		<c:if test="${user_form.idUser != 0}">Actualizar</c:if>
							    		<c:if test="${user_form.idUser == 0}">Crear</c:if>
							    	</button>
							    </div>
							</form:form>
						</div>
				    </div>
				  </div>
				  <!-- Accordion card -->
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
				$('#usersTale').DataTable();
				$('.dataTables_length').addClass('bs-select');
			});
		</script>
	
	</body>
</html>