<%@page import="java.util.ArrayList"%>
<%@page import="configuracion.Procedimiento"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="configuracion.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Restablecer Contraseña</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/views/css/bootstrap.min.css">
<link rel="shortcut icon" href="<%=request.getContextPath() %>/views/images/Logoo_rade-copia.png"/>
</head>
<body>
	<div class="container">
		<div class="row  justify-content-center my-5 mb-5">
			<div class=" col-sm-4 ">
				<div class="card-header " align="center"><b>Restablecer Contraseña</b></div>
				 	<div class="card-body text-dark">
						<p class="text-center">¿Ha olvidado su Contraseña?</p>
						<p class="text-center">Ingrese su dirección de correo electrónico asociada a su cuenta RADE y le enviaremos instrucciones sobre cómo restablecer su contraseña.</p>
		 			</div>
		 
			<div class="form-group" id="formCorreo">
    			<input class="form-control" id="correo" type="email" placeholder="nombre@dominio.com" maxlength="70" required autofocus="">
    				<div id="mensaje"></div>
    				
    		</div>
		  
			<div id="contenedorbtn">
        		<button class="btn btn-primary btn-block mt-3 "  id="restablecer">Enviar</button>
        		<a class="btn btn-danger btn-block mt-3 "  href="login">Cancelar</a>
    		</div>
    			<div id="msg"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/ValidarCorreo.js"></script>  
</html>