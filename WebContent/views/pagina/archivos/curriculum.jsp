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
System.err.print(id_tipo_curri +"al comienzo del jsp id_tipo_curri");
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
String institucion="";


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
System.out.println("tipo-- "+tipo);
System.out.println("id-- "+id);
%>
<%
Procedimiento proceso=new Procedimiento();
ArrayList<ArrayList<String>> id_per = null;
try{
	System.err.println("----- id_perfil -----------------------------------------------------------------"+tipo+"               "+id);	
	id_per=proceso.FiltroGeneralString("CALL Filtro_perfil ('"+tipo+"','"+id+"')","1","lugar");
}catch(Exception e){
	
}
id_perfil=String.valueOf(id_per.get(0).get(0));
System.err.println("----- id_perfil -----------------------------------------------------------------"+id_perfil);
%>

<%
ArrayList<ArrayList<String>> datos= null;

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
	/* 	id_perfil=String.valueOf(datos.get(0).get(10)); */
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
String modi=String.valueOf(session2.getAttribute("modificar"));
String nombre_a="";
String info_academica_a="",info_experiencia_a="",info_idioma_a="",refe_laboral_a="",refe_personal_a="";
String apellido_a="",conocimientos_a="",id_tipo_diseno_a="",direccion_a="",telefono_a="",cedula_a="",fecha_nac_a="";
String id_curriculum =String.valueOf(session2.getAttribute("id_curriculum"));;
System.err.println("El codigo que recibe modificar es ---->"+modi);
if(modi.equals(null)){
	System.out.println("Ingreso en el if de modi que cambia el valor");
	modi="2";
}
System.err.println("El codigo de modificar cambio a ---->"+modi+"--");
if(modi.equals("0")){
	nombre_a = String.valueOf(session2.getAttribute("nombre_a"));
	apellido_a=String.valueOf(session2.getAttribute("apellido_a"));
	info_academica_a = String.valueOf(session2.getAttribute("info_academica_a"));
	info_experiencia_a = String.valueOf(session2.getAttribute("info_experiencia_a"));
	info_idioma_a = String.valueOf(session2.getAttribute("info_idioma_a"));
	refe_laboral_a = String.valueOf(session2.getAttribute("refe_laboral_a"));
	refe_personal_a = String.valueOf(session2.getAttribute("refe_personal_a"));
	conocimientos_a = String.valueOf(session2.getAttribute("conocimientos_a"));
	id_tipo_diseno_a = String.valueOf(session2.getAttribute("id_tipo_diseno_a"));
	direccion_a = String.valueOf(session2.getAttribute("direccion_a"));
	telefono_a = String.valueOf(session2.getAttribute("telefono_a"));
	cedula_a = String.valueOf(session2.getAttribute("cedula_a"));
	fecha_nac_a = String.valueOf(session2.getAttribute("fecha_nac_a"));
	session2.setAttribute("modificar","");
	
}
System.err.println("Los datos que recibe son ---->"+nombre_a+" "+apellido_a+" "+info_academica_a );


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
			<!-- <h5>General</h5>  -->
               
			   <li class="nav-item" id="perfil">
					<a class="nav-link" href="">
						<i class="fa fa-fw fa-home"></i>
						<span class="nav-link-text">Perfil</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="#">
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
					<a class="nav-link" href="#">
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
				
				<li class="nav-item" id="abmInstitucion">
					<a class="nav-link" href="institucion">
						<i class="fa fa-fw fa-group"></i>
						<span class="nav-link-text">Instituciones</span>
					</a>
				</li>
			   
			   <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                        <i class="fa fa-fw fa-sign-out"></i>
                        <span class="nav-link-text">Salir</span>
                    </a>
                </li>
			   
        </ul><ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
			<!-- <h5>General</h5>  -->
               
			   <li class="nav-item" id="perfil">
					<a class="nav-link" href="">
						<i class="fa fa-fw fa-home"></i>
						<span class="nav-link-text">Perfil</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="#">
						<i class="fa fa-fw fa-edit"></i>
						<span class="nav-link-text">Nuevo Post</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="/rade/pregunta">
						<i class="fa fa-fw fa-question"></i>
						<span class="nav-link-text">Preguntas</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="#">
						<i class="fa fa-fw fa-table"></i>
						<span class="nav-link-text">Nuevo Eventos</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath() %>/archivos">
						<i class="fa fa-fw fa-clone"></i>
						<span class="nav-link-text">Archivo</span>
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
  <div class="content-wrapper">
    <div class="container-fluid">
