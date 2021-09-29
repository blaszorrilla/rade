<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath() %>/views/css/bootstrap.min.css" rel="stylesheet"> 
<link rel="shortcut icon" href="<%=request.getContextPath() %>/views/images/Logoo_rade-copia.png"/>
<title>Confirmación</title>
</head>
<body>
<div class="container mt-5">
<div class="card text-center">
  <div class="card-header">Correcto!</div>
  <div class="card-body">
    <h5 class="card-title">Hemos recibido su solicitud de acceso a la plataforma RADE</h5>
    <p class="card-text">El administrador le enviará un mensaje a su correo electrónico con las instrucciones para activar su cuenta.
    Si no logra visualizar el correo en su "Bandeja de entrada"  debe verificar en la bandeja de "Correo no deseado" o "Spam".</p>
  </div>
  <div class="card-footer text-muted">©2018</div>
</div>
</div>
</body>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/bootstrap.min.js"></script>
</html>