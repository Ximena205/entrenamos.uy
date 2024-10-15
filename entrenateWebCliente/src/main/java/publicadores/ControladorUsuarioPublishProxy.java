package publicadores;

public class ControladorUsuarioPublishProxy implements publicadores.ControladorUsuarioPublish {
  private String _endpoint = null;
  private publicadores.ControladorUsuarioPublish controladorUsuarioPublish = null;
  
  public ControladorUsuarioPublishProxy() {
    _initControladorUsuarioPublishProxy();
  }
  
  public ControladorUsuarioPublishProxy(String endpoint) {
    _endpoint = endpoint;
    _initControladorUsuarioPublishProxy();
  }
  
  private void _initControladorUsuarioPublishProxy() {
    try {
      controladorUsuarioPublish = (new publicadores.ControladorUsuarioPublishServiceLocator()).getControladorUsuarioPublishPort();
      if (controladorUsuarioPublish != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)controladorUsuarioPublish)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)controladorUsuarioPublish)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (controladorUsuarioPublish != null)
      ((javax.xml.rpc.Stub)controladorUsuarioPublish)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public publicadores.ControladorUsuarioPublish getControladorUsuarioPublish() {
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish;
  }
  
  public void agregarDtProfesor(publicadores.DtProfesor arg0) throws java.rmi.RemoteException, publicadores.UsuarioEnUsoExcepcion{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    controladorUsuarioPublish.agregarDtProfesor(arg0);
  }
  
  public java.lang.String[] devolverClases(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.devolverClases(arg0);
  }
  
  public java.lang.String[] listarUsuario() throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.listarUsuario();
  }
  
  public publicadores.DtUsuario obtenerUsuario(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.obtenerUsuario(arg0);
  }
  
  public void selecDatos(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, java.lang.String arg5, java.lang.String arg6) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    controladorUsuarioPublish.selecDatos(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
  }
  
  public void altaClase(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, java.lang.String arg5, java.lang.String arg6, java.lang.String arg7, java.lang.String arg8, java.lang.String arg9, java.lang.String arg10, java.lang.String arg11, java.lang.String arg12) throws java.rmi.RemoteException, publicadores.ClaseRepetidaExcepcion{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    controladorUsuarioPublish.altaClase(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12);
  }
  
  public void agregarDtSocio(publicadores.DtSocio arg0) throws java.rmi.RemoteException, publicadores.UsuarioEnUsoExcepcion{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    controladorUsuarioPublish.agregarDtSocio(arg0);
  }
  
  public java.lang.String[] listarActividades(java.lang.String arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.listarActividades(arg0);
  }
  
  public java.lang.String[] listarInstitucionDeportiva() throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.listarInstitucionDeportiva();
  }
  
  public boolean login(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException, publicadores.LoginExcepcion{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.login(arg0, arg1);
  }
  
  public java.lang.String[] listarClases(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.listarClases(arg0, arg1);
  }
  
  public java.lang.String getActividad(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.getActividad(arg0, arg1);
  }
  
  public publicadores.DtClase selectClase(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.selectClase(arg0, arg1, arg2);
  }
  
  public publicadores.DtActividadDeportiva selectActividadDeportiva(java.lang.String arg0, java.lang.String arg1) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.selectActividadDeportiva(arg0, arg1);
  }
  
  public java.lang.String[] obtenerUsuarioString(publicadores.DtUsuario arg0) throws java.rmi.RemoteException{
    if (controladorUsuarioPublish == null)
      _initControladorUsuarioPublishProxy();
    return controladorUsuarioPublish.obtenerUsuarioString(arg0);
  }
  
  
}