<!-- INICIO CONTENIDO PRINCIPAL-->
    	
    	<div class="main-section-data">
			<div class="row">
				<div class="col-lg-12">
			<!-- ----------------------------------------------------- -->
			<!--  -->
			
			<input type="hidden" id="id_perfil" value="<% out.write(id_perfil);%>" />
			<input type="hidden" id="id_nombre" value="<% out.write(nombre);%>" />
			<input type="hidden" id="modi" value="<% out.write(modi);%>" />
			<input type="hidden" id="id_curriculum" value="<% out.write(id_curriculum);%>" />
			<input type="hidden" id="id_tipo_curri" value="<% out.write(id_tipo_curri);%>" />
					<div class="card mb-12">
					<!--  -->
						<div class="card-header colores">
							<h1>Curriculum</h1>
						</div>
						
			                <div class="card-body" id="contenedor1">
			                    	<h3 class="display-4" >Informaci&oacute;n Personal</h3>
			                    	<div class="clearfix"></div>
								<div class="epi-sec">
									<div class="alert alert-success" >
										<font style="vertical-align: inherit;">
											<font style="vertical-align: inherit;">Rellenar todos los campos son obligatorios</font>
										</font>
									</div>
								</div>
								
								<!-- comieza campos -->
								
								<div class="row">
							    	<div class="col-md-8 ">
										<form class="form-horizontal form-label-left">
					                    	<div class="form-group">
												<label class="h4">Nombre</label>
					                      		<input type="text" class="form-control" id="id_cu_nombre" value="<% out.write(nombre_a); %>" placeholder="Ingrese Nombre/s">
					                    	</div>
					                    	<div class="form-group">
					                      		<label class="h4">Apellido</label>
					                      		<input type="text" class="form-control" id="id_cu_apellido" value="<% out.write(apellido_a);%>" placeholder="Ingrese Apellido/s">
					                    	</div>
					                    	<div class="form-group">
												<label class="h4">Numero de Cedula</label>
					                      		<input type="number" class="form-control" id="id_cu_cedula" value="<% out.write(cedula_a);%>" placeholder="Ingrese Numero de Cedula">
					                    	</div>
					                    	<div class="form-group">
					                      		<label class="h4">Fecha de Nacimiento</label>
					                      		<input type="date" class="form-control" id="id_cu_fecha" value="<% out.write(fecha_nac_a);%>" placeholder="Ingrese Numero de Telefono o Celular">
					                    	</div>
					                    	<div class="form-group">
												<label class="h4">Telefono / Celular</label>
					                      		<input type="text" class="form-control" id="id_cu_tel" value="<% out.write(telefono_a);%>" placeholder="Ingrese Numero de Telefono o Celular">
					                    	</div>
					                    	<div class="form-group">
					                      		<label class="h4">Direccion</label>
					                      		<input type="text" class="form-control" id="id_cu_dir" value="<% out.write(direccion_a);%>" placeholder="Ingrese Direccion">
					                    	</div>
					                    	
										</form>
					                
											<div class="col-md-6">
					                          <a href="../archivos"><button type="submit" class="btn btn-lg btn-primary">Cancelar</button></a>
					                          <button type="submit" class="btn btn-lg btn-success" id="abrirContenedor2">Siguiente</button>
					                        </div><br></br>
			                        </div>
								</div>
							</div>
							
							<!-- aca termina el primer panel -->
							
							<div class="card-body" id="contenedor2">
								<div class="x_title">
			                    	<h3 class="display-4" >Informaci&oacute;n Acad&eacute;mica</h3>
			                    	<div class="clearfix"></div>
								</div>
								<div class="epi-sec">
									<div class="alert alert-success" >
										<font style="vertical-align: inherit;">
											<font style="vertical-align: inherit;">Rellenar todos los campos son obligatorios</font>
											</font>
										</div>
									</div>
									
									<div class="row">
										<div class="col-md-10 col-md-offset-1" >
										    <div>
												<h4>Rellena el campo con el a&ntilde;o de ingreso, a&ntilde;o de finalizaci&oacute;n, Instituto y el titulo recibido</h4>
											</div>
											<div>
												<textarea class="form-control" rows="5" cols="85" id="id_cu_academico" placeholder="1. 2000-2008, Colegio San Roque Benitez, Educacion Escolar basica
