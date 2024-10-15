<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>EntrenamosUy | Agregar Clase</title>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="#">MenuEntrenamosUy</a>
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
            document.write('<li class="nav-item"><a class="nav-link" href="consultaDictadoClase.jsp">Consulta Dictado de Clase</a></li>');
            document.write('<li class="nav-item"><a class="nav-link" href="index.jsp">Cerrar Sesión</a></li>');
        }
    }
</script>
		</ul>
	</div>
	</nav>

	
<h1>Agregar Clase</h1>
	<p class="lead">
  Continuemos con el alta de dictado de clase 
</p>

	<form action="AgregarClase" method="post">
	
	<%
	
	String nombreInstitucion = (String) (request.getParameter("nomInstitucion"));
	%>
	
		<style>
  /* Estilo CSS para reducir el ancho del campo de entrada de fecha */
  #nomInstitucion {
    width: 280px; /* Puedes ajustar este valor según tus necesidades */
  }
</style>
	
	
		<input type="hidden" name="boton" id="boton" value="">	

			<div class="form-group">
			<label for="nomInstitucion">Nombre de la Institucion</label> <input type="text"
				name="nomInstitucion" class="form-control" id="nomInstitucion"
				value="<%= nombreInstitucion %>">
			</div>
		
		
		
		<%
    Object obj = request.getAttribute("actividadesList");
    ArrayList<String> actividadesList = new ArrayList<String>();

    if (obj instanceof ArrayList) {
    	actividadesList = (ArrayList<String>) obj;
    }
%>	
		
		
		<label for="actividadd">Selecciona una actividad:</label>
    <select name="actividadd">
        <% for (int i = 0; i < actividadesList.size() ; i++) { %>
            <option value="<%= i + 1 %>"><%= actividadesList.get(i) %></option>
        <% } %>
	    </select>
	    
	    
	     <% // borrar out.print
	     %>
	    <% out.println("Tamaño de actividadesList: " + actividadesList.size()); %>
<% for (int i = 0; i < actividadesList.size(); i++) { %>
    <% out.println("Elemento " + i + ": " + actividadesList.get(i)); %>
<% } %>
	    

			<button type="button" class="btn btn-primary" onclick="procesar('consultaActividad')">Consultar Actividad</button>
		
  		
		
	<style>
  /* Estilo CSS para reducir el ancho del campo de entrada de fecha */
  #nomActividad {
    width: 280px; /* Puedes ajustar este valor según tus necesidades */
  }
</style>		
		
		<div class="form-group">
			<label for="nomActividad">--</label> <input type="text"
				name="nomActividad" class="form-control" id="nomActividad"
				placeholder="Ingrese el nombre de la actividad">
		</div>

<style>
  /* Estilo CSS para reducir el ancho del campo de entrada de fecha */
  #nomClase {
    width: 280px; /* Puedes ajustar este valor según tus necesidades */
  }
</style>	
			<div class="form-group">
			<label for="nomClase">Nombre clase</label> <input type="text"
				name="nomClase" class="form-control" id="nomClase"
				placeholder="Ingrese un nombre para la clase">
		</div>
		
		
<style>
  /* Estilo CSS para reducir el ancho del campo de entrada de fecha */
  #profesor {
    width: 220px; /* Puedes ajustar este valor según tus necesidades */
  }
</style>		
			<div class="form-group">
			<label for="profesor">Profesor</label> <input type="text"
				name="profesor" class="form-control" id="profesor"
				placeholder="Ingrese su nickname">
		</div>
		
		

<style>
  /* Estilo CSS para reducir el ancho del campo de entrada de fecha */
  #fechaClase {
    width: 170px; /* Puedes ajustar este valor según tus necesidades */
  }
</style>

<div class="form-group">
    <label for="fechaClase">Fecha de Clase</label>
    <input type="date" name="fechaClase" class="form-control" id="fechaClase" placeholder="Selecciona la fecha de la clase">
</div>




<style>
  /* Estilo CSS para reducir el ancho de los campos de entrada de hora y minuto */
  .input-field {
    display: inline-block; /* Hacer que los campos sean elementos en línea */
    width: 100px; /* Puedes ajustar este valor según tus necesidades */
  }
</style>

<div class="form-group">
  <label for="horaClase">Hora de Clase ref</label>
  <input type="text" name="horaClase" class="form-control input-field" id="horaClase" placeholder="HH">
  <input type="text" name="minutoClase" class="form-control input-field" id="minutoClase" placeholder="MM">
</div>




		
<style>
  /* Estilo CSS para reducir el ancho del campo de entrada de fecha */
  #url {
    width: 320px; /* Puedes ajustar este valor según tus necesidades */
  }
</style>
			
		
			<div class="form-group">
			<label for="url">URL</label> <input type="text"
				name="url" class="form-control" id="url"
				placeholder="Ingrese un nombre para la clase">
		</div>
		
		
<style>
  /* Estilo CSS para reducir el ancho del campo de entrada de fecha */
  #fechaRegistro {
    width: 170px; /* Puedes ajustar este valor según tus necesidades */
  }
</style>
	
<div class="form-group">
    <label for="fechaRegistro">Fecha de Registro</label>
    <input type="date" name="fechaRegistro" class="form-control" id="fechaRegistro" placeholder="Selecciona la fecha de registro">
</div>


		<button type="button" class="btn btn-primary" onclick="procesar('agregarClase')">Agregar Clase</button>
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