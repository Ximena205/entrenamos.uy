<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous"/>
	

<title>EntrenamosUy | Iniciar Sesion</title>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="#">MenúEntrenamosUy</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="#">Homepage
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item">
				<a class="nav-link" href="inicioSesion.jsp">Iniciar sesion
				</a>
			</li>
					
		</ul>
	</div>
	</nav>
	
	
	
	<h1>Iniciar Sesion</h1>
	<form action="InicioSesion" method="post">
	
	
	<style>
  /* Estilo CSS para reducir el ancho del campo de entrada de fecha */
  #Nickname {
    width: 280px; /* Puedes ajustar este valor según tus necesidades */
  }
</style>
		<div class="form-group">
			<label for="Nickname">Nickname</label> <input type="text" name="Nickname"
				class="form-control" id="Nickname"
				placeholder="Nickname del usuario">
		</div>
		
	<style>
  /* Estilo CSS para reducir el ancho del campo de entrada de fecha */
  #Password {
    width: 280px; /* Puedes ajustar este valor según tus necesidades */
  }
</style>		
		<div class="form-group">
			<label for="Password">Contraseña</label> <input type="password" name="Password"
				class="form-control" id="Password"
				aria-describedby="emailHelp" placeholder="Contraseña">
		</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

		<script>
		$(document).ready(function () {
   			$("#habilitarCampos").change(function () {
     		if (this.checked) {
           		$("#descripcionUsuario, #biografiaUsuario, #sitioWebUsuario").prop("disabled", false);
        	} else {
            	$("#descripcionUsuario, #biografiaUsuario, #sitioWebUsuario").prop("disabled", true);
        	}
    		});
		});
		</script>

		<button type="submit" class="btn btn-primary">Iniciar Sesion</button>
	</form>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>
</html>