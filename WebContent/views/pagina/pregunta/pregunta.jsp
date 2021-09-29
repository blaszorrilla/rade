
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
	String id_perfil="",id_pregunta="0",min_pregunta="0";

HttpSession session2 = request.getSession( true );
session2.setAttribute("url", request.getContextPath());
System.out.println("rul--"+request.getContextPath()); 
String tipo = "";
String id = "0";
session2.setAttribute("url",String.valueOf(request.getAttribute("javax.servlet.forward.request_uri")));


 if(session2.getAttribute("login")!=null){
	String valor=String.valueOf(session2.getAttribute("login"));
	if(valor.equals("si")){
		tipo=String.valueOf(session2.getAttribute("tipo"));
		id=String.valueOf(session2.getAttribute("id"));
		System.out.println("abrio");
	
	}else{
		response.sendRedirect("index");
	}
}else{
	response.sendRedirect("index");

}
%>
<%
	Procedimiento proceso=new Procedimiento();
ArrayList<ArrayList<String>> temas = null;
ArrayList<ArrayList<String>> privacidad = null;
try{
	
	temas=proceso.FiltroGeneralString("SELECT id_temas,tema FROM temas WHERE estado='ACTIVO' ORDER BY id_temas ", "2", "busca temas");
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
<link rel="stylesheet" type="text/css" href="<% out.println(request.getContextPath()); %>/views/css/posteo.css"> 

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
						<a href="" title=""><img src="<%out.println(request.getContextPath()); %>/views/images/pregunta.png" alt=""></a>
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
					<a class="nav-link" href="/rade/posteo">
						<i class="fa fa-fw fa-edit"></i>
						<span class="nav-link-text">Publicaciones</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link activo" href="/rade/pregunta">
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
			<!-- 	<li class="nav-item">
					<a class="nav-link" href="/rade/informepregunta">
						<i class="fa fa-fw fa-file-pdf-o  "></i>
						<span class="nav-link-text">Informes Preguntas</span>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/rade/informetema">
						<i class="fa fa-fw fa-file-pdf-o  "></i>
						<span class="nav-link-text">Informe Temas</span>
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
   <input type="hidden" id="id_perfil" value="<% out.write(id_perfil); %>"/>
   <input type="hidden" id="id_pregunta" value="<% out.write(id_pregunta); %>"/>
    <input type="hidden" id="min_pregunta" value="<% out.write(min_pregunta); %>"/>
  
<!--   ------------------------------------------------RADIO BUTTONS -------------------------------------------------------------------  -->      
  <center>
   <div class="form-group">
   <button type="button" class="btn btn-link" id="AbrirContenedor4" >Preguntas</button>
   <button type="button" class="btn btn-link" id="AbrirContenedor2">Formular Preguntas</button>
   <button type="button" class="btn btn-link" id="AbrirContenedor1">Mis Preguntas</button>
   </div>	
  </center>	

  <!--  ----------------------------------------CONTENEDOR PARA FORMULAR PREGUNTA-------------------------------------------------- 	 -->
						
			<div id=contenedor2>
				<div class="row">
					<div class="col-lg-9">

						<div class="container">
							<div class="form-group">
								<h6>Titulo</h6>
								<input class="form-control " type="text" placeholder="¿Cual es tu pregunta ?" id="titulo" onkeyup="this.value=NumText(this.value)"  onblur="verifica()" maxlength="50" >
							</div>
							<div class="form-group">
								<h6>Descripción</h6>
								<textarea></textarea>
							</div>
						</div>
						<!-- FIN DEL CONTAINER -->
					</div>
					<!-- FIN DE COL 9	 -->
					<div class="col-lg-3">
						<div class="container">
							<div class="form-group">
								<h6>Tema</h6>
								<select class="form-control" id="temas">
									<option disabled selected>Seleccione:</option>
									<%
										try {
											for (int i = 0; i < temas.size(); i++) {
												out.print("<option value='" + temas.get(i).get(0) + "'>" + temas.get(i).get(1) + "</option>");
											}
										} catch (Exception e) {

										}
									%>
								</select>
							</div>
							<div class="form-group">
								<h6>Privacidad</h6>
								<select class="form-control" id="privacidad">
									<option disabled selected>Seleccione:</option>
									<%
										try {
											for (int i = 0; i < privacidad.size(); i++) {
												out.print("<option value='" + privacidad.get(i).get(0) + "'>" + privacidad.get(i).get(1)
														+ "</option>");
											}
										} catch (Exception e) {

										}
									%>
								</select>
							</div>

						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-9">
						<div class="container">
							<div id="msj" class="form-group"></div>
							<div class="row">
								<div class="col-lg-4"></div>
								<div class="col-lg-4">
									<button type="button" class="btn btn-primary btn-block" id="publica" onclick="preguntar()">Publicar</button>
								</div>
  
               
							</div>

						</div>
					</div>
				</div>
				<div class="form-group"></div>
			</div>
<!-- --------------------------------------- MIS PREGUNTAS----------------------------------------------------------------- -->
			<div id=contenedor1>
				<div class="row">
					<div class="col-lg-9">

						<div class="container">

							
							
							<div class="form-group input-group">
                 <input class="form-control" type="text" placeholder="Buscar en Mis Preguntas" id="mibusqueda">
                                           
                 <button class="btn btn-success " type="button" onclick="cargar_mis_preguntas('0')" ><i class="fa fa-search"></i></button>
                                           
                 </div>	

							<div class="x_content">

								<table class="table table-striped projects" id="tablaMisPreguntas">
									<thead>
										<tr>
											<th style="width: 30%"></th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
			<div class="ajax-mispregun text-center">
			<p class="form-control-static"><i class="fa fa-chevron-down  "></i></p>
			</div>   
			 <div class="finmispregun text-center" style="display: none;">
		 <p class="form-control-static"><i class="fa fa-chevron-up"></i> 
			<!--   <button type="button" class="btn btn-Default btn-circle"  onclick="cargar_mis_preguntas('0')"><i class="fa fa-chevron-up"></i></button>
		  -->
			</div>   

							</div>

						
						</div>


						<div class="form-group"></div>
					</div>
				</div>


			</div>
			<!-- 	------------------------------------------------------------MURO DE PREGUNTAS-------------------------------------					 -->
        <div id=contenedor4> 
      		
	        <div class="row">
          	<div class="col-lg-9" >
            <div class="container"> 
                              
        <div class="form-group input-group">
                 <input class="form-control" type="text" placeholder="Buscar en Preguntas" id="busqueda" >
                                           
                 <button class="btn btn-success " type="button" onclick="cargar_mas_muro('0')" ><i class="fa fa-search"></i></button>
                                           
                 </div>	

        <div class="x_content">	
	
        	     <table class="table table-striped projects" id="tablaPreguntas">
                     <thead>
                        <tr>
                  
                          <th style="width: 11%"></th>
                       
                        </tr>
                      </thead>
                      <tbody>
                       </tbody>
                    </table>
        	
        
			
         	  <div class="ajax-load text-center">
			<p class="form-control-static"><i class="fa fa-chevron-down  "></i></p>
				</div>   
			 <div class="fin text-center" style="display: none;">
			 <button type="button" class="btn btn-Default btn-circle"  onclick="cargar_mas_muro('0')"><i class="fa fa-chevron-up"></i></button>
			</div>   
        
     
    
             
               <div class="form-group"> </div>	
            </div>
          </div>
            
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
          <div class="modal-body">Selecciona "Salir" para desconectarte del sitio.</div>
          <div class="modal-footer">
            <button class="btn btn-danger" type="button" data-dismiss="modal">Cancelar</button>
            <a class="btn btn-success" href="javascript:void(0);" id="cerrar">Salir</a>
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

  </div>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/pregunta.js"></script>
<script src="<%=request.getContextPath() %>/views/tinymce/tinymce.min.js"></script>




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
/* 
   setInterval("cargar_mas_muro('0');",20000);    */

    var max_chars = 250; //max characters
    var max_for_html = 400; //max characters for html tags
    var allowed_keys = [8, 13, 16, 17, 18, 20, 33, 34, 35, 36, 37, 38, 39, 40, 46];
    var chars_without_html = 0;

    function alarmChars() {
        if (chars_without_html > (max_chars - 25)) {
            $('#chars_left').css('color', 'red');
        } else {
            $('#chars_left').css('color', 'gray');
        }
    }

    $(function () {
    	tinymce.init({selector:'textarea',language:'es', width: '100%', height: 200, autoresize_min_height: 200, autoresize_max_height: 200, 
    		menubar:false,
    		 plugins: ['autolink,autoresize,charmap,textcolor colorpicker,hr,image,imagetools,paste,imagetools,insertdatetime,link,preview,print,searchreplace,table,wordcount,lists '],
 	
    	  toolbar: 'undo redo | bold italic underline |forecolor backcolor | alignleft aligncenter alignright alignjustify | bullist numlist  | ',	
    		branding: false,
    		

           setup: function (ed) {
                ed.on("KeyDown", function (ed, evt) {
                    chars_without_html = $.trim(tinyMCE.activeEditor.getContent().replace(/(<([^>]+)>)/ig, "")).length;
                    chars_with_html = tinyMCE.activeEditor.getContent().length;
                    var key = ed.keyCode;

                    $('#chars_left').html(max_chars - chars_without_html);

                    if (allowed_keys.indexOf(key) != -1) {
                        alarmChars();
                        return;
                    }

                    if (chars_with_html > (max_chars + max_for_html)) {
                        ed.stopPropagation();
                        ed.preventDefault();
                    } else if (chars_without_html > max_chars - 1 && key != 8 && key != 46) {
                     	 $("#msj").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button><strong>Atencion</strong> - Limite de caracteres</div>");
                   
                        ed.stopPropagation();
                        ed.preventDefault();
                    }
                    alarmChars();
                });
            },

          
        });

        chars_without_html = $.trim($('textarea').text().replace(/(<([^>]+)>)/ig, "")).length;
        $('#chars_left').html(max_chars - chars_without_html);
        alarmChars();
    });
    
    $(document).ready(function(){
    	$("#cerrar").click(function(){
    		
    		$.ajax({
    			url : "controlador",
    			method: "POST",
    			data: { process:"cerrar"},
    			success: function(respuesta){
    				console.log(respuesta);
    				location.reload();
    				//location.href = respuesta;
    			},
    			error: function(jqXHR, exception){
    				$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
    			}
    		});

    		
    	});
    });
</script>
</body>
</html>
  