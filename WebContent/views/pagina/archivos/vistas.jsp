<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="configuracion.Procedimiento"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
HttpSession session2 = request.getSession( true );
session2.setAttribute("url", request.getContextPath());
System.out.println("rul--"+request.getContextPath());
String tipo = "";
String id = "0";
String usuario="";
String nombre="";
String apellido="";
String direccion="";
String fecha="";
String fecha_nac="";
String email="";
String universidad="";
String carrera="";
String ci="";
String pagina="";
String telefono="";
String ubicacion="";
String correo="";
String sexo="";
String id_perfil="";


if(session2.getAttribute("login")!=null){
	String valor=String.valueOf(session2.getAttribute("login"));
	if(valor.equals("si")){
		tipo=String.valueOf(session2.getAttribute("tipo"));
		id=String.valueOf(session2.getAttribute("id"));
		System.out.println("abrio");
		/////////////////////////////////
		
		/////////////////////////////////
	}else{
		response.sendRedirect("../index");
//		RequestDispatcher dispacher = request.getRequestDispatcher("views/publico/publico.jsp");
//    	dispacher.forward(request, response);
	}
}else{
	response.sendRedirect("../index");
//	RequestDispatcher dispacher = request.getRequestDispatcher("views/publico/publico.jsp");
//	dispacher.forward(request, response);
}


//	Filtramos conforme al tipo

ArrayList<ArrayList<String>> datos= null;
Procedimiento proceso=new Procedimiento();
if(tipo.equals("CEO")){
	datos=proceso.FiltroGeneralString("SELECT c.`id_ceo`,c.`ci`,c.`nombre`,c.`apellido`,c.`direccion`,c.`telefono`,c.`email`,c.`pagina`,c.`estado`,i.`nombre`,p.`id_prefil` FROM ceo c INNER JOIN institucion i INNER JOIN ceo_perfil cp INNER JOIN perfil p WHERE c.`id_ceo`=cp.`id_ceo` AND cp.`id_prefil`=p.`id_prefil` AND c.`id_ceo`=i.`id_ceo` AND c.`id_ceo`="+id, "11", "CEO");
	for(int i=0;i<datos.size();i++){
		//ci=String.valueOf(datos.get(0).get(1));
		nombre=String.valueOf(datos.get(0).get(2));
		apellido=String.valueOf(datos.get(0).get(3));
		direccion=String.valueOf(datos.get(0).get(4));
		telefono=String.valueOf(datos.get(0).get(5));
		email=String.valueOf(datos.get(0).get(6));
		pagina=String.valueOf(datos.get(0).get(7));
		universidad=String.valueOf(datos.get(0).get(9));
		id_perfil=String.valueOf(datos.get(0).get(10));
	}
}else if(tipo.equals("INSTITUCION")){
	datos=proceso.FiltroGeneralString("SELECT id_institucion,id_ceo,fecha,nombre,direccion,telefono,ubicacion,email,estado FROM institucion WHERE id_institucion="+id, "9", "INSTITUCION");
	for(int i=0;i<datos.size();i++){
		//usuario=String.valueOf(datos.get(0).get(2));
		nombre=String.valueOf(datos.get(0).get(3));
		direccion=String.valueOf(datos.get(0).get(4));
		telefono=String.valueOf(datos.get(0).get(5));
		email=String.valueOf(datos.get(0).get(7));
	}
}else if(tipo.equals("PERFIL")){
	datos=proceso.FiltroGeneralString("SELECT r.`id_registro`,r.`fecha`,r.`usuario`,r.`nombre`,r.`apellido`,r.`sexo`,r.`fecha_nac`,r.`correo`,r.`estado`,i.`nombre`,c.`nombre` FROM registro r INNER JOIN universidad_carrera uc INNER JOIN institucion i INNER JOIN carrera c WHERE r.`id_universidad_carrera`=uc.`id_universidad_carrera` AND uc.`id_institucion`=i.`id_institucion` AND uc.`id_carrera`=c.`id_carrera` AND r.`id_registro`="+id, "11", "PERFIL");
	/*datos=proceso.FiltroGeneralString("SELECT id_registro,fecha,usuario,nombre,apellido,sexo,fecha_nac,correo,estado FROM registro WHERE id_registro="+id, "9", "PERFIL");*/
	for(int i=0;i<datos.size();i++){
		//ci=String.valueOf(datos.get(0).get(1));
		usuario=String.valueOf(datos.get(0).get(2));
		nombre=String.valueOf(datos.get(0).get(3));
		apellido=String.valueOf(datos.get(0).get(4));
		sexo=String.valueOf(datos.get(0).get(5));
		fecha_nac=String.valueOf(datos.get(0).get(6));
		correo=String.valueOf(datos.get(0).get(7));
		universidad=String.valueOf(datos.get(0).get(9));
		carrera=String.valueOf(datos.get(0).get(10));
	}
	
}
%>
<%

