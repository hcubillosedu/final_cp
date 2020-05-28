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
				          <i class="fas fa-database"></i> Tus Empleados <i class="fas fa-angle-down rotate-icon"></i>
				        </h5>
				      </a>
				    </div>
				
				    <!-- Card body -->
				    <div id="collapseOne1" class="collapse <c:if test="${employee_form.idEmployee == 0}">show</c:if>" role="tabpanel" aria-labelledby="headingOne1" data-parent="#accordionEx">
						<div class="card-body">
			        		<table id="employeeTale" class="table table-striped table-bordered" cellspacing="0" width="100%">
		          				<thead class="bg-info" style="color:white;">
		          					<th>Nombre completo</th>
		          					<th>Edad</th>
		          					<th>F.Nacimiento</th>
		          					<th>Cargo</th>
		          					<th>#Teléfono</th>
		          					<th>Dirección</th>
		          					<th>Contacto</th>
		          					<th># Tel.Contacto</th>
		          					<th>Estado</th>
		          					<th></th>
	 		          				</thead>
		          				<tbody>
		          					<c:forEach items="${employees}" var="employee">
		          					<tr>
	   									<td>${employee.fullName}</td>
	   									<td>${employee.age}</td>
	   									<td>${employee.birthday}</td>
	   									<td>${employee.position}</td>
	   									<td>${employee.telephone}</td>
	   									<td>${employee.address}</td>
	   									<td>${employee.fullNameContact}</td>
	   									<td>${employee.telephoneContact}</td>
	   									<td>
	   										<c:if test="${employee.state == 1}"><span class="badge badge-success">Activo</span></c:if>
	   										<c:if test="${employee.state == 0}"><span class="badge badge-danger">Inactivo</span></c:if>
	   									</td>
	   									<td>
	   										<div class="btn-group-vertical" role="group" aria-label="Acciones">
	   											<c:if test="${employee.state == 1}">
	   												<a class="btn btn-sm btn-primary" title="Editar" href="<c:url value="/database/manage/${idUserDatabase}/${employee.idEmployee}" />"><i class="far fa-edit"></i></a>
	   												<a class="btn btn-sm btn-danger" title="Inactivar" href="<c:url value="/database/employee/delete/${idUserDatabase}/${employee.idEmployee}" />"><i class="fas fa-trash"></i></a>
	   											</c:if>
	   											<c:if test="${employee.state != 1}">
	   												<a class="btn btn-sm btn-info" title="Activar" href="<c:url value="/database/employee/undelete/${idUserDatabase}/${employee.idEmployee}" />"><i class="fas fa-check"></i></a>
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
				          	<c:if test="${employee_form.idEmployee == 0}">Crear</c:if> 
				          	<c:if test="${employee_form.idEmployee != 0}">Actualizar</c:if>
				          	Empleado 
				          	<i class="fas fa-angle-down rotate-icon"></i>
				        </h5>
				      </a>
				    </div>
				
				    <!-- Card body -->
				    <div id="collapseTwo2" class="collapse <c:if test="${employee_form.idEmployee != 0}">show</c:if>" role="tabpanel" aria-labelledby="headingTwo2" data-parent="#accordionEx">
						<div class="card-body">
							<form:form action="/database/manage/${idUserDatabase}" method="post" class="border border-light p-5 row" modelAttribute="employee_form">
								<form:hidden path="idEmployee" />
								<div class="col-6 col-md-6 col-sm-12">						    
								    <label for="fullName">Nombre completo*</label>
								    <form:input path="fullName" class="form-control mb-4" required="true" />
								    <form:errors path="fullName"></form:errors>
								</div>
							    <div class="col-6 col-md-6 col-sm-12">
								    <label for="age">Edad*</label>
								    <input type="number" name="age" id="age" min="1" class="form-control mb-4" required="true" value='<c:out value="${employee_form.age}"></c:out>' />
								    <form:errors path="age"></form:errors>
							    </div>
							    <div class="col-6 col-md-6 col-sm-12">
								    <label for="birthday">Fecha Nacimiento*</label>
								    <input type="date" name="birthday" id="birthday" class="form-control mb-4" required="true" value='<c:out value="${employee_form.birthday}"></c:out>' />
								    <form:errors path="birthday"></form:errors>
							    </div>
							    <div class="col-6 col-md-6 col-sm-12">
								    <label for="position">Cargo*</label>
								    <form:input path="position" class="form-control mb-4" required="true" />
								    <form:errors path="position"></form:errors>
								</div>
							    <div class="col-6 col-md-6 col-sm-12">
								    <label for="telephone"># Telefono*</label>
								    <form:input path="telephone" class="form-control mb-4" required="true" />
								    <form:errors path="telephone"></form:errors>
								</div>
							    <div class="col-6 col-md-6 col-sm-12">
									<label for="telephone2"># Telefono 2</label>
								    <form:input path="telephone2" class="form-control mb-4" />
								    <form:errors path="telephone2"></form:errors>
							    </div>
							    <div class="col-6 col-md-6 col-sm-12">
								    <label for="address">Dirección*</label>
								    <form:input path="address" class="form-control mb-4" required="true" />
								    <form:errors path="address"></form:errors>
							    </div>
							    <div class="col-6 col-md-6 col-sm-12">
								    <label for="fullNameContact">Nombre de contacto*</label>
								    <form:input path="fullNameContact" class="form-control mb-4" required="true" />
								    <form:errors path="fullNameContact"></form:errors>
								</div>
							    <div class="col-6 col-md-6 col-sm-12">
								    <label for="telephoneContact"># Telefono contacto*</label>
								    <form:input path="telephoneContact" class="form-control mb-4" required="true" />
								    <form:errors path="telephoneContact"></form:errors>
							    </div>
							    <div class="col-6 col-md-6 col-sm-12">
							    	<button class="btn btn-info btn-block my-4" type="submit">
							    		<c:if test="${employee_form.idEmployee != 0}">Actualizar</c:if>
							    		<c:if test="${employee_form.idEmployee == 0}">Crear</c:if>
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
				$('#employeeTale').DataTable();
				$('.dataTables_length').addClass('bs-select');
			});
		</script>
	
	</body>
</html>