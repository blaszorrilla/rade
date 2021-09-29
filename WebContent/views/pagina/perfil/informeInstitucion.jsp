<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="net.sf.jasperreports.engine.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="configuracion.Conexion" %> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="shortcut icon" type="image/ico" href="../../../Ejemplo/Imagen/Minicar.ico">
		<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
        <title>Informe Institucion</title>
    </head>
    <body>
        <h2>Informe </h2>
<% /*Parametros para realizar la conexión*/ 
Conexion llamars=null;
Connection cons=null;
llamars= new Conexion();
cons = llamars.getDataSource().getConnection();

File reportFile = new File(application.getRealPath("views/pagina/perfil/institucion.jasper")); 
/* No enviamos parámetros porque nuestro reporte no los necesita asi que escriba 
cualquier cadena de texto ya que solo seguiremos el formato del método runReportToPdf*/ 
Map parameters = new HashMap();
parameters.clear();
parameters.put("Nombre_parametro", "Valor_Parametro"); 
/*Enviamos la ruta del reporte, los parámetros y la conexión(objeto Connection)*/ 
byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (), parameters, cons); 
/*Indicamos que la respuesta va a ser en formato PDF*/ response.setContentType("application/pdf");
response.setContentLength(bytes.length); ServletOutputStream ouputStream = response.getOutputStream(); 
ouputStream.write(bytes, 0, bytes.length); /*Limpiamos y cerramos flujos de salida*/ ouputStream.flush(); 
ouputStream.close();
%>
   </body>
</html>
