<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.naming.InitialContext, javax.sql.DataSource" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<title>EntrenamosUy | Inscripciones</title>
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
            document.write('<li class="nav-item"><a class="nav-link" href="gestionInscripcion.jsp">Inscripcion</a></li>');
            document.write('<li class="nav-item"><a class="nav-link" href="index.jsp">Cerrar Sesión</a></li>');
        } else if (tipoUsuario === "p") {
        	document.write('<li class="nav-item"><a class="nav-link" href="consultaUsuario.jsp">Consulta Usuario</a></li>');
            document.write('<li class="nav-item"><a class="nav-link" href="consultaActividad.jsp">Consulta Actividad</a></li>');
            document.write('<li class="nav-item"><a class="nav-link" href="agregarClase.jsp">Alta Dictado de Clase</a></li>');
            document.write('<li class="nav-item"><a class="nav-link" href="index.jsp">Cerrar Sesión</a></li>');
        }
    }
</script>
		</ul>
	</div>
	</nav>
<h1>Inscripciones</h1>
	<p class="lead">
  Continuemos con el Registro a Dictado de Clase
</p>
	
	<form action="GestionInscripcion" method="post">
	
			<%
			String nombreInstitucion2 = (String) (request.getParameter("nomInstitucion2"));
		  	
		  	String nombreActividad = (String) (request.getParameter("actdep"));
			%>
	
			<style>
  /* Estilo CSS para reducir el ancho del campo de entrada de fecha */
	  #nomInstitucion2 {
	    width: 280px; /* Puedes ajustar este valor según tus necesidades */
	  }
	</style>
		<input type="hidden" name="boton" id="boton" value="">
		
	

			<div class="form-group">
		    <label for="nomInstitucion2">Institución</label> <input type="text"
						name="nomInstitucion2" class="form-control" id="nomInstitucion2"
						value="<%= nombreInstitucion2 %>"> 
		    <!-- <select name="institucion" class="form-control" id="institucionSelect">
		        <option value="Institución 1">Institución 1</option>
		        <option value="Institución 2">Institución 2</option>
		        <option value="Institución 3">Institución 3</option>
		         Agrega más opciones según sea necesario 
		    </select> -->
			</div>



	<style>
  /* Estilo CSS para reducir el ancho del campo de entrada de fecha */
	  #actdep {
	    width: 280px; /* Puedes ajustar este valor según tus necesidades */
	  }
	</style>
			<div class="form-group">
    		<label for="actdep">Actividad Deportiva</label> <input type="text"
				name="actdep" class="form-control" id="actdep"
				value="<%= nombreActividad %>">
    		<!-- <select name="actdeportiva" class="form-control" id="actividadSelect">
       		<option value="Actividad 1">Actividad 1</option>
        	<option value="Actividad 2">Actividad 2</option>
       		<option value="Actividad 3">Actividad 3</option>
         	Agrega más opciones según sea necesario 
    		</select> -->
			</div>



		<%
    Object obj = request.getAttribute("clases");
    ArrayList<String> clasesList = new ArrayList<String>();

    if (obj instanceof ArrayList) {
    	clasesList = (ArrayList<String>) obj;
    }
%>	
		
		
		<style>
  /* Estilo CSS para reducir el ancho del campo de entrada de fecha */
	  #clase {
	    width: 280px; /* Puedes ajustar este valor según tus necesidades */
	  }
	</style>
		
		<label for="clase">Selecciona una clase asociada a la actividad:</label>
    <select name="clase">
        <% for (int i = 0; i < clasesList.size(); i++) { %>
            <option value="<%= i + 1 %>"><%= clasesList.get(i) %></option>
        <% } %>
    </select>

			<button type="button" class="btn btn-primary" onclick="procesar('consultaClase')">Consultar Clase</button>
		
  	

			<div class="form-group">
			     <input type="text"
							name="nomClase" class="form-control" id="nomClase"
							placeholder="Ingrese la clase">
			    <!-- <select name="clase" class="form-control" id="claseSelect">
			        <option value="Clase 1">Clase 1</option>
			        <option value="Clase 2">Clase 2</option>
			        <option value="Clase 3">Clase 3</option>
			         Agrega más opciones según sea necesario 
			    </select> -->
			</div>
	
	<style>
  /* Estilo CSS para reducir el ancho del campo de entrada de fecha */
	  #socio {
	    width: 280px; /* Puedes ajustar este valor según tus necesidades */
	  }
	</style>
		<div class="form-group">
   			<label for="socio">Socio</label> <input type="text"
				name="socio" class="form-control" id="socio"
			placeholder="Ingrese su Nick">
		    <!--  <select name="socio" class="form-control" id="socioSelect">
		        <option value="Socio 1">Socio 1</option>
		        <option value="Socio 2">Socio 2</option>
		        <option value="Socio 3">Socio 3</option>
		         Agrega más opciones según sea necesario 
		    </select> -->
			</div>
		<button type="button" class="btn btn-primary" onclick="procesar('agregar')">Agregar Inscripcion</button>
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

</body>
</html>