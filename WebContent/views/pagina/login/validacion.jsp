<%@page import="java.util.ArrayList"%>
<%@page import="configuracion.Procedimiento"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8"> 
<title>Validacion de la Cuenta</title>
</head>
<link href="<%=request.getContextPath() %>/views/css/bootstrap.min.css" rel="stylesheet"> 
<link href="<%=request.getContextPath() %>/views/css/font-awesome.min.css" rel="stylesheet">
<link rel="shortcut icon" href="<%=request.getContextPath() %>/views/images/Logoo_rade-copia.png"/>
<body>

<div>
	<p class="text-center mt-4  h4 font-weight-bold">R.A.D.E.</p>

</div>

<%
String CodigoEnlace = "";
String CodigoRegistro = "";
String Nombre = "";
String Apellido = "";
try{
	String url = String.valueOf(request.getAttribute("javax.servlet.forward.request_uri"));
	Procedimiento pross= new Procedimiento();
	ArrayList<ArrayList<String>> datos = pross.FiltroGeneralString("SELECT enlacesistema.`id_enlacesistema`,registro.`id_registro`,registro.`nombre`,registro.`apellido` FROM enlacesistema INNER JOIN enlace_registro AS e ON e.`id_enlacesistema`=enlacesistema.`id_enlacesistema` INNER JOIN `registro` ON registro.`id_registro`=e.`id_registro` WHERE url='"+url+"'", "4", "validacion");
	for (int i = 0; i < datos.size(); i++) {
		CodigoEnlace = datos.get(i).get(0);
		CodigoRegistro = datos.get(i).get(1);
		Nombre = datos.get(i).get(2);
		Apellido = datos.get(i).get(3);
	}
}catch(Exception e){
	System.out.println("Ocurrio un error");
	RequestDispatcher dispacher = request.getRequestDispatcher("views/pagina/error/error.jsp");
    dispacher.forward(request, response);
}
%>

<div class="container">
	<input type="hidden" id="codigo" value="<%out.println(CodigoRegistro); %>">
		<div class="row  justify-content-center mt-5">
			<div class=" col-sm-4 ">
				<div class="card-header " align="center"><label>Bienvenido: <%out.println(Nombre+" "+Apellido); %></label></div>
				 	<div class="card-body text-dark">
						<p class="text-center">Digite un usuario y contraseña para finalizar el proceso de registro. El mismo será utilizado para acceder a la plataforma</p>
		 			</div>
		 
	<label class="card-subtitle">Nombre de Usuario </label> <span class="text-danger">*</span>
           <div class="input-group mb-3">
            	<div class="input-group-prepend form-control-feedback" >
                    <span class="input-group-text" >@</span>
               </div>
             <input type="text" class="form-control" maxlength="25" name="usuario" placeholder="usuario"  id="usuario" autofocus="">
             <small id="passwordHelpBlock" class="form-text text-muted">
  				Usuario solamente debe contener letras y numeros
			</small>
			<div id="msjUsuario"></div>
			<div id="mensaje" align="center"></div>
           </div> 
    <!-- .................................. -->
     <div class="form-group mt-3 ">
                 	<label class="card-subtitle">Contraseña </label> <span class="text-danger">*</span>
                 	<div class="input-group-prepend">
                         <span class="input-group-text"><i class="fa fa-lock"></i></span>
                         <input  type="password" class="form-control" name="passw" id="pass" maxlength="20" value="" >
                    </div>
                    <div id="msjPass"></div>
                    	
                      <small id="passwordHelpBlock" class="form-text text-muted">
  						Su contraseña debe tener entre 8 y 20 caracteres
					</small>
						  
      </div>
     <!-- .................................. -->
	   
		  
	<div>
        <button class="btn btn-primary btn-block mt-3 " name="btnEnviar"  id="validarRegistro">Registrarse</button>
    </div>
		 
	<div class="text-center mt-3 ">
     	<a href="login">Página de Inicio</a>
	</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/validarRegistro.js"></script>
</html>