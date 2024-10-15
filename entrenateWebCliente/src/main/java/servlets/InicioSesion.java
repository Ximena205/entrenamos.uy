package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import datatypes.DtProfesor;
//import datatypes.DtSocio;
//import datatypes.DtUsuario;
//import excepciones.LoginExcepcion;
//import interfaces.Fabrica;
//import interfaces.ICUsuario;
//import logica.Profesor;
//import logica.Socio;
import publicadores.ControladorUsuarioPublish;
import publicadores.ControladorUsuarioPublishService;
import publicadores.ControladorUsuarioPublishServiceLocator;

@WebServlet("/InicioSesion")
public class InicioSesion extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public InicioSesion() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Fabrica fabrica = Fabrica.getInstancia();
       // ICUsuario icon = fabrica.getICUsuario();

        String nick = request.getParameter("Nickname");
        String pass = request.getParameter("Password");
        
        try {
        	login(nick, pass);
            publicadores.DtUsuario dtc = obtenerUsuario(nick);
		
		            if (dtc instanceof publicadores.DtSocio) {
		                // El usuario es socio
		                //String mensaje = "Bienvenido " + nick + ".";
		                request.setAttribute("nick", nick);
		                //request.setAttribute("mensaje", mensaje);
		                // Redirige al área de socios con el mensaje de confirmación
		                response.sendRedirect("area_socios.jsp");
		            } else if (dtc instanceof publicadores.DtProfesor) {
		                // El usuario es profesor
		                //String mensaje = "Bienvenido " + nick + ".";
		                request.setAttribute("nick", nick);
		                //request.setAttribute("mensaje", mensaje);
		                // Redirige al área de profesores con el mensaje de confirmación
		                response.sendRedirect("area_profesores.jsp");
		            }
     
        	   
           
        } catch (publicadores.LoginExcepcion e) {
            e.printStackTrace();
            //request.setAttribute("mensaje", e.getMessage());
            // Redirige de nuevo a la página de inicio de sesión con un mensaje de error
            request.setAttribute("mensaje", "Usuario y/o contraseña incorrectos. Por favor, inténtelo nuevamente.");
			
            RequestDispatcher rd = request.getRequestDispatcher("/notificacion.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
			e.printStackTrace();
		}
    }
    
  //Operacion consumida
  	public publicadores.DtUsuario obtenerUsuario(String nickname)throws Exception{
  		ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
  		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
  		return port.obtenerUsuario(nickname);
  		
  	}
  	
  //Operacion consumida
  	public boolean login(String nick, String pass) throws Exception, publicadores.LoginExcepcion{
  		ControladorUsuarioPublishService cps = new ControladorUsuarioPublishServiceLocator();
  		ControladorUsuarioPublish port = cps.getControladorUsuarioPublishPort();
  		return port.login(nick,pass);
  		
  	}
}
