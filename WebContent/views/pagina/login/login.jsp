<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Página de Inicio</title>
<!--  <link href="../css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/views/css/bootstrap.min.css">
<link rel="shortcut icon" href="<%=request.getContextPath() %>/views/images/Logoo_rade-copia.png"/>
<link href="<%=request.getContextPath() %>/views/css/font-awesome.min.css" rel="stylesheet"> 
</head>
<body>
<div class="container">
<div class="row justify-content-center mt-3">
<div class=" col-lg-5 mx-auto">
<div class="form-signin" id="loginForm"> 
      <div class="mb-4 ">
        <img class="mb-3" src="<%=request.getContextPath() %>/views/images/Logoo_rade.png" alt="" width="400" height="250"> 
		<h6 class="h4  text-center">Recurso Académico Digital Específico</h6>
      </div>
	 
       <div class="form-label-group mb-3">
       		<div class="input-group-prepend">
                  <span class="input-group-text"><i class="fa fa-user"></i></span>
                  <input  id="usuario" class="form-control" placeholder="Usuario" required="" autofocus="">
            </div>
            <div id="mensajeusuario">
            </div>
            
        <hr>
        <div class="input-group-prepend">
             <span class="input-group-text"><i class="fa fa-lock"></i></span>
                <input type="password" id="pass" class="form-control" placeholder="Contraseña" maxlength="20" required="">       	
         </div>
        <div id="mensajepass">
        </div>
            
      </div>

      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Recordar Contraseña</label>
      </div>
		<div id="mensaje" align="center"></div>
       <button class="btn btn-primary btn-lg btn-block" id="inicio">  Iniciar Sesión</button>
       

        <div class="text-center mt-3 ">
         	<a  href="restablecer"  class="btn btn-link btn-block">¿Has olvidado tu Contraseña?</a>
      </div> 
      
      <div class="text-center mb-2 ">
    	 <a href="registro" class="btn btn-link btn-block">Registrar una nueva cuenta</a>
      </div>
        <p class="mt-3 mb-1  text-center text-info">©2018</p>
</div>
</div>
</div>
</div>
</body>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/popper.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/login.js"></script>
</html>