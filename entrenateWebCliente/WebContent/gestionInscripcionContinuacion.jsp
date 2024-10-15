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
		  <label for="nomInstitucion">Nombre de la Institucion</label> 
		  <input type="text"  name="nomInstitucion" class="form-control" id="nomInstitucion" value="<%=nombreInstitucion%>"> 
		    <!-- <select name="institucion" class="form-control" id="institucionSelect">
		        <option value="Institución 1">Institución 1</option>
		        <option value="Institución 2">Institución 2</option>
		        <option value="Institución 3">Institución 3</option>
		         Agrega más opciones según sea necesario 
		    </select> -->
			</div>
	
	
	
	
		<%
    Object obj2 = request.getAttribute("actividadesList");
    ArrayList<String> actividadesList = new ArrayList<String>();

    if (obj2 instanceof ArrayList) {
    	actividadesList = (ArrayList<String>) obj2;
    }
%>	
		
		
		<style>
  /* Estilo CSS para reducir el ancho del campo de entrada de fecha */
	  #actividadd {
	    width: 280px; /* Puedes ajustar este valor según tus necesidades */
	  }
	</style>
	
		<label for="actividadd">Selecciona una actividad:</label>
    <select name="actividadd">
        <% for (int i = 0; i < actividadesList.size(); i++) { %>
            <option value="<%= i + 1 %>"><%= actividadesList.get(i) %></option>
        <% } %>
    </select>

			<button type="button" class="btn btn-primary" onclick="procesar('consultaActividad')">Consultar Actividad</button>
		 
		 </form>
   
   <form action="gestionInscripcionCont2.jsp" method="post">
		
		
		<div class="form-group">
		 
		  <input  type="hidden"  name="nomInstitucion2" class="form-control" id="nomInstitucion2" value="<%=nombreInstitucion%>"> 
		</div>
		
		
 

<div class="form-group">
    <input type="text"
				name="actdep" class="form-control" id="ActDep"
				placeholder="Ingrese actividad deportiva">
    <!-- <select name="actdeportiva" class="form-control" id="actividadSelect">
        <option value="Actividad 1">Actividad 1</option>
        <option value="Actividad 2">Actividad 2</option>
        <option value="Actividad 3">Actividad 3</option>
         Agrega más opciones según sea necesario 
    </select> -->
</div>


  <button type="submit" class="btn btn-primary" ">Continuar Inscripcion a Clase</button>
		  <%
			String nombreInstitucion2 = (String) (request.getParameter("nomInstitucion2"));
		  
		  	String nombreActividad = (String) (request.getParameter("actdep"));
			%>
	

	
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