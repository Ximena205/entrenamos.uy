package interfaces;

import java.util.ArrayList;

import java.util.Set;

import datatypes.DtFecha;
import datatypes.DtProfesor;
import datatypes.DtSocio;
import datatypes.DtUsuario;
import excepciones.UsuarioEnUsoExcepcion;
import excepciones.LoginExcepcion;

public interface ICUsuario {
	//public void agregarUsuario(DtUsuario usuario) throws UsuarioEnUsoExcepcion;
	public void agregarDtSocio(DtSocio usuario) throws UsuarioEnUsoExcepcion;//SEPARAR
	public void agregarDtProfesor(DtProfesor usuario) throws UsuarioEnUsoExcepcion;
	public DtUsuario obtenerUsuario(String nickname);// en pav usabamos el main para iterar y mostrar toda la info de usuario
	public String[] devolverClases(String nickname);//publicado
	public String getActividad(String nickname, String clase);//publicado
	
	public boolean login(String nick, String pass) throws LoginExcepcion;//publicado
	public String[] listarUsuario();//publicado
	boolean selecDatos(String inst, String act, String socio, String clase, DtFecha fechaReg);
	
	public Set<String> listarUsuarios();
	public Set<String> listarSocios();
	//public boolean selecDatos(String socio, String clase, DtFecha fechaReg, Float costo);
	
	
	
	
	

	}
