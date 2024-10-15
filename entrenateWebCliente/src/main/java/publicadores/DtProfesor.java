/**
 * DtProfesor.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package publicadores;

public class DtProfesor  extends publicadores.DtUsuario  implements java.io.Serializable {
    private java.lang.String descripcion;

    private java.lang.String biografia;

    private java.lang.String sitioweb;

    private publicadores.DtActividadDeportiva[] actividades;

    private publicadores.DtClase[] clases;

    public DtProfesor() {
    }

    public DtProfesor(
           java.lang.String nickname,
           java.lang.String pass,
           java.lang.String nombre,
           java.lang.String apellido,
           java.lang.String email,
           publicadores.DtFecha fechaNac,
           java.lang.String descripcion,
           java.lang.String biografia,
           java.lang.String sitioweb,
           publicadores.DtActividadDeportiva[] actividades,
           publicadores.DtClase[] clases) {
        super(
            nickname,
            pass,
            nombre,
            apellido,
            email,
            fechaNac);
        this.descripcion = descripcion;
        this.biografia = biografia;
        this.sitioweb = sitioweb;
        this.actividades = actividades;
        this.clases = clases;
    }


    /**
     * Gets the descripcion value for this DtProfesor.
     * 
     * @return descripcion
     */
    public java.lang.String getDescripcion() {
        return descripcion;
    }


    /**
     * Sets the descripcion value for this DtProfesor.
     * 
     * @param descripcion
     */
    public void setDescripcion(java.lang.String descripcion) {
        this.descripcion = descripcion;
    }


    /**
     * Gets the biografia value for this DtProfesor.
     * 
     * @return biografia
     */
    public java.lang.String getBiografia() {
        return biografia;
    }


    /**
     * Sets the biografia value for this DtProfesor.
     * 
     * @param biografia
     */
    public void setBiografia(java.lang.String biografia) {
        this.biografia = biografia;
    }


    /**
     * Gets the sitioweb value for this DtProfesor.
     * 
     * @return sitioweb
     */
    public java.lang.String getSitioweb() {
        return sitioweb;
    }


    /**
     * Sets the sitioweb value for this DtProfesor.
     * 
     * @param sitioweb
     */
    public void setSitioweb(java.lang.String sitioweb) {
        this.sitioweb = sitioweb;
    }


    /**
     * Gets the actividades value for this DtProfesor.
     * 
     * @return actividades
     */
    public publicadores.DtActividadDeportiva[] getActividades() {
        return actividades;
    }


    /**
     * Sets the actividades value for this DtProfesor.
     * 
     * @param actividades
     */
    public void setActividades(publicadores.DtActividadDeportiva[] actividades) {
        this.actividades = actividades;
    }

    public publicadores.DtActividadDeportiva getActividades(int i) {
        return this.actividades[i];
    }

    public void setActividades(int i, publicadores.DtActividadDeportiva _value) {
        this.actividades[i] = _value;
    }


    /**
     * Gets the clases value for this DtProfesor.
     * 
     * @return clases
     */
    public publicadores.DtClase[] getClases() {
        return clases;
    }


    /**
     * Sets the clases value for this DtProfesor.
     * 
     * @param clases
     */
    public void setClases(publicadores.DtClase[] clases) {
        this.clases = clases;
    }

    public publicadores.DtClase getClases(int i) {
        return this.clases[i];
    }

    public void setClases(int i, publicadores.DtClase _value) {
        this.clases[i] = _value;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof DtProfesor)) return false;
        DtProfesor other = (DtProfesor) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = super.equals(obj) && 
            ((this.descripcion==null && other.getDescripcion()==null) || 
             (this.descripcion!=null &&
              this.descripcion.equals(other.getDescripcion()))) &&
            ((this.biografia==null && other.getBiografia()==null) || 
             (this.biografia!=null &&
              this.biografia.equals(other.getBiografia()))) &&
            ((this.sitioweb==null && other.getSitioweb()==null) || 
             (this.sitioweb!=null &&
              this.sitioweb.equals(other.getSitioweb()))) &&
            ((this.actividades==null && other.getActividades()==null) || 
             (this.actividades!=null &&
              java.util.Arrays.equals(this.actividades, other.getActividades()))) &&
            ((this.clases==null && other.getClases()==null) || 
             (this.clases!=null &&
              java.util.Arrays.equals(this.clases, other.getClases())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = super.hashCode();
        if (getDescripcion() != null) {
            _hashCode += getDescripcion().hashCode();
        }
        if (getBiografia() != null) {
            _hashCode += getBiografia().hashCode();
        }
        if (getSitioweb() != null) {
            _hashCode += getSitioweb().hashCode();
        }
        if (getActividades() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getActividades());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getActividades(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getClases() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getClases());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getClases(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(DtProfesor.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://publicadores/", "dtProfesor"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("descripcion");
        elemField.setXmlName(new javax.xml.namespace.QName("", "descripcion"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("biografia");
        elemField.setXmlName(new javax.xml.namespace.QName("", "biografia"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("sitioweb");
        elemField.setXmlName(new javax.xml.namespace.QName("", "sitioweb"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("actividades");
        elemField.setXmlName(new javax.xml.namespace.QName("", "actividades"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://publicadores/", "dtActividadDeportiva"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        elemField.setMaxOccursUnbounded(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("clases");
        elemField.setXmlName(new javax.xml.namespace.QName("", "clases"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://publicadores/", "dtClase"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        elemField.setMaxOccursUnbounded(true);
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
