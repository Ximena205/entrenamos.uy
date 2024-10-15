package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.DtProfesor;
import datatypes.DtUsuario;
/*
import datatypes.DtActividadDeportiva;
import datatypes.DtClase;
import datatypes.DtSocio;
import datatypes.DtUsuario;
import interfaces.Fabrica;
import interfaces.ICInstitucion;
import interfaces.ICUsuario;*/
import publicadores.ControladorUsuarioPublish;
import publicadores.ControladorUsuarioPublishService;
import publicadores.ControladorUsuarioPublishServiceLocator;

/**
 * Servlet implementation class Consultas
 */
@WebServlet("/Consultas")
public class Consultas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Consultas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Fabrica fabrica = Fabrica.getInstancia();
		//ICUsuario iconU = fabrica.getICUsuario();
		//ICInstitucion iconI = fabrica.getICInstitucion();
		
		String nickUsuario = request.getParameter("nickUsuario");
		String actividadDep = request.getParameter("actividadDep");
		
		ArrayList<String> institucion = null;
		try {
			institucion = listarInstitucionDeportiva();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String[] inst_ret = new String[institucion.size()];
		publicadores.DtActividadDeportiva dtActDep = null;
		String[] actividades = new String[100];
		String[] listadoClases = new String[100];
		  int ii=0;
	        int i=0;
	        int iii=0;
		if (request.getParameter("boton").equals("usuario")){
			
			
			
			publicadores.DtUsuario dtu = null;
			try {
				dtu = obtenerUsuario(nickUsuario);
				
				
				
				request.setAttribute("dtusuario", dtu);
				 
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			try {
				String[] datosUsuariosString = obtenerUsuarioString(dtu);
				request.setAttribute("datosUsuariosString", datosUsuariosString);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			
			
			List<publicadores.DtClase> claseRet = new ArrayList<>();
			
			
		
		
				
			
			
			
			
			publicadores.DtClase dtClase= null;
			
			String[] clasesU = null;
			try {
				clasesU = devolverClases(nickUsuario);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//las clases que dicta el usuario o las clases que esta registrado
			String[] nombClase = new String[200];
			
			String actividad = null;
	  
	      
	        
	       request.setAttribute("dtclaseU", clasesU);
	       for (String inst:institucion) {//las instituciones
	        	
	        	
	        	inst_ret[ii]= inst;
	        	
	        	 for(String c:clasesU) {//las clases que dicta el usuario o las clases que esta registrado
	 	        	
	     	        //nombClase[i]= c;
	     	        	
	     	        	try {
							actividad = getActividad(nickUsuario,c);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
	     	        	try {
							actividades = listarActividades(inst);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
	     	        	
	     	        	for(String act:actividades) {
	     	        		if(act.equals(actividad)) {
		     	        		
	     	        			try {
									dtActDep= selectActividadDeportiva(inst, actividad);
								} catch (Exception e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
	     	        			request.setAttribute("dtactividad", dtActDep);
	     	        			try {
									dtClase = selectClase(inst, actividad, c);
								} catch (Exception e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
		     	        		claseRet.add(dtClase);
		     	        		
	     	        			}
	     	        		
	     	        		iii++;
	     	        	 }
	     	        		
	     	       i++;		
	     	        	
	     	      }
	 
	        	ii++;
	        }
	  
	       	  request.setAttribute("dtclase", claseRet);
	       	
	       	  
			 
			 
			  request.setAttribute("mostrar", "usuario");
		}else if (request.getParameter("boton").equals("actividad")) {
			 int a=0;
		        int aa=0;
		        int aaa=0;
			
			for (String inst:institucion) {//las instituciones
				 inst_ret[aa]= inst;
				 
				 
				  try {
					actividades = listarActividades(inst);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				  for(String act:actividades) {
   	        			if(act.equals(actividadDep)) {
	     	        		
	   	        			try {
								dtActDep= selectActividadDeportiva(inst, actividadDep);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
	   	        			request.setAttribute("dtactividad2", dtActDep);
	   	        			try {
								listadoClases = listarClases(inst, actividadDep);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
		     	        		
   	        			}
   	        		
   	        		aaa++;
   	        	 }
				  
				  aa++;
		     } 
				 
			request.setAttribute("listadoClases", listadoClases);
			request.setAttribute("mostrar", "actividad");
		}
		request.setAttribute("nickUsuario", nickUsuario);
		request.setAttribute("actividadDep", actividadDep);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("/infoUsuarioyActividadDep.jsp");
		rd.forward(request, response);
	}

	
	//Operacion consumida
		public publicadores.DtUsuario obtenerUsuario(String nickname)throws Exception{
			ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
			ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
			return port.obtenerUsuario(nickname);
			
		}
		public String[] devolverClases(String email) throws Exception{
			ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
			ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
			return port.devolverClases(email);
			
		}
		public String getActividad(String nickname, String clase) throws Exception{
			ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
			ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
			return port.getActividad(nickname,clase);
			
		}
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
		public publicadores.DtActividadDeportiva selectActividadDeportiva(String inst, String act)  throws Exception{
			ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
			ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
			return port.selectActividadDeportiva(inst,act);
			
		}
		public publicadores.DtClase selectClase(String inst, String act, String clase)  throws Exception{
			ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
			ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
			return port.selectClase(inst,act,clase);
			
		}
		
		public String[] listarClases(String nombre_inst, String nombre_actividad) throws Exception{
			ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
			ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
			return port.listarClases(nombre_inst,nombre_actividad);
			
		}
		public String[] obtenerUsuarioString(publicadores.DtUsuario dtusuario) throws Exception{
			ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
			ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
			return port.obtenerUsuarioString(dtusuario);
			
		}
}
