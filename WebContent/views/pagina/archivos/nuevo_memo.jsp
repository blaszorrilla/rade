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
HttpSession session3 = request.getSession( true );
String id_tipo_curri=String.valueOf(session3.getAttribute("id"));
System.err.print(id_tipo_curri);
%>
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
ArrayList<ArrayList<String>> temas = null;
ArrayList<ArrayList<String>> privacidad = null;
try{
	
	temas=proceso.FiltroGeneralString("SELECT id_temas,tema FROM temas WHERE estado LIKE  'activo' '%' ORDER BY tema DESC", "2", "busca temas");
	privacidad=proceso.FiltroGeneralString("SELECT id_permiso,nombre FROM permiso ", "2", "busca temas");
}catch(Exception e){
	
}

%>



<%

ArrayList<ArrayList<String>> id_per = null;
try{
	
	id_per=proceso.FiltroGeneralString("CALL Filtro_perfil ('"+tipo+"','"+id+"')","1","lugar");
}catch(Exception e){
	
}
id_perfil=String.valueOf(id_per.get(0).get(0));

%>
<%

String modi=String.valueOf(session2.getAttribute("modificarMemo"));
String para_a="";
String de_a="",cargo_a="",fecha_a="",asunto_a="",nombre_empresa_a="";
String texto_a="";

String id_memo =String.valueOf(session2.getAttribute("id_memo"));;
System.err.println("El codigo que recibe modificar es ---->"+modi);

if(modi.equals(null)){
	System.out.println("Ingreso en el if de modi que cambia el valor");
	modi="2";
}

System.err.println("El codigo de modificar cambio a ---->"+modi+"--");

if(modi.equals("0")){
	System.err.println("Ingreso a el if de mofi 0 ??? ya me estoy cansando de escribir mensajes por consola");
	System.err.println(String.valueOf(session2.getAttribute("fecha_a")));
	
	para_a = String.valueOf(session2.getAttribute("para_a"));
	de_a=String.valueOf(session2.getAttribute("de_a"));
	cargo_a = String.valueOf(session2.getAttribute("cargo_a"));
	fecha_a = String.valueOf(session2.getAttribute("fecha_a"));
	asunto_a = String.valueOf(session2.getAttribute("asunto_a"));
	nombre_empresa_a = String.valueOf(session2.getAttribute("nombre_empresa_a"));
	texto_a = String.valueOf(session2.getAttribute("texto_a"));
	session2.setAttribute("modificarMemo","");
	
}
System.err.println("Los datos que recibe son ---->"+para_a+" "+de_a+" "+cargo_a );


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

<title>RADE</title>
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
					<a class="nav-link" href="<%=request.getContextPath() %>/archivos">
						<i class="fa fa-fw fa-clone"></i>
						<span class="nav-link-text">Archivos</span>
					</a>
				</li>
			   
			  <!--  <li class="nav-item">
					<a class="nav-link" href="#">
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
  <div class="content-wrapper">
    <div class="container-fluid">
<!-- INICIO CONTENIDO PRINCIPAL-->
		<div class="main-section-data">
			<div class="row">
				<input type="hidden" id="id_perfil" value="<% out.write(id_perfil);%>" />
				<input type="hidden" id="id_nombre" value="<% out.write(nombre);%>" />
				<input type="hidden" id="modi" value="<% out.write(modi);%>" />
				<input type="hidden" id="id_memo" value="<% out.write(id_memo);%>" />
				<div class="col-lg-12">
				<!-- ----------------------------------------------------- -->
				<div class="card mb-12">
					<div class="card-header colores">
						<h1 class="h1">Memorandun</h1>
					</div>
		            <div class="card-body"  id="cont_memo_1">
		            	<h3 class="display-4" >Formulario</h3>
						<div class="epi-sec">
							<div class="alert alert-success" >
								<font style="vertical-align: inherit;">
									<font style="vertical-align: inherit;">Rellenar los campos de "Cargo" y "Nombre de la Empresa" son opcionales</font>
								</font>
							</div>
						</div>
							
							<!-- comieza campos -->
							
							<div class="row">
						    	<div class="col-md-8 ">
									<form class="form-horizontal form-label-left">
				                    	<div class="form-group">
										    <label class="h4" >Para</label>
										    <input class="form-control" id="id_arch_para" style="width:50%;" type="text" value="<% out.write(para_a); %>" placeholder="A quien va dirigido"/>
										</div>
										<div id="mensaje_para" class="form-group"></div>	
											
										<div class="form-group">
										    <label class="h4">De</label>
										    <input class="form-control" id="id_arch_de" style="width:50%;" type="text" value="<% out.write(de_a); %>" placeholder="De parte de quien"/>
										</div>
										<div id="mensaje_de" class="form-group"></div>	
										
										<div class="form-group">
										    <label class="h4">Cargo</label>
										  	<input class="form-control" style="width:50%;" type="text" id="id_arch_cargo" value="<% out.write(cargo_a); %>" placeholder="Cargo o puesto del emisor" />
										</div>
										
										<div class="form-group">
											<label class="h4" for="form-field-mask">Fecha</label>
										  	<input class="form-control" style="width: 50%" type="date" value="<% out.write(fecha_a); %>" id="id_arch_fecha">
										</div>
										<div id="mensaje_fecha" class="form-group"></div>	
										
										<div class="form-group">
										    <label class="h4">Asunto</label>
									      	<input class="form-control" style="width:50%;" type="text" id="id_arch_re" value="<% out.write(asunto_a); %>" placeholder="El asunto del memorando"/>
										</div>
										<div id="mensaje_asunto" class="form-group"></div>	
										
										<div class="form-group">
										    <label class="h4">Nombre de la Empresa</label>
									       	<input class="form-control" style="width:50%;" type="text" id="id_arch_empresa" value="<% out.write(nombre_empresa_a); %>" placeholder="Nombre de la empresa" />
										</div>
									
										<div class="form-group">
										    <label class="h4" >Texto a incluir</label>
									    	<textarea class="form-control" id="textarea" placeholder="El área de ventas llevará a cabo su reunión mensual el día 22 de Abril del 2018. En la reunión se discutirán los temas referentes al incremento de ventas que se ha alcanzado en el último trimestre. 