2. 2009-2011, Colegio Federico Gonz&aacuote;lez, Educion Media y Tecnica (Bachillerato)
3. 2012-Actualmente, Universidad Tecnologica Intercontinental (UTIC), Lic. en analisis de sistema " ><%out.write(info_academica_a);%></textarea>
											</div>
								    	</div>
								    	<!-- termina campos -->
			                        <div class="col-md-4 btn-tamano">
			                          <button type="submit" class="btn btn-lg btn-primary" id="cerrarContenedor2">Atras</button>
			                          <button type="submit" class="btn btn-lg btn-success" id="abrirContenedor3">Siguiente</button>
			                        </div><br></br>
							    </div>
							</div>
							
							<!-- aqui termina curriculum -->
							
							<div class="card-body" id="contenedor3">
			                    	<h3 class="display-5" >Experiencia Laboral</h3>
								<div class="epi-sec">
									<div class="alert alert-success" >
										<font style="vertical-align: inherit;">
											<font style="vertical-align: inherit;">Agregue una experiencia para cada trabajo que ha tenido y desea que se muestre en su curriculum.</font>
											</font>
										</div>
									</div>		
									<div class="row">
										<div class="col-md-10 col-md-offset-1" >
									    	<div>
												<h4>Rellena el campo con el nombre del empleador, puesto en el trabajo y el la antiguedad</h4>
											</div>
											<div>
												<textarea class="form-control" rows="5" cols="85" id="id_cu_laboral" placeholder="1. Eduardo Perez, Encargado de Marketing, 1 año 8 meses
2. Josue Vera, Cocinero personal, 2 semanas
3. Mark Zuckerberg, Programador web, 3 meses " ><% out.write(info_experiencia_a);%></textarea>
											</div>
										</div>
								  	
								  	<!-- aqui termina experiencia -->
								
				                        <div class="col-md-4 btn-tamano">
				                          <button type="submit" class="btn btn-lg btn-primary" id="cerrarContenedor3">Atras</button>
				                          <button type="submit" class="btn btn-lg btn-success" id="abrirContenedor4">Siguiente</button>
				                        </div>
			       			  		</div>
							</div>
							
							<!-- aqui comienza idioma -->
							
							<div class="card-body" id="contenedor4">
								<div class="x_title">
			                    	<h3 class="display-4" >Idiomas</h3>
			                    
			                    	<div class="clearfix"></div>
								</div>
								<div class="epi-sec">
									<div class="alert alert-success" >
										<font style="vertical-align: inherit;">
											<font style="vertical-align: inherit;">Agregue uno o varios idiomas que comprenda y desea que se muestre en su curriculum.</font>
											</font>
										</div>
									</div>		
									<div class="row">
										<div class="col-md-10 col-md-offset-1" >
											<div>
												<textarea class="form-control" rows="5" cols="85" id="id_cu_idioma" placeholder="1. Ingles, Basico
