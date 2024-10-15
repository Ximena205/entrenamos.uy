package servlets;

import java.io.IOException;

import datatypes.DtSocio;
import datatypes.DtUsuario;
import excepciones.InstitucionRepetidaExcepcion;
import excepciones.UsuarioEnUsoExcepcion;
import datatypes.DtSocio;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interfaces.Fabrica;
//import interfaces.IControlador;
import interfaces.ICInstitucion;
import interfaces.ICUsuario;

@WebServlet("/AgregarInstDeportiva")
public class AgregarInstDeportiva extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AgregarInstDeportiva() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("des");
		String url = request.getParameter("url");
	
		Fabrica fabrica = Fabrica.getInstancia();
		ICInstitucion icon = fabrica.getICInstitucion();
		


		try {
			icon.altaInstitucionDeportiva(nombre,descripcion,url);
		} catch (InstitucionRepetidaExcepcion e) {
			throw new ServletException(e.getMessage());
		}
		RequestDispatcher rd;
		request.setAttribute("mensaje", "Se ha ingresado correctamente la inst. deportiva:  " + nombre + " en el sistema.");
		rd = request.getRequestDispatcher("/notificacion.jsp");
		rd.forward(request, response);
	}

}
