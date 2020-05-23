<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register User</title>
</head>
<body>
	<h3 style="color: red;">Register New User</h3>

	<div id="registerEmployee">
		<form:form action="/register" method="post" modelAttribute="user">
			<p>
				<label>Nombres *</label>
				<form:input path="nameUser" />
				<form:errors path="nameUser"></form:errors>
			</p>
			<p>
				<label>Apellidos *</label>
				<form:input path="lastNameUser" />
				<form:errors path="lastNameUser"></form:errors>
			</p>
			<p>
				<label>Email *</label>
				<form:input path="emailUser" />
				<form:errors path="emailUser"></form:errors>
			</p>
			<p>
				<label>Empresa *</label>
				<form:input path="enterpriseName" />
				<form:errors path="enterpriseName"></form:errors>
			</p>
			<p>
				<label>Contraseña *</label>
				<form:input path="password" />
				<form:errors path="password"></form:errors>
			</p>
			<input type="SUBMIT" value="Submit" />
		</form:form>
	</div>
	<a href="<c:url value="/login" />">Log In</a>
</body>
</html>