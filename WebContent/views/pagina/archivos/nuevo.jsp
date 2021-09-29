<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<title>R.A.D.E.</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="shortcut icon" href="<%=request.getContextPath() %>/views/images/logo.png"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/views/css/animate.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/views/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/views/css/jquery.range.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/views/css/line-awesome.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/views/css/sb-admin.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/views/css/line-awesome-font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/views/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/views/lib/slick/slick.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/views/lib/slick/slick-theme.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/views/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/views/css/responsive.css">
<link href="<%=request.getContextPath() %>/views/css/index.css" rel="stylesheet">
</head>
<body class="fixed-nav sticky-footer bg-light" id="page-top">
<div class="wrapper">
		<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light" id="mainNav">
			<div class="logo">
				<a href="index.java" title=""><img src="<%=request.getContextPath() %>/views/images/logo.png" alt=""></a>
			</div>
		    <a class="navbar-brand" href="">R.A.D.E.</a>
		    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
    		<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
					<li>
						<div class="filter-heading">
							<h3>Filtros</h3>
							<a href="#" title="">limpiar</a>
						</div>
					</li>
					<li>
						<div class="paddy">
							<div class="filter-ttl">
								<h3>Tipo de Documento</h3>
							</div>
							</div>
    	  			</li>
								<li>
									<input type="radio" name="radio" id="c1">
									<label for="c1">
										<span></span>
									</label>
									<small Style="color: white;">Curriculum</small>
								</li>
								<li>
									<input type="radio" name="radio" id="c2" >
									<label for="c2">
										<span></span>
									</label>
									<small Style="color: white;">Memorandun</small>
								</li>
								<li>
									<input type="radio" name="radio" id="c3">
									<label for="c3">
										<span></span>
									</label>
									<small Style="color: white;">Contrato de Producto</small>
								</li>
								<li>
									<input type="radio" name="radio" id="c4">
									<label for="c4">
										<span></span>
									</label>
									<small Style="color: white;">Contrato de Servicio</small>
								</li>
								<li>
									<input type="radio" name="radio" id="c11">
									<label for="c11">
										<span></span>
									</label>
									<small Style="color: white;">Carta de presentacion</small>
								</li>					
						
      			</ul>
      			<ul class="navbar-nav ml-auto">
      
     		 <li class="nav-item dropdown">
							 	<a class="nav-link dropdown-toggle mr-lg-2" href="/rade/publicaciones" title="">
									<i class="fa fa-fw fa-home"></i>
									<span class="d-lg-none">Inicio</span>
								</a>  
							</li>
      
      						<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle mr-lg-2" href="" title="">
									<i class="fa fa-fw fa-puzzle-piece"></i>
									<span class="d-lg-none">Proyectos</span>
								</a>
								<ul>
									<li><a href="/rade/posteonuevo"  title=""><span class="fa fa-fw fa-edit"></span> Nuevo Post</a></li>
									<li><a href="/rade/misposteos"  title=""><span class="fa fa-fw fa-calendar"></span> Nuevo Evento</a></li>
									<li><a href="/rade/archivos"  title=""><span class="fa fa-fw fa-file"></span> Archivos</a></li>
								</ul>
							</li>
							
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle mr-lg-2" href="" title="">
									<i class="fa fa-fw fa-user"></i>
									<span class="d-lg-none">Perfil</span>
								</a>
								<ul>
									<li><a href="user-profile.html" title=""><span class="fa fa-fw fa-user"></span> Perfil del usuario</a></li>
								</ul>
							</li>
  
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-envelope"></i>
            <span class="d-lg-none">Mensajes
              <span class="badge badge-pill badge-primary">12 Nuevos</span>
            </span>
            <span class="indicator text-primary d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="messagesDropdown">
            <h6 class="dropdown-header">New Messages:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>David Miller</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>Jane Smith</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I was wondering if you could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>John Doe</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I've sent the final files over to you for review. When you're able to sign off of them let me know and we can discuss distribution.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all messages</a>
          </div>
        </li>
        
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-bell"></i>
            <span class="d-lg-none">Alerts
              <span class="badge badge-pill badge-warning">6 New</span>
            </span>
            <span class="indicator text-warning d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="alertsDropdown">
            <h6 class="dropdown-header">New Alerts:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-danger">
                <strong>
                  <i class="fa fa-long-arrow-down fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all alerts</a>
          </div>
        </li>
        
       <!--  
        <li class="nav-item">
          <form class="form-inline my-2 my-lg-0 mr-lg-2">
            <div class="input-group">
              <input class="form-control" type="text" placeholder="Buscar...">
              <span class="input-group-append">
                <button class="btn btn-success" type="button">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </form>
        </li> -->
        
        
      <!--   <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Desconectar</a>
        </li> --> 
        
      </ul>
    		</div>
		</nav>
		
			<div class="main-section">
				<div class="content-wrapper">
				<div class="container-fluid">
					<div class="main-section-data">
						<div class="row">
							<div class="col-lg-12">
								<div class="main-ws-sec">
									<div class="posts-section" id="contenedor1" onsubmit="returm validar_arch();">
										<div class="post-bar">
											<div class="post_topbar">
												<h1 class="display-4" >Informacion personal</h1>
											</div>
											<div class="epi-sec">
												<div class="alert alert-success" >
													<font style="vertical-align: inherit;">
														<font style="vertical-align: inherit;">Rellena los campos con tus datos personales, son obligatorios.</font>
													</font>
												</div>
											</div>
											<div class="epi-sec">
												<div class="alert-block alert-success mensajeRegistro" align="center"></div>
											</div>
											
											<div class="job_descp">
												<div class="form-group">
												    <label class="h4 col-sm-3 no-padding-right">Nombre</label>
												    <div class="col-sm-9">
												    	<div class="clearfix">
												            <input class="form-control" id="id_cu_nombre" style="width:50%;" type="text" autofocus="" placeholder="Nombre"/>
												        </div>
												    </div>
												</div>
												
												<div class="space-2"></div>
												
												<div class="form-group">
												    <label class="h4 col-sm-3 no-padding-right" for="form-field-apellidos">Apellido</label>
												    <div class="col-sm-9">
												    	<div class="clearfix">
												    		<input class="form-control" id="id_cu_apellido" style="width:50%;" type="text" placeholder="Apellido"/>
												    	</div>
												    </div>
												</div>
												
												<div class="space-2"></div>
												
												<div class="form-group">
												    <label class="h4 col-sm-3 no-padding-right" for="form-field-apellidos">Numero de Cedula</label>
												    <div class="col-sm-9">
												    	<div class="clearfix">
												    		<input class="form-control" id="id_cu_cedula" style="width:50%;" type="text" placeholder="Numero de cedula"/>
												    	</div>
												    </div>
												</div>
												
												<div class="space-2"></div>
												
												<div class="form-group">
													<label class="h4 col-sm-3 no-padding-right" for="form-field-mask">Fecha de Nacimiento</label>
													<div class="col-sm-9">
														<div class="clearfix">
												        	<input class="form-control" style="width: 50%" type="date" id="id_cu_fecha">
												        </div>
												    </div>
												</div>
												
												<div class="space-2"></div>
												
												<div class="form-group">
												    <label class="h4 col-sm-6 no-padding-right" for="telefono">Numero de telefono</label>
												    <div class="col-sm-9">
												    	<div class="clearfix">
												        	<input class="form-control" style="width:50%;" type="text" id="id_cu_telefono" placeholder="Numero de telefono" value="" />
												        </div>
												    </div>
												</div>
											
												<div class="space-2"></div>
												
												<div class="form-group">
												    <label class="h4 col-sm-3 no-padding-right" for="direccion">Direcci&oacute;n</label>
												    <div class="col-sm-9">
												    	<div class="clearfix">
												    		<input class="form-control" style="width:50%;" type="text" placeholder="Direccion" id="id_cu_direccion"/>
												        </div></br>
												       Si deja este campo en blanco, su ubicaci&oacute;n no se mostrar&aacute; en su CV. (Tenga en cuenta que en el &uacute;ltimo paso puede optar por evitar que su &iacute;ndice sea indexado por los motores de b&uacute;squeda, por lo que no se mostrar&aacute; en las b&uacute;squedas)
												    </div>
												</div>
												<div class="space-2"></div>
												
												<div class="row">
													<div class="col-lg-6"></div>
													<div class="col-lg-2"></div>
													<div class="col-lg-4">
														
														<button class="btn-primary btn-lg btn-success" aling="right" id="abrirContenedor2">
															<font style="vertical-align: inherit;">Siguiente <i class="fa fa-angle-double-right"></i></font>
														</button>
													</div>
												</div>												
											</div>
										</div><!--post-bar end-->
									</div><!--posts-section end-->
						
									<div class="posts-section" id="contenedor2">
										<div class="post-bar">
											<div class="post_topbar">
												<h1 class="display-4" >Informaci&oacute;n Acad&eacute;mica</h1>
											</div>
											<div class="epi-sec">
												<div class="alert alert-success" >
													<font style="vertical-align: inherit;">
														<font style="vertical-align: inherit;">Rellenar este campo es obligatorio</font>
													</font>
												</div>
											</div>
												<div class="job_descp">
												<div id="tabla_estudio">
													<div class="jumbotron" >
														<div class="widget-header">
															<div class="widget-main">
																<div>
																	<h4>Rellena el campo con el a&ntilde;o de ingreso, a&ntilde;o de finalizaci&oacute;n, Instituto y el titulo recibido</h4></br>
																</div>
																<div>
																	<textarea class="form-control" rows="5" cols="85" id="id_cu_academico" placeholder="1. 2000-2008, Colegio San Roque Benitez, Educacion Escolar basica
