/**
 * ControladorUsuarioPublish.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package publicadores;

public interface ControladorUsuarioPublish extends java.rmi.Remote {
    public void agregarDtProfesor(publicadores.DtProfesor arg0) throws java.rmi.RemoteException, publicadores.UsuarioEnUsoExcepcion;
    public java.lang.String[] devolverClases(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String[] listarUsuario() throws java.rmi.RemoteException;
    public publicadores.DtUsuario obtenerUsuario(java.lang.String arg0) throws java.rmi.RemoteException;
    public void selecDatos(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, java.lang.String arg5, java.lang.String arg6) throws java.rmi.RemoteException;
    public void altaClase(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, java.lang.String arg5, java.lang.String arg6, java.lang.String arg7, java.lang.String arg8, java.lang.String arg9, java.lang.String arg10, java.lang.String arg11, java.lang.String arg12) throws java.rmi.RemoteException, publicadores.ClaseRepetidaExcepcion;
    public void agregarDtSocio(publicadores.DtSocio arg0) throws java.rmi.RemoteException, publicadores.UsuarioEnUsoExcepcion;
    public java.lang.String[] listarActividades(java.lang.String arg0) throws java.rmi.RemoteException;
    public java.lang.String[] listarInstitucionDeportiva() throws java.rmi.RemoteException;
    public boolean login(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException, publicadores.LoginExcepcion;
    public java.lang.String[] listarClases(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public java.lang.String getActividad(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public publicadores.DtClase selectClase(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException;
    public publicadores.DtActividadDeportiva selectActividadDeportiva(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException;
    public java.lang.String[] obtenerUsuarioString(publicadores.DtUsuario arg0) throws java.rmi.RemoteException;
}
