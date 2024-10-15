package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
import interfaces.Fabrica;
import interfaces.ICInstitucion;
import interfaces.ICUsuario;*/
import publicadores.ControladorUsuarioPublish;
import publicadores.ControladorUsuarioPublishService;
import publicadores.ControladorUsuarioPublishServiceLocator;
//import datatypes.DtFecha;

@WebServlet("/GestionInscripcion")
public class GestionInscripcion extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GestionInscripcion() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Fabrica fabrica = Fabrica.getInstancia();
		//ICUsuario icon = fabrica.getICUsuario();
		//ICInstitucion iconI = fabrica.getICInstitucion();
		
		
		
		
	

		
        if (request.getParameter("boton").equals("consultaInstitucion")){
        	ArrayList<String> instituciones = null;
			try {
				instituciones = listarInstitucionDeportiva();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			request.setAttribute("instituciones", instituciones); // Establece el atributo con la lista de instituciones
			request.getRequestDispatcher("gestionInscripcion.jsp").forward(request, response);	
			
        	
        }
        if (request.getParameter("boton").equals("consultaActividad")){
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
		request.getRequestDispatcher("gestionInscripcionContinuacion.jsp").forward(request, response);	
			
        	
        	
        }
		if (request.getParameter("boton").equals("consultaClase")) {
			
			String institucion2 = request.getParameter("nomInstitucion2");
			String actividad2 = request.getParameter("actdep");
			
			String[] clasesU = null;
			try {
				clasesU = listarClases(institucion2, actividad2);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 ArrayList<String> clasesList = new ArrayList<>(Arrays.asList(clasesU));
			
			request.setAttribute("clases", clasesList);
			request.getRequestDispatcher("gestionInscripcionCont2.jsp").forward(request, response);	
			
		}if (request.getParameter("boton").equals("agregar")) {
				

				
				
				
				Calendar calendario = Calendar.getInstance();
		        int anio = calendario.get(Calendar.YEAR);
		        int mes = calendario.get(Calendar.MONTH) + 1; // El mes se indexa desde 0, así que sumamos 1.
		        int dia = calendario.get(Calendar.DAY_OF_MONTH);
	
		        //DtFecha dtf = new DtFecha(dia, mes, anio);
		        
		        String diaString = String.valueOf(dia);
		        String mesString = String.valueOf(mes);
		        String anioString = String.valueOf(anio);
		        
		        String clase = request.getParameter("nomClase");
				String nick = request.getParameter("socio");
				
				String institucion = request.getParameter("nomInstitucion2");
				String actividad = request.getParameter("actdep");
				
				try {
					selecDatos(institucion, actividad, nick, clase, diaString, mesString, anioString);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				request.setAttribute("mensaje", "Se ha ingresado correctamente al sistema la inscripción del socio " + nick + " en la clase " + clase);
		}else if (request.getParameter("boton").equals("eliminar")){
			//icon.borrarInscripcion(institucion, actividad, nick, clase);
			//request.setAttribute("mensaje", "Se ha eliminado del sistema la inscripción del socio " + nick + " de la clase " + clase);
		}
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("/notificacion.jsp");
		rd.forward(request, response);
	}
	//Operacion consumida

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
	
	
	public void selecDatos(String inst, String act, String socio, String clase, String dia, String mes, String anio) throws Exception{
		ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
		port.selecDatos(inst, act, socio, clase, dia, mes, anio);
		
	}
	
	
	public String[] listarClases(String nombre_inst, String nombre_actividad) throws Exception{
		ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
		return port.listarClases(nombre_inst,nombre_actividad);
		
	}
	
	
}
