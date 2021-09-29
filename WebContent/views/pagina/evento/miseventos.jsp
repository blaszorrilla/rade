<%-- <%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%> --%>
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
String id_perfil = "";
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
		System.out.print(id+" id----");
		nombre=String.valueOf(datos.get(0).get(2))+", "+String.valueOf(datos.get(0).get(3));
	}
}else if(tipo.equals("INSTITUCION")){
	
}else if(tipo.equals("PERFIL")){
	
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
					<a class="nav-link activo" href="/rade/evento">
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
  
  
  
  
			<div class="main-section">
  
  <div class="content-wrapper">
    <div class="container-fluid">
    
      <!-- INICIO DE CONTENIDO PRINCIPAL -->
      
      <div class="main-section-data">
						<div class="row">
		
							
				<!-- Fin de datos de perfil de costado -->
				
				<div class="col-lg-9">
				<div class="post-bar">
                <div class="container">       
              <%--   <input type="hidden" id="id_perfil" value="<% out.write(id); %>"/> --%>
                
                	          
                   
         
           <div class="row">
            <div class="col-sm-12">
            
            <div class="form-group"> </div>	
					
			
          <!--   ------------------------------------------------------------------------------------------------------------------ -->
        	<!-- INICIO SOLICITUD -->
        		
        		<div class="form-group input-group">
                  <input class="form-control" type="text" placeholder="Buscare...." id="busqueda">
                  <input type="hidden" id="id_perfil" value="<% out.print(id_perfil); %>">
                 <button class="btn btn-success btn-circle" type="button" onclick="cargar_mas(0);"><i class="fa fa-search"></i></button>                     
                 </div>	
        	
        	
        	
        	
        	
	
	 
          
                 
        	
  
        
        <div class="row content-list-head">
	        
	     <!-- <div id="divevento"></div> -->
	        <!-- Inicio Tabla -->
	  <table class="table table-striped" id="tablaevento">
	    
		 <thead>
         <tr>
          <th style="width:15%" class="visible-md visible-lg visible-sm">T&iacutetulo</th>
			                <th class="textoderecha">Fecha</th>
			                <th class="visible-md visible-lg">Hora</th>
			                <th class="textoderecha">Ubicaci&oacuten</th>  
			                <th style="width:15%" class="textoderecha">Cantidad de Asistencia</th>
			                
			                  
         </tr>
         </thead>
        <tbody>
	                

              </tbody>
            </table> 
	        
           <div class="form-group"> </div>	  
        <!--     ------------------------------------------------------------------------------------------------------------------ -->
             
               <div class="form-group"> </div>	
            </div>
            <div id="mensaje1" class="form-group"></div>
          </div>
            

					</div>

				</div>
					
			</div>
<!-- ------------------------------------------------------------ -->			
		     
								
				
		 	
				
				
				
			
				</div> 
<!-- ------------------------------------------------------------ -->			
		     
						
				
				
				
				
				
				
				
				
				
				
				
				
				
				
						
					
				</div> 
						</div>
						</div>
						
	 <!-- Pie de pagina-->
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
    
    $(window).scroll(function() {
        if($(window).scrollTop() + $(window).height() >= $(document).height()) {
        var last_id = $(".post-id:last").attr("id");
            if (last_id>1) {
            	console.log("ingresooo scroll "+last_id);
                cargar_mas(last_id);
            }else{
                $('.ajax-load').hide();
                $('.fin').show();
            }
        }
    });
    
    function cargar_mas(ultimo){
    	console.log("ingresooo cargar mas "+ultimo);
    	var datos=$('#busqueda').val();
    	var id=$('#id_perfil').val();

    		accion='Filtromisevento';
    		$.ajax
    		    ({
    		    type: "POST",           
    		    data: {process:accion,id:id,datos:datos,ultimo:ultimo},
    		    url: 'controlador',
    		    success:function(datos)
    		    {
    		    	
    		    	$("#tablaevento tbody tr").remove();
    		    	/* $("#divevento").html(""); */
    		    	var jsonData = JSON.parse(datos);
    		    	console.log(jsonData);
    				for (var i = 0; i < jsonData.contenido.length; i++) {
    						var resul = jsonData.contenido[i];
    					for (var j = 0; j < resul.datos.length; j++) {
    						var valor = resul.datos[j];
    						 var nuevaFila="<tr>"; 
    			                nuevaFila+="<td class=\"visible-md visible-lg visible-sm\">"+valor.titulo+"</td>";
    			                 nuevaFila+="<td class=\"textoderecha\">"+valor.fecha+"</td>";
    			                nuevaFila+="<td class=\"visible-md visible-lg\">"+valor.hora+"</td>";
    			                nuevaFila+="<td class=\"textoderecha\">"+valor.ubicacion+"</td>";
    			                nuevaFila+="<td class=\"textoderecha\">"+valor.asistencia+"</td>";
    			                nuevaFila+="<td class=\"textoderecha\">" +
    			                "<td align=\"lefth\" class=\"actions\"><button class=\"icon\" title=\"Eliminar Evento\" onclick=\"borrarevento("+valor.codigo+")\"   aria-label=\"Left Align\"><span class=\"fa fa-fw fa-trash-o  \"></span></button>" +
    			                "<td class=\"actions\"><button class=\"icon\" title=\"Modificar Evento\" onclick=\"mod()\" aria-label=\"Left Align\"><span class=\"fa fa-fw fa-gear \"></span></button>"+   			               
    				            "</td>"; 
    			                nuevaFila+="</tr>";
    			                
    						
    		               console.log("ingresooo valor "+nuevaFila);
    		               $("#tablaevento").append(nuevaFila);
    					}
    				}
    				
    		    },
    		    error : function(xhr, status) 
            {
                  alert('sin respuesta...');
            }
    		    });
    }
    
    
    </script>

   
    
  
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/evento2.js"></script> 
 <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
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