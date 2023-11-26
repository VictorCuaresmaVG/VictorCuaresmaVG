<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="pe.edu.vallegrande.db.AccesoDB"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<link rel="stylesheet" type="text/css" href="static/css/new.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>B.P San Jose</title>
</head>
<body>
	<nav id="barra" class="navbar navbar-expand-xl navbar-light"
		style="background-color: gray;">
		<div class="container-fluid">
			<a class="navbar-brand" href="usuario.jsp"> <img alt="logo"
				class="imagenLogo" src="static/img/logo.jpg">B.P San Jose
			</a>
		</div>
	</nav>

	<div>
		<div style="margin-left: 50px;">

			<div class="title">
				<h1>CLIENTES</h1>
				<div class="rectTitle"></div>
			</div>

			<div class="input-group" style="display: flex; gap: 20px; margin-bottom: 40px;margin-top: 40px">
				<p class="tituloBuscar">BUSCAR REGISTRO</p>
				<form action="" method="post" style="display: flex; gap: 20px;">

					<input type="search" name="dni" class="form-control"
						placeholder="Buscar">

					<button type="submit" id="btnAE" class="btn btn-primary">BUSCAR</button>

				</form>
				<div>
					<a href="RegistrarCliente.jsp"><button type="button"
							class="btn btn-success">Agregar</button></a>
				</div>
				<div>
					<a href="clientes.jsp"><button type="button"
							class="btn btn-success">Volver</button></a>
				</div>
			</div>


			<div style="width: 300px; display: grid; align-items: center;">
				<%
				String dni = request.getParameter("dni");

				Connection connection = null;
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;

				try {

					connection = AccesoDB.getConnection();

					if (dni != null) {

						String sql = "Select Id, names, last_names, documentType ,documentNumber,email, registration_date, state,phone, Password,birthdate  from client Where documentNumber=?;";
						preparedStatement = connection.prepareStatement(sql);
						preparedStatement.setString(1, dni);

					} else {
						String sql = "Select Id, names, last_names, documentType ,documentNumber,email, registration_date, state,phone, Password,birthdate  from client Where state ='I';";
						preparedStatement = connection.prepareStatement(sql);
					}

					resultSet = preparedStatement.executeQuery();
				%>

				<table class="table table-bordered">

					<thead>
						<tr class="text-center">
							<th>ID</th>
							<th>NOMBRES</th>
							<th>APELLIDOS</th>
							<th>DOCUMENTO</th>
							<th>Nº DOCUMENTO</th>
							<th>CELULAR</th>
							<th>EMAIL</th>
							<th>FECHA DE REGISTRO</th>
							<th>CONTRASEÑA</th>
							<th>FECHA DE NACIMIENTO</th>
							<th>ESTADO</th>
							<th>ACCIONES</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<%
						while (resultSet.next()) {
							String id = resultSet.getString("Id");
							String nombres = resultSet.getString("names");
							String apellidos = resultSet.getString("last_names");
							String tipoDocumento = resultSet.getString("documentType");
							String numeroDocumento = resultSet.getString("documentNumber");
							String email = resultSet.getString("email");
							String fechaRegistro = resultSet.getString("registration_date");
							String Estado = resultSet.getString("state");
							String celular = resultSet.getString("phone");
							String contraseña = resultSet.getString("Password");
							String birthdate = resultSet.getString("birthdate");
						%>
						<tr>
							<td><%=id%></td>
							<td><%=nombres%></td>
							<td><%=apellidos%></td>
							<td><%=tipoDocumento%></td>
							<td><%=numeroDocumento%></td>
							<td><%=celular%></td>
							<td><%=email%></td>
							<td><%=fechaRegistro%></td>
							<td><%=contraseña%></td>
							<td><%=birthdate%></td> 
							<td><%=Estado%></td>

							<td>
								<div style="display: grid; justify-content: center; gap: 10px;">


									<form action="eliminadoLogicoCliente" method="post">

										<input type="hidden" id="codigo" name="id" value="<%=id%>">
										<input type="hidden"  name="estado" value="<%=Estado%>">
		<!-- Botón para activar el modal -->
<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#confirmacionModal">
    RESTAURAR
</button>
</form>
<!-- Modal -->
<div class="modal fade" id="confirmacionModal" tabindex="-1" role="dialog" aria-labelledby="confirmacionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmacionModalLabel">Confirmación</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>¿Estás seguro de que deseas restaurar el cliente?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                <button type="button" class="btn btn-success" onclick="restaurarRegistro()">Sí</button>
            </div>
        </div>
    </div>
</div>

<!-- Script para la notificación y redirección -->
<script>
    function notificacion() {
        // Código para mostrar la notificación con SweetAlert
        Swal.fire({
            icon: 'success',
            title: 'Cliente restaurado correctamente',
            showConfirmButton: false,
            timer: 1500  // La notificación se cerrará automáticamente después de 1.5 segundos
        });

        // Redireccionar a otra página después de la restauración
        setTimeout(function() {
            window.location.href = "Eliminados.jsp";
        }, 1500);  // Espera 1.5 segundos antes de redirigir
    }

    // Función para realizar la restauración del registro
    function restaurarRegistro() {
        // Realizar la solicitud AJAX para la restauración
        $.ajax({
            type: "POST",
            url: "eliminadoLogicoCliente",  // Coloca la URL correcta para tu acción de eliminación
            data: { id: '<%=id%>' },
            success: function (response) {
                // Manejar la respuesta del servidor, si es necesario
                // En este caso, simplemente mostrar la notificación y redirigir
                notificacion();
            },
            error: function (error) {
                // Manejar el error, si es necesario
                alert("Error al restaurar el registro");
            }
        });

        // Cierra el modal después de hacer clic en "Sí"
        $('#confirmacionModal').modal('hide');
    }
</script>
			
								</div>
							</td>

						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<%
				} catch (Exception e) {
				out.println("Error: " + e.getMessage());
				}
				%>
			</div>

<!-- Bibliotecas de Bootstrap, jQuery y SweetAlert (asegúrate de tener las versiones correctas) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		</div>
	</div>
</body>
</html>