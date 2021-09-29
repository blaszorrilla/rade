<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<link rel="shortcut icon" href="views/images/logo.png"/>
<link rel="stylesheet" type="text/css" href="<%out.println(request.getContextPath()); %>/views/css/bootstrap.min.css">

<style type="text/css">
.login-card {
  margin-top: 25%;
  

  
  
<%
String codigo="";
String usuario="";
String nombre="";
String apellido="";
String fecha="";
String fecha_nac="";
String correo="";
String universidad="";
String carrera="";
/*
HttpSession session2 = request.getSession( true );
if(session2.getAttribute("login")!=null){
	
	String valor=String.valueOf(session2.getAttribute("login"));
	 codigo=String.valueOf(session2.getAttribute("codigo"));
	 usuario=String.valueOf(session2.getAttribute("usuario"));
	 nombre=String.valueOf(session2.getAttribute("nombre"));
	 apellido=String.valueOf(session2.getAttribute("apellido"));
	 fecha_nac=String.valueOf(session2.getAttribute("fecha_nac"));
	 correo=String.valueOf(session2.getAttribute("correo"));

	 try{
		int id=Integer.parseInt(codigo);
		if(id>0){
			Procedimiento proceso = new Procedimiento();
			ArrayList<ArrayList<String>> dato = proceso.FiltroGeneralString("SELECT r.fecha,r.usuario,r.nombre,r.apellido,r.fecha_nac,r.correo,f.universidad,f.carrera FROM registro AS r LEFT JOIN filtro_ingreso_perfil AS f ON f.id_registro=r.`id_registro` WHERE r.id_registro="+id, "8", "perfil");
			
			for(int i=0;i < dato.size();i++){
				fecha=dato.get(i).get(0);
				universidad=dato.get(i).get(6);
				carrera=dato.get(i).get(7);
			}
		}
	}catch(Exception e){
		System.out.println("ERROR EN EL CODIGO"+e);
	}
	if(valor.equals("si")){
		
	}else{
		RequestDispatcher dispacher = request.getRequestDispatcher("views/login/login.jsp");
    	dispacher.forward(request, response);
	}
}else{
	RequestDispatcher dispacher = request.getRequestDispatcher("views/login/login.jsp");
	dispacher.forward(request, response);
}
*/
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
						<a href="index.java" title=""><img src="<%out.println(request.getContextPath()); %>/views/images/logo.png" alt=""></a>
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
						<!-- <h5 class="h5">Datos de Usuario</h5>  -->
								
								<p id="carrera">
									<h6 class="titu">Usuario:</h6><h6 class="h6"><% out.print(usuario); %></h6>
									<h6 class="titu">Nombre y Apellido:</h6><h6 class="h6"><% out.print(nombre); %> <% out.print(apellido); %></h6>
									
									<!-- <h6 class="titu">fecha de creacion:</h6><h6 class="h6"><% out.print(fecha); %></h6> -->
									<h6 class="titu">Fecha de nacimiento:</h6><h6 class="h6"><% out.print(fecha_nac); %></h6>
									<h6 class="titu">E-mail:</h6><h6 class="h6"><% out.print(correo); %></h6>
									<h6 class="titu">Institucion:</h6><h6 class="h6"><% out.print(universidad); %></h6>
									<h6 class="titu">Carrera:</h6><h6 class="h6"><% out.print(carrera); %></h6>
									
								</p>
									</br>
								<a href="#" style="color:#5EB456" >Configuracion<i class="fa fa-fw fa-gears"></i></a>
						</div>
					</div>
				</div>
      </li>
       
        
      </ul>
      
      <ul class="navbar-nav ml-auto">
      
     		 <li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle mr-lg-2" href="/foro" title="">
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
									<li><a href="/Rade/posteo"  title=""><span class="fa fa-fw fa-edit"></span> Nuevo Post</a></li>
									<li><a href="/Rade/evento"  title=""><span class="fa fa-fw fa-calendar"></span> Nuevo Evento</a></li>
									<li><a href="/Rade/archivo"  title=""><span class="fa fa-fw fa-file"></span> Archivos</a></li>
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
        
        
        <li class="nav-item">
          <form class="form-inline my-2 my-lg-0 mr-lg-2">
            <div class="input-group">
              <input class="form-control" type="text" placeholder="Buscar...">
              <span class="input-group-append">
                <button class="btn btn-success" type="button">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </form>
        </li>
        
        
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Desconectar</a>
        </li>
        
      </ul>
    </div>
  </nav>
  
  
   <main role="main" class="container">
  <div class="my-3 p-3 bg-white rounded shadow-sm" id="contenedor1">
        <div class="row content-list-head">
        	<div class="col-md-12">
        		<div class="clearfix">
        			<h3 class="float-left">Buscar EVENTO</h3>
        			<button class="btn btn-primary float-right" type="button" id="AbrirContenedor1">Agregar</button>
        		</div>
        	</div>
        	
        	<div class="col-md-12">
        		<div class="d-flex p-3 bg-secondary text-white">
	        		
        			<input type="text" class="form-control p-2 " id="busqueda" placeholder="Busqueda" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
        			<button class="btn btn-success p-2 bn-sm btn-block form-control" onclick="BuscarEvento('primero');" type="button">Buscar</button>
        		</div>

        	</div>
        	
        </div>
        
        <div class="row content-list-head">
	        
	        <div class="col-md-12">
	        <!-- Inicio Tabla -->
	        <table class="table table-hover" id="tablaevento">
	        	<thead style="background: #314456;color: #fff;">
						<tr>
			                <th class="visible-xs visible-sm visible-md">
			                <button type="button" class="btn btn-default btn-xs vercaja" onclick="" data-toggle="tooltip" data-placement="top" title="VER REGISTROS">
					        <span class="fa fa-fw fa-eye"></span>
					        </button></th>
			                <th class="visible-md visible-lg visible-sm">Titulo</th>
			                <th class="textoderecha">Fecha</th>
			                <th class="visible-md visible-lg">Contenido</th>
			                <th class="textoderecha">Ubicacion</th>
		                </tr>
				</thead>
                <tbody>
	            <tr class="impar">
	            <td class="visible-xs visible-sm visible-md">
	            <button type="button" class="btn btn-default btn-xs vercaja" onclick="" data-toggle="tooltip" data-placement="top" title="VER REGISTROS">
	            <span class="fa fa-fw fa-eye"></span>
	            </button>
	            </td>
	            <td class="visible-md visible-lg visible-sm"> </td>
	            <td class="textoderecha"> </td>
	            <td class="visible-md visible-lg"> </td>
	            <td class="visible-md visible-lg"> </td>
	            <td class="visible-md visible-lg"> </td>
	            <button class="btn btn-info float-right" style="margin-right: 10px;">Modificar</button>
	            <button class="btn btn-danger float-right" style="margin-right: 10px;">Eliminar</button>
	            </td>
	            </tr>    

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
						<button type="button" id="n_n4" class="btn float-right" onclick="BuscarEvento('ultimo');" style="color: #ffffff;background: #314456;" disabled="disabled">Ultimo</button> 
						<button type="button" id="n_n3" class="btn float-right" onclick="BuscarEvento('siguiente');" style="color: #ffffff;background: #314456;" disabled="disabled">&raquo;</button>
						<button type="button" id="n_n2" class="btn float-right" onclick="BuscarEvento('anterior');" style="color: #ffffff;background: #314456;" disabled="disabled">&laquo;</button>
						<button type="button" id="n_n1" class="btn float-right" onclick="BuscarEvento('primero');" style="color: #ffffff;background: #314456;" disabled="disabled">Primero</button>
			    </div>
			    	
				
        	</div>
        </div>
	     <div class="my-3 p-3 bg-white rounded shadow-sm" id="contenedor2">
        <div class="row content-list-head">
        	<div class="col-md-12">
        		<div class="clearfix">
        			<h3 class="float-left">Evento</h3>
        			<button class="btn btn-danger float-right" type="button" id="CerrarContenedor1">Cerrar</button>
        		</div>
        	</div>
        	
        	<div class="col-md-12">
        		<input type="hidden" id="codigo">
   
        		<label>Titulo</label>
        		<input type="text" class="form-control p-2 " placeholder="Nombre" id="titulo" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
				<label>Fecha</label>
        		<input type="text" class="form-control p-2 " placeholder="Apellido" id="fecha" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
				<label>Contenido</label>
        		<input type="text" class="form-control p-2 " placeholder="Dirección" id="contenido" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
				<label>Ubicacion</label>
        		<input type="text" class="form-control p-2 " placeholder="Teléfono" id="busqueda" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
				
				<div class="form-check">
					<input type="checkbox" id="estado" class="form-check-input">	<label class="form-check-label">Activo</label>
				</div>
				
        	</div>
        	<div  class="col-md-12" id="mensaje"></div>
        	<div class="col-md-12">
        		<button class="btn btn-success float-right" style="margin-top: 10px;" type="button" id="guardar">Guardar</button>
        	</div>
        	
        </div>
      </div>
	    
      </div>
      </main>
  	 <script src="views/js/jquery-3.3.1.js"></script>
  	  <script src="views/js/evento2.js"></script>
 <script src="views/js/bootstrap.min.js"></script>
 <script src="views/js/script.js"></script>
  <script src="views/js/evento.js"></script>
</body>
</html>