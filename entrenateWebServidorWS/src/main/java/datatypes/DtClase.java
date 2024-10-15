package datatypes;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;

@XmlAccessorType(XmlAccessType.FIELD)
public class DtClase {
    private String nombre;
    private DtFecha fecha;
    private DtHora horaInicio;
    private String url;
    private DtFecha fechaReg;
    private String act;

    public DtClase(String nombre, DtFecha fecha,DtHora horaInicio,String url,DtFecha fechaReg, String act) {
        this.nombre = nombre;
        this.fecha = fecha;
        this.horaInicio =horaInicio ;
        this.url=url;
        this.fechaReg=fechaReg;
        this.act=act;
    }

    // Métodos getters 
    public String getNombre() {
        return nombre;
    }

    public DtFecha getFecha() {
        return fecha;
    }

    public DtHora getHora() {
    	return horaInicio;
    }
    
    public String getUrl() {
    	return url;
    }
    
    public DtFecha getFechaReg() {
    	return fechaReg;
    }
    
    public String getActividad() {
    	return act;
    }


    @Override
    public String toString() {
        return "Nombre: " + nombre + " \n"+ "Fecha: " + fecha + " \n" + "Hora de inicio: " + horaInicio + " \n" + "URL : "+ url + " \n" + "Fecha de Alta : " + fechaReg;
    }
}