<%@page import="java.util.ArrayList"%>
<%@page import="configuracion.Procedimiento"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>R.A.D.E</title>
<link
	href="<%=request.getContextPath()%>/views/css/bootstrap-datepicker.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/views/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/views/css/font-awesome.min.css"
	rel="stylesheet">

<style type="text/css">
.datepicker {
	font-sizw: 0.875em;
}

.datepicker td, ..datepicker th {
	width: 1.5em;
	height: 1.5em;
}
</style>

<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/views/images/Logoo_rade-copia.png" />
<%
	ArrayList<ArrayList<String>> universidad = null;

	try {
		Procedimiento proceso = new Procedimiento();
		universidad = proceso.FiltroGeneralString(
				"SELECT id_institucion,nombre FROM institucion  WHERE estado='ACTIVO' ORDER BY nombre DESC",
				"2", "REGISTRO USUARIO");
	} catch (Exception e) {

	}
%>
</head>
<body>
	<div class="container">
		<div class="row ">
			<div class="col-lg-12 mt-5">
				<h1 class="page-header text-center">Solicitud de registro a la
					plataforma R.A.D.E</h1>
			</div>

		</div>
		<div class="row justify-content-center mt-4">
			<div class=" col-lg-5 mx-auto">
				<div role="form" id="registro-form">
					<div class="card-header" align="center">
						<b>Información del Usuario</b>
					</div>
					<div class="card card-body text-dark">
						<div class="row justify-content-center">

							<div class="col-lg-10 mx-auto mr-auto">

								<div class="form-group ">
									<label class="card-subtitle">Nombres</label> <span
										class="text-danger">*</span>
									<div class="input-group-prepend input-valor">
										<span class="input-group-text"><i class="fa fa-user"></i></span>
										<input class="form-control" id="nombre" value=""
											maxlength="70" autofocus="" required> <span class=""></span>
									</div>


								</div>
								<div class="form-group">
									<label class="card-subtitle">Apellidos</label> <span
										class="text-danger">*</span>
									<div class="input-group-prepend form-control-feedback">
										<span class="input-group-text"><i class="fa fa-user"></i></span>
										<input class="form-control" id="apellido" maxlength="70"
											value="">
									</div>
								</div>
								<div class="form-group">
									<label class="card-subtitle">Cédula de Identidad</label> <span
										class="text-danger">*</span>
									<div class="input-group-prepend form-control-feedback">
										<span class="input-group-text"><i
											class="fa fa-file-text-o"></i></span> <input class="form-control"
											id="ci" maxlength="8" value="">
									</div>
									<small id="passwordHelpBlock" class="form-text text-muted">Ingrese
										sólo numeros</small>
								</div>
								<div class="form-group">
									<label class="card-subtitle">Ciudad</label> <span
										class="text-danger">*</span>
									<div class="input-group-prepend form-control-feedback">
										<span class="input-group-text"><i
											class="fa fa-file-text-o"></i></span> <input class="form-control"
											id="ciudad" value="">
									</div>
								</div>

								<div class="form-group">
									<label class="card-subtitle">Sexo</label> <span
										class="text-danger">*</span>
									<div class="input-group-prepend form-control-feedback">
										<span class="input-group-text"><i class="fa fa-group"></i></span>
										<select class="form-control" id="genero" required>
											<option value="0" disabled selected>Seleccione una
												opción</option>
											<option value="MASCULINO">MASCULINO</option>
											<option value="FEMENINO">FEMENINO</option>
										</select>
									</div>
								</div>

								<div class="form-group correo">
									<label class="card-subtitle">Correo Electrónico</label> <span
										class="text-danger">*</span>
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="fa fa-envelope  "></i></span> <input type="email"
											class="form-control" id="correo" value="">
									</div>
									<div id="msj" align="center"></div>

								</div>

								<label class="card-subtitle">Fecha de Nacimiento</label> <span
									class="text-danger">*</span>
								<div class="input-group mb-3">
									<div class="input-group-prepend form-control-feedback">
										<span class="input-group-text"><i
											class="fa fa-calendar"></i></span>
									</div>
									<input class="form-control" data-date-format="dd/mm/yyyy"
										id="fecha_nac" placeholder="fecha de nacimiento">
								</div>

								<div>
									<label class="card-subtitle">Universidad</label> <span
										class="text-danger">*</span>
									<div class="input-group-prepend form-control-feedback">
										<span class="input-group-text"><i
											class="fa fa-university"></i></span> <select class="form-control"
											id="universidad" onclick="mensaje();" required>
											<option value="0" disabled selected>Seleccione una
												Universidad</option>
											<%
												try {
													for (int i = 0; i < universidad.size(); i++) {
														out.print("<option value='" + universidad.get(i).get(0) + "'>" + universidad.get(i).get(1)
																+ "</option>");
													}
												} catch (Exception e) {
													System.out.println("Error en filtro universidad" + e);
												}
											%>
										</select>
									</div>
								</div>


								<div>
									<label class="card-subtitle mt-3">Carrera</label> <span
										class="text-danger">*</span>
									<div class="input-group-prepend form-control-feedback">
										<span class="input-group-text"><i
											class="fa fa-graduation-cap"></i></span> <select
											class="form-control" id="carrera" onclick="" required>
											<option disabled selected>Seleccione una Carrera</option>

										</select>
										<div id="mensajecarrera"></div>
									</div>
								</div>

								<span class="help-block text-danger" id="error"></span>
								<div>
									<a href="terminos" target="_blank">Términos y condiciones</a>
								</div>

								<div class="form-check">
									<input type="checkbox" class="form-check-input mt-3"
										id="terminos" required> <label
										class="form-check-label mt-2" for="exampleCheck1">Acepto
										los términos y condiciones de uso</label>

								</div>

								<div id="mensaje" align="center"></div>

								<div>
									<button class="btn btn-primary btn-block mt-3 " id="registro">Enviar
										Solicitud</button>
									<a class="btn btn-danger btn-block mt-3 " href="login">Cancelar</a>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/js/popper.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/js/registro.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/js/jquery.validate.min.js">
	
</script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/views/js/universidad.js">
	
</script>
<script type="text/javascript">
	/////////////////
	$("#fecha_nac").datepicker({
		weekStart : 1,
		daysOfWeekHighlighted : "6,0",
		autoclose : true,
		todayHighlight : true,
	});
	$("#fecha_nac").datepicker("setDate", new Date());
	/////////////////
</script>
</html>