2. 2009-2011, Colegio Federico Gonz&aacuote;lez, Educion Media y Tecnica (Bachillerato)
3. 2012-Actualmente, Universidad Tecnologica Intercontinental (UTIC), Lic. en analisis de sistema " ></textarea>
																</div>
															</div>
														</div>
													</div>
														
														<!-- aqui termina el jumbo -->
												</div>
													<!-- boton atras - siguiente -->
													<div class="row">
														<div class="col-lg-6"></div>
														<div class="col-lg-2"></div>
														<div class="col-lg-4">
															<button class="btn-primary btn-lg btn-danger" aling="right" id="cerrarContenedor2">
																<font style="vertical-align: inherit;"><i class="fa fa-angle-double-left"></i> Atras </font>
															</button>
															<button class="btn-primary btn-lg btn-success" aling="right" id="abrirContenedor3">
																<font style="vertical-align: inherit;"> Siguiente <i class="fa fa-angle-double-right"></i></font>
															</button>

														</div>
													</div>
													<!-- fin botones -->
													
													</div>
												</div>
									
									</div>
									<!-- inicio de informacion laboral -->			
									<div class="posts-section" id="contenedor3">
										<div class="post-bar">
											<div class="post_topbar">
												<h1 class="display-4" >Experiencia Laboral</h1>
											</div>
											<div class="epi-sec">
												<div class="alert alert-success" >
													<font style="vertical-align: inherit;">
														<font style="vertical-align: inherit;">Agregue una experiencia para cada trabajo que ha tenido y desea que se muestre en su curriculum.</font>
													</font>
												</div>
											</div>
												<div class="job_descp">
												<div id="tabla_experiencia">
													<div class="jumbotron" >
														<div class="widget-header">
															<div class="widget-main">
																<div>
																	<h4>Rellena el campo con el nombre del empleador, puesto en el trabajo y el la antiguedad</h4></br>
																</div>
																<div>
																	<textarea class="form-control" rows="5" cols="85" id="id_cu_laboral" placeholder="1. Eduardo Perez, Encargado de Marketing, 1 año 8 meses
