<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="configuracion.Procedimiento"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--------------------------------------------------INICIO HEAD-------------------------------------------------->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--------------------------------------------------INICIO FILTRO-------------------------------------------------->
<%
HttpSession session2 = request.getSession( true );
session2.setAttribute("url", request.getContextPath());
System.out.println("rul--"+request.getContextPath());
String tipo = "";
String id = "0", id_posteo="0";
String usuario="";
String nombre="";
String apellido="";
String direccion="";
String fecha="";
String fecha_nac="";
String email="";
String sede="";
String institucion="";
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
System.out.println("tipo-- "+tipo);
System.out.println("id-- "+id);

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
		institucion=String.valueOf(datos.get(0).get(9));
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
	datos=proceso.FiltroGeneralString("SELECT id_registro,fecha,usuario,nombre,apellido,sexo,fecha_nac,correo,estado,institucion,' ',carrera FROM perfilvistaperfil WHERE id_registro="+id, "12", "PERFIL");
	/*datos=proceso.FiltroGeneralString("SELECT id_registro,fecha,usuario,nombre,apellido,sexo,fecha_nac,correo,estado FROM registro WHERE id_registro="+id, "9", "PERFIL");*/
	for(int i=0;i<datos.size();i++){
		//ci=String.valueOf(datos.get(0).get(1));
		System.out.println("usuario-- "+usuario);
		System.out.println("nombre-- "+nombre);
		usuario=String.valueOf(datos.get(0).get(2));
		nombre=String.valueOf(datos.get(0).get(3));
		apellido=String.valueOf(datos.get(0).get(4));
		sexo=String.valueOf(datos.get(0).get(5));
		fecha_nac=String.valueOf(datos.get(0).get(6));
		correo=String.valueOf(datos.get(0).get(7));
		institucion=String.valueOf(datos.get(0).get(9));
		sede=String.valueOf(datos.get(0).get(10));
		carrera=String.valueOf(datos.get(0).get(11));
	}
	
}

	ArrayList<ArrayList<String>> universidad = null;
	ArrayList<ArrayList<String>> carreras = null;
	ArrayList<ArrayList<String>> sedes = null;
	try{
		universidad=proceso.FiltroGeneralString("SELECT id_institucion,nombre FROM institucion  WHERE estado='ACTIVO' ORDER BY nombre asc", "2", "REGISTRO USUARIO");
		carreras=proceso.FiltroGeneralString("SELECT id_carrera,nombre FROM carrera ORDER BY nombre asc", "2", "REGISTRO USUARIO");
		//sedes=proceso.FiltroGeneralString("SELECT id_sede,nombre FROM sede ORDER BY nombre asc", "2", "REGISTRO USUARIO");
	}catch(Exception e){

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

<!--------------------------------------------------FIN FILTRO-------------------------------------------------->
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

<link rel="stylesheet" type="text/css" href="<%out.println(request.getContextPath()); %>/views/css-js/estilo-perfil.css">


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>RADE - <%out.print(tipo); %></title>
</head>
<!--------------------------------------------------FIN HEAD-------------------------------------------------->
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<!--------------------------------------------------INICIO NAV-------------------------------------------------->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
  					<div class="logo">
						<a href="/rade/perfil title="><img src="<%out.println(request.getContextPath()); %>/views/images/logo.png" alt=""></a>
					</div>
<!--------------------------------------------------INICIO RADE EXP-------------------------------------------------->
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
<!--------------------------------------------------FIN RADE EXP-------------------------------------------------->
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">        
       <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
			<!-- <h5>General</h5>  -->
               
			   <li class="nav-item" id="<%out.print(session2.getAttribute("usuario")); %>">
					<a class="nav-link" href="<% out.print(session.getAttribute("usuario"));%>">
						<i class="fa fa-fw fa-home"></i>
						<span class="nav-link-text">Perfil</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link activo" href="/rade/posteo">
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
			   
			   <li class="nav-item" id="solicitudes">
					<a class="nav-link" href="solicitudes">
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
<!--------------------------------------------------INICIO BOTON <> DE ABAJO-------------------------------------------------->
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
<!--------------------------------------------------FIN BOTON <> DE ABAJO-------------------------------------------------->
    </div>
  </nav>
<!--------------------------------------------------FIN NAV-------------------------------------------------->
<!--------------------------------------------------INICIO CONTENIDO PRINCIPAL-------------------------------------------------->
  <div class="content-wrapper">
    <div class="container-fluid">
<!--------------------------------------- INICIO POSTEO ----------------------------------------------------------->

   <input type="hidden" id="id_posteo" value="<% out.write(id_posteo); %>"/>
<div id="contenedorposteo">
		<div id="divbotones">
  		<button type="button" class="btn btn-light" id="verposteo">VER POSTEOS</button>
  		<button type="button" class="btn btn-light" id="miposteo">MIS POSTEOS</button>
  		<button type="button" class="btn btn-light" id="nuevoposteo">NUEVO POSTEO</button>
  	</div>
  	<!-- INICIO VER MI POSTEO -->
          		<div class="card mb-3" id=divmiposteo>
        		<!-- <div class="card-header" id="datosPerfil">
          			<i class="fa fa-user"></i>
          			<span>Mis Posteos</span> 
          			
          		</div> -->
          		<div class="form-group input-group">
                  <input class="form-control" type="text" placeholder="Buscar...." id="busquedaposteo">
                  <input type="hidden" id="id_perfil" value="<% out.print(id_perfil); %>">
                 <button class="btn btn-success btn-circle" type="button"  id="busca" onclick="cargarposteo('0');"><i class="fa fa-search"></i></button>                          
                 </div>	
                
			        <div class="table-responsive" id="divposteo">
			   <!-- Inicio Tabla -->

	    		<table class="table-responsive" id="tablaPosteo">
                     <thead>
                        <tr>
        
                        </tr>
                      </thead>
                      <tbody>
                       </tbody>
                    </table>
	   
            <!-- FIN DE TABLA -->
					  
				    </div>
					<div class="ajax-load1 text-center">
				    <!-- <p><img src="views/img/status.gif"></p>  -->
				</div>
				<div class="fin1 text-center" style="display: none;">
				    <!-- Fin de scroll	-->    
				</div>
          	</div>
			<!-- FIN VER MI POSTEO -->  
			
				<!-- INICIO VER POSTEO -->
          		<div class="card mb-3" id="divverposteo">
        		<!-- <div class="card-header" id="datosPerfil1">
          			<i class="fa fa-user"></i>
          			<span>Posteos</span> 
          			
          		</div> -->
          		<div class="form-group input-group">
                  <input class="form-control" type="text" placeholder="Buscar...." id="busquedaposteo">
                <%--   <input type="hidden" id="id_perfil" value="<% out.print(id_perfil); %>"> --%>
                 <button class="btn btn-success btn-circle" type="button"  id="busquedaTodoposteo" onclick="cargartotsposteo('0');"><i class="fa fa-search"></i></button>                          
                 </div>	
                
			        <div class="posteo" id="divposteomuro">
			   <!-- Inicio Tabla -->
	    <!--  <table id="tablaposteomuro">
	   
            </table> -->
           
            <!-- FIN DE TABLA -->
					  
				    </div>
					<!-- <div class="ajax-load2 text-center">
				    <p><img src="views/img/status.gif"></p>
				</div> -->
				<div class="fin2 text-center" style="display: none;">
				    <!-- Fin de scroll	-->    
				</div>
          	</div>
			<!-- FIN VER POSTEO --> 
			
			<!-- NUEVO POSTEO class="content-wrapper"-->
			 <div id="divnuevoposteo">
    <div class="container-fluid">
      
      <div class="main-section-data">
						<div class="row">
		
				<%--  <input type="hidden" id="id_perfil" value="<% out.write(id_perfil); %>"/> --%>
		
				<div class="col-lg-9">
			
				<div class="post-bar">
                    <div class="container">                 
                        <form>
 						    <div class="form-group"> </div>
    						

  							<div class="form-group">
  								
  							<input class="form-control " type="text" placeholder="Escriba aqui el título de la publicación"  id="titulo" maxlength="50" autofocus>
							
					 
 							 </div>

 							<div>
    								 	
    				 			<div class="form-group" >
    				 				<textarea ></textarea>
    		                         
   								</div>

   							</div>

                     	 <div id="mensaje" class="form-group"></div>	  

   							<div class="row">
   							<div class="col-lg-3">	

   							</div>	
   						

   							<div class="col-lg-6">	
    				
 						<button type="button" class="btn btn-success btn-block"  onclick="publicar()">Publicar</button>
								
  						</div>
  						
  					          
  						</div>
									<div class="form-group"></div>
						</form>


					</div>

				</div>
					
			</div>
			
			<div class="col-lg-3">
				<div class="filter-secs">
					<div class="filter-heading">			
						   <h3>Configuraciones</h3>
										<!-- 	<a href="/RADE/posteos">Busqueda Posteo</a> -->
									</div><!--filter-heading end-->
								<div class="paddy">
										
									<div class="filter-dd">
										<div class="filter-ttl">
											


											<h3>Temas</h3>
										</div>	
					<div>
                 	
                	<select  class="form-control" id="temas" >
                		<option disabled selected>Seleccione:</option>
                	<%
						try{
							for(int i=0; i<temas.size();i++){
								
								out.print("<option value='"+temas.get(i).get(0)+"'>"+temas.get(i).get(1)+"</option>");
							}
						}catch(Exception e){
							
						}
					%>
                </select>
                </div>
										</div>
								<div class="filter-dd">
									<div class="filter-ttl">
											<h3>Privacidad</h3>
											
									</div>
									
										<div>
                 	
                	<select  class="form-control" id="privacidad">
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
                </div>
									
									
                                <div class="form-group">
                             
  							   </div>

  									<div class="form-group"></div>
						</div>
						</div>
					</div><!-- main-section-data end-->
				</div> 
			</div>	
			
			
						
						
					
						</div> 
		</div>
   </div>
			<!-- FIN DE NUEVO POSTEO -->
			
			<!-- Ventana Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- Cuerpo Modal -->
        <div class="container">
  <h2>Elegir Puntuación</h2>
  <p></p>
  <div id="divhidden">
  </div>
  <form>
    <label class="radio-inline">
      <input type="radio" name="optradio" value="1" checked>  1 &emsp;  
    </label>
    <label class="radio-inline">
      <input type="radio" name="optradio" value="2" >  2 &emsp;  
    </label>
    <label class="radio-inline">
      <input type="radio" name="optradio" value="3" >   3 &emsp;  
    </label>
    <label class="radio-inline">
      <input type="radio" name="optradio" value="4" > 4  &emsp;  
    </label>
    <label class="radio-inline">
      <input type="radio" name="optradio" value="5" > 5  &emsp; 
    </label>
  </form>
</div>
		
        <!-- Fin Cuerpo Modal -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="guardar" onclick="guarda_puntaje_posteo();"    data-dismiss="modal">Guardar</button>
      </div>
    </div>
  </div>
</div>
<!-- Fin Ventana Modal -->		 
</div>
<!----------------------------------------------------------- FIN POSTEO ------------------------------------------->
<!--------------------------------------------------INICIO CONTENIDO PERFIL-------------------------------------------------->
    	<div class="row" id="contenedor1">
			<div class="col-lg-5">
    		
    		<div class="card mb-3" id="per">
        		<div class="card-header" id="datosPerfil">
          			<i class="fa fa-user"></i>
          			<span>Perfil</span> 
          			
          		</div>
          		<div class="card-body colorP">
          					
          						<div class="card-body colorP" id="ceo">
          						<img class="imagen" src="<%out.println(request.getContextPath()); %>/views/images/ceo.png" alt="">
     				
								<p>
									<!-- <h6 class="titu">CI:</h6><h6 class="h6"><% out.print(ci); %></h6> -->
									<h6 class="titu">Nombre y Apellido:</h6><h6 class="h6"><% out.print(nombre);%> <% out.print(apellido);%></h6>
									<h6 class="titu">Direccion:</h6><h6 class="h6"><% out.print(direccion); %></h6>
									<h6 class="titu">Telefono:</h6><h6 class="h6"><% out.print(telefono); %></h6>
									<h6 class="titu">E-mail:</h6><h6 class="h6"><% out.print(email); %></h6>
									<h6 class="titu">Pagina:</h6><h6 class="h6"><% out.print(pagina); %></h6>
									<h6 class="titu">Institucion:</h6><h6 class="h6"><% out.print(institucion); %></h6>
								
								</p>
								
								</div>
							
								<div class="card-body colorP" id="insti">
								<img class="imagen" src="<%out.println(request.getContextPath()); %>/views/images/utic.jpg" alt="">
     				
									<p>
									<!--  <h6 class="titu">Usuario:</h6><h6 class="h6"><% out.print(usuario); %></h6> -->
									<h6 class="titu">Nombre:</h6><h6 class="h6"><% out.print(nombre);%> <% out.print(apellido);%></h6>
									<h6 class="titu">Telefono:</h6><h6 class="h6"><% out.print(telefono); %></h6>
									<h6 class="titu">direccion:</h6><h6 class="h6"><% out.print(direccion); %></h6>
									<h6 class="titu">E-mail:</h6><h6 class="h6"><% out.print(email); %></h6>
								</p>
								</div>
							
								<div class="card-body colorP" id="usu">
								<img class="imagen" src="<%out.println(request.getContextPath()); %>/views/images/user.png" alt="">
     				
								<p>
									<h6 class="titu">Usuario:</h6><h6 class="h6"><% out.print(usuario); %></h6>
									<h6 class="titu">Nombre y Apellido:</h6><h6 class="h6"><% out.print(nombre);%> <% out.print(apellido);%></h6>
									
									<h6 class="titu">Sexo:</h6><h6 class="h6"><% out.print(sexo); %></h6>
									<h6 class="titu">Fecha Nac:</h6><h6 class="h6"><% out.print(fecha_nac); %></h6>
									<h6 class="titu">Correo:</h6><h6 class="h6"><% out.print(correo); %></h6>
									<h6 class="titu">Institucion:</h6><h6 class="h6"><% out.print(institucion); %></h6>
									<!--  <h6 class="titu">sede:</h6><h6 class="h6"><% //out.print(sede); %></h6>-->
									<h6 class="titu">Carrera:</h6><h6 class="h6"><% out.print(carrera); %></h6>
									
								</p>
								</div>
							
          			
          			</div>
          		</div>
          	</div>
          	
    		<div class="col-lg-4">
    		
    		<div class="card mb-3" id="con">
        		<div class="card-header" id="configurar">
          			<i class="fa fa-gears"></i> Configuraciones
          			
          		</div>
          		<div class="card-body colorP">
          		
          			<li class="list-inline-item" id="datosceo">
                       <a href="#">Cambiar Datos de Perfil</a>
                    </li>
                    
                    <li class="list-inline-item" id="datosinsti">
                       <a href="#">Cambiar Datos de Perfil</a>
                    </li>
                    
                    <li class="list-inline-item" id="datosusu">
                       <a href="#">Cambiar Datos de Perfil</a>
                    </li>
          		</div>
          	</div>
    		</div>
    		</div>
<!--------------------------------------------------CAMBIAR DATOS--------------------------------------------------> 
	<div class="row" id="contenedor2"> 	
	
    	<div class="col-lg-5">
    		
    		<div class="card mb-3" id="camdat">
        		<div class="card-header" id="cambiodate">
          			<i class="fa fa-refresh"></i> Cambiar Datos de Perfil
          			<input type="hidden" id="tipoacceso" value="<% out.print(tipo);%>">
          		</div>
          		
          			<div class="card-body colorP">
          				
          				<div id="ceoconfi">
          				<h6 class="titu">Nombre:</h6>
          				<input class="form-control" value="<%out.print(nombre);%>">
          				<br>
          				<h6 class="titu">Apellido:</h6>
          				<input class="form-control" value="<%out.print(apellido);%>">
          				<br>
          				<h6 class="titu">Dirección:</h6>
          				<input class="form-control" value="<%out.print(direccion);%>">
          				<br>
          				<h6 class="titu">Teléfono:</h6>
          				<input class="form-control" value="<%out.print(telefono);%>">
          				<br>
          				<h6 class="titu">Página:</h6>
          				<input class="form-control" value="<%out.print(pagina);%>">
          				<br>
          				<%-- <h6 class="titu">Institución:</h6>
          				<input class="form-control" value="<%out.print(institucion);%>"> --%>
          				
          				<h6 class="titu">Institucion:</h6>
          				<select class="form-control" id="instiPerfil">
          				<option value="0" disabled selected><% out.print(institucion); %></option>
          				
          				<%
						try{
							for(int i=0; i<universidad.size();i++){
								out.print("<option value='"+universidad.get(i).get(0)+"'>"+universidad.get(i).get(1)+"</option>");
							}
						}catch(Exception e){
							System.out.println("Error en filtro universidad"+e);
						}
						%>
					</select>
          				
          				<br>
          				</div>
          				
          				<div id="insticonfi">
          				<h6 class="titu">Nombre:</h6>
          				<input class="form-control" value="<%out.print(nombre);%>">
          				<br>
          				<h6 class="titu">Dirección:</h6>
          				<input class="form-control" value="<%out.print(direccion);%>">
          				<br>
          				<h6 class="titu">Teléfono:</h6>
          				<input class="form-control" value="<%out.print(telefono);%>">
          				<br>
          				</div>
          				
          				<div id="usuconfi">
          				
          				<h6 class="titu">Nombre:</h6>
          				<input class="form-control" value="<%out.print(nombre);%>" id="perfilnombre">
          				<br>
          				<h6 class="titu">Apellido:</h6>
          				<input class="form-control" value="<%out.print(apellido);%>" id="perfilapellido">
          				<br>
          				<h6 class="titu">Sexo:</h6>
          				<input class="form-control" value="<%out.print(sexo);%>" id="perfilsexo">
          				<br>
          				
          				
         
                
          				
          				<%-- <h6 class="titu">Institucion:</h6>
          				<input class="form-control" value="<%out.print(institucion);%>" id="perfilinstitucion"> --%>
          				<!-- /////////////////////////////////////// -->
          				<h6 class="titu">Institucion:</h6>
          				<select class="form-control" id="instiPerfil">
          				<option value="0" disabled selected><% out.print(institucion); %></option>
          				
          				<%
						try{
							for(int i=0; i<universidad.size();i++){
								out.print("<option value='"+universidad.get(i).get(0)+"'>"+universidad.get(i).get(1)+"</option>");
							}
						}catch(Exception e){
							System.out.println("Error en filtro universidad"+e);
						}
						%>
					</select>
          				<!-- /////////////////////////////////////// -->
          				
          				<br>
          				<!--  <h6 class="titu">Sede:</h6>-->
          				<select class="form-control" id="sedePerfil">
          				<!--<option value="0" disabled selected><% //out.print(sede); %></option>-->
          				
          				<%-- <%
						try{
							for(int i=0; i<sedes.size();i++){
								out.print("<option value='"+sedes.get(i).get(0)+"'>"+sedes.get(i).get(1)+"</option>");
							}
						}catch(Exception e){
							System.out.println("Error en filtro sedes"+e);
						}
						%> --%>
					</select>
          				<br>
          				<h6 class="titu">Carrera:</h6>
          				<!-- ///////////////////////////////////////////// -->
          				<select class="form-control" id="carreraPerfil">
          				<option value="0" disabled selected><% out.print(carrera); %></option>
          				
          				<%
						try{
							for(int i=0; i<carreras.size();i++){
								out.print("<option value='"+carreras.get(i).get(0)+"'>"+carreras.get(i).get(1)+"</option>");
							}
						}catch(Exception e){
							System.out.println("Error en filtro carreras"+e);
						}
						%>
					</select>
          				<%-- <input class="form-control" value="<%out.print(carrera);%>" id="perfilcarrera"> --%>
          				<br>
          				</div>
          					
          					<div class="centro">
          						<button class="btn btn-success" type="button" id="guardardatosperfil">Guardar</button>
          						<button class="btn btn-danger" type="button" id="cancel">Cancelar</button>
          					</div>
          			</div>
          	</div>
    	</div>
    	
    	<div class="col-lg-4">	
    		<div class="card mb-3" id="fotocam">
        		<div class="card-header" id="camfoto">
          			<i class="fa fa-gears"></i> Cambiar foto de perfil
          			
          		</div>
          		<div class="card-body colorP">
          		<img class="imagen" src="<%out.println(request.getContextPath()); %>/views/images/ceo.png" alt="">
          		<br>
          		<br>
          			<div>
          			<li class="list-inline-item" id="" >
                       <a href="#">Cambiar</a>
                       <a href="">Guardar</a>
                       <a href="">Cancelar</a>
                    </li>
          			<!-- <button class="btn btn-success" type="button">Guardar</button>
                    <button class="btn btn-danger" type="button">Cancelar</button> -->
         			</div>
         		</div>
          	</div>
    	</div>
    	
    </div>
<!--------------------------------------------------FIN CAMBIAR DATOS-------------------------------------------------->
<!--------------------------------------------------FIN CONTENIDO PERFIL-------------------------------------------------->
<!--------------------------------------------------INICIO SOLICITUDES-------------------------------------------------->
<div class="col-lg-12"  id="contenedor3">
        <div class="row content-list-head">
        	<div class="col-md-12" >
        		<div class="clearfix">
        	
        			<h3 class="float-left">Solicitudes</h3>
        		</div>
        	</div>
        	
        	<div class="col-md-12">
        		<div class="d-flex p-3 bg-secondary text-white">
	        		
        			<input type="text" class="form-control p-2 " id="busqueda" placeholder="Busqueda" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
        			<button class="btn btn-success p-2 bn-sm btn-block form-control" type="button" onclick="BuscarSolicitud('primero',<% out.print(id); %>);" >Buscar</button>
        		</div>

        	</div>
        	
        </div>
        
        <div class="row content-list-head">
	        
	        <div class="col-md-12">
	        <!-- Inicio Tabla -->
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
	        <!-- Fin Tabla -->
			</div>   
	    </div>
	    
	    <div class="row content-list-head" >
	    	<div class="col-sm-12">
	    	<span>Total de Registros: <span id="n_total_reg1">0</span> Mostrando de <span id="n_total_des">0</span> hasta <span id="n_total_has">0</span></span>
	    	</div>
	    	<div class="col-md-12 ">
	    
				<div class="col-sm-12 justify-content-end">
						<input type="hidden" id="n_pos1_autor" value="1">	
									
						<button type="button" id="n_n4" class="btn float-right" onclick="BuscarSolicitud('ultimo',<% out.print(id); %>);" style="color: #ffffff;background: #314456;" disabled="disabled">Ultimo</button> 
						<button type="button" id="n_n3" class="btn float-right" onclick="BuscarSolicitud('siguiente',<% out.print(id); %>);" style="color: #ffffff;background: #314456;" disabled="disabled">&raquo;</button>
						<button type="button" id="n_n2" class="btn float-right" onclick="BuscarSolicitud('anterior',<% out.print(id); %>);" style="color: #ffffff;background: #314456;" disabled="disabled">&laquo;</button>
						<button type="button" id="n_n1" class="btn float-right" onclick="BuscarSolicitud('primero',<% out.print(id); %>);" style="color: #ffffff;background: #314456;" disabled="disabled">Primero</button>
			    </div>
			</div>
        </div>
      </div> 

        	<input type="hidden" id="ins" value="INSTITUCION">			
			<input type="hidden" id="institucion" value="<%out.println(tipo);%>">
<!--------------------------------------------------FIN SOLICITUDES-------------------------------------------------->
</div>
<!--------------------------------------------------INICIO BARRA BAJA DE TOPE-------------------------------------------------->
     <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Proyecto RADE: Recurso Académico Digital Especifico ©</small>
        </div>
      </div>
    </footer> 
<!--------------------------------------------------FIN BARRA BAJA DE TOPE-------------------------------------------------->
<!--------------------------------------------------BOTON INICIO DE PAGINA-------------------------------------------------->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
<!--------------------------------------------------FIN BOTON INICIO DE PAGINA-------------------------------------------------->
<!--------------------------------------------------INICIO VENTANA MODAL-------------------------------------------------->
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
          <a class="btn btn-success" href="" id="cerrar">Salir</a>
            <button class="btn btn-danger" type="button" data-dismiss="modal">Cancelar</button>
            
          </div>
        </div>
      </div>
    </div>
<!--------------------------------------------------FIN VENTANA MODAL-------------------------------------------------->
</div>
<!--------------------------------------------------FIN CONTENIDO PRINCIPAL-------------------------------------------------->   
    <!-- Bootstrap core JavaScript-->
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/css-js/jquery.min.js"></script>
    
<!--------------------------------------------------INICIO SCRIPT-------------------------------------------------->
     <script>
    $(document).ready(function(){
    	$('#contenedorposteo').show();
    	$('#contenedor2').hide();
    	$('#contenedor3').hide();
    	$('#contenedor1').hide();
    	$('#solicitudes').hide();
    	$('#divcomentario').hide();
    	$('#divmiposteo').hide();
    	$('#divnuevoposteo').hide();
    	$('#divverposteo').click();
    	
		
		var inst=$('#institucion').val();
		var compara=$('#ins').val();
		<% if(tipo.equals("INSTITUCION")){%>
			//cargar div de INSTITUCION
				$('#solicitudes').show();
				$('#insti').show();
				$('#datosinsti').show();
				$('#insticonfi').show();
				$('#ceo').hide();
				$('#datosceo').hide();
				$('#ceoconfi').hide();
				$('#usu').hide();
				$('#datosusu').hide();
				$('#usuconfi').hide();
				
				<%}%>
		<% if(tipo.equals("CEO")){%>
		///cargar div de CEO
			$('#solicitudes').show();
				$('#ceo').show();
				$('#datosceo').show();
				$('#ceoconfi').show();
				$('#insti').hide();
				$('#datosinsti').hide();
				$('#insticonfi').hide();
				$('#usu').hide();
				$('#datosusu').hide();
				$('#usuconfi').hide();
			
				
		<%}%>
		<% if(tipo.equals("PERFIL")){%>
		///// cargar div Perfil
				$('#usu').show();
				$('#datosusu').show();
				$('#usuconfi').show();
				$('#insti').hide();
				$('#datosinsti').hide();
				$('#ceo').hide();
				$('#datosceo').hide();
				$('#solicitudes').hide();
		<%}%>
						 });

		$('#datosceo').click(function(){
   			$('#contenedor1').hide();
   			$('#contenedor3').hide();
   			$('#contenedor2').show();
   			$('#insticonfi').hide();
   			$('#usuconfi').hide();
   			$('#contenedorposteo').hide();
   		 });
		$('#datosinsti').click(function(){
	   		$('#contenedor1').hide();
	   		$('#contenedor3').hide();
	   		$('#contenedor2').show();
	   		$('#usuconfi').hide();
	   		$('#ceoconfi').hide();
	   		$('#contenedorposteo').hide();
	   	});
		$('#datosusu').click(function(){
	   		$('#contenedor1').hide();
	   		$('#contenedor3').hide();
	   		$('#contenedor2').show();
	   		$('#ceoconfi').hide();
	   		$('#insticonfi').hide();
	   		$('#contenedorposteo').hide();
	   	});

		/*$('#Jython').click(function(){
   		$("#contenido").load("c_jython.html");
									 });*/
$('#solicitudes').click(function(){
	$('#contenedor2').hide();
	$('#contenedor1').hide();
	$('#contenedorposteo').hide();
	$('#contenedor3').show();
});			
	$('#cancel').click(function(){
	$('#contenedor2').hide();
	$('#contenedor1').show();
});	
$('#inic').click(function(){
$('#contenedor2').hide();
$('#contenedor3').hide();
$('#contenedor1').show();
});	

$('#perfil').click(function(){
		$('#contenedor1').show();
		$('#contenedor3').hide();
		$('#contenedor2').hide();
		 });
		</script>
<!--------------------------------------------------INICIO SCRIPT EXP-------------------------------------------------->
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
<!--------------------------------------------------FIN SCRIPT EXP-------------------------------------------------->
<!--------------------------------------------------FIN SCRIPT-------------------------------------------------->

    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/css-js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/css-js/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/css-js/sb-admin.min.js"></script>
    
 	<script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/css-js/perfil.js"></script>
	<script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/css-js/solicitud.js"></script>
	
	
	<!-- POSTEO -->
	  <script type="text/javascript" src="<%=request.getContextPath() %>/views/js/posteo.js"></script>
 		<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/popper.js"></script>
 		<script src="<%=request.getContextPath() %>/views/tinymce/tinymce.min.js"></script>
  		<script type="text/javascript" src="<%=request.getContextPath() %>/views/lib/slick/slick.min.js"></script>
  		<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/jquery.range-min.js"></script>
  	  <script>
     tinymce.init({selector:'textarea',autoresize_max_height: 315,language:'es',

 plugins: ['autolink,autoresize,charmap,textcolor colorpicker,hr,image,imagetools,paste,imagetools,insertdatetime,link,preview,print,searchreplace,table,wordcount,lists '],
 toolbar: 'undo redo | styleselect | forecolor backcolor| bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview  fullpage   ',
 paste_data_images: true,
branding: false,
force_br_newlines :true,
force_p_newlines : false,
forced_root_block : false,
});
     </script>
  
  
  	<!-- FIN POSTEO -->
</body>
</html>






