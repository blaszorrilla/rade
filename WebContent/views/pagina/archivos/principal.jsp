<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="configuracion.Procedimiento"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
String institucion="";
String carrera="";
String ci="";
String pagina="";
String telefono="";
String ubicacion="";
String correo="";
String sexo="";
String id_perfil="";
String misarchivosviendo = "";

if(session2.getAttribute("login")!=null){
	String valor=String.valueOf(session2.getAttribute("login"));
	if(valor.equals("si")){
		tipo=String.valueOf(session2.getAttribute("tipo"));
		id=String.valueOf(session2.getAttribute("id"));
		misarchivosviendo=String.valueOf(session2.getAttribute("misarchivosviendo"));
		session.setAttribute("misarchivosviendo","");
		System.out.println("abrio");
		/////////////////////////////////
		
		/////////////////////////////////
	}else{
		response.sendRedirect("index");
//		RequestDispatcher dispacher = request.getRequestDispatcher("views/publico/publico.jsp");
//    	dispacher.forward(request, response);
	}
}else{
	response.sendRedirect("index");
//	RequestDispatcher dispacher = request.getRequestDispatcher("views/publico/publico.jsp");
//	dispacher.forward(request, response);
}
System.out.println("tipo-- "+tipo);
System.out.println("id-- "+id);

//	Filtramos conforme al tipo

