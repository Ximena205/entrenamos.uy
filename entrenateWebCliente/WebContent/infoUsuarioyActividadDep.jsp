<%@page import="publicadores.DtUsuario"%>
<%@page import="publicadores.DtSocio"%>
<%@page import="publicadores.DtProfesor"%>
<%@page import="publicadores.DtActividadDeportiva"%>
<%@page import="publicadores.DtClase"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.Iterator" %>
<%@page import="java.util.ArrayList"%>
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
<title>EntrenamosUy | Consulta de Usuario</title>
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
	<%
		String mostrar = (String) request.getAttribute("mostrar");
		String nickUsuario = (String) request.getAttribute("nickUsuario");
		String actividadDep = (String) request.getAttribute("actividadDep");
		
		 if (mostrar.equals("usuario")) {
			DtUsuario dtu = (DtUsuario) request.getAttribute("dtusuario");

			
			DtActividadDeportiva dtActDep = (DtActividadDeportiva) request.getAttribute("dtactividad");
			
			List<publicadores.DtClase> claseRet = (List<publicadores.DtClase>) request.getAttribute("dtclase");
			String [] clasesU = (String []) request.getAttribute("dtclaseU");
			//String [] datosUsuariosString = (String []) request.getAttribute("datosUsuariosString");
			
			
	%>
	
	
	
	
	
	
	<%
	if (dtu instanceof publicadores.DtProfesor) {
		 publicadores.DtProfesor dtProfesor1 = (publicadores.DtProfesor) dtu;
		
	
	%>
	
		<h1 style="white-space: pre-line; font-size: 30px; text-decoration: underline;">
		Informacion del profesor: 
		</h1>
			
		<h1 style="white-space: pre-line;font-size: 20px; font-family: Trebuchet MS;"><%=dtProfesor1.getBiografia()%></h1>
		<h1 style="white-space: pre-line;font-size: 20px; font-family: Trebuchet MS;"><%= dtu.getNombre()%></h1>
		
		<h1 style="white-space: pre-line;font-size: 30px; text-decoration: underline;">
		Clases que dicta el profesor:</h1>
	
	<h1 style="white-space: pre-line;font-size: 20px;font-family: Trebuchet MS;"><%=nickUsuario%> </h1>
		
		
		
			<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				
				<th scope="col">Nombre Clase</th>
				<th scope="col">Fecha Inicio</th>
				<th scope="col">Hora Inicio</th>
				<th scope="col">URL</th>
				<th scope="col">Fecha Registro</th>
				<th scope="col">Actvidad Deportiva Asociada</th>
			</tr>
		</thead>
		<tbody>
			<%
			Iterator<publicadores.DtClase> itr = claseRet.iterator();	
			 int numero = 0;
             while (itr.hasNext()) {
            	 numero++;
            	 publicadores.DtClase item = itr.next();
             
			//int i = 1;
					//for (DtClase dtcl : claseRet) {
			%>
			<tr>
				<th scope="row"><%=numero%></th>
				<td><%=item.getNombre()%></td>
				<td><%= item.getFecha().getDia() %>/<%= item.getFecha().getMes() %>/<%= item.getFecha().getAnio() %></td>
    			<td><%= item.getHoraInicio().getHora() %>:<%= item.getHoraInicio().getMinutos() %></td>
				<td><%=item.getUrl()%></td>
				<td><%= item.getFechaReg().getDia() %>/<%= item.getFechaReg().getMes() %>/<%= item.getFechaReg().getAnio() %></td>
 				<td><%=dtActDep.getNombre()%></td>
			</tr>
			<%
			//i++;
				}
			%>
		</tbody>
	</table>
	<%
    } else if (dtu instanceof DtSocio) {
    	 DtSocio dtSocio = (DtSocio) dtu;
    	
    
        
    %>
  		<h1 style="white-space: pre-line; font-size: 30px; text-decoration: underline;">
		Informacion del Socio: 
		</h1>
		<h1 style="white-space: pre-line;font-size: 20px; font-family: Trebuchet MS;"><%=dtSocio.toString()%></h1>
			
		<h1 style="white-space: pre-line;font-size: 30px; text-decoration: underline;">
		Clases a las que se registró el socio:</h1>
		<h1 style="white-space: pre-line;font-size: 20px;font-family: Trebuchet MS;"><%=nickUsuario%> </h1>
		
		
			<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				
				<th scope="col">Nombre</th>
				
				
			</tr>
		</thead>
		<tbody>
			<%
				int i = 0;
					for (String claseUsu : clasesU) {
			%>
			<tr>
				<th scope="row"><%=i%></th>
				<td><%=claseUsu%></td>
				
				
				
			</tr>
			<%
			i++;
			
				}
			%>
		</tbody>
	</table>
		
				<%
			 	
			    }
				%>
	<%
 	
    }else if (mostrar.equals("actividad")) {
		DtActividadDeportiva dtAD = (DtActividadDeportiva) request.getAttribute("dtactividad2");
		String [] listadoClases = (String []) request.getAttribute("listadoClases");
	%>
	<h1 style="white-space: pre-line; font-size: 30px; text-decoration: underline;">
		Informacion de la actividad: 
		</h1>
			<h1 style="white-space: pre-line; font-size: 20px;"> Nombre: </h1>	
			<h1 style="white-space: pre-line; font-size: 15px;"><%= dtAD.getNombre() %></h1>
			<h1 style="white-space: pre-line; font-size: 20px;"> Descripcion: </h1>	
			<h1 style="white-space: pre-line; font-size: 15px;"><%=dtAD.getDescripcion()%></h1>
			<h1 style="white-space: pre-line; font-size: 20px;"> Duracion: </h1>	
			<h1 style="white-space: pre-line; font-size: 15px;"><%=dtAD.getDuracion()%></h1>
			<h1 style="white-space: pre-line; font-size: 20px;"> Costo: </h1>	
			<h1 style="white-space: pre-line; font-size: 15px;"><%=dtAD.getCosto()%></h1>
			<h1 style="white-space: pre-line; font-size: 20px;"> Fecha registro: </h1>	
			<td style="white-space: pre-line; font-size: 15px;"><%=dtAD.getFechaReg().getDia()%>/<%=dtAD.getFechaReg().getMes()%>/<%= dtAD.getFechaReg().getAnio()%></td>
    			
			
		<h1 style="white-space: pre-line; font-size: 30px; text-decoration: underline;">
		Lista de clases Asociadas:
		</h1><%=actividadDep%></h1>
		
		
		
			<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				
				<th scope="col">Nombre de la Clase</th>
				
			</tr>
		</thead>
		<tbody>
			<%
				int i = 0;
					for (String clases : listadoClases) {
			%>
			<tr>
				<th scope="row"><%=i%></th>
				<td><%=clases%></td>
				
			</tr>
			<%
			i++;
				}
			%>
		</tbody>
	</table>
	<%
	}

	%>
	
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