package interfaces;

import java.util.ArrayList;
import java.util.Set;

import datatypes.DtActividadDeportiva;
import datatypes.DtClase;
import datatypes.DtFecha;
import datatypes.DtHora;
import excepciones.InstitucionRepetidaExcepcion;
import excepciones.ActividadDeportivaRepetidaExcepcion;
import excepciones.ClaseRepetidaExcepcion;
import logica.Clase;

public interface ICInstitucion {

    public ArrayList<String> listarInstitucionDeportiva();//publicado
    public String[] listarActividades(String nombre_inst);//publicado
    public DtActividadDeportiva selectActividadDeportiva(String inst, String act);//publicado
    public DtClase selectClase(String inst, String act, String clase);//publicado
    public String[] listarClases(String nombre_inst, String nombre_actividad);//publicado
    
    public boolean altaClase(String nombre_inst, String actividad, String nombre, DtFecha fechaini, DtHora horaini, String profesor, String url, DtFecha fechaAlta) throws ClaseRepetidaExcepcion;
    
    public Set<String> selectInstitucionDeportiva(String institucion);
    //public DtActividadDeportiva selectActividadDeportiva(String actividad); se la definio de nuevo pasandole la inst y activ tambien 
    public boolean altaInstitucionDeportiva(String nombre_institucion, String descripcion, String url)throws InstitucionRepetidaExcepcion;
    //public boolean altaClase(String nombre_inst, String actividad, String nombre, DtFecha fechaini, DtHora horaini, String profesor, String url, DtFecha fechaAlta) throws ClaseRepetidaExcepcion;
    public boolean altaActividadDeportiva(String nombre_institucion, String nombre, String descripcion, int duracion, Float costo, DtFecha fechaAlta)throws ActividadDeportivaRepetidaExcepcion;
    //public DtClase selectClase(String nombre); se la definio de nuevo pasandole la inst y activ tambien
	public Clase obtenerClase(String inst, String act, String clase);
	public String[] listarInstitucion();
	
	
	
	
}