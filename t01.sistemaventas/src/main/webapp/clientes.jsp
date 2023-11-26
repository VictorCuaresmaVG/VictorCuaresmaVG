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
  <input type="text" name="nombre" class="form-control input-sm" placeholder="Nombres">
  <input type="text" name="apellido" class="form-control input-sm" placeholder="Apellidos">
  <button type="submit" name="buscarNombres" class="btn btn-primary btn-sm">BUSCAR</button>
</form>
<form action="" method="post" style="display: flex; gap: 20px;">
  <input type="text" name="dni" class="form-control input-sm" placeholder="DNI">
  <button type="submit" name="buscarDNI" class="btn btn-primary btn-sm">BUSCAR POR DNI</button>
</form>
				
<style>
.input-sm {
  height: 35px;
  font-size: 12px;
  padding: 10px;
}

.btn-sm {
  font-size: 10px;
  padding: 7px;
}

</style>

<form action="report" method="get">
<button type="submit" class="btn btn-outline-danger">
<i class="bi bi-file-pdf"></i>PDF
</form>

  	<button type="button" class="btn btn-outline-success"
					onclick="tableToExcel('testTable','Data')">
					<i class="bi bi-file-earmark-spreadsheet"></i>Excel
				</button>
				
<button class="btn btn-outline-primary	"
					onclick="exportTableToCSV('report.csv')">
					<i class="bi bi-filetype-csv"></i>CSV
				</button>
								
				<div>
					<a href="RegistrarCliente.jsp"><button type="button"
							class="btn btn-success">Agregar</button></a>
				</div>
				
				<div>
					<a href="Eliminados.jsp"><button type="button"
							class="btn btn-success">Eliminados</button></a>
				</div>
			</div>
  

			<div style="width: 300px; display: grid; align-items: center;">
	<%
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String dni = request.getParameter("dni");

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        connection = AccesoDB.getConnection();

        String sql = "SELECT Id, names, last_names, documentType, documentNumber, email, registration_date, state, phone, Password, birthdate FROM client WHERE 1=1";

        if (nombre != null && !nombre.isEmpty()) {
            sql += " AND names LIKE ?";
        }

        if (apellido != null && !apellido.isEmpty()) {
            sql += " AND last_names LIKE ?";
        }

        if (dni != null && !dni.isEmpty()) {
            sql += " AND documentNumber = ?";
        }

        preparedStatement = connection.prepareStatement(sql);

        int parameterIndex = 1;

        if (nombre != null && !nombre.isEmpty()) {
            preparedStatement.setString(parameterIndex++, "%" + nombre + "%");
        }

        if (apellido != null && !apellido.isEmpty()) {
            preparedStatement.setString(parameterIndex++, "%" + apellido + "%");
        }

        if (dni != null && !dni.isEmpty()) {
            preparedStatement.setString(parameterIndex++, dni);
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

									<a
										href="editarRegistroCliente.jsp?id=<%=id%>&nombres=<%=nombres%>&apellidos=<%=apellidos%>&tipoDocumento=<%=tipoDocumento%>&numeroDocumento=<%=numeroDocumento%>&email=<%=email%>&Estado=<%=Estado%>&celular=<%=celular%>">
										<button type="button" class="btn btn-secondary">EDITAR</button>
									</a>

									<form action="eliminadoLogicoCliente" method="post">

										<input type="hidden" id="codigo" name="id" value="<%=id%>">
										<input type="hidden" id="estado" name="estado" value="<%=Estado%>">
										
								<button type="submit" id="btnAE" class="btn btn-danger" onclick="showConfirmation()">ELIMINAR</button>

<script>
  function showConfirmation() {
    var confirmacion = confirm("¿Estás seguro de que deseas eliminar este registro?");
    if (confirmacion) {
      alert("El registro ha sido eliminado exitosamente.");
      // Aquí puedes agregar la lógica para realizar la eliminación del registro
    }
  }
</script>

                               

</form>
									

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
				
<script type="text/javascript">	
	function downloadCSV(csv, filename) {
	 var csvFile;
	 var downloadLink;
	 // CSV file
	 csvFile = new Blob([csv], {type: "text/csv"});
	 // Download link
	 downloadLink = document.createElement("a");
	 // File name
	 downloadLink.download = filename;
	 // Create a link to the file
	 downloadLink.href = window.URL.createObjectURL(csvFile);
	 // Hide download link
	 downloadLink.style.display = "none";
	 // Add the link to DOM
	 document.body.appendChild(downloadLink);
	 // Click download link
	 downloadLink.click();
	}
	
	function exportTableToCSV(filename) {
	 var csv = [];
	 var rows = document.querySelectorAll("table tr");
	
	 for (var i = 0; i < rows.length; i++) {
	 var row = [], cols = rows[i].querySelectorAll("td, th");
	
	 for (var j = 0; j < cols.length; j++)
	 row.push(cols[j].innerText);
	
	 csv.push(row.join(","));
	 }
	 // Download CSV file
	 downloadCSV(csv.join("n"), filename);
	}
	
	</script>
	
   
   <table class=table class="table-bordered table-striped table-hover table-sm"
   id="testTable" style="border: 1px solid gray;">
   
   
   <thead>
   
	<script type="text/javascript">
	var tableToExcel = (function() {
		 var uri = 'data:application/vnd.ms-excel;base64,'
		 , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
		 , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
		 , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
		 return function(table, name) {
		 if (!table.nodeType) table = document.getElementById(table)
		 var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
		 window.location.href = uri + base64(format(template, ctx))
		 }
		})()
	</script>
	</table>
	</thead>
	
</body>
</html>