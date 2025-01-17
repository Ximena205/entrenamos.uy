package logica;
import javax.persistence.InheritanceType;
import java.util.ArrayList;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;

import org.hibernate.annotations.Type;

import datatypes.DtFecha;
import datatypes.DtUsuario;    

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public abstract class Usuario {
	@Id
    private String nickname;
    private String nombre;
    private String apellido;
    private String email;
    private String pass;
    @Type(type = "logica.DtFechaUserType")
    private DtFecha fechaNac;
    public abstract ArrayList<String> obtenerClases();

    public Usuario(String nick, String pass, String nombre, String apellido, String email, DtFecha fechaNac) {
        this.nickname = nick;
        this.pass = pass;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.fechaNac = fechaNac;
    }
    
    public Usuario() {
    	super();
    }

    public abstract DtUsuario getDtUsuario();
    
    public String getNickname() {
        return nickname;
    }
    
    public String getPass() {
    	return pass;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getEmail() {
        return email;
    }

    public DtFecha getFechaNac() {
        return fechaNac;
    }

    public void setNickname(String nick) {
        this.nickname = nick;
    }
    
    public void setPass(String pass) {
    	this.pass = pass;
    }

     public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setFechaNac(DtFecha fechaNac) {
        this.fechaNac = fechaNac;
    }
    
   public abstract DtUsuario obtenerInfo(); 

}
