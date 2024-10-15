<%@page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<HTML>
<HEAD>
<TITLE>Result</TITLE>
</HEAD>
<BODY>
<H1>Result</H1>

<jsp:useBean id="sampleControladorUsuarioPublishProxyid" scope="session" class="publicadores.ControladorUsuarioPublishProxy" />
<%
if (request.getParameter("endpoint") != null && request.getParameter("endpoint").length() > 0)
sampleControladorUsuarioPublishProxyid.setEndpoint(request.getParameter("endpoint"));
%>

<%
String method = request.getParameter("method");
int methodID = 0;
if (method == null) methodID = -1;

if(methodID != -1) methodID = Integer.parseInt(method);
boolean gotMethod = false;

try {
switch (methodID){ 
case 2:
        gotMethod = true;
        java.lang.String getEndpoint2mtemp = sampleControladorUsuarioPublishProxyid.getEndpoint();
if(getEndpoint2mtemp == null){
%>
<%=getEndpoint2mtemp %>
<%
}else{
        String tempResultreturnp3 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getEndpoint2mtemp));
        %>
        <%= tempResultreturnp3 %>
        <%
}
break;
case 5:
        gotMethod = true;
        String endpoint_0id=  request.getParameter("endpoint8");
            java.lang.String endpoint_0idTemp = null;
        if(!endpoint_0id.equals("")){
         endpoint_0idTemp  = endpoint_0id;
        }
        sampleControladorUsuarioPublishProxyid.setEndpoint(endpoint_0idTemp);
break;
case 10:
        gotMethod = true;
        publicadores.ControladorUsuarioPublish getControladorUsuarioPublish10mtemp = sampleControladorUsuarioPublishProxyid.getControladorUsuarioPublish();
if(getControladorUsuarioPublish10mtemp == null){
%>
<%=getControladorUsuarioPublish10mtemp %>
<%
}else{
        if(getControladorUsuarioPublish10mtemp!= null){
        String tempreturnp11 = getControladorUsuarioPublish10mtemp.toString();
        %>
        <%=tempreturnp11%>
        <%
        }}
break;
case 13:
        gotMethod = true;
        String descripcion_2id=  request.getParameter("descripcion18");
            java.lang.String descripcion_2idTemp = null;
        if(!descripcion_2id.equals("")){
         descripcion_2idTemp  = descripcion_2id;
        }
        String biografia_3id=  request.getParameter("biografia20");
            java.lang.String biografia_3idTemp = null;
        if(!biografia_3id.equals("")){
         biografia_3idTemp  = biografia_3id;
        }
        String sitioweb_4id=  request.getParameter("sitioweb22");
            java.lang.String sitioweb_4idTemp = null;
        if(!sitioweb_4id.equals("")){
         sitioweb_4idTemp  = sitioweb_4id;
        }
        %>
        <jsp:useBean id="publicadores1DtProfesor_1id" scope="session" class="publicadores.DtProfesor" />
        <%
        publicadores1DtProfesor_1id.setDescripcion(descripcion_2idTemp);
        publicadores1DtProfesor_1id.setBiografia(biografia_3idTemp);
        publicadores1DtProfesor_1id.setSitioweb(sitioweb_4idTemp);
        sampleControladorUsuarioPublishProxyid.agregarDtProfesor(publicadores1DtProfesor_1id);
break;
case 24:
        gotMethod = true;
        String arg0_5id=  request.getParameter("arg027");
            java.lang.String arg0_5idTemp = null;
        if(!arg0_5id.equals("")){
         arg0_5idTemp  = arg0_5id;
        }
        java.lang.String[] devolverClases24mtemp = sampleControladorUsuarioPublishProxyid.devolverClases(arg0_5idTemp);
if(devolverClases24mtemp == null){
%>
<%=devolverClases24mtemp %>
<%
}else{
        String tempreturnp25 = null;
        if(devolverClases24mtemp != null){
        java.util.List listreturnp25= java.util.Arrays.asList(devolverClases24mtemp);
        tempreturnp25 = listreturnp25.toString();
        }
        %>
        <%=tempreturnp25%>
        <%
}
break;
case 29:
        gotMethod = true;
        java.lang.String[] listarUsuario29mtemp = sampleControladorUsuarioPublishProxyid.listarUsuario();