ArrayList<ArrayList<String>> datos= null;
Procedimiento proceso=new Procedimiento();
if(tipo.equals("CEO")){
	datos=proceso.FiltroGeneralString("SELECT c.`id_ceo`,c.`ci`,c.`nombre`,c.`apellido`,c.`direccion`,c.`telefono`,c.`email`,c.`pagina`,c.`estado`,i.`nombre`,p.`id_prefil` FROM ceo c INNER JOIN institucion i INNER JOIN ceo_perfil cp INNER JOIN perfil p WHERE c.`id_ceo`=cp.`id_ceo` AND cp.`id_prefil`=p.`id_prefil` AND c.`id_ceo`=i.`id_ceo` AND c.`id_ceo`="+id, "11", "CEO");
	for(int i=0;i<datos.size();i++){
		nombre=String.valueOf(datos.get(0).get(2));
		apellido=String.valueOf(datos.get(0).get(3));
		direccion=String.valueOf(datos.get(0).get(4));
		telefono=String.valueOf(datos.get(0).get(5));
		email=String.valueOf(datos.get(0).get(6));
		pagina=String.valueOf(datos.get(0).get(7));
		institucion=String.valueOf(datos.get(0).get(9));
		id_perfil=String.valueOf(datos.get(0).get(10));
	}
}else if(tipo.equals("INSTITUCION")){
	datos=proceso.FiltroGeneralString("SELECT id_institucion,id_ceo,fecha,nombre,direccion,telefono,ubicacion,email,estado FROM instivistainsti WHERE id_institucion="+id, "9", "INSTITUCION");
	for(int i=0;i<datos.size();i++){
		nombre=String.valueOf(datos.get(0).get(3));
		direccion=String.valueOf(datos.get(0).get(4));
		telefono=String.valueOf(datos.get(0).get(5));
		email=String.valueOf(datos.get(0).get(7));
		
	}
}else if(tipo.equals("PERFIL")){
	datos=proceso.FiltroGeneralString("SELECT id_registro,fecha,nombre,apellido,sexo,fecha_nac,correo,estado,institucion,carrera FROM perfilvistaperfil WHERE id_registro="+id, "10", "PERFIL");
	for(int i=0;i<datos.size();i++){
		nombre=String.valueOf(datos.get(0).get(2));
		apellido=String.valueOf(datos.get(0).get(3));
		sexo=String.valueOf(datos.get(0).get(4));
		fecha_nac=String.valueOf(datos.get(0).get(5));
		correo=String.valueOf(datos.get(0).get(6));
		institucion=String.valueOf(datos.get(0).get(8));
		
		carrera=String.valueOf(datos.get(0).get(9));
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
System.err.println("----- id_perfil "+id_perfil);
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
    <!-- <a class="navbar-brand" href="#">R.A.D.E.</a>  -->
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
	        
       <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
			<!-- <h5>General</h5> -->
               
			   <li class="nav-item">
					<a class="nav-link" href="<%out.print(session2.getAttribute("usuario")); %>">
						<i class="fa fa-fw fa-home"></i>
						<span class="nav-link-text">Perfil</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="/rade/posteo">
						<i class="fa fa-fw fa-edit"></i>
						<span class="nav-link-text">Publicaciones</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="/rade/pregunta">
						<i class="fa fa-fw fa-question"></i>
						<span class="nav-link-text">Preguntas</span>
					</a>
				</li>
			   
			    <li class="nav-item">
					<a class="nav-link" href="/rade/evento">
						<i class="fa fa-fw fa-table"></i>
						<span class="nav-link-text">Eventos</span>
					</a>
				</li> 
			   
			   <li class="nav-item">
					<a class="nav-link activo" href="<%=request.getContextPath() %>/archivos">
						<i class="fa fa-fw fa-clone"></i>
						<span class="nav-link-text">Archivos</span>
					</a>
				</li>
			   
			   <!-- <li class="nav-item">
					<a class="nav-link" href="solicitudes">
						<i class="fa fa-fw fa-group"></i>
						<span class="nav-link-text">Solicitudes</span>
					</a>
				</li> -->
			   
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
							<div class="row">
					            <div class="col-xl-12 mb-12">
					            <input type="hidden" id="id_perfil" value="<% out.write(id_perfil);%>" />
								<input type="hidden" id="id_nombre" value="<% out.write(nombre);%>" />
					              <div class="card text-white bg-primary o-hidden h-100">
					                <div class="card-body">
					                  <div class="card-body-icon">
					                    <i class="fa fa-fw fa-comments"></i>
					                  </div>
					                  <div class="mr-5"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Mis archivos</font></font></div>
					                </div>
					                <a class="card-footer text-white clearfix small z-1" href="<%=request.getContextPath() %>/archivos/mis-archivos" id="tablass">
					                  <span class="float-left"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Ver todos los archivos guardados</font></font></span>
					                  <span class="float-right">
					                    <i class="fa fa-angle-right"></i>
					                  </span>
					                </a>
					              </div>
					            </div>
					            <!-- <div class="col-xl-6 mb-6">
					              <div class="card text-white bg-warning o-hidden h-100">
					                <div class="card-body">
					                  <div class="card-body-icon">
					                    <i class="fa fa-fw fa-list"></i>
					                  </div>
					                  <div class="mr-5"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Crear archivos</font></font></div>
					                </div>
					                <a class="card-footer text-white clearfix small z-1" href="#">
					                  <span class="float-left"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Ver detalles</font></font></span>
					                  <span class="float-right">
					                    <i class="fa fa-angle-right"></i>
					                  </span>
					                </a>
					              </div>
					            </div> -->
					          </div><br></br>
<!-- ------------------------------------------------------------------------------ -->
							<div class="row">
								<div class="col-lg-12">
									<div class="main-ws-sec">
										<div class="posts-section">
											<div class="card mb-12">
												<div class="card-header colores">
													<h1 class="h1">Diseños</h1>								
												</div>
												
												<%-- <%
												if(misarchivosviendo.equals("carta")){
													%> --%>
												<%-- 	<div class="card-body" id="id_carta">
													<br><h3>Carta de presentación</h3><br/>
													<p>Es la carta que acompaña al CV, pretende atraer la atención del responsable de selección de manera que considere, en esta primera impresión, que el CV que acompaña esta carta puede ser el idóneo para cubrir el puesto de trabajo.</p>
													<div class="row">
												    	<div class="col-sm-4" Style="padding: 10px;">
													      	<img src="<%=request.getContextPath() %>/views/imagen/curri/car1.jpg" style="width: 100%; border: 2px solid #a0adba;">
													    </div>
													    <div class="col-sm-4" Style="padding: 10px;">
													      	<img src="<%=request.getContextPath() %>/views/imagen/curri/car2.jpg" style="width: 100%; border: 2px solid #a0adba;">
													    </div>
													</div>
													
												</div> --%>
													<%
												/*}else*/ if(misarchivosviendo.equals("curriculum")){
													%> 
													<div class="card-body" id="id_curri">
														<h3>Curriculum</h3><br/>
														<p>Documento que presenta las habilidades, formación y experiencia laboral de una persona, con el fin de optar a un puesto de trabajo. Junto a la carta de presentación, es el documento destinado a presentar en un único lugar toda la información que puede resultar relevante en un proceso de selección de personal o en una entrevista.</p>
														<div class="row">
													    	<div class="col-sm-4" Style="padding: 10px;">
														      	<a onclick="cargar('1');" title="">
														      	<img src="<%=request.getContextPath() %>/views/imagen/curri/t4.png" style="width: 100%; border: 2px solid #a0adba;">
														    	</a>
														    </div>
														    <div class="col-sm-4" Style="padding: 10px;">
														      <img src="<%=request.getContextPath() %>/views/imagen/curri/t5.png" style="width: 100%; border: 2px solid #a0adba;">
														    </div>
													  	</div>
													</div>
													<%
												}else if(misarchivosviendo.equals("memo")){
													%>
													<div class="card-body" id="id_memo">
													<br><h3>Memorandum</h3><br/>
													<p>Es una comunicación menos solemne que la memoria y que la nota, donde se recapitulan hechos y razones que deben ser tenidas en cuenta en los asuntos más importantes. </p>
													<div class="row">
												    	<div class="col-sm" Style="padding: 10px;">
													      	<a href="<%=request.getContextPath() %>/archivos/memo" title="">
													      	<img src="<%=request.getContextPath() %>/views/imagen/curri/memo.jpg" style="width: 31%; border: 2px solid #a0adba;">
													    	</a>
													    </div>
													</div>
												</div>
													<% 
												}else {
													%>
													
													<%-- <div class="card-body" id="id_carta">
														<br><h3>Carta de presentación</h3><br/>
														<p>Es la carta que acompaña al CV, pretende atraer la atención del responsable de selección de manera que considere, en esta primera impresión, que el CV que acompaña esta carta puede ser el idóneo para cubrir el puesto de trabajo.</p>
														<div class="row">
													    	<div class="col-sm-4" Style="padding: 10px;">
														      	<img src="<%=request.getContextPath() %>/views/imagen/curri/car1.jpg" style="width: 100%; border: 2px solid #a0adba;">
														    </div>
														    <div class="col-sm-4" Style="padding: 10px;">
														      	<img src="<%=request.getContextPath() %>/views/imagen/curri/car2.jpg" style="width: 100%; border: 2px solid #a0adba;">
														    </div>
														</div>
													</div> --%>
												
												
												
												<div class="card-body" id="id_curri">
													<h3>Curriculum</h3><br/>
													<p>Documento que presenta las habilidades, formación y experiencia laboral de una persona, con el fin de optar a un puesto de trabajo. Junto a la carta de presentación, es el documento destinado a presentar en un único lugar toda la información que puede resultar relevante en un proceso de selección de personal o en una entrevista.</p>
													<div class="row">
												    	<div class="col-sm-4" Style="padding: 10px;">
													      	<a onclick="cargar('1');" title="">
													      	<img src="<%=request.getContextPath() %>/views/imagen/curri/t4.png" style="width: 100%; border: 2px solid #a0adba;">
													    	</a>
													    </div>
													    <div class="col-sm-4" Style="padding: 10px;">
													      <img src="<%=request.getContextPath() %>/views/imagen/curri/t5.png" style="width: 100%; border: 2px solid #a0adba;">
													    </div>
												  	</div>
												</div>
												<div class="card-body" id="id_memo">
													<br><h3>Memorandum</h3><br/>
													<p>Es una comunicación menos solemne que la memoria y que la nota, donde se recapitulan hechos y razones que deben ser tenidas en cuenta en los asuntos más importantes. </p>
													<div class="row">
												    	<div class="col-sm-4" Style="padding: 10px;">
													      	<a href="<%=request.getContextPath() %>/archivos/memo" title="">
													      	<img src="<%=request.getContextPath() %>/views/imagen/curri/memo.jpg" style="width: 100%; border: 2px solid #a0adba;">
													    	</a>
													    </div>
													</div>
												</div>
												
													<%
												}
												%>
								
												
												
											</div>			
									</div><!--right-sidebar end-->
								</div>
							</div><!--  -->
						</div>
					</div><!-- main-section-data end-->
				</div> 
					</div>
				</div>
			</div><!--theme-layout end-->
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