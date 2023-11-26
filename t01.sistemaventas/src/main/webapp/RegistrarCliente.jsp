<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>B.P San Jose</title>
</head>
<body>
<style>

	body {
			background-image: url('https://previews.123rf.com/images/teploleta/teploleta1507/teploleta150700232/42280315-mano-panader%C3%ADa-dibujado-patr%C3%B3n-de-fondo-sin-fisuras.jpg');
			background-size: cover;
			background-repeat: no-repeat;
		}
    /* Estilos para el formulario */
    form {
        max-width: 400px;
        margin: 0 auto;
    }

    h2 {
        text-align: center;
        color: #333;
    }

    h5 {
        margin-top: 20px;
    }

    input,
    select {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    input[type="submit"] {
        background-color: #333;
        color: #fff;
        cursor: pointer;
    }

    /* Estilos para mensajes de error */
    .error-message {
        display: none;
        color: red;
        margin-top: 5px;
    }
</style>

<h2>Agregar Cliente</h2>

<form action="RegistrarCliente" method="post">
    <h5>Nombre(es)</h5>
    <input type="text" name="nombres" oninput="validarNombresApellidos(this)">
    <p class="error-message" id="nombres-error">Solo se permiten letras en este campo</p>

    <h5>Apellidos</h5>
    <input type="text" name="apellidos" oninput="validarNombresApellidos(this)">
    <p class="error-message" id="apellidos-error">Solo se permiten letras en este campo</p>

    <h5>Documento (DNI, CNE)</h5>
    <select name="tipoDocumento">
        <option value="CNE">CNE</option>
        <option value="DNI">DNI</option>
    </select>

    <h5>Nº Documento</h5>
    <input type="number" name="numeroDocumento" oninput="validarNumeroDocumento(this)">
    <p class="error-message" id="numeroDocumento-error"></p>

    <h5>Correo</h5>
    <input type="email" name="email" pattern="^[a-zA-Z0-9._%+-]+@(gmail|outlook|hotmail)\.com$">
    <p class="error-message" id="email-error">Solo se permiten correos con las extensiones @gmail, @outlook o @hotmail</p>

    <h5>Celular</h5>
    <input type="tel" name="celular" pattern="9[0-9]{8}" oninput="validarCelular(this)">
    <p class="error-message" id="celular-error">El número de celular debe tener 9 dígitos y empezar con el número 9</p>
    
     <h5>Fecha De Nacimiento</h5>
<input type="date" name="birthdate" id="birthdate" required>

    <h5>Contraseña</h5>
    <input type="password" name="contraseña" id="contraseña">
    <p class="error-message" id="contraseña-error">La contraseña debe tener un Numero , Una Mayuscula y como minimo 8 caracteres y 15 como maximo</p>

    <input type="submit" value="Registrar" onclick="confirmacion()">
</form>

<script>
const birthdateInput = document.getElementById("birthdate");
birthdateInput.addEventListener("input", () => {
  const birthdate = new Date(birthdateInput.value);
  const eighteenYearsAgo = new Date();
  eighteenYearsAgo.setFullYear(eighteenYearsAgo.getFullYear() - 18);
  if (birthdate > eighteenYearsAgo) {
    birthdateInput.setCustomValidity("Debes tener al menos 18 años para registrarte.");
  } else {
    birthdateInput.setCustomValidity("");
  }
});

function confirmacion() {
	if (confirm("¿Estás seguro de que deseas registrar?")) {
		mostrarMensaje();
	}
}

function mostrarMensaje() {
	var mensaje = document.createElement("p");
	mensaje.className = "success-message";
	mensaje.innerHTML = "¡Registro exitoso!";
	document.body.appendChild(mensaje);
}
function validarContraseña() {
	  const contraseñaInput = document.getElementById("contraseña");
	  const contraseña = contraseñaInput.value;
	  const contraseñaError = document.getElementById("contraseña-error");

	  const regex = /^(?=.*[A-Z])(?=.*\d)(?=.*[a-zA-Z]).{8,15}$/;

	  if (!regex.test(contraseña)) {
	    contraseñaError.style.display = "block";
	  } else {
	    contraseñaError.style.display = "none";
	  }
	}

	document.getElementById("contraseña").addEventListener("input", validarContraseña);
	
	function validarNombresApellidos(input) {
		  const nombresApellidos = input.value;
		  const errorElement = input.nextElementSibling;

		  const regex = /^[a-zA-Z\s]+$/;

		  if (!regex.test(nombresApellidos)) {
		    errorElement.style.display = "block";
		  } else {
		    errorElement.style.display = "none";
		  }
		}

		document.getElementsByName("nombres")[0].addEventListener("input", function() {
		  validarNombresApellidos(this);
		});

		document.getElementsByName("apellidos")[0].addEventListener("input", function() {
		  validarNombresApellidos(this);
		});

function validarNumeroDocumento(input) {
  var tipoDocumento = document.getElementsByName("tipoDocumento")[0].value;
  if (tipoDocumento === "CNE" && input.value.length !== 15) {
    document.getElementById(input.name + "-error").innerHTML = "El número de documento debe tener 15 dígitos para CNE";
    document.getElementById(input.name + "-error").style.display = "block";
    input.setCustomValidity("El número de documento debe tener 15 dígitos para CNE");
  } else if (tipoDocumento === "DNI" && input.value.length !== 8) {
    document.getElementById(input.name + "-error").innerHTML = "El número de documento debe tener 8 dígitos para DNI";
    document.getElementById(input.name + "-error").style.display = "block";
    input.setCustomValidity("El número de documento debe tener 8 dígitos para DNI");
  } else {
    document.getElementById(input.name + "-error").style.display = "none";
    input.setCustomValidity("");
  }
}

function validarCelular(input) {
  const celular = input.value;
  const celularError = document.getElementById("celular-error");

  if (celular.length !== 9 || celular[0] !== "9") {
    celularError.style.display = "block";
  } else {
    celularError.style.display = "none";
  }
}

function validarCorreo() {
	  const emailInput = document.getElementsByName("email")[0];
	  const email = emailInput.value;
	  const emailError = document.getElementById("email-error");

	  const regex = /^[a-zA-Z0-9._%+-]+@(gmail|outlook|hotmail)\.com$/;

	  if (!regex.test(email)) {
	    emailError.style.display = "block";
	  } else {
	    emailError.style.display = "none";
	  }
	}

	document.getElementsByName("email")[0].addEventListener("input", validarCorreo);
</script>

</body>
</html>
