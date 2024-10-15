<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous"/>
<title>EntrenamosUy | Consultas</title>
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
			<script>
    // Recupera el tipo de usuario del almacenamiento local
    var tipoUsuario = localStorage.getItem("tipoUsuario");
    
    if (tipoUsuario != "s" && tipoUsuario != "p") {
        // Si el tipo de usuario no se encuentra, redirige al usuario a la página de inicio de sesión
        window.location.href = "agregarUsuario.jsp";
    } else {
        // Mostrar u ocultar elementos del menú según el tipo de usuario
        if (tipoUsuario === "s") {
            document.write('<li class="nav-item"><a class="nav-link" href="consultaUsuario.jsp">Consulta Usuario</a></li>');
            document.write('<li class="nav-item"><a class="nav-link" href="consultaActividad.jsp">Consulta Actividad</a></li>');
            document.write('<li class="nav-item"><a class="nav-link" href="gestionInscripcion.jsp">Registro a dictado de clase</a></li>');
            document.write('<li class="nav-item"><a class="nav-link" href="index.jsp">Cerrar Sesión</a></li>');
        } else if (tipoUsuario === "p") {
        	document.write('<li class="nav-item"><a class="nav-link" href="consultaUsuario.jsp">Consulta Usuario</a></li>');
            document.write('<li class="nav-item"><a class="nav-link" href="consultaActividad.jsp">Consulta Actividad</a></li>');
            document.write('<li class="nav-item"><a class="nav-link" href="agregarClase.jsp">Alta Dictado de Clase</a></li>');
            document.write('<li class="nav-item"><a class="nav-link" href="consultaDictadoClase.jsp">Consulta Dictado de Clase</a></li>');
            document.write('<li class="nav-item"><a class="nav-link" href="index.jsp">Cerrar Sesión</a></li>');
        }
    }
</script>

		</ul>
	</div>
	</nav>
	<h1>Consultar: información del Usuario </h1>
	<form action="Consultas" method="post">
		<input type="hidden" name="boton" id="boton" value="">
		<div class="form-group">
			<label for="exampleInputPassword1">Nickanme</label> <input type="text"
				name="nickUsuario" class="form-control" id="exampleInputPassword1"
				placeholder="Nickname del usuario">
		</div>
		<button type="button" class="btn btn-primary"
			onclick="procesar('usuario')">Perfil Usuario</button>
		
			
	</form>
	<script type="text/javascript">
		function procesar(tipo) {
			document.getElementById("boton").value = tipo;
			document.forms[0].submit();
		}
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
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