2. Guarani, Avanzado
3. Español, Intermedio " ><% out.write(info_idioma_a);%></textarea>
											</div>
										</div>
								  	<!-- aqui termina experiencia -->
					                        <div class="col-md-6 btn-tamano">
					                          <button type="submit" class="btn btn-lg btn-primary" id="cerrarContenedor4">Atras</button>
					                          <button type="submit" class="btn btn-lg btn-success" id="abrirContenedor5">Siguiente</button>
					                        </div><br></br>
								  	</div>							  	
							</div>
							
							<!-- aqui termina idioma -->
							
							<div class="card-body" id="contenedor5">
			                    	<h3 class="display-4" >Referencia Laboral</h3>
								<div class="epi-sec">
									<div class="alert alert-success" >
										<font style="vertical-align: inherit;">
											<font style="vertical-align: inherit;">Agregue una o varias referencias ingresando el nombre del establecimiento, nombre del empleador y numero de contacto que desea mostrar en su curriculum.</font>
											</font>
										</div>
									</div>		
									<div class="row">
										<div class="col-md-10 col-md-offset-1" >
											<div>
												<textarea class="form-control" rows="5" cols="85" id="id_cu_ref_laboral"  placeholder="1. R.A.D.E. Corporations, Salvador Suenaga, +595 985 123 456
2. Estudio Contable Numeritos, Elsa Pofeo, +595 985 484 021
3. Heladeria Los Hermanos, Elva Gabundo, +595 714 84 021 " ><% out.write(refe_laboral_a);%></textarea>
											</div>
										</div>
					                        <div class="col-md-6 btn-tamano">
					                          <button type="submit" class="btn btn-lg btn-primary" id="cerrarContenedor5">Atras</button>
					                          <button type="submit" class="btn btn-lg btn-success" id="abrirContenedor6">Siguiente</button>
					                        </div><br></br>
								  	</div>							  	
							</div>
							
							<!--Aqui termina Referencia Laboral  -->
							
							<div class="card-body" id="contenedor6">
			                    	<h3 class="display-4" >Referencia Personal</h3>
								<div class="epi-sec">
									<div class="alert alert-success" >
										<font style="vertical-align: inherit;">
											<font style="vertical-align: inherit;">Agregue una o varias ingresando el nombre, apellido y numero de contacto que desea mostrar en su curriculum.</font>
											</font>
										</div>
									</div>		
									<div class="row">
										<div class="col-md-10 col-md-offset-1" >
											<div>
												<textarea class="form-control" rows="5" cols="85" id="id_cu_ref_personal" placeholder="1. Maria Magdalena, Orue, +595 xxx xxx xxx
2. Juan, Orue, +595 xxx xxx xxx
3. Carolina, Herrera, 071 xx xx xx - +595 xxx xxx xxx " ><% out.write(refe_personal_a);%></textarea>
											</div>
										</div>
					                        <div class="col-md-6 btn-tamano">
					                          <button type="submit" class="btn btn-lg btn-primary" id="cerrarContenedor6">Atras</button>
					                          <button type="submit" class="btn btn-lg btn-success" id="abrirContenedor7">Siguiente</button>
					                        </div><br></br>
								  	</div>							  	
							</div>
							
							<!--Aqui termina Referencia Personal  -->
							
							<div class="card-body" id="contenedor7">
			                    	<h3 class="display-4" >Conocimientos</h3>
								<div class="epi-sec">
									<div class="alert alert-success" >
										<font style="vertical-align: inherit;">
											<font style="vertical-align: inherit;">Aqui puede anexar los conocimientos </font>
											</font>
										</div>
									</div>		
									<div class="row">
										<div class="col-md-10 col-md-offset-1" >
											<div>
												<textarea class="form-control" rows="5" cols="85" id="id_cu_conocimiento" placeholder="1. Maria Magdalena, Orue, +595 xxx xxx xxx
