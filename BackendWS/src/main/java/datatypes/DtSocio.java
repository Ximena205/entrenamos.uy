package datatypes;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;

@XmlAccessorType(XmlAccessType.FIELD)
public class DtSocio extends DtUsuario {
    private List<DtClase> clases;
    // en el DtSocio guardamos la lista de clases que esta inscripto

    public DtSocio(String nickname, String pass, String nombre, String apellido, String email,DtFecha fechaNac) {
        super(nickname, pass, nombre, apellido, email,  fechaNac);
        this.clases = clases;
    }

    // Getter 
    public List<DtClase> getClase() {
        return clases;
    }


}

