<%@page import="java.util.ArrayList"%>
<%@page import="configuracion.Procedimiento"%>
<html lang="en">
<head>

<link rel="shortcut icon" href="<%=request.getContextPath() %>/views/images/Logoo_rade-copia.png"/>


<style type="text/css">
.login-card {
  margin-top: 25%;
<%
String id_perfil="";
String codigo="";
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




 <link rel="stylesheet" type="text/css" href="<%out.println(request.getContextPath()); %>/views/css/bootstrap.css">
 <link rel="stylesheet" type="text/css" href="<% out.println(request.getContextPath()); %>/views/css/evento2.css">
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
  <title>R.A.D.E.</title>
 
  
  
</head>

<body class="fixed-nav sticky-footer bg-light" id="page-top">
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
					<a class="nav-link" href="#">
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
  							<input type="hidden" id="id_evento" value="<% out.write(codigo); %>"/> 
  											 	
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
   							
   											<div class="col-lg-10">
   								
                                 				<textarea class="form-control" rows="2"  placeholder="Agrega tu comentario...." id="textcomentario" maxlength="200"></textarea>
                               					</div>
                            				<div class="col-lg-2">	
                                  				<button type="button" class="btn btn-success " onclick="guardarcomentarioevento();">Enviar</button>
                                  
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
   </div>
   
   
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Proyecto RADE: Recurso Académico Digital Especifico ©</small>
        </div>
      </div>
    </footer>
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
    
  
    <script type="text/javascript" src="<%=request.getContextPath() %>/views/js/evento.js"></script>
    
 <!-- Bootstrap core JavaScript-->
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/css/jquery.min.js"></script>
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/css/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/css/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/css/sb-admin.min.js"></script>




</body>
</html>