package datatypes;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;

@XmlAccessorType(XmlAccessType.FIELD)
public class DtFecha {

    private int dia;
    private int mes;
    private int anio;

    public DtFecha(int d, int m, int a) {
        this.dia = d;
        this.mes = m;
        this.anio = a;
    }

    public int getDia() {
        return dia;
    }

    
    public int getMes() {
        return mes;
    }

    public int getAnio() {
        return anio;
    }
    @Override
	public String toString() {
		return "" + dia + "/" + mes + "/" + anio + "";
	}
}
