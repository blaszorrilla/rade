<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gestíon Enlace RADE</title>
<link href="views/css/bootstrap.min.css" rel="stylesheet">
<link href="views/css/style.css" rel="stylesheet">
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
            <a class="nav-link" href="#">Administrador Enlace<span class="sr-only">(current)</span></a>
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
        <img class="mr-3" src="views/img/logo.png" alt="" width="48" height="48">
        <div class="lh-100">
          <h6 class="mb-0 text-white lh-100">Gestion Enlace</h6>
          <small>2018</small>
        </div>
      </div>

      <div class="my-3 p-3 bg-white rounded shadow-sm" id="contenedor1">
        <div class="row content-list-head">
        	<div class="col-md-12">
        		<div class="clearfix">
        			<h3 class="float-left">Buscar Enlace</h3>
        			<button class="btn btn-primary float-right" type="button" id="AbrirContenedor1">Agregar</button>
        		</div>
        	</div>
        	
        	<div class="col-md-12">
        		<div class="d-flex p-3 bg-secondary text-white">
	        		<select class="form-control p-2 ">
	        			<option>NINGUNA</option>
	        			<option>PERFIL</option>
	        			<option>POSTEO</option>
	        		</select>
        			<input type="text" class="form-control p-2 " placeholder="Busqueda" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
        			<button class="btn btn-success p-2 bn-sm btn-block form-control" type="button">Buscar</button>
        		</div>

        	</div>
        	
        </div>
        
        <div class="row content-list-head">
	        <div class="col-md-12 right contenedor-tabla">
	        	<div class="card text-left">
	        		<div class="progress-bar" role="progressbar" style="width: 100%;height: 1px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
	        		<div class="card-body">
	        			<div class="row">
	        				<div class="col-md-10">
	        					<div class="card-title"><h6>Perfil<span class="usuariotabla text-danger">@yosh</span></h6></div>
	        					<div class="clearfix">
	        						<p class="float-left">Se abre la interfaz de perfil. </p>
	        						<span class="p-1 mb-0 bg-success text-white float-right">
	        							<a href="#" class="text-white">/rade/perfil/@</a>
	        						</span>
	        					</div>
	        				</div>
	        				<div class="col-md-2 text-right">
	        					<a href="javascript:void(0);" class="text-warning" data-toggle="modal" data-target="#contenido">Actualizar</a> 	
	        					<a href="javascript:void(0);" class="text-danger">Borrar</a>
	        				</div>
	        			</div>
	        		</div>
	        	</div>
	        </div>
	        
	        <div class="col-md-12 right contenedor-tabla">
	        	<div class="card text-left">
	        		<div class="progress-bar" role="progressbar" style="width: 100%;height: 1px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
	        		<div class="card-body">
	        			<div class="row">
	        				<div class="col-md-10">
	        					<div class="card-title"><h6>Perfil<span class="usuariotabla text-danger">@yosh</span></h6></div>
	        					<div class="clearfix">
	        						<p class="float-left">Se abre la interfaz de perfil. </p>
	        						<span class="p-1 mb-0 bg-success text-white float-right">
	        							<a href="#" class="text-white">/rade/perfil/@</a>
	        						</span>
	        					</div>
	        				</div>
	        				<div class="col-md-2 text-right">
	        					<a href="javascript:void(0);" class="text-warning" data-toggle="modal" data-target="#contenido">Actualizar</a> 	
	        					<a href="javascript:void(0);" class="text-danger">Borrar</a>
	        				</div>
	        			</div>
	        		</div>
	        	</div>
	        </div>
   
	    </div>
	    
	    <div class="row content-list-head">
	    	<div class="col-md-12 ">
	    		<div class="d-flex p-3 bg-secondary text-white justify-content-end">
	        			<ul class="pagination justify-content-center" style="margin:20px 0">
		        			<li class="page-item"><a class="page-link" href="#">Primero</a></li>
		        			<li class="page-item"><a class="page-link" href="#">Anterior</a></li>
		        			<li class="page-item"><a class="page-link" href="#">Siguiente</a></li>
		        			<li class="page-item"><a class="page-link" href="#">Ultimo</a></li>
	        			</ul>
				</div>
        	</div>
        </div>
	    
	    
      </div>
	
	  <div class="my-3 p-3 bg-white rounded shadow-sm" id="contenedor2">
        <div class="row content-list-head">
        	<div class="col-md-12">
        		<div class="clearfix">
        			<h3 class="float-left">Gestión Enlace</h3>
        			<button class="btn btn-danger float-right" type="button" id="CerrarContenedor1">Cerrar</button>
        		</div>
        	</div>
        	
        	<div class="col-md-12">
        		<label>Codigo</label>
        		<input type="text" class="form-control p-2 " placeholder="Busqueda" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>
        		<label>Nombre</label>
        		<input type="text" class="form-control p-2 " placeholder="Busqueda" aria-lable="Buscar Enlace" aria-describedby="basic-addon2"/>

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
  <script src="views/js/enlace.js"></script>
</body>
</html>