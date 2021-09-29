<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/Bootstrap/css/bootstrap.min.css" rel="stylesheet"> 
<link rel="shortcut icon" href="<%=request.getContextPath() %>/views/images/Logoo_rade-copia.png"/>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-4 mb-3">
		<div class="card-header " align="center"><b>¡Usuario Registrado con Éxito!</b></div>
		<div class="card-body text-dark">
			<p class="text-center">Usted se ha registrado correctamente a la Plataforma R.A.D.E</p>
		 </div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/popper.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/registro.js"></script>
</html>