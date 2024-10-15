<%@page import="datatypes.DtUsuario"%>
<%@page import="datatypes.DtSocio"%>
<%@page import="datatypes.DtProfesor"%>
<%@page import="datatypes.DtActividadDeportiva"%>
<%@page import="datatypes.DtClase"%>
<%@page import="java.util.List"%>
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
				<li class="nav-item"><a class="nav-link" href="agregarUsuario.jsp">Agregar
					Usuario</a></li>
			<li class="nav-item"><a class="nav-link" href="agregarClase.jsp">Agregar
					Clase</a></li>
			<li class="nav-item"><a class="nav-link" href="gestionInscripcion.jsp">Inscripciones</a></li>
	<li class="nav-item"><a class="nav-link" href="consultas.jsp">Consultas</a></li>
				
				
				<li class="nav-item"><a class="nav-link" href="agregarInstDeportiva.jsp">Agregar
					Inst. Deportiva</a></li>
		</ul>
	</div>
	</nav>
	<%
		String mostrar = (String) request.getAttribute("mostrar");
		String nickUsuario = (String) request.getAttribute("nickUsuario");
		
		 if (mostrar.equals("usuario")) {
			DtUsuario dtu = (DtUsuario) request.getAttribute("dtusuario");
			DtActividadDeportiva dtActDep = (DtActividadDeportiva) request.getAttribute("dtactividad");
			ArrayList<DtClase> claseRet = (ArrayList<DtClase>) request.getAttribute("dtclase");
	
			
	%>
	
	<%
	if (dtu instanceof DtProfesor) {
	%>
		<h1><%=dtu.toString()%></h1>
		
		<h1>
		Clases que dicta el profesor:
		<%=nickUsuario%></h1>
		
		
		
			<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				
				<th scope="col">Nombre</th>
				<th scope="col">Fecha</th>
				<th scope="col">Actvidad Deportiva Asociada</th>
			</tr>
		</thead>
		<tbody>
			<%
				int i = 0;
					for (DtClase dtcl : claseRet) {
			%>
			<tr>
				<th scope="row"><%=i%></th>
				<td><%=dtcl.getNombre()%></td>
				<td><%=dtcl.getFecha()%></td>
				<td><%=dtActDep.getNombre()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<%
    } else if (dtu instanceof DtSocio) {
        
    %>
		<h1><%=dtu.toString()%></h1>
		
		<h1>
		Clases a las que se registró el socio:
		<%=nickUsuario%></h1>
		
		
			<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				
				<th scope="col">Nombre</th>
				<th scope="col">Fecha</th>
				
			</tr>
		</thead>
		<tbody>
			<%
				int i = 1;
					for (DtClase dtcl : claseRet) {
			%>
			<tr>
				<th scope="row"><%=i%></th>
				<td><%=dtcl.getNombre()%></td>
				<td><%=dtcl.getFecha()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
		
				<%
			 	
			    }
				%>
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