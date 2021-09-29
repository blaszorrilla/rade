<%@page import="java.util.ArrayList"%>
<%@page import="configuracion.Procedimiento"%>
<html lang="en">
<head>

<link rel="shortcut icon" href="<%=request.getContextPath() %>/views/images/Logoo_rade-copia.png"/>
<link rel="stylesheet" type="text/css" href="<%out.println(request.getContextPath()); %>/views/css/bootstrap.min.css">

<style type="text/css">
.login-card {
  margin-top: 25%;
<%
String id_perfil="";
String idposteo="";

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
 	
 	}
 }else if(tipo.equals("INSTITUCION")){
 	datos=proceso.FiltroGeneralString("SELECT id_institucion,id_ceo,fecha,nombre,direccion,telefono,ubicacion,email,estado FROM institucion WHERE id_institucion="+id, "10", "INSTITUCION");
 	for(int i=0;i<datos.size();i++){
 		/* 	usuario=String.valueOf(datos.get(0).get(2)); */
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
 String url = String.valueOf(request.getAttribute("javax.servlet.forward.request_uri"));
ArrayList<ArrayList<String>> desdeurl = null;
ArrayList<ArrayList<String>> desdeenlace = null;
ArrayList<ArrayList<String>> cargar = null;
try{
	
	desdeurl=proceso.FiltroGeneralString("SELECT id_enlacesistema FROM enlacesistema WHERE url='"+url+"'","1","");
	String idenlace="";
	for(int i=0;i<desdeurl.size();i++){
		idenlace=desdeurl.get(i).get(0);
	}
	desdeenlace=proceso.FiltroGeneralString("SELECT id_posteo FROM enlace_posteo WHERE id_enlacesistema="+idenlace,"1","");
	
	for(int i=0;i<desdeenlace.size();i++){
		idposteo=desdeenlace.get(i).get(0);
	}
	cargar=proceso.FiltroGeneralString("SELECT posteo.titulo,posteo.texto,DATE_FORMAT(posteo.fecha,'%d %b %Y'),DATE_FORMAT(posteo.fecha,'%H:%i:%s'),perfil.usuario,tipo_perfil.nombre FROM posteo LEFT JOIN perfil ON posteo.id_prefil=perfil.id_prefil LEFT JOIN tipo_perfil ON perfil.id_tipo_perfil=tipo_perfil.id_tipo_perfil WHERE posteo.id_posteo="+idposteo,"6","trayendo todo");
	 
	
}catch(Exception e){
	
}

%>

<%
ArrayList<ArrayList<String>> comentarios = null;
try{
	
	comentarios=proceso.FiltroGeneralString("SELECT pe.usuario,DATE_FORMAT(pc.fecha, '%d %b %Y' ' a las '  '%H:%i:%s'),pc.texto FROM posteo_comentario pc INNER JOIN perfil pe ON pe.id_prefil=pc.id_prefil WHERE pc.id_posteo="+idposteo, "3", "busca comentario");
}catch(Exception e){
	
}

%>


}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />

<link rel="stylesheet" type="text/css" href="<% out.println(request.getContextPath());%>/views/css/animate.css">
<link rel="stylesheet" type="text/css" href="<% out.println(request.getContextPath()); %>/views/css/jquery.range.css">
<link rel="stylesheet" type="text/css" href="<% out.println(request.getContextPath()); %>/views/css/line-awesome.css">
<link rel="stylesheet" type="text/css" href="<% out.println(request.getContextPath()); %>/views/css/line-awesome-font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="<% out.println(request.getContextPath()); %>/views/lib/slick/slick.css">
<link rel="stylesheet" type="text/css" href="<% out.println(request.getContextPath()); %>/views/lib/slick/slick-theme.css">
<link href="<% out.println(request.getContextPath()); %>/views/css/sb-admin.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<% out.println(request.getContextPath()); %>/views/css/responsive.css">
<link rel="stylesheet" type="text/css" href="<% out.println(request.getContextPath()); %>/views/css/font-awesome.css">
 <link rel="stylesheet" type="text/css" href="<% out.println(request.getContextPath());%>/views/css/css.css">

 <link rel="stylesheet" type="text/css" href="<% out.println(request.getContextPath()); %>/views/css/style.css">
 <link rel="stylesheet" type="text/css" href="<% out.println(request.getContextPath()); %>/views/css/posteo2.css">

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>R.A.D.E.</title>
 
  
  
</head>

<body class="fixed-nav sticky-footer bg-light" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light" id="mainNav">
  <div class="logo">
						<a href="/rade/publicaciones" title=""><img src="<%out.println(request.getContextPath()); %>/views/images/logo.png" alt=""></a>
					</div>
    <a class="navbar-brand" href="">R.A.D.E.</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
    
    
    
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
      <!--  -->
      <li>
     
		<div class="right-sidebar">
			<img class="imagen" src="<%out.println(request.getContextPath()); %>/views/images/perfil.png" alt="">
		</div>
      </li>
      <li>
    		
			<div class="jobs-list">
				<div class="job-info">
					<div class="job-details">
					<div id="perfil">
						<p>
									<!-- <h6 class="titu">CI:</h6><h6 class="h6"><% out.print(ci); %></h6> -->
									<h6 class="titu">Nombre y Apellido:</h6><h6 class="h6"><% out.print(nombre);%> <% out.print(apellido);%></h6>
									<h6 class="titu">Direccion:</h6><h6 class="h6"><% out.print(direccion); %></h6>
									<h6 class="titu">Telefono:</h6><h6 class="h6"><% out.print(telefono); %></h6>
									<h6 class="titu">E-mail:</h6><h6 class="h6"><% out.print(email); %></h6>
									<h6 class="titu">Pagina:</h6><h6 class="h6"><% out.print(pagina); %></h6>
									<h6 class="titu">Institucion:</h6><h6 class="h6"><% out.print(universidad); %></h6>
								
								</p>
								</div>
								<div id="insti">
									<p>
								<%-- 	<h6 class="titu">Usuario:</h6><h6 class="h6"><% out.print(usuario); %></h6> --%>
									<h6 class="titu">Nombre:</h6><h6 class="h6"><% out.print(nombre);%> <% out.print(apellido);%></h6>
									<h6 class="titu">Telefono:</h6><h6 class="h6"><% out.print(telefono); %></h6>
									<h6 class="titu">direccion:</h6><h6 class="h6"><% out.print(direccion); %></h6>
									<h6 class="titu">E-mail:</h6><h6 class="h6"><% out.print(email); %></h6>
								</p>
								</div>
								<div id="usu">
								<p>
								<%-- 	<h6 class="titu">Usuario:</h6><h6 class="h6"><% out.print(usuario); %></h6> --%>
									<h6 class="titu">Nombre y Apellido:</h6><h6 class="h6"><% out.print(nombre);%> <% out.print(apellido);%></h6>
									
									<h6 class="titu">Sexo:</h6><h6 class="h6"><% out.print(sexo); %></h6>
									<h6 class="titu">Fecha Nac:</h6><h6 class="h6"><% out.print(fecha_nac); %></h6>
									<h6 class="titu">Correo:</h6><h6 class="h6"><% out.print(correo); %></h6>
									<h6 class="titu">Universidad:</h6><h6 class="h6"><% out.print(universidad); %></h6>
									<h6 class="titu">Carrera:</h6><h6 class="h6"><% out.print(carrera); %></h6>
									
								</p>
								</div>
									</br>
								<a id="configuracion" href="#" style="color:#5EB456" >Configuracion<i class="fa fa-fw fa-gears"></i></a>
						</div>
					</div>
				</div>
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
									<li><a href="/rade/posteonuevo"  title=""><span class="fa fa-fw fa-edit"></span> Nuevo Posteo</a></li>
									<li><a href="/rade/misposteos"  title=""><span class="fa fa-fw fa-file-text"></span> Mis Posteos</a></li>
									<li><a href="/rade/evento"  title=""><span class="fa fa-fw fa-calendar"></span> Nuevo Evento</a></li>
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
        
      
       <!--  <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Desconectar</a>
        </li> -->
        
      </ul>
    </div>
  </nav>
  
<!-- ----------------------------------------------------------------------------------------------------------------------  --> 
  <div class="main-section">
  
  <div class="content-wrapper">
    <div class="container-fluid">
      
      <div class="main-section-data">
			<div class="row">
		
		<div class="col-lg-9">
			<div class="post-bar">
                   <div class="container">               
                        		
 						  <div class="form-group"> </div>
    						
  								<div class="form-group">
  							 <input type="hidden" id="id_perfil" value="<% out.write(id_perfil); %>"/>	
  							<input type="hidden" id="id_posteo" value="<% out.write(idposteo); %>"/> 
  											 	
  						    <%
                            for(int i=0;i<cargar.size();i++){
                        		
                        		out.print("<div class=\"posteo\"><center><h3>"+(cargar.get(i).get(0))+"</h3></center>");
                        	}
                            %> 	
                            <br>	
  							<%
                            for(int i=0;i<cargar.size();i++){
                        		
                        		out.print("<p>"+(cargar.get(i).get(1))+"</p>");
                        	}
                            %> 		
  						   
  						    <br> 
  						   <br> 
  						   <br>
  						 	
  						    				
 							 	  </div>
 							
 							 	
		 					</div>	
					</div>
					<div class="form-group"> </div>
			</div>
		

		</div>	

						
	</div>	
<!-- 	---------------------------------segundo contenedor----------------------------------------------------- -->

    <div class="main-section-data">
			<div class="row">
		
		<div class="col-lg-9">
			<div class="post-bar">
                   <div class="container">               
                        		
 						  <div class="form-group"> </div>
    						
  						<div class="form-group">
  						<%
                            for(int i=0;i<comentarios.size();i++){
                        		
                        	  	out.print("<div class=\"posteo\">"
                        		+"<div class=\"media border p-2\">"
                        	    +"<img src=\"../views/images/Logoo_rade-copia.png\"  class=\"mr-2 mt-2 rounded-circle\" style=\"width:50px;\">"
                    			 + "<div class=\"media-body\">"
                    			+"<p>"+"<strong>"+(comentarios.get(i).get(0))+"</strong>&emsp;<em>coment&oacute el "+(comentarios.get(i).get(1))+"</em></p>"
                    					+"<p>"+(comentarios.get(i).get(2))+"</p>"
                    					+"</div>"
                    					+"</div>");  
                            }
                            %> 
  						    			
 					    </div>
 					    <div class="form-group"></div>
 						<div class="form-group">
  						
  							<div> 	
    								 	
    				 						<div class="form-group" >
    				 							<div class="card-header">	
    				 							      <div class="row">
   							
   															<div class="col-lg-10">
   								
                                 								<textarea class="form-control" rows="2"  placeholder="Agrega tu comentario...." id="textcomentario" maxlength="200"></textarea>
                               								</div>
                            				<div class="col-lg-2">	
                                  				<button type="button" class="btn btn-success " onclick="guardarcomentario()">Enviar</button>
                                  
                            				</div>
                                 
   														</div>	
    		                         
   											
   													</div>
   												
   										
   												
   												
   											   </div>
   												
  				
   										</div>
  						
  						
  						
  						
  						
  						
  						
  						
  						
  						
  						
 					    </div>	
 							 	
		 					</div>	
					</div>
					<div class="form-group"> </div>
			</div>
		    

		</div>	

						
	</div>	
   
	

	
	
	
	
	
	
	
    </div>  
   </div>
<!-- ----------------------------------------------------------------------------------------------------------------------- -->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
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
    <!-- Bootstrap core JavaScript-->
    <script src="<%out.println(request.getContextPath()); %>/views/js/jquery.js"></script>
    <script src="<%out.println(request.getContextPath()); %>/views/js/bootstrap.min.js"></script>
    <!-- Core plugin JavaScript-->
 
    <!-- Custom scripts for all pages-->
    <script src="<%out.println(request.getContextPath()); %>/views/js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <!-- Toggle between fixed and static navbar-->
    <script>
    $('#toggleNavPosition').click(function() {
      $('body').toggleClass('fixed-nav');
      $('nav').toggleClass('fixed-top static-top');
    });

    </script>
    <!-- Toggle between dark and light navbar-->
    <script>
    $('#toggleNavColor').click(function() {
      $('nav').toggleClass('navbar-dark navbar-light');
      $('nav').toggleClass('bg-dark bg-light');
      $('body').toggleClass('bg-dark bg-light');
    });

    </script>
    
         <script>
    $(document).ready(function(){
		$('#contenedor2').hide();
		$('#contenedor3').hide();
		$('#contenedor1').show();
		$('#solicitudes').hide();
		
		
		var inst=$('#institucion').val();
		var compara=$('#ins').val();
		<%if(tipo.equals("INSTITUCION")){%>
			//cargar div de INSTITUCION
				$('#solicitudes').show();
				$('#insti').show();
				$('#perfil').hide();
				$('#usu').hide();
				<%}%>
		<%if(tipo.equals("CEO")){%>
		///cargar div de CEO
				$('#perfil').show();
				$('#insti').hide();
				$('#usu').hide();
		<%}%>
		<%if(tipo.equals("PERFIL")){%>
		///// cargar div Perfil
				$('#usu').show();
				$('#insti').hide();
				$('#perfil').hide();
		<%}%>
						 });

		$('#configuracion').click(function(){
   		$('#contenedor1').hide();
   		$('#contenedor3').hide();
   		$('#contenedor2').show();
   		 });

		/*$('#Jython').click(function(){
   		$("#contenido").load("c_jython.html");
									 });*/
$('#solicitudes').click(function(){
	$('#contenedor2').hide();
	$('#contenedor1').hide();
	$('#contenedor3').show();
});			
	$('#cancelar').click(function(){
	$('#contenedor2').hide();
	$('#contenedor1').show();
});	
$('#inic').click(function(){
$('#contenedor2').hide();
$('#contenedor3').hide();
$('#contenedor1').show();
});	
		</script> 
    </div>
   
    
  
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/posteo.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/popper.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/jquery.range-min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/lib/slick/slick.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/script.js"></script>
<script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/perfil.js"></script>



</body>
</html>