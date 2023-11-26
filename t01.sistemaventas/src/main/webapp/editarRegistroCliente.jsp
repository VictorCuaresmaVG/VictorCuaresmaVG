<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar</title>
<style>

</style>
</head>
<body>

<%
  String id = request.getParameter("id");
  String nombres = request.getParameter("nombres");
  String apellidos = request.getParameter("apellidos");
  String tipoDocumento = request.getParameter("tipoDocumento");
  String numeroDocumento = request.getParameter("numeroDocumento");
  String email = request.getParameter("email");
  String estado = request.getParameter("Estado");
  String celular = request.getParameter("celular");
  String contraseña = request.getParameter("contraseña");
  String birthdate = request.getParameter("birthdate");
%>

<body>
  <div class="container">
    <form action="actualizarDatos" method="post" class="form">
      <h5>ID</h5>
      <input type="text" name="id" value="<%=id%>" readonly="readonly">
      
      <h5>Nombre(es)</h5>
      <input type="text" name="nombres" value="<%=nombres%>" pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ\s]+" title="Solo se permiten letras">
      
      <h5>Apellidos</h5>
      <input type="text" name="apellidos" value="<%=apellidos%>" pattern="[A-Za-zñÑáéíóúÁÉÍÓÚ\s]+" title="Solo se permiten letras">
      
      <h5>Documento (DNI, CNE)</h5>
      <select name="tipoDocumento">
        <option value="DNI" <%=tipoDocumento.equals("DNI") ? "selected" : ""%>>DNI</option>
        <option value="CNE" <%=tipoDocumento.equals("CNE") ? "selected" : ""%>>CNE</option>
      </select>
      
      <h5>Nº Documento</h5>
      <input type="text" name="numeroDocumento" value="<%=numeroDocumento%>" pattern="\d{8}" title="Solo se permiten 8 números para el DNI o 15 números para el CNE">
      
      <h5>Correo</h5>
      <input type="email" name="email" value="<%=email%>" pattern="[a-zA-Z0-9._%+-]+@(gmail\.com|outlook\.com|hotmail\.com)$" title="Solo se permiten correos de Gmail, Outlook y Hotmail">
      
      <h5>ESTADO</h5>
      <input type="text" name="estado" value="<%=estado%>" readonly="readonly">
      
      <h5>Celular</h5>
      <input type="text" name="celular" value="<%=celular%>" pattern="\d{9}" title="Solo se permiten 9 números">
      
      <h5>Contraseña</h5>
      <input type="password" name="contraseña" value="<%=contraseña%>">
      
      <h5>Fecha de Nacimiento</h5>
<input type="date" name="birthdate" value="<%=birthdate%>" readonly>

      
      <input type="submit" value="Actualizar" onclick="confirmarEdicion()">
    </form>
    <script>
  function confirmarEdicion() {
    if (confirm("¿Estás seguro de que quieres editar a este cliente?")) {
      document.getElementById("formulario").submit();
    }
  }
</script>
  </div>
</body>


	<style>
		body {
			background-image: url('https://previews.123rf.com/images/brsav/brsav1411/brsav141100022/34072212-pan-panader%C3%ADa-patr%C3%B3n-de-fondo-sin-fisuras-etiquetas-pack-para-pan.jpg');
			background-size: cover;
			background-repeat: no-repeat;
		}

		.container {
			max-width: 500px;
			margin: 0 auto;
			background-color: transparent; /* Fondo transparente */
			border-radius: 5px;
			padding: 20px;
			margin-top: 50px;
		}

		.form {
			background-color: rgba(255, 255, 255, 0.8); /* Fondo semi-transparente */
			padding: 20px;
			border-radius: 5px;
		}

		.form h5 {
			margin-top: 20px;
		}

		.form input,
		.form select {
			width: 90%;
			padding: 8px;
			margin-bottom: 10px;
			border-radius: 5px;
			border: 1px solid #ccc;
		}

		.form input[type="submit"] {
			background-color: #333;
			color: #fff;
			cursor: pointer;
		}
	</style>

<script>
const nombresInput = document.querySelector('input[name="nombres"]');
const apellidosInput = document.querySelector('input[name="apellidos"]');
const tipoDocumentoSelect = document.querySelector('select[name="tipoDocumento"]');
const numeroDocumentoInput = document.querySelector('input[name="numeroDocumento"]');
const emailInput = document.querySelector('input[name="email"]');
const celularInput = document.querySelector('input[name="celular"]');

nombresInput.addEventListener('input', (event) => {
  const regex = new RegExp('[A-Za-zñÑáéíóúÁÉÍÓÚ\\s]+');
  const isValid = regex.test(event.target.value);
  if (!isValid) {
    event.target.setCustomValidity('Solo se permiten letras');
  } else {
    event.target.setCustomValidity('');
  }
});

apellidosInput.addEventListener('input', (event) => {
  const regex = new RegExp('[A-Za-zñÑáéíóúÁÉÍÓÚ\\s]+');
  const isValid = regex.test(event.target.value);
  if (!isValid) {
    event.target.setCustomValidity('Solo se permiten letras');
  } else {
    event.target.setCustomValidity('');
  }
});

tipoDocumentoSelect.addEventListener('change', (event) => {
  const value = event.target.value;
  if (value === 'DNI') {
    numeroDocumentoInput.setAttribute('pattern', '\\d{8}');
    numeroDocumentoInput.setAttribute('title', 'Solo se permiten 8 números para el DNI');
  } else if (value === 'CNE') {
    numeroDocumentoInput.setAttribute('pattern', '\\d{15}');
    numeroDocumentoInput.setAttribute('title', 'Solo se permiten 15 números para el CNE');
  }
});

numeroDocumentoInput.addEventListener('input', (event) => {
  const value = tipoDocumentoSelect.value;
  if (value === 'DNI') {
    const regex = new RegExp('\\d{8}');
    const isValid = regex.test(event.target.value);
    if (!isValid) {
      event.target.setCustomValidity('Solo se permiten 8 números para el DNI');
    } else {
      event.target.setCustomValidity('');
    }
  } else if (value === 'CNE') {
    const regex = new RegExp('\\d{15}');
    const isValid = regex.test(event.target.value);
    if (!isValid) {
      event.target.setCustomValidity('Solo se permiten 15 números para el CNE');
    } else {
      event.target.setCustomValidity('');
    }
  }
});

emailInput.addEventListener('input', (event) => {
  const regex = new RegExp('[a-zA-Z0-9._%+-]+@(gmail\\.com|outlook\\.com|hotmail\\.com)$');
  const isValid = regex.test(event.target.value);
  if (!isValid) {
    event.target.setCustomValidity('Solo se permiten correos de Gmail, Outlook y Hotmail');
  } else {
    event.target.setCustomValidity('');
  }
});

celularInput.addEventListener('input', (event) => {
  const regex = new RegExp('\\d{9}');
  const isValid = regex.test(event.target.value);
  if (!isValid) {
    event.target.setCustomValidity('Solo se permiten 9 números');
  } else {
    event.target.setCustomValidity('');
  }
});

</script>
</body>
</html>