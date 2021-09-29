<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Página no encontrada</title>
</head>
<!-- Bootstrap -->
    <link href="<%=request.getContextPath() %>/views/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<%=request.getContextPath() %>/views/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="<%=request.getContextPath() %>/views/css/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="<%=request.getContextPath() %>/views/css/custom.min.css" rel="stylesheet">
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <!-- page content -->
        <div class="col-md-12">
          <div class="col-middle">
            <div class="text-center text-center">
              <h1 class="error-number">404</h1>
              <h2>No se pudo encontrar esta página</h2>
              <p>La página que esta buscando no existe o ha sido eliminada</p>
             <!--  <div class="mid_center">
                <h3>Search</h3>
                <form>
              <div class="col-xs-12 form-group pull-right top_search">
                 <div class="input-group">
                      <input type="text" class="form-control" placeholder="Search for...">
                      <span class="input-group-btn">
                              <button class="btn btn-default" type="button">Go!</button>
                      </span>
                    </div> 
                  </div>  
                </form>
              </div> -->
            </div>
          </div>
        </div>
        <!-- /page content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="<%=request.getContextPath() %>/views/js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=request.getContextPath() %>/views/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="<%=request.getContextPath() %>/views/js/fastclick.js"></script>
    <!-- NProgress -->
    <script src="<%=request.getContextPath() %>/views/js/nprogress.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="<%=request.getContextPath() %>/views/js/custom.min.js"></script>
  </body>
</html>