package logica;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;

import datatypes.DtActividadDeportiva;
import datatypes.DtClase;
import datatypes.DtFecha;
import datatypes.DtHora;

@Entity
public class Clase {
    @Id
    private String nombre;
    @Type(type = "logica.DtFechaUserType")
    private DtFecha fecha;
    @Type(type = "logica.DtHoraUserType")
    private DtHora horaInicio;
    private String url;
    @Type(type = "logica.DtFechaUserType")
    private DtFecha fechaReg;
    @ManyToOne
    private ActividadDeportiva actividadDepo;

    public ActividadDeportiva getActividadDepo() {
		return actividadDepo;
	}

	public void setActividadDepo(ActividadDeportiva actividadDepo) {
		this.actividadDepo = actividadDepo;
	}
	public Clase() {
		super();
	}

	public Clase(String nombre, DtFecha fecha, DtHora horaInicio, String url, DtFecha fechaReg, ActividadDeportiva actividadDepo) {
        this.nombre = nombre;
        this.fecha = fecha;
        this.horaInicio = horaInicio;
        this.url = url;
        this.fechaReg = fechaReg;
	this.actividadDepo = actividadDepo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public DtFecha getFecha() {
        return fecha;
    }

    public void setFecha(DtFecha fecha) {
        this.fecha = fecha;
    }

    public DtHora getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(DtHora horaInicio) {
        this.horaInicio = horaInicio;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public DtFecha getFechaReg() {
        return fechaReg;
    }

    public void setFechaReg(DtFecha fechaReg) {
        this.fechaReg = fechaReg;
    }

    public DtClase obtenerinfo() {
    	return new DtClase(this.nombre, this.fecha, this.horaInicio, this.url, this.fechaReg, this.actividadDepo.getNombre());
    }
    
    public void mostrarInformacion() {
        System.out.println("Nombre: " + nombre);
        System.out.println("Fecha: " + fecha);
        System.out.println("Hora de Inicio: " + horaInicio);
        System.out.println("URL: " + url);
        System.out.println("Fecha de Registro: " + fechaReg);
    }

   /* public static void main(String[] args) {
        DtFecha fecha = new DtFecha(8, 8, 2023);
        DtHora horaInicio = new DtHora(15, 30);
        Clase clase = new Clase("Yoga en lÃ­nea", fecha, horaInicio, "http://www.claseyoga.com", fecha);

        clase.mostrarInformacion();
    }*/

	public DtActividadDeportiva obtenerInfoActividad() {
		// TODO Auto-generated method stub
		return this.actividadDepo.obtenerInfo();
		
	}
	
	public DtClase getDtClase() {
		return new DtClase(this.nombre, this.fecha,  this.horaInicio, this.url, this.fechaReg, this.actividadDepo.getNombre());
    }
	
	public String getActividad() {
	return this.actividadDepo.getNombre(); 
	
	}
	

	
}