2. Juan, Orue, +595 xxx xxx xxx
3. Carolina, Herrera, 071 xx xx xx - +595 xxx xxx xxx " ><% out.write(conocimientos_a);%></textarea>
											</div>
										</div>
					                        <div class="col-md-6 btn-tamano">
					                          <button type="submit" class="btn btn-lg btn-primary" id="cerrarContenedor7">Atras</button>
					                          <button type="submit" class="btn btn-lg btn-success" id="abrirContenedor8">Siguiente</button>
					                        </div><br></br>
								  	</div>							  	
							</div>
							
							<!--Aqui termina Conocimientos  -->
							<div class="card-body" id="contenedor8">
			                    	<h3 class="display-4" >Descargar</h3>
			                    
								<div class="epi-sec">
									<div class="alert alert-success" >
										<font style="vertical-align: inherit;">
											<font style="vertical-align: inherit;">Casi listo!. Aqui puedes descargar y guardar tu curriculum en tu pc o imprimirlo.</font>
										</font>
									</div>
								</div>		
								<div class="row">
									<div class="col-md-10 btn-tamano" >
										<button class="btn btn-danger btn-lg" id="cargartodo" >
										 	<span class="fa glyphicon-floppy-save" aria-hidden="true"> Previsualizar y Descargar </span>
										 </button> 
										 <%if(modi.equals("")){ %>
										 <input type="hidden" id="tipo_curri" value="<% out.write(id_tipo_curri);%>"/>
										 <%}else if(modi.equals("0")){ %>
										 <input type="hidden" id="tipo_curri" value="<% out.write(id_tipo_diseno_a);%>"/>
										 <% }%>
										 <button class="btn btn-danger btn-lg" id="guardar">
										 	<span class="fa glyphicon-floppy-save" aria-hidden="true">  Guardar </span>
										 </button> 
									</div>
							  	<!-- aqui termina experiencia -->
									<div class="form-group">
				                        <div class="col-md-6 btn-tamano">
				                          <button type="submit" class="btn btn-lg btn-primary" id="cerrarContenedor8">Atras</button>
				                        </div><br></br>
				                    </div>
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
 	<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/curriculum.js"></script>
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
			var nombre=$("#id_cu_nombre").val();
			var apellido = $("#id_cu_apellido").val();
			var cedula = $("#id_cu_cedula").val();
			var fecha = $("#id_cu_fecha").val();
			var tel = $('#id_cu_tel').val();
			var direccion = $("#id_cu_dir").val();
			var texto = $("#id_cu_academico").val();
			var texto2 = $("#id_cu_laboral").val();
			var texto3 = $("#id_cu_idioma").val();
			var id_nombre = $("#id_nombre").val();
			var id_perfil = $("#id_perfil").val();
			var ref_laboral = $("#id_cu_ref_laboral").val();
			var ref_personal = $("#id_cu_ref_personal").val();
			var conocimiento = $("#id_cu_conocimiento").val();
			var id_tipo_curri = $("#id_tipo_curri").val();
			
				$.ajax({
						url : "Informe",
						method: "POST",
						data: { envio:"curriculum", nombre:nombre,apellido:apellido,cedula:cedula,tel:tel,texto:texto,texto2:texto2,texto3:texto3, direccion:direccion, fecha:fecha, id_nombre:id_nombre, id_perfil:id_perfil, ref_laboral:ref_laboral, ref_personal:ref_personal, conocimiento:conocimiento, id_tipo_curri:id_tipo_curri},
						beforeSend: function(){
							$("#mensaje").html("<img src=\"../views/img/status.gif\"></img>");
						},
						success: function(respuesta){
							window.open("Informe",'First','height=600,width=800,toolbar=no,scrollbars=yes');
							console.log("ejecuta 1///////////");
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