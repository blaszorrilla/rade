<%@page import="java.util.ArrayList"%>
<%@page import="configuracion.Procedimiento"%>
<html lang="en">
<head>



<!-- <style type="text/css">
.login-card {
  margin-top: 25%;
  }
</style> -->
<%
String id_perfil="";
String idevento="";

HttpSession session2 = request.getSession( true );
session2.setAttribute("url", request.getContextPath());
System.out.println("rul--"+request.getContextPath()); 
String tipo = "";
String id = "0";

String usuario="";
String apellido="";
String fecha="";
String fecha_nac="";
String correo="";
String universidad="";
String carrera="";

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
String nombre="";
ArrayList<ArrayList<String>> datos= null;
Procedimiento proceso=new Procedimiento();
if(tipo.equals("CEO")){
	datos=proceso.FiltroGeneralString("SELECT id_ceo,ci,nombre,apellido,direccion,telefono,email,pagina,estado FROM ceo WHERE id_ceo="+id, "9", "PERFIL");
	for(int i=0;i<datos.size();i++){
		nombre=String.valueOf(datos.get(0).get(2))+", "+String.valueOf(datos.get(0).get(3));
	}
}else if(tipo.equals("INSTITUCION")){
	
}else if(tipo.equals("PERFIL")){
	
} 
%>
 <%
  String url = String.valueOf(request.getAttribute("javax.servlet.forward.request_uri"));
ArrayList<ArrayList<String>> desdeurl = null;
ArrayList<ArrayList<String>> desdeenlace = null;
ArrayList<ArrayList<String>> cargar = null;
try{

	
	
	desdeenlace=proceso.FiltroGeneralString("SELECT `id_evento` FROM `enlace_evento` INNER JOIN `enlacesistema` ON `enlacesistema`.`id_enlacesistema`=`enlace_evento`.`id_enlacesistema`  WHERE `enlacesistema`.`url`='"+url+"'","1","");

	for(int i=0;i<desdeenlace.size();i++){
		idevento=desdeenlace.get(i).get(0);
	}
	
	System.out.println("evento "+ idevento);
	cargar=proceso.FiltroGeneralString("SELECT evento.`titulo` AS titulo, evento.`fecha` AS fecha, evento.`ubicacion` AS ubicacion, perfil.`usuario` AS usuario, evento.`contenido` FROM evento LEFT JOIN perfil ON evento.`id_prefil`=perfil.`id_prefil` WHERE evento.`id_evento`="+idevento,"5","");
	
	
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
ArrayList<ArrayList<String>> comentarios = null;
try{
	
	comentarios=proceso.FiltroGeneralString("SELECT pe.usuario,DATE_FORMAT(pc.fecha, '%d %b %Y' ' a las '  '%H:%i:%s'),pc.texto FROM evento_comentario pc INNER JOIN perfil pe ON pe.id_prefil=pc.id_prefil WHERE pc.id_evento="+idevento, "3", "busca comentario");
}catch(Exception e){
	
}

%>





<link rel="shortcut icon" href="views/images/logo.png"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="keywords" content="" />

<!-- Bootstrap core CSS-->
<link rel="stylesheet" type="text/css" href="<%out.println(request.getContextPath()); %>/views/css/bootstrap.css">



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

<body class="fixed-nav sticky-footer bg-dark" id="page-top" onload="Buscarevento('primero',<% out.print(id); %>);">
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
               
			    <li class="nav-item" id="<%out.print(session2.getAttribute("usuario")); %>">
					<a class="nav-link activo" href="">
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
					<a class="nav-link" href="/rade/evento">
						<i class="fa fa-fw fa-table"></i>
						<span class="nav-link-text">Eventos</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="/rade/archivo">
						<i class="fa fa-fw fa-clone"></i>
						<span class="nav-link-text">Archivos</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="/rade/solicitudes">
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
  
<!-- ----------------------------------------------------------------------------------------------------------------------  --> 
   <div class="main-section-data">
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
  							<input type="hidden" id="id_evento" value="<% out.write(idevento); %>"/> 
  											 	
  						     <%
                            for(int i=0;i<cargar.size();i++){
                        		
                        		out.print("<div class=\"evento\"><center><h3>"+(cargar.get(i).get(0))+"</h3></center>");
                        	}
                            %> 	
                            <br>	
  							<%
                            for(int i=0;i<cargar.size();i++){
                            	out.print("<div class=\"evento\"><center><p>"+(cargar.get(i).get(4))+"</p></center>");       	
                            	out.print("<div class=\"evento\"><center><p>"+(cargar.get(i).get(2))+"</p></center>");
                            	out.print("<div class=\"evento\"><center><p>"+(cargar.get(i).get(1))+"</p></center>");
                            	out.print("<div class=\"evento\"><center><p>"+(cargar.get(i).get(3))+"</p></center>");
                            	
                            	
                            	
              
               
                
                        	}
                            %> 		
  						  
  						    <br> 
  						   <br> 
  						   <br>
  						 	
  						    				
 							 </div> 
 							 	
		 				</div>	
					</div>
					             
   				</div>	
    		                         							
   	         </div>	
   												
   			
   														   
	<div class="form-group"> </div>
						
		<!-- 	---------------------------------segundo contenedor----------------------------------------------------- -->

    
			<div class="row">
		
		<div class="col-lg-12">
			<div class="post-bar">
                   <div class="container">               
                        		
 						  
    						
  						<div class="form-group">
  					 	<%
                            for(int i=0;i<comentarios.size();i++){
                        		
                        	  	out.print("<div class=\"evento\">"
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
    								 	
    				 						 <div class="form-group" >
    				 							<div class="card-header">	
    				 							      <div class="row">
   							
   															<div class="col-lg-12">
   								
                                 								<textarea class="form-control" rows="2"  placeholder="Agrega tu comentario...." id="textcomentario" maxlength="200"></textarea>
                               								</div>
                            				<div class="col-lg-2">	
                                  				<button type="button" class="btn btn-success " onclick="guardarcomentarioevento()">Enviar</button>
                                  
                            				</div>
                                 
   										</div>	
    		                         
   									</div>
   								
   								 </div> 
  					           </div>	
 							 	
		 					</div>	
					</div>
					
			    </div>
		      </div>							
	      	 </div>
          </div>
 
   
  <!--   
      <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Proyecto RADE: Recurso Académico Digital Especifico ©</small>
        </div>
      </div>
    </footer> -->
  
 
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
    
 

    
   

   
    
  
    <script type="text/javascript" src="<%=request.getContextPath() %>/views/js/evento.js"></script> 
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/jquery.easing.min.js"></script>
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/sb-admin.min.js"></script>
    
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
</div>
</body>
</html>