2. Josue Vera, Cocinero personal, 2 semanas
3. Mark Zuckerberg, Programador web, 3 meses " ></textarea>
																</div>
															</div>
														</div>
														</div>
														
														<!-- aqui termina el jumbo -->
														</div>
														 
													<!-- boton atras - siguiente -->
													<div class="row">
														<div class="col-lg-6"></div>
														<div class="col-lg-2"></div>
														<div class="col-lg-4">
															<button class="btn-primary btn-lg btn-danger" aling="right" id="cerrarContenedor3">
																<font style="vertical-align: inherit;"><i class="fa fa-angle-double-left"></i> Atras </font>
															</button>
															<button class="btn-primary btn-lg btn-success" aling="right" id="abrirContenedor4">
																<font style="vertical-align: inherit;"> Siguiente <i class="fa fa-angle-double-right"></i></font>
															</button>

														</div>
													</div>
													<!-- fin botones -->
													
													</div>
												</div>
									
									</div>
									
									<!-- inicio de informacion laboral -->			
									<div class="posts-section" id="contenedor4">
										<div class="post-bar">
											<div class="post_topbar">
												<h1 class="display-4" >Idiomas</h1>
											</div>
											<div class="epi-sec">
												<div class="alert alert-success" >
													<font style="vertical-align: inherit;">
														<font style="vertical-align: inherit;">Agregue uno o varios idiomas que comprenda y desea que se muestre en su curriculum.</font>
													</font>
												</div>
											</div>
												<div class="job_descp">
												<div id="tabla_idioma">
													<div class="jumbotron" >
														<div class="widget-header">
															<div class="widget-main">
																<div>
																	<textarea class="form-control" rows="5" cols="85" id="id_cu_idioma" placeholder="1. Ingles, Basico
