package servlets;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
import datatypes.DtClase;
import datatypes.DtFecha;
import datatypes.DtHora;
import datatypes.DtUsuario;
import excepciones.ClaseRepetidaExcepcion;
import excepciones.UsuarioEnUsoExcepcion;
import interfaces.Fabrica;
import interfaces.ICInstitucion;

import interfaces.ICUsuario;*/
import publicadores.ControladorUsuarioPublish;
import publicadores.ControladorUsuarioPublishService;
import publicadores.ControladorUsuarioPublishServiceLocator;

/**
 * Servlet implementation class AgregarClase
 */
@WebServlet("/AgregarClase")
public class AgregarClase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AgregarClase() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		
		//Fabrica fabrica = Fabrica.getInstancia();
		//ICInstitucion icon = fabrica.getICInstitucion();
		
		if (request.getParameter("boton").equals("consultaInstitucion")){
			
			ArrayList<String> instituciones = null;
			try {
				instituciones = listarInstitucionDeportiva();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			request.setAttribute("instituciones", instituciones); // Establece el atributo con la lista de instituciones
			request.getRequestDispatcher("agregarClase.jsp").forward(request, response);	
			
		}  else if (request.getParameter("boton").equals("consultaActividad")){
				
				String institucion = request.getParameter("nomInstitucion");
			
				String[] actividades = null;
				try {
					actividades = listarActividades(institucion);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				
				
				    ArrayList<String> actividadesList = new ArrayList<>(Arrays.asList(actividades));
				    // Ahora, actividadesList es un ArrayList que contiene los mismos elementos que actividadesArray
				
	
				request.setAttribute("actividadesList", actividadesList); // Establece el atributo con la lista de instituciones
				request.getRequestDispatcher("continuarAgregarClase.jsp").forward(request, response);	
				
		
		}else if (request.getParameter("boton").equals("agregarClase")) {
		

		
		String institucion = request.getParameter("nomInstitucion");
		
		String actividaddep = request.getParameter("nomActividad");
		String nombre = request.getParameter("nomClase");
		String profesor = request.getParameter("profesor");
		//String fechaclase = request.getParameter("fechaClase");
		String fechaClaseStr = request.getParameter("fechaClase");
		String fechaRegistroStr = request.getParameter("fechaRegistro");
		
		SimpleDateFormat formatoFecha = new SimpleDateFormat("dd-MM-yyyy");
		
		
			
			
			 Date fechaClaseDate = null;
			try {
				fechaClaseDate = formatoFecha.parse(fechaClaseStr);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			 Date fechaRegistroDate = null;
			try {
				fechaRegistroDate = formatoFecha.parse(fechaRegistroStr);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			   

		    // Ahora puedes obtener el día, mes y año como números
		    Calendar calendar = Calendar.getInstance();
		    calendar.setTime(fechaClaseDate);
		   
		    int diaC = calendar.get(Calendar.DAY_OF_MONTH);
		    int mesC = calendar.get(Calendar.MONTH) + 1; // Sumamos 1 ya que en Calendar, los meses comienzan desde 0
		    int anioC = calendar.get(Calendar.YEAR);
		    
		    
			 						//publicadores.DtFecha dtFecha = new publicadores.DtFecha(diaC, mesC, anioC);
		    String diaInicio = String.valueOf(diaC);
		    String mesInicio = String.valueOf(mesC);
		    String anioInicio = String.valueOf(anioC);
		    
		    // Ahora, 'dia', 'mes' y 'anio' contienen los valores numéricos de la fecha.
		
		
	  String horaclase = request.getParameter("horaClase");
	  String minutoclase = request.getParameter("minutoClase");
	  
								  //int horaClase=Integer.parseInt(horaclase);
									//int minutoClase=Integer.parseInt(minutoclase);
									
								    //publicadores.DtHora dtHora = new publicadores.DtHora(horaClase, minutoClase);


	  String url = request.getParameter("url");
	  //String fecharef = request.getParameter("fechaRef");

	  	calendar.setTime(fechaRegistroDate);
	  	 int diaR = calendar.get(Calendar.DAY_OF_MONTH);
		 int mesR = calendar.get(Calendar.MONTH) + 1; // Sumamos 1 ya que en Calendar, los meses comienzan desde 0
		 int anioR = calendar.get(Calendar.YEAR);
		 
		 publicadores.DtFecha dtFecha2 = new publicadores.DtFecha(diaR, mesR, anioR);
		 
		 String diaReg = String.valueOf(diaR);
		 String mesReg = String.valueOf(mesR);
		 String anioReg = String.valueOf(anioR);
		
		
		
		
		//DtClase dtclase=null;
	    	try	{
				altaClase(institucion, actividaddep,  nombre, diaInicio,mesInicio, anioInicio, horaclase,minutoclase,  profesor, url, diaReg, mesReg, anioReg);
				request.setAttribute("mensaje", "Se ha ingresado correctamente la clase " + nombre +  " en el sistema.");
			 	
			} catch (publicadores.ClaseRepetidaExcepcion e) {
	           // e.printStackTrace();
	            //request.setAttribute("mensaje", e.getMessage());
	            request.setAttribute("mensaje", "La clase " + nombre + "ya se dio de alta. Por favor, inténtelo nuevamente.");
				
			} catch (Exception e) {
				// Si hay una excepción general, imprime la traza de la excepción
				e.printStackTrace();
				
				 // Establece un mensaje de error genérico
			    request.setAttribute("mensaje", "Ha ocurrido un error al ingresar la clase. Por favor, inténtelo nuevamente.");
			}  
			
	
		
	    //public boolean altaClase(String nombre_inst, String actividad, String nombre, DtFecha fechaini, DtHora horaini, String profesor, String url, DtFecha fechaAlta) throws ClaseRepetidaExcepcion;


		//icon.agregarClase(dtc);
		
	
	    	// Redirecciona a la página de notificación
		 	//request.setAttribute("mensaje", "Se ha ingresado correctamente la clase " + nombre +  " en el sistema.");
		 	RequestDispatcher rd = request.getRequestDispatcher("/notificacion.jsp");
    		rd.forward(request, response);
		}
	}
	
	//OPERACION CONSUMIDA
	public ArrayList<String> listarInstitucionDeportiva() throws Exception{
	
		ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
		String[] lista = port.listarInstitucionDeportiva();
		ArrayList<String> lstLista =new ArrayList<>();
		for (int i = 0; i < lista.length; ++i) {
			lstLista.add(lista[i]);
		}
		return lstLista;
		
		
	}
	public String[] listarActividades(String nombre_inst)  throws Exception{
		ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
		return port.listarActividades(nombre_inst);
		
	}
	
	public void altaClase(String nombre_inst, String actividad, String nombre,  String dia, String mes, String anio, String hora, String minutos, String profesor, String url, String diaAlta, String mesAlta, String anioAlta) throws Exception,publicadores.ClaseRepetidaExcepcion {
		ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
		port.altaClase(nombre_inst, actividad, nombre, dia, mes, anio, hora, minutos, profesor, url, diaAlta, mesAlta, anioAlta);
		
	}


}