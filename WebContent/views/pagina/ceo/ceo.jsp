<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gestíon CEO RADE</title>
<link href="views/css/bootstrap.min.css" rel="stylesheet">

 <link href="views/css/estilo.css" rel="stylesheet">  
<style type="text/css">
.par {
	background-color:#E6E6FA;
	color:black;
}
.impar {
	background-color:#FFF;
	color:black;
}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
      <a class="navbar-brand mr-auto mr-lg-0" href="#">RADE</a>
      <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Administrar CEO<span class="sr-only">(current)</span></a>
          </li>
          
        </ul>
        <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="text" placeholder="Búsqueda" aria-label="Búsqueda">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Búsqueda</button>
        </form>
      </div>
    </nav>


    <main role="main" class="container">
      <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm">
        <img class="mr-3" src="views/images/perfil.png" alt="" width="48" height="48">
        <div class="lh-100">
          <h6 class="mb-0 text-white lh-100">Gestion CEO</h6>
          <small>2018</small>
        </div>
      </div>

      <div class="my-3 p-3 bg-white rounded shadow-sm" id="contenedor1">
        <div class="row content-list-head">
        	<div class="col-md-12">
        		<div class="clearfix">
        			<h3 class="float-left">Buscar CEO</h3>
        			<button class="btn btn-primary float-right" type="button" id="AbrirContenedor1">Agregar</button>
        		</div>
        	</div>
        	
        	<div class="col-md-12">
        		<div class="d-flex p-3 bg-secondary text-white">
	        		
        			<input type="text" class="form-control p-2 " id="busqueda" placeholder="Busqueda" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
        			<button class="btn btn-success p-2 " onclick="BuscarCeo('primero');" type="button">Buscar</button>
        		</div>

        	</div>
        	
        </div>
        
        <div class="row content-list-head">
	        
	        <div class="col-md-12">
	        <!-- Inicio Tabla -->
	        <table class="table table-hover" id="tablaceo">
	        	<thead style="background: #314456;color: #fff;">
						<tr>
			                <th class="visible-xs visible-sm visible-md">
			                <button type="button" class="btn btn-default btn-xs vercaja" onclick="" data-toggle="tooltip" data-placement="top" title="VER REGISTROS">
					        <span class="fa fa-fw fa-eye"></span>
					        </button></th>
			                <th class="visible-md visible-lg visible-sm">Cedula</th>
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
						<button type="button" id="n_n4" class="btn float-right" onclick="BuscarCeo('ultimo');" style="color: #ffffff;background: #314456;" disabled="disabled">Ultimo</button> 
						<button type="button" id="n_n3" class="btn float-right" onclick="BuscarCeo('siguiente');" style="color: #ffffff;background: #314456;" disabled="disabled">&raquo;</button>
						<button type="button" id="n_n2" class="btn float-right" onclick="BuscarCeo('anterior');" style="color: #ffffff;background: #314456;" disabled="disabled">&laquo;</button>
						<button type="button" id="n_n1" class="btn float-right" onclick="BuscarCeo('primero');" style="color: #ffffff;background: #314456;" disabled="disabled">Primero</button>
			    </div>
			    	
				
        	</div>
        </div>
	    
	    
      </div>
	
	  <div class="my-3 p-3 bg-white rounded shadow-sm" id="contenedor2">
        <div class="row content-list-head">
        	<div class="col-md-12">
        		<div class="clearfix">
        			<h3 class="float-left">Gestión CEO</h3>
        			<button class="btn btn-danger float-right" type="button" id="CerrarContenedor1">Cerrar</button>
        		</div>
        	</div>
        	
        	<div class="col-md-12">
        		<input type="hidden" id="codigo">
        		<label>Cedula</label>
        		<input type="text" class="form-control p-2 " placeholder="Cedula" id="cedula" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
        		
        		<label>Nombre</label>
        		<input type="text" class="form-control p-2 " placeholder="Nombre" id="nombre" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
				<label>Apellido</label>
        		<input type="text" class="form-control p-2 " placeholder="Apellido" id="apellido" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
				<label>Dirección</label>
        		<input type="text" class="form-control p-2 " placeholder="Dirección" id="direccion" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
				<label>Teléfono</label>
        		<input type="text" class="form-control p-2 " placeholder="Teléfono" id="telefono" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
				<label>E-mail</label>
        		<input type="text" class="form-control p-2 " placeholder="E-mail" id="email" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
				<label>Pagina</label>
        		<input type="text" class="form-control p-2 " placeholder="Pagina" id="pagina" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
				
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
      
      <div class="my-3 p-3 bg-white rounded shadow-sm" id="contenedor3">
        <div class="row content-list-head">
        	<div class="col-md-12">
        		<div class="clearfix">
        			<h3 class="float-left">Gestión CEO</h3>
        			<button class="btn btn-danger float-right" type="button" id="CerrarContenedor3">Cerrar</button>
        		</div>
        	</div>
        	
        	<div class="col-md-12">
        		
        		<label>Usuario</label>
        		<input type="text" class="form-control p-2 " placeholder="Usuario" id="usuario" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
        		
        		<label>Password</label>
        		<input type="text" class="form-control p-2 " placeholder="Password" id="password" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
				<label>Repetir Password</label>
        		<input type="text" class="form-control p-2 " placeholder="Password" id="password1" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>

				
				
        	</div>
        	<div  class="col-md-12" id="mensaje"></div>
        	<div class="col-md-12">
        		<button class="btn btn-success float-right" style="margin-top: 10px;" type="button" id="guardar_usuario">Guardar</button>
        	</div>
        	
        </div>
      </div>
      
    </main>
    
<!-- Modal -->
<div class="modal fade" id="contenido" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary">
        <h5 class="modal-title text-white" id="exampleModalLabel">Gestión Enlace</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span class="text-white" aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-group">
        	<label for="recipient-name" class="col-form-label">Usuario</label>
        	<input type="text" class="form-control form-control-sm">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!-- Fin Modal -->

 <script src="views/js/jquery-3.3.1.js"></script>
 <script src="views/js/bootstrap.min.js"></script>
 <script src="views/js/script.js"></script>
  <script src="views/js/ceo.js"></script>
</body>
</html>