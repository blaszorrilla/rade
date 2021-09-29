
<%@page  import="java.io.*"%> 
<%@page  import="java.util.HashMap"%>
<%@page  import="java.util.Map"%>

<%@page  import="net.sf.jasperreports.engine.*"%> 
<%@page import="net.sf.jasperreports.view.JasperViewer" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- <!DOCTYPE HTML> -->
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="shortcut icon" type="image/ico" href="../../../Ejemplo/Imagen/Minicar.ico">
		<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
        <title>Informe Curriculum</title>
    </head>
    <body>
        <h2>Reporte </h2>
        <%
     		String cedula = request.getParameter("cedula"); // request.getParameter("codigo");
     		String nombre = request.getParameter("nombre"); // request.getParameter("codigo");
     		String apellido = request.getParameter("apellido");
     		String direccion = request.getParameter("direccion");
     		String telefono = request.getParameter("telefono");
     		String email = request.getParameter("email");
     		String estado = request.getParameter("estado");
     		String profesion = request.getParameter("profesion");
     		String nacionalidad = request.getParameter("nacionalidad");
     		
     		String anho1 = request.getParameter("anho1");
     		String escuela1 = request.getParameter("escuela1");
     		String curso1 = request.getParameter("curso1");
     		
     		String anho2 = request.getParameter("anho2");
     		String escuela2 = request.getParameter("escuela2");
     		String curso2 = request.getParameter("curso2");
     		
     		String anho3 = request.getParameter("anho3");
     		String escuela3 = request.getParameter("escuela3");
     		String curso3 = request.getParameter("curso3");
     		
     		String anho4 = request.getParameter("anho4");
     		String escuela4 = request.getParameter("escuela4");
     		String curso4 = request.getParameter("curso4");
     		
     		String nomlab1 = request.getParameter("nomlab1");
     		String tellab1 = request.getParameter("tellab1");
     		
     		String nomlab2 = request.getParameter("nomlab2");
     		String tellab2 = request.getParameter("tellab2");
     		
     		String nomlab3 = request.getParameter("nomlab3");
     		String tellab3 = request.getParameter("tellab3");
     		
     		String nomper1 = request.getParameter("nomper1");
     		String teloer1 = request.getParameter("telper1");
     		
     		String nomper2 = request.getParameter("nomper2");
     		String telper2 = request.getParameter("telper2");
     		
     		String nomper3 = request.getParameter("nomper3");
     		String telper3 = request.getParameter("telper3");
     		
     		
     		 		
     		File reportFile = new File(application.getRealPath("Ejercicios/CurriculumBootstrap/informe/Curriculum.jasper"));//your report_name.jasper file
            Map parameters = new HashMap();
            parameters.clear();
            parameters.put("cedula",cedula);
        	parameters.put("nombre",nombre);
        	parameters.put("apellido",apellido);
        	parameters.put("direccion",direccion);
        	parameters.put("telefono",telefono);
        	parameters.put("email",email);
        	parameters.put("estado",estado);
        	parameters.put("profesion",profesion);
        	parameters.put("nacionalidad",nacionalidad);
        	
        	parameters.put("anho1",anho1);
        	parameters.put("escuela1",escuela1);
        	parameters.put("curso1",curso1);
        	
        	parameters.put("anho2",anho2);
        	parameters.put("escuela2",escuela2);
        	parameters.put("curso2",curso2);
        	
        	parameters.put("anho3",anho3);
        	parameters.put("escuela3",escuela3);
        	parameters.put("curso3",curso3);
        	
        	parameters.put("anho4",anho4);
        	parameters.put("escuela4",escuela4);
        	parameters.put("curso4",curso4);
        	
        	parameters.put("nomlab1",nomlab1);
        	parameters.put("tellab1",tellab1);
        	
        	parameters.put("nomlab2",nomlab2);
        	parameters.put("tellab2",tellab2);
        	
        	parameters.put("nomlab3",nomlab3);
        	parameters.put("tellab3",tellab3);
        	
        	parameters.put("nomper1",nomlab1);
        	parameters.put("telper1",tellab1);
        	
        	parameters.put("nomper2",nomper2);
        	parameters.put("telper2",telper2);
        	
        	parameters.put("nomper3",nomper3);
        	parameters.put("telper3",telper3);
        	 
            //this.getClass().getResourceAsStream(img)
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),parameters, new JREmptyDataSource());
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outStream = response.getOutputStream(); 
            outStream.write(bytes, 0, bytes.length);
            outStream.flush();
            outStream.close();

    %>
    </body>
</html>