if(listarUsuario29mtemp == null){
%>
<%=listarUsuario29mtemp %>
<%
}else{
        String tempreturnp30 = null;
        if(listarUsuario29mtemp != null){
        java.util.List listreturnp30= java.util.Arrays.asList(listarUsuario29mtemp);
        tempreturnp30 = listreturnp30.toString();
        }
        %>
        <%=tempreturnp30%>
        <%
}
break;
case 32:
        gotMethod = true;
        String arg0_6id=  request.getParameter("arg053");
            java.lang.String arg0_6idTemp = null;
        if(!arg0_6id.equals("")){
         arg0_6idTemp  = arg0_6id;
        }
        publicadores.DtUsuario obtenerUsuario32mtemp = sampleControladorUsuarioPublishProxyid.obtenerUsuario(arg0_6idTemp);
if(obtenerUsuario32mtemp == null){
%>
<%=obtenerUsuario32mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">fechaNac:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">mes:</TD>
<TD>
<%
if(obtenerUsuario32mtemp != null){
publicadores.DtFecha tebece0=obtenerUsuario32mtemp.getFechaNac();
if(tebece0 != null){
%>
<%=tebece0.getMes()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">anio:</TD>
<TD>
<%
if(obtenerUsuario32mtemp != null){
publicadores.DtFecha tebece0=obtenerUsuario32mtemp.getFechaNac();
if(tebece0 != null){
%>
<%=tebece0.getAnio()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">dia:</TD>
<TD>
<%
if(obtenerUsuario32mtemp != null){
publicadores.DtFecha tebece0=obtenerUsuario32mtemp.getFechaNac();
if(tebece0 != null){
%>
<%=tebece0.getDia()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">nickname:</TD>
<TD>
<%
if(obtenerUsuario32mtemp != null){
java.lang.String typenickname43 = obtenerUsuario32mtemp.getNickname();
        String tempResultnickname43 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typenickname43));
        %>
        <%= tempResultnickname43 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">email:</TD>
<TD>
<%
if(obtenerUsuario32mtemp != null){
java.lang.String typeemail45 = obtenerUsuario32mtemp.getEmail();
        String tempResultemail45 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeemail45));
        %>
        <%= tempResultemail45 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">pass:</TD>
<TD>
<%
if(obtenerUsuario32mtemp != null){
java.lang.String typepass47 = obtenerUsuario32mtemp.getPass();
        String tempResultpass47 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepass47));
        %>
        <%= tempResultpass47 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">apellido:</TD>
<TD>
<%
if(obtenerUsuario32mtemp != null){
java.lang.String typeapellido49 = obtenerUsuario32mtemp.getApellido();
        String tempResultapellido49 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeapellido49));
        %>
        <%= tempResultapellido49 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">nombre:</TD>
<TD>
<%
if(obtenerUsuario32mtemp != null){
java.lang.String typenombre51 = obtenerUsuario32mtemp.getNombre();
        String tempResultnombre51 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typenombre51));
        %>
        <%= tempResultnombre51 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 55:
        gotMethod = true;
        String arg0_7id=  request.getParameter("arg058");
            java.lang.String arg0_7idTemp = null;
        if(!arg0_7id.equals("")){
         arg0_7idTemp  = arg0_7id;
        }
        String arg1_8id=  request.getParameter("arg160");
            java.lang.String arg1_8idTemp = null;
        if(!arg1_8id.equals("")){
         arg1_8idTemp  = arg1_8id;
        }
        String arg2_9id=  request.getParameter("arg262");
            java.lang.String arg2_9idTemp = null;
        if(!arg2_9id.equals("")){
         arg2_9idTemp  = arg2_9id;
        }
        String arg3_10id=  request.getParameter("arg364");
            java.lang.String arg3_10idTemp = null;
        if(!arg3_10id.equals("")){
         arg3_10idTemp  = arg3_10id;
        }
        String arg4_11id=  request.getParameter("arg466");
            java.lang.String arg4_11idTemp = null;
        if(!arg4_11id.equals("")){
         arg4_11idTemp  = arg4_11id;
        }
        String arg5_12id=  request.getParameter("arg568");
            java.lang.String arg5_12idTemp = null;
        if(!arg5_12id.equals("")){
         arg5_12idTemp  = arg5_12id;
        }
        String arg6_13id=  request.getParameter("arg670");
            java.lang.String arg6_13idTemp = null;
        if(!arg6_13id.equals("")){
         arg6_13idTemp  = arg6_13id;
        }
        sampleControladorUsuarioPublishProxyid.selecDatos(arg0_7idTemp,arg1_8idTemp,arg2_9idTemp,arg3_10idTemp,arg4_11idTemp,arg5_12idTemp,arg6_13idTemp);
break;
case 72:
        gotMethod = true;
        String arg0_14id=  request.getParameter("arg075");
            java.lang.String arg0_14idTemp = null;
        if(!arg0_14id.equals("")){
         arg0_14idTemp  = arg0_14id;
        }
        String arg1_15id=  request.getParameter("arg177");
            java.lang.String arg1_15idTemp = null;
        if(!arg1_15id.equals("")){
         arg1_15idTemp  = arg1_15id;
        }
        String arg2_16id=  request.getParameter("arg279");
            java.lang.String arg2_16idTemp = null;
        if(!arg2_16id.equals("")){
         arg2_16idTemp  = arg2_16id;
        }
        String arg3_17id=  request.getParameter("arg381");
            java.lang.String arg3_17idTemp = null;
        if(!arg3_17id.equals("")){
         arg3_17idTemp  = arg3_17id;
        }
        String arg4_18id=  request.getParameter("arg483");
            java.lang.String arg4_18idTemp = null;
        if(!arg4_18id.equals("")){
         arg4_18idTemp  = arg4_18id;
        }
        String arg5_19id=  request.getParameter("arg585");
            java.lang.String arg5_19idTemp = null;
        if(!arg5_19id.equals("")){
         arg5_19idTemp  = arg5_19id;
        }
        String arg6_20id=  request.getParameter("arg687");
            java.lang.String arg6_20idTemp = null;
        if(!arg6_20id.equals("")){
         arg6_20idTemp  = arg6_20id;
        }
        String arg7_21id=  request.getParameter("arg789");
            java.lang.String arg7_21idTemp = null;
        if(!arg7_21id.equals("")){
         arg7_21idTemp  = arg7_21id;
        }
        String arg8_22id=  request.getParameter("arg891");
            java.lang.String arg8_22idTemp = null;
        if(!arg8_22id.equals("")){
         arg8_22idTemp  = arg8_22id;
        }
        String arg9_23id=  request.getParameter("arg993");
            java.lang.String arg9_23idTemp = null;
        if(!arg9_23id.equals("")){
         arg9_23idTemp  = arg9_23id;
        }
        String arg10_24id=  request.getParameter("arg1095");
            java.lang.String arg10_24idTemp = null;
        if(!arg10_24id.equals("")){
         arg10_24idTemp  = arg10_24id;
        }
        String arg11_25id=  request.getParameter("arg1197");
            java.lang.String arg11_25idTemp = null;
        if(!arg11_25id.equals("")){
         arg11_25idTemp  = arg11_25id;
        }
        String arg12_26id=  request.getParameter("arg1299");
            java.lang.String arg12_26idTemp = null;
        if(!arg12_26id.equals("")){
         arg12_26idTemp  = arg12_26id;
        }
        sampleControladorUsuarioPublishProxyid.altaClase(arg0_14idTemp,arg1_15idTemp,arg2_16idTemp,arg3_17idTemp,arg4_18idTemp,arg5_19idTemp,arg6_20idTemp,arg7_21idTemp,arg8_22idTemp,arg9_23idTemp,arg10_24idTemp,arg11_25idTemp,arg12_26idTemp);
break;
case 101:
        gotMethod = true;
        %>
        <jsp:useBean id="publicadores1DtSocio_27id" scope="session" class="publicadores.DtSocio" />
        <%
        sampleControladorUsuarioPublishProxyid.agregarDtSocio(publicadores1DtSocio_27id);
break;
case 106:
        gotMethod = true;
        String arg0_28id=  request.getParameter("arg0109");
            java.lang.String arg0_28idTemp = null;
        if(!arg0_28id.equals("")){
         arg0_28idTemp  = arg0_28id;
        }
        java.lang.String[] listarActividades106mtemp = sampleControladorUsuarioPublishProxyid.listarActividades(arg0_28idTemp);
if(listarActividades106mtemp == null){
%>
<%=listarActividades106mtemp %>
<%
}else{
        String tempreturnp107 = null;
        if(listarActividades106mtemp != null){
        java.util.List listreturnp107= java.util.Arrays.asList(listarActividades106mtemp);
        tempreturnp107 = listreturnp107.toString();
        }
        %>
        <%=tempreturnp107%>
        <%
}
break;
case 111:
        gotMethod = true;
        java.lang.String[] listarInstitucionDeportiva111mtemp = sampleControladorUsuarioPublishProxyid.listarInstitucionDeportiva();
if(listarInstitucionDeportiva111mtemp == null){
%>
<%=listarInstitucionDeportiva111mtemp %>
<%
}else{
        String tempreturnp112 = null;
        if(listarInstitucionDeportiva111mtemp != null){
        java.util.List listreturnp112= java.util.Arrays.asList(listarInstitucionDeportiva111mtemp);
        tempreturnp112 = listreturnp112.toString();
        }
        %>
        <%=tempreturnp112%>
        <%
}
break;
case 114:
        gotMethod = true;
        String arg0_29id=  request.getParameter("arg0117");
            java.lang.String arg0_29idTemp = null;
        if(!arg0_29id.equals("")){
         arg0_29idTemp  = arg0_29id;
        }
        String arg1_30id=  request.getParameter("arg1119");
            java.lang.String arg1_30idTemp = null;
        if(!arg1_30id.equals("")){
         arg1_30idTemp  = arg1_30id;
        }
        boolean login114mtemp = sampleControladorUsuarioPublishProxyid.login(arg0_29idTemp,arg1_30idTemp);
        String tempResultreturnp115 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(login114mtemp));
        %>
        <%= tempResultreturnp115 %>
        <%
break;
case 121:
        gotMethod = true;
        String arg0_31id=  request.getParameter("arg0124");
            java.lang.String arg0_31idTemp = null;
        if(!arg0_31id.equals("")){
         arg0_31idTemp  = arg0_31id;
        }
        String arg1_32id=  request.getParameter("arg1126");
            java.lang.String arg1_32idTemp = null;
        if(!arg1_32id.equals("")){
         arg1_32idTemp  = arg1_32id;
        }
        java.lang.String[] listarClases121mtemp = sampleControladorUsuarioPublishProxyid.listarClases(arg0_31idTemp,arg1_32idTemp);
if(listarClases121mtemp == null){
%>
<%=listarClases121mtemp %>
<%
}else{
        String tempreturnp122 = null;
        if(listarClases121mtemp != null){
        java.util.List listreturnp122= java.util.Arrays.asList(listarClases121mtemp);
        tempreturnp122 = listreturnp122.toString();
        }
        %>
        <%=tempreturnp122%>
        <%
}
break;
case 128:
        gotMethod = true;
        String arg0_33id=  request.getParameter("arg0131");
            java.lang.String arg0_33idTemp = null;
        if(!arg0_33id.equals("")){
         arg0_33idTemp  = arg0_33id;
        }
        String arg1_34id=  request.getParameter("arg1133");
            java.lang.String arg1_34idTemp = null;
        if(!arg1_34id.equals("")){
         arg1_34idTemp  = arg1_34id;
        }
        java.lang.String getActividad128mtemp = sampleControladorUsuarioPublishProxyid.getActividad(arg0_33idTemp,arg1_34idTemp);
if(getActividad128mtemp == null){
%>
<%=getActividad128mtemp %>
<%
}else{
        String tempResultreturnp129 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getActividad128mtemp));
        %>
        <%= tempResultreturnp129 %>
        <%
}
break;
case 135:
        gotMethod = true;
        String arg0_35id=  request.getParameter("arg0164");
            java.lang.String arg0_35idTemp = null;
        if(!arg0_35id.equals("")){
         arg0_35idTemp  = arg0_35id;
        }
        String arg1_36id=  request.getParameter("arg1166");
            java.lang.String arg1_36idTemp = null;
        if(!arg1_36id.equals("")){
         arg1_36idTemp  = arg1_36id;
        }
        String arg2_37id=  request.getParameter("arg2168");
            java.lang.String arg2_37idTemp = null;
        if(!arg2_37id.equals("")){
         arg2_37idTemp  = arg2_37id;
        }
        publicadores.DtClase selectClase135mtemp = sampleControladorUsuarioPublishProxyid.selectClase(arg0_35idTemp,arg1_36idTemp,arg2_37idTemp);
