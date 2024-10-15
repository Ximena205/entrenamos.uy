package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
import datatypes.DtActividadDeportiva;
import datatypes.DtClase;
import datatypes.DtProfesor;
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
@WebServlet("/ConsultaDictadoClase")
public class ConsultaDictadoClase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsultaDictadoClase() {
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
		
	    //String nickUsuario = request.getParameter("nickUsuario");
	    String nickUsuario = request.getParameter("nickUsuario");
	    String c = request.getParameter("nomClase");

		
		if (request.getParameter("boton").equals("usuario")){
			publicadores.DtProfesor dtu;
			try {
				dtu = (publicadores.DtProfesor) obtenerUsuario(nickUsuario);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			ArrayList<String> institucion = null;
			try {
				institucion = listarInstitucionDeportiva();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ArrayList<publicadores.DtClase> claseRet = new ArrayList<>();
			
			String[] inst_ret = new String[institucion.size()];
			String[] actividades = new String[institucion.size()];
			
			
			publicadores.DtActividadDeportiva dtActDep = null;
			publicadores.DtClase dtClase= null;
			
			String[] clasesU = null;
			try {
				clasesU = devolverClases(nickUsuario);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//las clases que dicta el usuario o las clases que esta registrado
			String[] nombClase = new String[20];
			
			String actividad = null;
	  
	        int ii=0;
	        int i=0;
	        int iii=0;
	        
	      
	        
	        Set<String> clasesAgregadas = new HashSet<>();

	        for (String inst : institucion) {
	            for (String cc : clasesU) {
	            	try {
						actividades = listarActividades(inst);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

	            	
	                try {
						actividad = getActividad(nickUsuario, c);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	                
	                for (String act : actividades) {
	                    if (act.equals(actividad)) {
	                        try {
								dtActDep = selectActividadDeportiva(inst, actividad);
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

	                        // Verificar si la clase ya ha sido agregada
	                        if (!clasesAgregadas.contains(dtClase.getNombre())) {
	                            claseRet.add(dtClase);
	                            // Agregar la clase al conjunto para evitar repeticiones
	                            clasesAgregadas.add(dtClase.getNombre());
	                        }
	                    }

	                    iii++;
	                }

	                i++;
	            }

	            ii++;
	        }
	       
	   
	       
	       	  request.setAttribute("dtclase", claseRet);
	       	  
	       	  
			  //request.setAttribute("dtusuario", dtu);
			  request.setAttribute("mostrar", "usuario");
		
			
			int a=0;
			int aa=0;
			ArrayList<String> sociosR = new ArrayList<>();
			
			
			String[] listaUsuarios = null;
			try {
				listaUsuarios = listarUsuario();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
					for(String usuario:listaUsuarios) {
						        	
									String[] clasesUsu = null;
									try {
										clasesUsu = devolverClases(usuario);
									} catch (Exception e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
									
									for(String clasesUsuario:clasesUsu) {
									
											if(clasesUsuario.equals(c))	{
												
												if(!usuario.equals(nickUsuario))	{
												sociosR.add(usuario);
												}
											}
											aa++;
									}
							a++;		
										
				}
						
			
			
	
			//request.setAttribute("actividad", );

		request.setAttribute("socios", sociosR);
		request.setAttribute("nickUsuario", nickUsuario);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("/infoClase.jsp");
		rd.forward(request, response);
		}
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
	public String[] listarUsuario() throws Exception{
		ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
		return port.listarUsuario();
		
	}

	
}
