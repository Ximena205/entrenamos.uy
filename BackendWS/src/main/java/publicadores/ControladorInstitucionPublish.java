/*package publicadores;

import java.util.ArrayList;

import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.ParameterStyle;
import javax.jws.soap.SOAPBinding.Style;
import javax.xml.ws.Endpoint;

import configuraciones.WebServiceConfiguracion;
import datatypes.DtActividadDeportiva;
import datatypes.DtClase;
import interfaces.Fabrica;
import interfaces.ICInstitucion;

@WebService
@SOAPBinding(style = Style.RPC, parameterStyle = ParameterStyle.WRAPPED)
public class ControladorInstitucionPublish {
	private Fabrica fabrica;
	private ICInstitucion iconI;
	private WebServiceConfiguracion configuracion;
	private Endpoint endpoint;

	public ControladorInstitucionPublish() {
		fabrica = Fabrica.getInstancia();
		iconI = fabrica.getICInstitucion();
				
		try {
			configuracion = new WebServiceConfiguracion();
		} catch (Exception ex) {
			
		}
	}

	@WebMethod(exclude = true)
	public void publicar() {
		//endpoint = Endpoint.publish("http://" + configuracion.getConfigOf("#WS_IP") + ":" + configuracion.getConfigOf("#WS_PORT") + "/controladorInstitucion", this);
		endpoint = Endpoint.publish("http://127.0.0.1:1945/controladorInstitucion", this);
		System.out.println("http://" + configuracion.getConfigOf("#WS_IP") + ":" + configuracion.getConfigOf("#WS_PORT") + "/controladorInstitucion");
	}
	
	@WebMethod(exclude = true)
	public Endpoint getEndpoint() {
        return endpoint;
	}
	
	//LOS MÉTODOS QUE VAMOS A PUBLICAR
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
	
}*/
