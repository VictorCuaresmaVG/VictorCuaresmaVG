<!DOCTYPE html>
<html>
  <head>
    <title>Inicio de sesión | Panadería</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
      body {
        background-color: #f8f9fa;
   background-image: url('https://media.istockphoto.com/id/539829066/es/vector/ilustraci%C3%B3n-de-dise%C3%B1o-de-interiores-de-bake-shop-venta-negocios-cocinar-ventas-panader%C3%ADa.jpg?b=1&s=612x612&w=0&k=20&c=l9XfkZzb2Jj1vizblWWqVRplb0DJsMRkR_03Un0kHJU=');
    background-repeat: no-repeat;
    background-position: center center;
    background-attachment: fixed;
    background-size: cover;
  }

      .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
      }

      .login-form {
        width: 300px;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      }

      .login-form h1 {
        text-align: center;
        margin-bottom: 20px;
      }

      .form-group {
        margin-bottom: 20px;
      }

      .form-group label {
        font-weight: bold;
      }

      .form-group input[type="text"],
      .form-group input[type="password"] {
        width: 100%;
        padding: 10px;
        border-radius: 3px;
        border: 1px solid #ced4da;
      }

      .form-group input[type="submit"] {
        width: 100%;
        padding: 10px;
        border-radius: 3px;
        border: none;
        background-color: #007bff;
        color: #fff;
        font-weight: bold;
        cursor: pointer;
      }
      
      .logo-img {
        width: 20%;
      }
      
      .center {
        display: flex;
        justify-content: center;
        align-items: center;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="login-form">
        <div class="center">
          <img src="static/img/logo.jpg" alt="Logo de la panadería" class="logo-img">
          <h1>Iniciar sesión</h1>
        </div>
        <form action="iniciosesion" method="post">
          <div class="form-group">
            <label for="correo">Correo electrónico:</label>
            <div class="input-group">
              <input type="text" id="correo" name="correo" placeholder="Ana@gmail.com" class="form-control">
              <div class="input-group-append">
                <span class="input-group-text"><i class="fas fa-check"></i></span>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="contraseña">Contraseña:</label>
            <div class="input-group">
              <input type="password" id="contraseña" name="contraseña" placeholder="Anaa2024" class="form-control">
              <div class="input-group-append">
                <span class="input-group-text"><i class="fas fa-check"></i></span>
              </div>
            </div>
          </div>
          <input type="submit" value="Ingresar" class="btn btn-primary btn-block">
        </form>
      </div>
    </div>
    <script src="https://kit.fontawesome.com/xxxxxxxxxx.js" crossorigin="anonymous"></script> <!-- Reemplace xxxxxxxxxx con su clave de API de Font Awesome -->
  </body>
</html>
