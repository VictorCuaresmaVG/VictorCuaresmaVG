<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="static/css/new.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INICIO DE USUARIO</title>
</head>
<body>
	<nav id="barra" class="navbar navbar-expand-xl navbar-light"
		style="background-color: gray;">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img alt="logo"
				class="imagenLogo" src="static/img/logo.jpg">B.P San Jose
			</a>
		</div>
	</nav>
	
	<nav class="slidernav">
		<a href="usuario.jsp" style="margin-top: 50px;"><i
			class="bi bi-person-circle"></i>Usuario</a> <a href="clientes.jsp"><i
			class="bi bi-house"></i>Clientes</a> <a href=""><i class="bi bi-egg"></i>Producto</a>
		<a href="index.jsp"><i class="bi bi-door-closed"></i>Cerrar</a>

	</nav>

	<div class="contenido">

		<div class="perfil">
			<p class="perfil-data">Nombres:</p>
			<div class="data">
				<p>${usuario.nombres}</p>
			</div>
		</div>

		<div class="perfil">
			<p class="perfil-data">Apellidos</p>
			<div class="data">
				<p>${usuario.apellidos}</p>
			</div>
		</div>
		<div class="perfil">
			<p class="perfil-data">Documento</p>
			<div class="data">
				<p>${usuario.tipoDocumento}</p>
			</div>
		</div>
		<div class="perfil">
			<p class="perfil-data">Numero de Documento</p>
			<div class="data">
				<p>${usuario.numeroDocumento}</p>
			</div>
		</div>
		<div class="perfil">
			<p class="perfil-data">Correo</p>
			<div class="data">
				<p>${usuario.email}</p>
			</div>
		</div>
		<div class="perfil">
			<p class="perfil-data">Celular</p>
			<div class="data">
				<p>${usuario.celular}</p>
			</div>
		</div>
	</div>
</body>
</html>