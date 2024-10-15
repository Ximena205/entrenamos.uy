package publicadores;
import java.util.ArrayList;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.ws.Endpoint;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.ParameterStyle;
import javax.jws.soap.SOAPBinding.Style;
import interfaces.Fabrica;
import interfaces.ICInstitucion;
import interfaces.ICUsuario;

import configuraciones.WebServiceConfiguracion;
import datatypes.DtActividadDeportiva;
import datatypes.DtClase;
import datatypes.DtFecha;
import datatypes.DtHora;
import datatypes.DtProfesor;
import datatypes.DtSocio;
import datatypes.DtUsuario;
import excepciones.ClaseRepetidaExcepcion;
import excepciones.LoginExcepcion;
import excepciones.UsuarioEnUsoExcepcion;
@WebService
@SOAPBinding(style = Style.RPC, parameterStyle = ParameterStyle.WRAPPED)
public class ControladorUsuarioPublish {
	private Fabrica fabrica;
	private ICUsuario icon;
	private ICInstitucion iconI;
	private WebServiceConfiguracion configuracion;
	private Endpoint endpoint;

	public ControladorUsuarioPublish() {
		fabrica = Fabrica.getInstancia();
		icon = fabrica.getICUsuario();
		iconI = fabrica.getICInstitucion();
		try {
			configuracion = new WebServiceConfiguracion();
		} catch (Exception ex) {
			
		}
	}

	@WebMethod(exclude = true)
	public void publicar() {
		//endpoint = Endpoint.publish("http://" + configuracion.getConfigOf("#WS_IP") + ":" + configuracion.getConfigOf("#WS_PORT") + "/controladorUsuario", this);
		endpoint = Endpoint.publish("http://127.0.0.1:9128/controladorUsuario", this);
		System.out.println("http://" + configuracion.getConfigOf("#WS_IP") + ":" + configuracion.getConfigOf("#WS_PORT") + "/controladorUsuario");
		//System.out.println("http://" + configuracion.getConfigOf("#WS_IP") + ":" + configuracion.getConfigOf("#WS_PORT") + "/controladorInstitucion");
	}
	
	@WebMethod(exclude = true)
	public Endpoint getEndpoint() {
        return endpoint;
	}
	
	//LOS MÉTODOS QUE VAMOS A PUBLICAR
	@WebMethod
	public void agregarDtSocio(DtSocio usuario) throws UsuarioEnUsoExcepcion {
		icon.agregarDtSocio(usuario);
	}
	
	@WebMethod
	public void agregarDtProfesor(DtProfesor usuario) throws UsuarioEnUsoExcepcion {
		icon.agregarDtProfesor(usuario);
	}

	@WebMethod
	public DtUsuario obtenerUsuario(String nickname){
		
		DtUsuario dtusuario = null;
		dtusuario= icon.obtenerUsuario(nickname);
        return dtusuario;
	}
	
	@WebMethod
	public String[] obtenerUsuarioString(DtUsuario dtusuario){
		String nombre = dtusuario.getNombre();
		String nick = dtusuario.getNickname();
		
		String [] datosUsuario = new String[3];
		datosUsuario[0] = nombre;
		datosUsuario[1] = nick;
		return  datosUsuario;
	}
	
	@WebMethod
	public String[] devolverClases(String email) {

		String[] ret = new String[200];
       
        return ret= icon.devolverClases(email);
    }
	
	@WebMethod
	public String getActividad(String nickname, String clase) {
		String actividad= null;
		return actividad=icon.getActividad(nickname, clase);
		
	}
	
	@WebMethod
	public boolean login(String nick, String pass) throws LoginExcepcion {
		
		return icon.login(nick, pass);
		
	}
	

	@WebMethod
	public String[] listarUsuario() {
		
		return icon.listarUsuario();
		
	}
	@WebMethod
	public void selecDatos(String inst, String act, String socio, String clase, String dia, String mes, String anio){
		
		int diaInt = Integer.parseInt(dia);
		int mesInt = Integer.parseInt(mes);
		int anioInt = Integer.parseInt(anio);
		DtFecha fecha= new DtFecha(diaInt,mesInt,anioInt);
		icon.selecDatos(inst, act, socio, clase, fecha);
		
	}
	
	
	

	//LOS MÉTODOS QUE VAMOS A PUBLICAR CONTROLADOR INSTITUCION
	@WebMethod
	public String[] listarInstitucionDeportiva() {
		ArrayList<String> lista= iconI.listarInstitucionDeportiva();
		int i = 0;
		String[] ret = new String[lista.size()];
		for(String s : lista) {
            ret[i]=s;
            i++;
        }
        return ret;
	}
	
	@WebMethod
	public String[] listarActividades(String nombre_inst) {
		//String[] ret=null;
		return iconI.listarActividades(nombre_inst);
	}

	@WebMethod
	public DtActividadDeportiva selectActividadDeportiva(String inst, String act){
		//tActividadDeportiva ret= null;
		return iconI.selectActividadDeportiva(inst, act);
		
	}
	
	@WebMethod
	public DtClase selectClase(String inst, String act, String clase) {

		
       
        return iconI.selectClase(inst, act, clase);
    }
	
	@WebMethod
	public String[] listarClases(String nombre_inst, String nombre_actividad) {
		
		return iconI.listarClases(nombre_inst, nombre_actividad);
		
	}
	
	@WebMethod
	public void altaClase(String nombre_inst, String actividad, String nombre,  String dia, String mes, String anio, String hora, String minutos, String profesor, String url, String diaAlta, String mesAlta, String anioAlta)throws ClaseRepetidaExcepcion {
		int diaInt = Integer.parseInt(dia);
		int mesInt = Integer.parseInt(mes);
		int anioInt = Integer.parseInt(anio);
		
		int diaAltaInt = Integer.parseInt(diaAlta);
		int mesAltaInt = Integer.parseInt(mesAlta);
		int anioAltaInt = Integer.parseInt(anioAlta);
		
		DtFecha fechaini= new DtFecha(diaInt,mesInt,anioInt);
		DtFecha fechaAlta= new DtFecha(diaAltaInt,mesAltaInt,anioAltaInt);
		
		int horaInt = Integer.parseInt(hora);
		int minutosInt = Integer.parseInt(minutos);
		
		DtHora horaini= new DtHora(horaInt,minutosInt);
		
		 iconI.altaClase(nombre_inst, actividad, nombre, fechaini, horaini, profesor, url, fechaAlta);
		
		
	}
	
}
