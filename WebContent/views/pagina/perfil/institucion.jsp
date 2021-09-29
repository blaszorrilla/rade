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


//	Filtramos conforme al tipo

ArrayList<ArrayList<String>> datos= null;
Procedimiento proceso=new Procedimiento();
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
		id_perfil=String.valueOf(datos.get(0).get(10));
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

ArrayList<ArrayList<String>> tipo_institucion = null;
ArrayList<ArrayList<String>> institucion2 = null;

try{
	tipo_institucion=proceso.FiltroGeneralString("SELECT id_tipo_institucion,descripcion FROM tipo_institucion ORDER BY descripcion ASC", "2", "TIPO INSTITUCION");
	institucion2=proceso.FiltroGeneralString("SELECT id_institucion,nombre FROM institucion WHERE estado='ACTIVO 'ORDER BY nombre ASC", "2", "INSTITUCION");
}catch(Exception e){
	
}
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
               
			   <li class="nav-item" id="perfil">
					<a class="nav-link " href="<% out.print(session.getAttribute("usuario"));%>">
						<i class="fa fa-fw fa-home"></i>
						<span class="nav-link-text">Perfil</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="/rade/posteo">
						<i class="fa fa-fw fa-edit"></i>
						<span class="nav-link-text">Nuevo Post</span>
					</a>
				</li>
			   
			   <li class="nav-item">
					<a class="nav-link" href="/rade/pregunta">
						<i class="fa fa-fw fa-question"></i>
						<span class="nav-link-text">Nueva Pregunta</span>
					</a>
				</li>
			   
			   <!-- <li class="nav-item">
					<a class="nav-link" href="#">
						<i class="fa fa-fw fa-table"></i>
						<span class="nav-link-text">Nueva Pregunta</span>
					</a>
				</li> -->
			   
			   <li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath() %>/archivos">
						<i class="fa fa-fw fa-clone"></i>
						<span class="nav-link-text">Archivo</span>
					</a>
				</li>
			   
			   <li class="nav-item" ><!-- id="solicitudes" -->
					<a class="nav-link" href="solicitudes">
						<i class="fa fa-fw fa-group"></i>
						<span class="nav-link-text">Solicitudes</span>
					</a>
				</li>
				
				<li class="nav-item" >
					<a class="nav-link activo" href="institucion">
						<i class="fa fa-fw fa-cogs"></i>
						<span class="nav-link-text">Administrar</span>
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
    
     <center>
   <div class="form-group">
   <button type="button" class="btn btn-link" id="contAgregInstitucion" >Agregar Institucion</button>
   <button type="button" class="btn btn-link" id="bscInstitucion" >Modificar Datos</button>
   <a href="informeInstitucion" target="_blank">Instituciones</a>
   <a href="informeUsuario" target="_blank">Usuarios</a>
   
   </div>	
  </center>

<!--------------------------------------------------INICIO ABMINSTITUCION-------------------------------------------------->

	<div class="row" id="contenedor1"> 	
	
    	<div class="col-lg-5" >
    		
    		<div class="card mb-3">
        		<div class="card-header">
          			<i class="fa fa-refresh"></i> Agregar Institución
          			<input type="hidden" id="tipoacceso" value="<% out.print(tipo);%>">
          		</div>
          		
          			<div class="card-body colorP">
        
          				<div id="datosInsti">
          				
          				<h6 class="titu">Nombre:</h6>
          				<input class="form-control" id="nombreInstitucion" autofocus="" required>
          				
          				<h6 class="titu">Ciudad:</h6>
          				<input class="form-control"  id="ciuInsti">
          				
          				<h6 class="titu">Dirección:</h6>
          				<input class="form-control"  id="dirInstitucion">
          				
          				<h6 class="titu">Teléfono:</h6>
          				<input class="form-control" id="telInstitucion" maxlength="15">
          				
          
          				<h6 class="titu">E-mail:</h6>
          				<input class="form-control" id="correoInstitucion">
          				
          				<h6 class="titu">Usuario:</h6>
          				<input class="form-control" id="usuInsti">
          				
          				<h6 class="titu">Contraseña:</h6>
          				<input class="form-control" type="password" id="pssInsti" maxlength="20">
          				
          				<h6 class="titu">Tipo de Institución:</h6>
          				<select  class="form-control" id="tipoInsti">
                		<option value="0" disabled selected>Seleccione el tipo de Institucion</option>
                		<%
						try{
							for(int i=0; i<tipo_institucion.size();i++){
								out.print("<option value='"+tipo_institucion.get(i).get(0)+"'>"+tipo_institucion.get(i).get(1)+"</option>");
							}
						}catch(Exception e){
							System.out.println("Error en filtro tipo_institucion"+e);
						}
						%>
                		</select>
          				<br>
          				
          				</div>
          					
          					<div class="centro">
          						<button class="btn btn-success" type="button" id="guardarInsti">Guardar</button>
          						<button class="btn btn-danger" type="button" id="cancelInsti">Cancelar</button>
          					</div>
          					<div id="msjGuardar"></div>
          			</div>
          	</div>
    	</div>
    	
    	<div class="col-lg-4">
    		<div class="card-header">
          		<i class="fa fa-refresh"></i> Agregar Carrera	
          </div>
    	<h6 class="titu">Institución:</h6>
          				
          <select  class="form-control" id="agrrInsti">
             <option value="0" disabled selected>Seleccione la Institucion</option>
                <%
				try{
					for(int i=0; i<institucion2.size();i++){
					out.print("<option value='"+institucion2.get(i).get(0)+"'>"+institucion2.get(i).get(1)+"</option>");
				}
				}catch(Exception e){
					System.out.println("Error en filtro institucion"+e);
				}
				%>
           </select>
          <br>
          <h6 class="titu">Carrera:</h6>
          <input class="form-control" id="instiCarrera">
          <br>
          <div id="msjCarrera"></div>
    	  <div class="centro">
          		<button class="btn btn-success" type="button" id="guardarCarrera">Guardar</button>
          		<button class="btn btn-danger" type="button" id="cancelCarrera">Cancelar</button>
          </div>
    	
    	
    </div>	
    </div>
    
    <div class="row" id="contenedor2">
    	<div class="col sm-4 lg-5">
    		<div class="form-group input-group" id="barraBusqueda">
            	<input class="form-control" type="text" placeholder="Buscar Institucion" id="mibusqueda">                          
                 <button class="btn btn-success " type="button" id="buscarInstitucion" ><i class="fa fa-search"></i></button>                       
            </div>	
             <div id="busqueda">
             <div id="mensaje">
             <div class="table-responsive">
             <table class="table table-striped table-sm" id="tablaInstitucion">
             	
             </table>
              </div>   
 		</div>
    		</div>



        	 <input type="hidden" id="ins" value="INSTITUCION">			
			<input type="hidden" id="institucion" value="<%out.println(tipo);%>"> 
<!--------------------------------------------------FIN SOLICITUDES-------------------------------------------------->
</div>
</div>
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
    
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/jquery.min.js"></script>
<!--------------------------------------------------INICIO SCRIPT-------------------------------------------------->
		<script>
		$('#perfil').click(function(){
		$('#perfil.jsp').show();
		//$('#contenedor2').hide();
		
		 });
		$('#institucion').click(function(){
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
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/abmInstitucion.js"></script>
    <script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/abmCarrera.js"></script>
 	<script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/perfil.js"></script>
	<script type="text/javascript" src="<%out.println(request.getContextPath()); %>/views/js/solicitud.js"></script>

</body>
</html>