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
		response.sendRedirect("index");
//		RequestDispatcher dispacher = request.getRequestDispatcher("views/publico/publico.jsp");
//    	dispacher.forward(request, response);
	}
}else{
	response.sendRedirect("index");
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
	/* for(int i=0;i<datos.size();i++){
		//ci=String.valueOf(datos.get(0).get(1));
		usuario=String.valueOf(datos.get(0).get(2));
		nombre=String.valueOf(datos.get(0).get(3));
		apellido=String.valueOf(datos.get(0).get(4));
		sexo=String.valueOf(datos.get(0).get(5));
		fecha_nac=String.valueOf(datos.get(0).get(6));
		correo=String.valueOf(datos.get(0).get(7));
		universidad=String.valueOf(datos.get(0).get(9));
		carrera=String.valueOf(datos.get(0).get(10));
	} */
	
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

ArrayList<ArrayList<String>> privacidad = null;
try{
	
	privacidad=proceso.FiltroGeneralString("SELECT id_permiso,nombre FROM permiso ", "2", "busca temas");
}catch(Exception e){
	
}

%>
<link rel="shortcut icon" href="views/images/logo.png"/>
<!-- Bootstrap core CSS-->
<link rel="stylesheet" type="text/css" href="<%out.println(request.getContextPath()); %>/views/css/bootstrap.css">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />

<!-- Custom fonts for this template-->
<link rel="stylesheet" type="text/css" href="<%out.println(request.getContextPath()); %>/views/css/font-awesome.min.css">
<!-- Custom styles for this template-->
<link rel="stylesheet" type="text/css" href="<%out.println(request.getContextPath()); %>/views/css/sb-admin.css">
<!-- ESTILOS CASEROS-->
<link rel="stylesheet" type="text/css" href="<%out.println(request.getContextPath()); %>/views/css/estilo.css">


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
    <!-- <a class="navbar-brand" href="#">R.A.D.E.</a> -->
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
					<a class="nav-link" href="/rade/posteonuevo">
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
					<a class="nav-link activo" href="/rade/evento">
						<i class="fa fa-fw fa-table"></i>
						<span class="nav-link-text">Eventos</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="/rade/archivos">
						<i class="fa fa-fw fa-clone"></i>
						<span class="nav-link-text">Archivos</span>
					</a>
				</li>
			   
			   <!-- <li class="nav-item">
					<a class="nav-link" href="/rade/solicitudes">
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

    </div>
  </nav>
  <div class="content-wrapper">
    <div class="container-fluid">
<!-- INICIO CONTENIDO PRINCIPAL-->
    	
    	
    	<div class="main-section-data">
		 <div class="row">
		 	
            <div class="col-lg-9">
               <div class="well well-md">
                  <form class="form-horizontal border border-dark rounded" method="post" action="evento_guardar.jsp">
                    
                    <fieldset>
                        <legend class="text-center header mb-2 "><h1>Crear Evento</h1></legend>
                    </fieldset>

                        
                         
                         
                        <div class="form-group input-group">
                            <div class="col-md-9">
                            
                             <input type="hidden" id="id_perfil" value="<% out.write(id_perfil); %>"/>
                            <input id="codigo"  type="hidden" value="0" >
                            <label class="card-subtitle">Evento</label>
                            <div class="input-group-prepend form-control-feedback">
                            <span class="input-group-text">
                            <i class="fa fa-few fa-edit"></i>
                            </span>
                          
							
                                
                               <input class="form-control"  id="evento" name="evento" type="text" placeholder="Ingrese un titulo para el evento" autofocus required class="form-control form-control-md">
                             </div>
                            </div>
                            
                        </div>
                        
                        
                        
                        <div class="form-group input-group">     
                            <div class="col-md-5">
                            <label class="card-subtitle">Fecha</label>
                            <div class="input-group-prepend form-control-feedback">
                            <span class="input-group-text">
                            <i class="fa fa-few fa-calendar"></i>
                            </span>
                        <input class="form-control" data-date-format="dd/mm/yyyy" id="fecha" size="16"  name="fecha" type="date" autofocus="required"  class="form-control form-control-md">
                            </div>
                            </div>
                            <div class="col-md-3">
    						<label class="card-subtitle">Hora</label>
    						<div class="form-group">
                          <div class="well">
                          <div id="datetimepicker3" class="input-append">
                          <input id="hora" data-format="hh:mm:ss" type="text" autofocus="required"></input>
                          <span class="add-on">
                         <i data-time-icon="icon-time" data-date-icon="icon-calendar">
                          </i>
                       </span>
                       </div>
                      </div>
                    </div>
    						</div>
                        </div>
    						
    						 	
    				 			<div class="form-group">
    				 			<div class="col-md-12">
    				 			<label class="card-subtitle">Descripcion</label>
    				 				<textarea name="contenido" autofocus required ></textarea>
    		                         
   								</div>
                             </div>

   							<div class="col-md-10">
   							
   							<div class="form-group input-group">
                     <input type="text" id="busqueda" name="busqueda" autofocus="required" class="form-control" placeholder="Ubicacion del Evento" >
                       
                      </div>
                      </div>


                             
                              
   							<div class="row">
  					<div class="col-xs-2 offset-md-5 mt-2">	
  					<div class="form-group input-group">
    				<div align="center">
    				 			  
 						<button type="button" class="btn btn-outline-success "  id="guardar_evento" >Guardar</button> 
 					   
 					    </div>
 					    </div>
  						</div>
  						</div>
                    <div id="mensaje" class="form-group">
                    
                    </div>
                     
						</form>
						<div id="mensaje" class="form-group"> </div>
						</div>
						</div>
					<div class="col-md-3" id="colmd3">
                 	
                	<select  class="form-control" name="privacidad" id="privacidad">
                		<option disabled selected>Seleccione:</option>
                	<%
						try{
							for(int i=0; i<privacidad.size();i++){
								out.print("<option value='"+privacidad.get(i).get(0)+"'>"+privacidad.get(i).get(1)+"</option>");
							}
						}catch(Exception e){
							
						}
					%>
                </select>
                <div class="col-xs-3 mt-5">	
  					<div class="form-group input-group">
    				<div align="center">
    				 		  
 						<a href="/rade/eventoguardar"  title=""><button type="button" class="btn btn-outline-success "  >Ver Eventos</button></a>
 					   
 					    </div>
 					    </div>
 					    
  						</div>
  						
  						<div class="col-xs-3 mt-5">	
  					<div class="form-group input-group">
    				<div align="center">
    				 		  
 						<a href="/rade/miseventos"  title=""><button type="button" class="btn btn-outline-success "  >Mis eventos</button></a>
 					   
 					    </div>
 					    </div>
 					    
  						</div>
  						
  							<div class="col-xs-3 mt-5">	
  					<div class="form-group input-group">
    				<div align="center">
    				 		  
 						<a href="/rade/eventoasistencia"  title=""><button type="button" class="btn btn-outline-success "  >Vista de Asistencia</button></a>
 					   
 					    </div>
 					    </div>
 					    
  						</div>
  						</div>
                </div>
                
                	
                
	            </div>
    	<div id="mensaje" class="form-group"> </div>
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
<!-- FIN DEL CONTENIDO PRINCIPAL -->
    </div>
   
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
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/sb-admin.min.js"></script>
	<script src="<%=request.getContextPath() %>/views/tinymce/tinymce.min.js"></script>
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/evento.js"></script>


 




<script>
tinymce.init({selector:'textarea',autoresize_max_height: 330,language:'es',

 plugins: ['autolink,autoresize,charmap,textcolor colorpicker,hr,image,imagetools,paste,imagetools,insertdatetime,link,preview,print,searchreplace,table,wordcount,lists '],
 toolbar: 'undo redo | styleselect | forecolor backcolor| bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview  fullpage   ',
 paste_data_images: true,
branding: false
});
</script> 



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
  </div>
</body>
</html>