Es muy importante contar con su presencia. 

Saludos a UD." rows="15" cols="50"><% out.write(texto_a); %></textarea>
										</div>
										<div id="mensaje_texto" class="form-group"></div>	
										
									</form>										
								</div>
							</div>
							
							<div class="ln_solid"></div>
							
							<!-- termina campos -->
							<div class="form-group">
		                        <div class="col-md-4 col-md-offset-8">
		                          <a href="../archivos2"><button type="submit" class="btn btn-lg btn-primary">Cancelar</button></a>
		                          <button type="submit" class="btn btn-lg btn-success" id="abrirDescarga">Siguiente</button>
		                        </div><br></br>
		                    </div>
							
						</div>
						
						<!-- aca termina el primer panel -->
						
						
						<div class="card-body" id="cont_memo_2">
							<h3 class="display-4" >Descargar</h3>
		                    
							<div class="epi-sec">
								<div class="alert alert-success" >
									<font style="vertical-align: inherit;">
										<font style="vertical-align: inherit;">Casi listo!. Aqui puedes descargar y guardar tu memorandun en tu pc o imprimirlo.</font>
									</font>
								</div>
							</div>		
							<div class="row">
								<div class="col-md-10 col-md-offset-1" >
									<button class="btn btn-danger btn-lg" id="cargartodo" >
									 	<span class="fa fa-floppy-save" aria-hidden="true"> Previsualizar y Descargar </span>
									</button>
									<button class="btn btn-danger btn-lg" id="guardaMemo" >
									 	<span class="fa fa-floppy-save" aria-hidden="true"> Guardar </span>
									 </button>  
								</div>
						  	</div>
						  	
						  	<!-- aqui termina experiencia -->
						  	
						  	<div class="ln_solid"></div>
							
							<div class="form-group">
		                        <div class="col-md-4 col-md-offset-8">
		                          <button type="submit" class="btn btn-lg btn-primary" id="abrirMemo">Atras</button>
		                        </div><br></br>
		                    </div>
						  	
						</div>
					</div>
				<!-- --------------------------------------------------------------- -->
			</div>
		</div>
	</div>
<!-- FIN DEL CONTENIDO PRINCIPAL -->
    </div>
    <!-- /.content-wrapper-->
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
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/css-js//sb-admin.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/arch_cont_prin.js"></script>
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
	<script>
	$( document ).ready(function() {
		$("#cargartodo").click(function(){
			var para=$("#id_arch_para").val();
			var de = $("#id_arch_de").val();
			var fecha = $("#id_arch_fecha").val();
			var asunto = $("#id_arch_re").val();
			var cargo =  $("#id_arch_cargo").val();
			var texto = $("#textarea").val();
			var empresa = $("#id_arch_empresa").val();
			$.ajax({
					url : "Memoo",
					method: "POST",
					data: { envio:"memo", para:para,de:de,fecha:fecha,asunto:asunto,cargo:cargo,texto:texto, empresa:empresa},
					beforeSend: function(){
						$("#mensaje").html("<img src=\"../views/img/status.gif\"></img>");
					},
					success: function(respuesta){
						window.open("Memoo",'First','height=600,width=800,toolbar=no,scrollbars=yes');
					},
					error: function(jqXHR, exception){
						$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Verifique  </div>");
					}
				});
		});
	});
	</script>
</div>
  </body>
</html>