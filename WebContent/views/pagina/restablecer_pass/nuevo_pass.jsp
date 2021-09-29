<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Cambiar Contraseña</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/views/css/bootstrap.min.css">
<link rel="shortcut icon" href="<%=request.getContextPath() %>/views/images/Logoo_rade-copia.png"/>
</head>
<body>
	<div class="container">
		<div class="row  justify-content-center my-5 mb-5">
			<div class=" col-sm-4 ">
				<div class="card-header" align="center">
						<p class="text-center">Digite una nueva contraseña.</p>
		 		</div>
				
				<label class="card-subtitle">Nueva Contraseña</label>	<span class="text-danger">*</span>
				<div class="input-group">
    				<input  type="password" class="form-control"  id="pass" maxlength="20" value="" required autofocus="">
    			</div>
    			<div id="msjPass"></div>
   				
   				 <div class="form-group mt-3 ">
    				<label class="card-subtitle">Repetir Contraseña</label>	<span class="text-danger">*</span>
    				<input  type="password" class="form-control"  id="pass2" maxlength="20" value="" >
    			</div>
    			<div id="msjPass2"></div>
		  
			<div>
        		<button class="btn btn-primary btn-block mt-3 "  id="nuevo_pass">Enviar</button>
        		<a class="btn btn-danger btn-block mt-3 "  href="login">Cancelar</a>
    		</div>
    			<div id="mensaje" align="center"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/nuevopass.js"> </script>
</html>