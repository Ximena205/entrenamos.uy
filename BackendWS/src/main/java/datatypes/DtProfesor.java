package datatypes;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;

import logica.InstitucionDeportiva;

@XmlAccessorType(XmlAccessType.FIELD)
public class DtProfesor extends DtUsuario{
	   private String descripcion;
	   private String biografia;
	   private String sitioweb;
	  
	   private List<DtActividadDeportiva> actividades;
	   private List<DtClase> clases;
	
	
	public DtProfesor (String nickname, String pass, String nombre, String apellido, String email,
            DtFecha fechaNac, String descripcion, String biografia, String sitioweb) {
		super(nickname, pass, nombre, apellido, email,fechaNac);
		this.descripcion = descripcion;
		this.biografia = biografia;
		this.sitioweb = sitioweb;
		
		this.actividades = actividades;
		this.clases = clases;
}


public String getDescripcion()
{
return descripcion;
}

public String getBiogrfia()
{
return biografia;
}

public String getSitioweb()
{
return sitioweb;
}




@Override
public String toString() {
	return super.toString() + "[Descripcion:" + descripcion + ", Biografia:" + biografia + ", Sitioweb:" + sitioweb + "]";
}

		

}