ArrayList<ArrayList<String>> id_per = null;
try{
	
	id_per=proceso.FiltroGeneralString("CALL Filtro_perfil ('"+tipo+"','"+id+"')","1","lugar");
	
}catch(Exception e){
	
}
id_perfil=String.valueOf(id_per.get(0).get(0));
session.setAttribute("id_perfil", id_perfil);
System.out.println("codigo perfil -- "+id_perfil);
%>
<link rel="shortcut icon" href="views/images/logo.png"/>
<!-- Bootstrap core CSS-->
<link rel="stylesheet" type="text/css" href="<%out.println(request.getContextPath()); %>/views/css-js/bootstrap.css">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />

<!-- Custom fonts for this template-->
<link rel="stylesheet" type="text/css" href="<%out.println(request.getContextPath()); %>/views/css-js/font-awesome.min.css">
<!-- Custom styles for this template-->
<link rel="stylesheet" type="text/css" href="<%out.println(request.getContextPath()); %>/views/css-js/sb-admin.css">
<!-- ESTILOS CASEROS-->
<link rel="stylesheet" type="text/css" href="<%out.println(request.getContextPath()); %>/views/css-js/estilo.css">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>RADE - <%out.print(tipo); %></title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    	<div class="logo">
		<a href="/rade/perfil title="><img src="<%out.println(request.getContextPath()); %>/views/images/logo.png" alt=""></a>
	</div>
  
	<div class="exp">
		<ul class="text hidden">
			<li>R</li>
			<li class="ghost"><a>e</a></li>
			<li class="ghost"><a>c</a></li>
			<li class="ghost"><a>u</a></li>
			<li class="ghost"><a>r</a></li>
			<li class="ghost"><a>s</a></li>
			<li class="ghost"><a>o</a></li>
			
			<li class="spaced">A</li>
			<li class="ghost"><a>c</a></li>
			<li class="ghost"><a>a</a></li>
			<li class="ghost"><a>d</a></li>
			<li class="ghost"><a>é</a></li>
			<li class="ghost"><a>m</a></li>
			<li class="ghost"><a>i</a></li>
			<li class="ghost"><a>c</a></li>
			<li class="ghost"><a>o</a></li>
			
			<li class="spaced">D</li>
			<li class="ghost"><a>i</a></li>
			<li class="ghost"><a>g</a></li>
			<li class="ghost"><a>i</a></li>
			<li class="ghost"><a>t</a></li>
			<li class="ghost"><a>a</a></li>
			<li class="ghost"><a>l</a></li>
			
			<li class="spaced">E</li>
			<li class="ghost"><a>s</a></li>
			<li class="ghost"><a>p</a></li>
			<li class="ghost"><a>e</a></li>
			<li class="ghost"><a>c</a></li>
			<li class="ghost"><a>i</a></li>
			<li class="ghost"><a>f</a></li>
			<li class="ghost"><a>i</a></li>
			<li class="ghost"><a>c</a></li>
			<li class="ghost"><a>o</a></li>
		</ul>
	</div> 
    
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
	        
       <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
			<h5>General</h5>
               
			   <li class="nav-item">
					<a class="nav-link" href="#">
						<i class="fa fa-fw fa-home"></i>
						<span class="nav-link-text">Perfil</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="#">
						<i class="fa fa-fw fa-edit"></i>
						<span class="nav-link-text">Publicaciones</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="#">
						<i class="fa fa-fw fa-question"></i>
						<span class="nav-link-text">Preguntas</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="#">
						<i class="fa fa-fw fa-table"></i>
						<span class="nav-link-text">Eventos</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath() %>/archivos">
						<i class="fa fa-fw fa-clone"></i>
						<span class="nav-link-text">Archivos</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="#">
						<i class="fa fa-fw fa-group"></i>
						<span class="nav-link-text">Solicitudes</span>
					</a>
				</li>
			   
			   <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                        <i class="fa fa-fw fa-sign-out"></i>
                        <span class="nav-link-text">Salir</span>
                    </a>
                </li>
			   
        </ul>
      <!-- BOTON <> DE ABAJO -->
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
	  <!-- FIN BOTON <> DE ABAJO -->
    </div>
  </nav>
<!--   <div class="content-wrapper">
    <div class="container-fluid"> -->
		<!--header end-->		
		
			<div class="main-section">
				<div class="content-wrapper">
					<div class="container-fluid">
						<div class="main-section-data">
<!-- ------------------------------------------------------------------------------ -->
							