if(selectClase135mtemp == null){
%>
<%=selectClase135mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">fecha:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">mes:</TD>
<TD>
<%
if(selectClase135mtemp != null){
publicadores.DtFecha tebece0=selectClase135mtemp.getFecha();
if(tebece0 != null){
%>
<%=tebece0.getMes()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">anio:</TD>
<TD>
<%
if(selectClase135mtemp != null){
publicadores.DtFecha tebece0=selectClase135mtemp.getFecha();
if(tebece0 != null){
%>
<%=tebece0.getAnio()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">dia:</TD>
<TD>
<%
if(selectClase135mtemp != null){
publicadores.DtFecha tebece0=selectClase135mtemp.getFecha();
if(tebece0 != null){
%>
<%=tebece0.getDia()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">url:</TD>
<TD>
<%
if(selectClase135mtemp != null){
java.lang.String typeurl146 = selectClase135mtemp.getUrl();
        String tempResulturl146 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeurl146));
        %>
        <%= tempResulturl146 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">horaInicio:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">hora:</TD>
<TD>
<%
if(selectClase135mtemp != null){
publicadores.DtHora tebece0=selectClase135mtemp.getHoraInicio();
if(tebece0 != null){
%>
<%=tebece0.getHora()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">minutos:</TD>
<TD>
<%
if(selectClase135mtemp != null){
publicadores.DtHora tebece0=selectClase135mtemp.getHoraInicio();
if(tebece0 != null){
%>
<%=tebece0.getMinutos()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">nombre:</TD>
<TD>
<%
if(selectClase135mtemp != null){
java.lang.String typenombre154 = selectClase135mtemp.getNombre();
        String tempResultnombre154 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typenombre154));
        %>
        <%= tempResultnombre154 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">fechaReg:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">mes:</TD>
<TD>
<%
if(selectClase135mtemp != null){
publicadores.DtFecha tebece0=selectClase135mtemp.getFechaReg();
if(tebece0 != null){
%>
<%=tebece0.getMes()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">anio:</TD>
<TD>
<%
if(selectClase135mtemp != null){
publicadores.DtFecha tebece0=selectClase135mtemp.getFechaReg();
if(tebece0 != null){
%>
<%=tebece0.getAnio()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">dia:</TD>
<TD>
<%
if(selectClase135mtemp != null){
publicadores.DtFecha tebece0=selectClase135mtemp.getFechaReg();
if(tebece0 != null){
%>
<%=tebece0.getDia()
%><%}}%>
</TD>
</TABLE>
<%
}
break;
case 170:
        gotMethod = true;
        String arg0_38id=  request.getParameter("arg0189");
            java.lang.String arg0_38idTemp = null;
        if(!arg0_38id.equals("")){
         arg0_38idTemp  = arg0_38id;
        }
        String arg1_39id=  request.getParameter("arg1191");
            java.lang.String arg1_39idTemp = null;
        if(!arg1_39id.equals("")){
         arg1_39idTemp  = arg1_39id;
        }
        publicadores.DtActividadDeportiva selectActividadDeportiva170mtemp = sampleControladorUsuarioPublishProxyid.selectActividadDeportiva(arg0_38idTemp,arg1_39idTemp);
if(selectActividadDeportiva170mtemp == null){
%>
<%=selectActividadDeportiva170mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">descripcion:</TD>
<TD>
<%
if(selectActividadDeportiva170mtemp != null){
java.lang.String typedescripcion173 = selectActividadDeportiva170mtemp.getDescripcion();
        String tempResultdescripcion173 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedescripcion173));
        %>
        <%= tempResultdescripcion173 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">duracion:</TD>
<TD>
<%
if(selectActividadDeportiva170mtemp != null){
%>
<%=selectActividadDeportiva170mtemp.getDuracion()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">costo:</TD>
<TD>
<%
if(selectActividadDeportiva170mtemp != null){
%>
<%=selectActividadDeportiva170mtemp.getCosto()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">nombre:</TD>
<TD>
<%
if(selectActividadDeportiva170mtemp != null){
java.lang.String typenombre179 = selectActividadDeportiva170mtemp.getNombre();
        String tempResultnombre179 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typenombre179));
        %>
        <%= tempResultnombre179 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">fechaReg:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">mes:</TD>
<TD>
<%
if(selectActividadDeportiva170mtemp != null){
publicadores.DtFecha tebece0=selectActividadDeportiva170mtemp.getFechaReg();
if(tebece0 != null){
%>
<%=tebece0.getMes()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">anio:</TD>
<TD>
<%
if(selectActividadDeportiva170mtemp != null){
publicadores.DtFecha tebece0=selectActividadDeportiva170mtemp.getFechaReg();
if(tebece0 != null){
%>
<%=tebece0.getAnio()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">dia:</TD>
<TD>
<%
if(selectActividadDeportiva170mtemp != null){
publicadores.DtFecha tebece0=selectActividadDeportiva170mtemp.getFechaReg();
if(tebece0 != null){
%>
<%=tebece0.getDia()
%><%}}%>
</TD>
</TABLE>
<%
}
break;
case 193:
        gotMethod = true;
        String mes_42id=  request.getParameter("mes200");
        int mes_42idTemp  = Integer.parseInt(mes_42id);
        String anio_43id=  request.getParameter("anio202");
        int anio_43idTemp  = Integer.parseInt(anio_43id);
        String dia_44id=  request.getParameter("dia204");
        int dia_44idTemp  = Integer.parseInt(dia_44id);
        %>
        <jsp:useBean id="publicadores1DtFecha_41id" scope="session" class="publicadores.DtFecha" />
        <%
        publicadores1DtFecha_41id.setMes(mes_42idTemp);
        publicadores1DtFecha_41id.setAnio(anio_43idTemp);
        publicadores1DtFecha_41id.setDia(dia_44idTemp);
        String nickname_45id=  request.getParameter("nickname206");
            java.lang.String nickname_45idTemp = null;
        if(!nickname_45id.equals("")){
         nickname_45idTemp  = nickname_45id;
        }
        String email_46id=  request.getParameter("email208");
            java.lang.String email_46idTemp = null;
        if(!email_46id.equals("")){
         email_46idTemp  = email_46id;
        }
        String pass_47id=  request.getParameter("pass210");
            java.lang.String pass_47idTemp = null;
        if(!pass_47id.equals("")){
         pass_47idTemp  = pass_47id;
        }
        String apellido_48id=  request.getParameter("apellido212");
            java.lang.String apellido_48idTemp = null;
        if(!apellido_48id.equals("")){
         apellido_48idTemp  = apellido_48id;
        }
        String nombre_49id=  request.getParameter("nombre214");
            java.lang.String nombre_49idTemp = null;
        if(!nombre_49id.equals("")){
         nombre_49idTemp  = nombre_49id;
        }
        %>
        <jsp:useBean id="publicadores1DtUsuario_40id" scope="session" class="publicadores.DtUsuario" />
        <%
        publicadores1DtUsuario_40id.setFechaNac(publicadores1DtFecha_41id);
        publicadores1DtUsuario_40id.setNickname(nickname_45idTemp);
        publicadores1DtUsuario_40id.setEmail(email_46idTemp);
        publicadores1DtUsuario_40id.setPass(pass_47idTemp);
        publicadores1DtUsuario_40id.setApellido(apellido_48idTemp);
        publicadores1DtUsuario_40id.setNombre(nombre_49idTemp);
        java.lang.String[] obtenerUsuarioString193mtemp = sampleControladorUsuarioPublishProxyid.obtenerUsuarioString(publicadores1DtUsuario_40id);
if(obtenerUsuarioString193mtemp == null){
%>
<%=obtenerUsuarioString193mtemp %>
<%
}else{
        String tempreturnp194 = null;
        if(obtenerUsuarioString193mtemp != null){
        java.util.List listreturnp194= java.util.Arrays.asList(obtenerUsuarioString193mtemp);
        tempreturnp194 = listreturnp194.toString();
        }
        %>
        <%=tempreturnp194%>
        <%
}
break;
}
} catch (Exception e) { 
%>
Exception: <%= org.eclipse.jst.ws.util.JspUtils.markup(e.toString()) %>
Message: <%= org.eclipse.jst.ws.util.JspUtils.markup(e.getMessage()) %>
<%
return;
}
if(!gotMethod){
%>
result: N/A
<%
}
%>
</BODY>
</HTML>