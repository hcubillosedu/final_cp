<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<title>CUBILLOS ENTERPRISE - Inicio</title>
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
			    	<a class="nav-link " href="<c:url value="/account" /> "><i class="fas fa-user-cog"></i> Administrar Cuenta</a>
			  	</li>
			  	<li class="nav-item">
			    	<a class="nav-link" href="<c:url value="/database" /> "><i class="fas fa-database"></i> Bases de datos</a>
			  	</li>
			  	<c:if test="${role_user="ROLE_ADMIN"}">
			  	<li class="nav-item">
			    	<a class="nav-link" href="<c:url value="/admin" /> "><i class="fas fa-users-cog"></i> Administración de Usuarios</a>
			  	</li>
			  	</c:if>
			  	<li class="nav-item">
			    	<a class="nav-link" href="<c:url value="/logout" /> "><i class="fas fa-sign-out-alt"></i> Cerrar sesión</a>
			  	</li>
			</ul>
		</header>
			
	    <!--Main layout-->
	    <main>
      		<div class="container-fluid text-center">
	        	<!--Card-->
		        <div class="card card-cascade wider reverse my-4 pb-5">
		
	          	<!--Card image-->
	          	<div class="view view-cascade overlay wow fadeIn">
		            
              	<div class="mask rgba-white-slight"></div>
		            
	          	</div>
	          	<!--/Card image-->
		
	          	<!--Card content-->
	          	<div class="card-body card-body-cascade text-center wow fadeIn" data-wow-delay="0.2s">
		            <!--Title-->
		            <h4 class="card-title"><strong>Enterprise Database</strong></h4>
		            <h5 class="blue-text"><strong>By Cubillos bros.</strong></h5>
		
		            <p class="card-text">Registra la información más importante de los empleados de tu empresa</p>
					<div class="row justify-content-center">
						
			            <a class="btn btn-primary btn-lg col-5 float-left" href="<c:url value="/account" /> "><i class="fas fa-user-cog"></i> Administrar Cuenta</a>
			            <a class="btn btn-secondary btn-lg col-5 float-left" href="<c:url value="/database" /> "><i class="fas fa-database"></i> Bases de datos</a>
			            <a class="btn btn-default btn-lg col-5 float-left" href="<c:url value="/admin"/>" ><i class="fas fa-users-cog"></i> Administración de Usuarios</a>
			            <a class="btn btn-info btn-lg col-5 float-left" href="<c:url value="/about_us"/>"><i class="fas fa-info-circle"></i> Acerca de</a>
				  	</div>
		          </div>
		          <!--/.Card content-->
		        </div>
		        <!--/.Card-->
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