<!-- ------------------------------------------------------------------------------ -->
							<div class="row">
								<div class="col-lg-12">
								<input type="hidden" id="id_perfil" value="<% out.write(id_perfil);%>" />
								<input type="hidden" id="id_nombre" value="<% out.write(nombre);%>" />
									<div class="main-ws-sec">
										<div class="posts-section">
											<div class="card mb-12">
												<div class="card-header colores">
													<h1 class="h1">Mis Archivos</h1>								
												</div>
												<!-- <div class="card-body" id="id_carta">
													<div>
														<div class="card mb-6">
															<div class="card-header colores">
																<span class="float-left">
																	<h5>Carta de presentacion</h5>
																</span>
																<button class="float-right" id="carta">
										                    		<i class="fa fa-plus-circle" Style=" font-size:200%;"></i>
											               		</button>
															</div>		
															<div class="card-body">
															<p>No hay ninguna carta de presentacion guardado</p>
															 Inicio Tabla
													        <table class="table table-hover" id="tablaSolicitud">
													        	<thead style="background: #314456;color: #fff;">
																		<tr>
															                <th class="visible-xs visible-sm visible-md">
															                <button type="button" class="btn btn-default btn-xs vercaja" onclick="" data-toggle="tooltip" data-placement="top" title="VER REGISTROS">
																	        <span class="fa fa-fw fa-eye"></span>
																	        </button></th>
															                <th class="visible-md visible-lg visible-sm">Carrera</th>
															                <th class="textoderecha">Nombre</th>
															                <th class="visible-md visible-lg">Apellido</th>
															                <th class="textoderecha">Opcion</th>
														                </tr>
																</thead>
												                <tbody>
													                
												
												              </tbody>
												            </table>
													        Fin Tabla
															</div>
														</div>
													</div>
												</div> -->
												<div class="card-body" id="id_curri">
													<div>
														<div class="card mb-6">
															<div class="card-header colores">
																<span class="float-left">
																	<h5>Curriculum</h5>
																</span>
																
																<button class="float-right" id="curriculum">
											                    	<i class="fa fa-plus-circle" Style=" font-size:200%; "></i>
											               		</button>								
															</div>		
															<div class="card-body">
															 <!-- Inicio Tabla -->
													        <table class="table table-hover" id="tablaCurriculum">
													        	<thead style="background: #314456;color: #fff;">
																		<tr>
															                <th >Nombre</th>
															                <th >Apellido</th>
															                <th >Fecha de nacimiento</th>
															                <th >Opcion</th>
														                </tr>
																</thead>
												                <tbody>
													                
												
												              </tbody>
												            </table>
													        <!-- Fin Tabla -->
															</div>
														</div>
													</div>
												</div>
												<div class="card-body" id="id_memo">
													<div>
														<div class="card mb-6">
															<div class="card-header colores">
																<span class="float-left">
																	<h5>Memorandum</h5>										
																</span>
																<button class="float-right" id="memo">
											                    	<i class="fa fa-plus-circle" Style=" font-size:200%; "></i>
											               		</button>													
															</div>		
															<div class="card-body">
															 <!-- Inicio Tabla -->
													        <table class="table table-hover" id="tablaMemo">
													        	<thead style="background: #314456;color: #fff;">
																	<tr>
														                <th >Receptor</th>
														                <th >Emisor</th>
														                <th >Fecha</th>
														                <th >Opcion</th>
													                </tr>
																</thead>
												                <tbody>
												            	</tbody>
												            </table>
													        <!-- Fin Tabla -->
															</div>
														</div>
													</div>
												</div>
											</div>			
										</div><!--right-sidebar end-->
									</div>
								</div><!--  -->
							</div>
						</div><!-- main-section-data end-->
					</div> 
				</div>
			</div>
			<!--theme-layout end-->
<!-- //////////////////////////////////////////// -->
	<!-- Logout Modal-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Proyecto RADE: Recurso Académico Digital Especifico ©</small>
        </div>
      </div>
    </footer> 
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- VENTANA DE SALIDA-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Desea salir de R.A.D.E.?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Seleccina "Salir" para desconectarte del sitio.</div>
          <div class="modal-footer">
            <button class="btn btn-danger" type="button" data-dismiss="modal">Cancelar</button>
            <a class="btn btn-success" href="login.html">Salir</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/css-js/jquery.min.js"></script>
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/css-js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/css-js/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/css-js/sb-admin.min.js"></script>
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/sesioncurriculum.js"></script>
     <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/archivovistas.js"></script>
	<script>
	$(function() {
		  var text = $(".text").hover();
		  
		  $(text).hover(function() {
			    $( this ).append( text.removeClass("hidden") );
			  }, 
			 function() {
			    $( this ).find( text.addClass("hidden") );
			  });
		});
	
	</script>
</body>
</html>