2. Guarani, Avanzado
3. Español, Intermedio " ></textarea>
																</div>
															</div>
														</div>
													</div>
														
														<!-- aqui termina el jumbo -->
												</div>
												
													<!-- boton atras - siguiente -->
													<div class="row">
														<div class="col-lg-6"></div>
														<div class="col-lg-2"></div>
														<div class="col-lg-4">
															<button class="btn-primary btn-lg btn-danger" aling="right" id="cerrarContenedor4">
																<font style="vertical-align: inherit;"><i class="fa fa-angle-double-left"></i> Atras </font>
															</button>
															<button class="btn-primary btn-lg btn-success" aling="right" id="abrirContenedor5">
																<font style="vertical-align: inherit;"> Siguiente <i class="fa fa-angle-double-right"></i></font>
															</button>

														</div>
													</div>
													<!-- fin botones -->
													
													</div>
												</div>
									
									</div>
									<!-- Imprimir -->
									<div class="posts-section" id="contenedor5">
										<div class="post-bar">
											<div class="post_topbar">
												<h1 class="display-4" >Descargar</h1>
											</div>
											<div class="epi-sec">
												<div class="alert alert-success" >
													<font style="vertical-align: inherit;">
														<font style="vertical-align: inherit;">Casi listo!. Aqui puedes descargar y guardar tu curriculum en tu pc o imprimirlo.</font>
													</font>
												</div>
											</div>
												<div class="job_descp">
												<div id="tabla_idioma">
													<div class="row">
														<div class="col-lg-2"></div>
														<div class="col-lg-6">
															
															 <button class="btn btn-danger btn-lg" id="cargartodo" >
															 	<span class="fa glyphicon-floppy-save" aria-hidden="true"> Previsualizar y Descargar </span>
															 </button> 
														</div>
													</div>
														 
													<!-- boton atras - siguiente -->
													<div class="row">
														<div class="col-lg-6"></div>
														<div class="col-lg-2"></div>
														<div class="col-lg-4">
															<button class="btn-primary btn-lg btn-danger" aling="right" id="cerrarContenedor5">
																<font style="vertical-align: inherit;"><i class="fa fa-angle-double-left"></i> Atras </font>
															</button>

														</div>
													</div>
													<!-- fin botones -->
													
													</div>
												</div>
									
									</div>
									
								</div><!--main-ws-sec end-->
							</div>
						</div>
					</div>
					</div><!-- main-section-data end-->
				</div> 
			</div>


	</div><!--theme-layout end-->
	
	<!-- //////////////////////////////////////////// -->
	<!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Seguro que quieres salir?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Has seleccionado "Desconectar".</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
            <a class="btn btn-primary" href="" id="cerrar">Desconectar</a>
          </div>
        </div>
      </div>
    </div>
	
	<!-- ///////////////////////////////////////////////// -->

<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/popper.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/jquery.range-min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/curriculum.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/archivo.js"></script>
<script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/perfil.js"></script>
<script>
$( document ).ready(function() {
	$("#cargartodo").click(function(){
		var nombre=$("#id_cu_nombre").val();
		var apellido = $("#id_cu_apellido").val();
		var cedula = $("#id_cu_cedula").val();
		var fecha = $("#id_cu_fecha").val();
		var direccion = $("#id_cu_direccion").val();
		var texto = $("#id_cu_academico").val();
		var texto2 = $("#id_cu_laboral").val();
		var texto3 = $("#id_cu_idioma").val();
		
			   $.ajax({
					url : "Informe",
					method: "POST",
					data: { envio:"curriculum", nombre:nombre,apellido:apellido,cedula:cedula,texto:texto,texto2:texto2,texto3:texto3, direccion:direccion, fecha:fecha},
					beforeSend: function(){
						$("#mensaje").html("<img src=\"../views/img/status.gif\"></img>");
					},
					success: function(respuesta){
						window.open("Informe",'First','height=600,width=800,toolbar=no,scrollbars=yes');
						console.log("ejecuta 1///////////");
					},
					error: function(jqXHR, exception){
						$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Verifique  </div>");
					}
				});
	});
});
var keynum, lines = 1;

function limitLines(obj, e) {
  // IE
  if(window.event) {
    keynum = e.keyCode;
  // Netscape/Firefox/Opera
  } else if(e.which) {
    keynum = e.which;
  }

  if(keynum == 13) {
    if(lines == obj.rows) {
      return false;
    }else{
      lines++;
    }
  }
}
</script>


</body>

</html>