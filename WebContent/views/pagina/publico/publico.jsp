<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>R.A.D.E</title>
<link href="<%=request.getContextPath() %>/views/css/font-awesome.min.css" rel="stylesheet"> 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/views/css/bootstrap.min.css">
<link rel="shortcut icon" href="<%=request.getContextPath() %>/views/images/Logoo_rade-copia.png"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/views/css/all.min.css"  type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/views/css/magnific-popup.css" >

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/views/css/creative.min.css" >
</head>
<body>
<!--  
<h1>Perfil Publico</h1>
<%
HttpSession session2 = request.getSession( true );
session2.setAttribute("url", request.getContextPath());
System.out.println("rul--"+request.getContextPath());
if(session2.getAttribute("login")!=null){
	if(String.valueOf(session2.getAttribute("login")).equals("no")){
		out.print("	<a href=\"/rade/login\">login</a>");
	}
}else{
	out.print("	<a href=\"/rade/login\">login</a>");
}
%> -->
 



<body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">RECURSO ACADÉMICO DIGITAL ESPECÍFICO</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="registro">Registrarse</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="login">Iniciar Sesión</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#info">Sobre Nosotros</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#contact">Contacto</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <header class="masthead text-center text-white d-flex">
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-10 mx-auto">
            <h1 class="text-uppercase">
              <strong>La primera plataforma creada por Estudiantes y para Estudiantes!</strong>
            </h1>
            <hr>
          </div>
          <div class="col-lg-8 mx-auto">
            <p class="text-faded mb-5">Regístrate para enterarte!</p>
            <a class="btn btn-primary btn-xl js-scroll-trigger" href="#info">Descubre</a>
          </div>
        </div>
      </div>
    </header>

    <section class="bg-primary" id="info">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="section-heading text-white">Proyecto RADE – Recurso Académico Digital Específico</h2>
            <hr class="light my-4">
            <p class="text-faded mb-4">RADE, nace con un sueño de aficionados a la interconexión entre las personas, en un presente revolucionario y exigente. En donde los métodos para la comunicación se vuelven más robustos y complejos en funcionamiento, pero simples y fáciles para las experiencias de los internautas. </p>
            <a class="btn btn-light btn-xl js-scroll-trigger" href="#services">Unete!</a>
          </div>
        </div>
      </div>
    </section>

    <section id="services">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading">A tu disposición</h2>
            <hr class="my-4">
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fas fa-4x fa-check text-primary mb-3 sr-icon-1"></i>
              <h3 class="mb-3">REGISTRATE</h3>
              <p class="text-muted mb-0">Regístrate a R.A.D.E para estar enterado de las últimas noticias.</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fas fa-4x fa-comments text-primary mb-3 sr-icon-2"></i>
              <h3 class="mb-3">CONECTA</h3>
              <p class="text-muted mb-0">Sigue a personas o temas que sean de tu interés. Crea tu círculo de interacción.</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fas fa-4x fa-globe text-primary mb-3 sr-icon-3"></i>
              <h3 class="mb-3">CONOCE</h3>
              <p class="text-muted mb-0">Descubre todas las funcionalidades que ofrece la plataforma.</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fas fa-4x fa-users text-primary mb-3 sr-icon-4"></i>
              <h3 class="mb-3">COMPARTE</h3>
              <p class="text-muted mb-0">Comparte conocimientos e información con gente de tu círculo.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="p-0" id="portfolio">
      <div class="container-fluid p-0">
       <div class="row no-gutters popup-gallery"> 
          <div class="col-lg-4 col-sm-6">
            
              <img class="img-fluid" src="<%=request.getContextPath() %>/views/img/num.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    
                  </div>
                  <div class="project-name">
                    
                  </div>
                </div>
              </div>
            
          </div>
          <div class="col-lg-4 col-sm-6">
            
              <img class="img-fluid" src="<%=request.getContextPath() %>/views/img/inf.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    
                  </div>
                  <div class="project-name">
                  
                  </div>
                </div>
              </div>
            
          </div>
          <div class="col-lg-4 col-sm-6">
            
              <img class="img-fluid" src="<%=request.getContextPath() %>/views/img/cien.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                   
                  </div>
                  <div class="project-name">
                    
                  </div>
                </div>
              </div>
            
          </div>
          <div class="col-lg-4 col-sm-6">
            
              <img class="img-fluid" src="<%=request.getContextPath() %>/views/img/med.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    
                  </div>
                  <div class="project-name">
                   
                  </div>
                </div>
              </div>
            
          </div>
          <div class="col-lg-4 col-sm-6">
            
              <img class="img-fluid" src="<%=request.getContextPath() %>/views/img/estudio.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    
                  </div>
                  <div class="project-name">
                    
                  </div>
                </div>
              </div>
           
          </div>
          <div class="col-lg-4 col-sm-6">
            
              <img class="img-fluid" src="<%=request.getContextPath() %>/views/img/est.jpg" alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                   
                  </div>
                  <div class="project-name">
                    
                  </div>
                </div>
              </div>
            
          </div>
        </div> 
      </div>
    </section>


    <section id="contact">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="section-heading">¡Mantengámonos en contacto!</h2>
            <hr class="my-4">
            <p class="mb-5">Si tiene alguna duda llámenos o envíenos un correo electrónico y nos pondremos en contacto con usted lo antes posible.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 ml-auto text-center">
            <i class="fas fa-phone fa-3x mb-3 sr-contact-1"></i>
            <p>+595 984-582-563</p>
          </div>
          <div class="col-lg-4 mr-auto text-center">
            <i class="fas fa-envelope fa-3x mb-3 sr-contact-2"></i>
            <p>
              <a href="mailto:your-email@your-domain.com">rade.encarnacion@gmail.com</a>
            </p>
          </div>
        </div>
      </div>
    </section>
</body>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/scrollreveal.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/creative.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/popper.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/views/js/bootstrap.min.js"></script>
</html>