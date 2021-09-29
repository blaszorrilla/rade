var pos=0;
var ultimovalor=0;
var valorscroll=0;

$(document).ready(function(){
	valorscroll=1;
	cargartotsposteo(0);
});
$('#posteo').click(function(){
	$('#contenedorposteo').show();
	$('#divcomentario').hide();
	$('#contenedor2').hide();
	$('#contenedor3').hide();
	$('#contenedor1').hide();
	$('#solicitudes').hide();
	$('#divmiposteo').hide();
	$('#divnuevoposteo').hide();
	$('#divverposteo').show();
	valorscroll=1;
	cargartotsposteo(0);
});	

$('#miposteo').click(function(){
	$('#divmiposteo').show();
	$('#divnuevoposteo').hide();
	$('#divverposteo').hide();
	$('#divcomentario').hide();
		valorscroll=2;
		cargarposteo(0);
		
		
});	
$('#verposteo').click(function(){
	$('#divmiposteo').hide();
	$('#divnuevoposteo').hide();
	$('#divverposteo').show();
	$('#divcomentario').hide();
	valorscroll=1;
	cargartotsposteo(0);
});	
$('#nuevoposteo').click(function(){
	$('#divmiposteo').hide();
	$('#divverposteo').hide();
	$('#divnuevoposteo').show();
	$('#divcomentario').hide();
	limpiar();
	valorscroll=0;
});	



//SCROLL
$(window).scroll(function(){
	console.log("scroll "+valorscroll);
    if($(window).scrollTop() + $(window).height() >= $(document).height()) {
    	if(valorscroll==1){
    		var last_id = $(".post-id:last").attr("id");
            if (last_id>1) {
            	cargartotsposteo(last_id);
            }else{
                $('.ajax-load1').hide();
                $('.fin1').show();
            }
    	}else{
    		if(valorscroll==2){
    		var last_id = $(".post-id1:last").attr("id");
            if (last_id>1) {
            
            	cargarposteo(last_id);
            }else{
                $('.ajax-load2').hide();
                $('.fin2').show();
            }
    		}else
    		{

        		if(valorscroll==3){
        		var last_id = $(".post-id2:last").attr("id");
                if (last_id>1) {
                	cargar_comentarios(last_id);
                }else{
                   /* $('.ajax-load3').hide();
                    $('.fin3').show();*/
                }
        		}
        	
    		}
    	}
    
    }
});
///COMENTARIO
function guardarcomentario(){
	console.log("ingresooo guardarcomentario ");
	var idposteo = $("#id_posteo").val();
	var idperfil= $("#id_perfil").val();
	//var texto = $("#textcomentario").val();
	 var texto=tinyMCE.activeEditor.getContent();
	if (texto!=" "){
		console.log("ingresooo guardarcomentario------- ");
	$.ajax({
		url : "/rade/controlador",
		method: "POST",
		data: { process:"altacomentario", idperfil:idperfil,idposteo:idposteo,texto:texto},
	
		beforeSend: function(){
			
		},
		success: function(respuesta){
			
		$("#textcomentario").val('');	
		location.reload();
		},
		error: function(jqXHR, exception){
			
		}
	});
	console.log("ingresooo guardarcomentario "+url);
	}else{
		document.getElementById('textcomentario').focus();
	}
}
//BORRAR
function borrar(codigo){
	$.ajax({
		url : "controlador",
		method: "POST",
		
		data: { process:"bajaposteo", codigo:codigo},
	
		beforeSend: function(){
			
		},
		success: function(respuesta){
			cargarposteo(ultimovalor);
			/*$("#resultado").html(respuesta);*/
		//	location.reload();
		},
		error: function(jqXHR, exception){
			
		}
	});
}
//BORRAR COMENTARIO
function borrar_c(codigo){
	console.log("ingresooo borrar "+codigo);
	$.ajax({
		url : "/rade/controlador",
		method: "POST",
		
		data: { process:"bajacomentario", codigo:codigo},
	
		beforeSend: function(){
			
		},
		success: function(respuesta){
			//cargarposteo(ultimovalor);
			cargar_comentarios(0);
			
		},
		error: function(jqXHR, exception){
			
		}
	});
}
//PUNTAJE
function guarda_puntaje_posteo(){
	
	var puntaje = $('input[name="optradio"]:checked').val();
	var posteo= pos;
	var idperfil= $("#id_perfil").val();
	console.log("ingresooo ountaje "+puntaje);
	$.ajax({
		url : "controlador",
		method: "POST",
		data: { process:"alta_puntaje_posteo", posteo:posteo, idperfil:idperfil,puntaje:puntaje},
	
		beforeSend: function(){
			
		},
		success: function(respuesta){			
			$("#punto"+posteo+"").empty();
			$("#punto"+posteo+"").append(respuesta);
			
		},
		error: function(jqXHR, exception){
			
		}
	});
}


//MODIFICAR
function mod(codigo,usuario,titulo,tema, texto){
		valorscroll=3;
		$("#id_posteo").val(codigo);
		$("#titulo").val(titulo);

		document.getElementById("temas").selectedIndex =tema;
			
		tinyMCE.activeEditor.setContent(texto);
		$("#divnuevoposteo").click();
		
		$.ajax({
			url : "controlador",
			method: "POST",
			data: { process:"traerprivacidad",id_posteo:codigo},
			beforeSend: function(){
				
			},
			success: function(respuesta){	
				document.getElementById("privacidad").selectedIndex=respuesta;
				console.log(tema+" "+respuesta);
				 var temas = $("#temas").val();
				   var privacidad11 = $("#privacidad").val();
				   console.log(temas+" "+privacidad11);
				   
			},
			error: function(jqXHR, exception){
				
			}
		});
	
	$('#divmiposteo').hide();
	$('#divnuevoposteo').show();
	$('#divverposteo').hide();
	$('#divcomentario').hide();
}

///MURO GENERAL
function cargartotsposteo(ultimo){
	console.log("ingreso cargar  posteo muro");
	ultimovalor=ultimo;
	var datos=$('#busquedaTodoposteo').val();
	var id=$('#id_perfil').val();
	console.log("ingreso carga todo "+ultimo+" "+datos+" perfil "+id);
	
		accion='Filtromuro';
		$.ajax
		    ({
		    type: "POST",           
		    data: {process:accion,id:id,datos:datos,ultimo:ultimo},
		    url: 'controlador',
		    success:function(datos)
		    {
		    	if(ultimo==0){$("#divposteomuro").empty();}
		    	var jsonData = JSON.parse(datos);
				for (var i = 0; i < jsonData.contenido.length; i++) {
					console.log("ingreso1 ");
						var resul = jsonData.contenido[i];
					for (var j = 0; j < resul.datos.length; j++) {
						console.log("ingreso2 ");
						var valor = resul.datos[j];
						var cod=("punto"+valor.codigo);
						
			                var nuevaFila="<div class=\"post-id\" id="+valor.codigo+">";
                    		nuevaFila+="<div class=\"media border p-2\">"
                    			    +"<div class=\"media-body\">";
                    				nuevaFila+="<p><strong>"+valor.titulo+"</strong></p>";
                    				nuevaFila+="<small class=\"text-muted\">"+valor.usuario+"&emsp;<em>Publicado el "+valor.fecha+"</em></small>" +
                    						"&emsp;<a class=\"icon\" title=\"Ver\" href ="+valor.enlace+" style=\"color:green\" aria-label=\"Left Align\">" +
			                	"<span class=\"fa fa-commenting\">" +
			                		"</span></a></em>";
				            nuevaFila+="&emsp;<span><button class=\"btn btn-light fa fa-thumbs-o-up\"   id="+cod+" onclick=\"vermodal("+valor.codigo+")\">"+valor.puntaje+"</button>" +
				            "</span></em>";
                    				+"</div>"
                    				+"</div>"
                    				+"</div>";
		                $("#divposteomuro").append(nuevaFila);
		                console.log("ingreso4 ");
					}
				}	
					
		    },
		    error : function(xhr, status) 
        {
              alert('sin respuesta...');
        }
		    });
}
function vermodal(codigo){
	pos=codigo;
	$('#modal').modal('show');
	//$("#divhidden").html("<input type=\"hidden\" id=\"posteopuntaje\" value="+codigo+">");
	
}
function colo_tabla(datos){
	   var table = document.getElementById(datos);	
	   var celdas = table.getElementsByTagName("tr");
	   for (var i=1; i<celdas.length; i++){
	   if (i%2==0){
	       celdas[i].className ="par";
	   }else {
	       celdas[i].className ="impar";
	       }
	    }
}

function cargar_posteo(codigo){
	$.ajax({
		url : "controlador",
		method: "POST",
		
		data: { process:"cargar_posteo"},
	
		beforeSend: function(){
			
		},
		success: function(respuesta){
		
			$("#div_carga").html(respuesta);
			cargar_comentario(codigo);
		//	location.reload();
		},
		error: function(jqXHR, exception){
			
		}
	});
}

function cargar_comentarios(ultimo){
    console.log("ingresocomentario ");
	var codigo= $("#id_posteo").val();
	var id=$('#id_perfil').val();
	valorscroll=3;
	$.ajax({
		url :  "/rade/controlador",
		method: "POST",
		
		data: { process:"cargar_comentario", codigo:codigo,ultimo:ultimo},
	
		beforeSend: function(){
			
		},
		success: function(datos){
		//	String[] columna= {"usuario","fecha","texto","id"};
	    	if(ultimo==0){$("#divcarga_comentario").empty();}
	    	var jsonData = JSON.parse(datos);
			for (var i = 0; i < jsonData.contenido.length; i++) {
	
					var resul = jsonData.contenido[i];
				for (var j = 0; j < resul.datos.length; j++) {
					var valor = resul.datos[j];
			         console.log("- "+valor);
					
					var nuevaFila="<div class=\"post-id2\" id="+valor.id+">";
                    		nuevaFila+="<div class=\"media border p-2\">"
                    				+"<div class=\"media-body\">"
                    				nuevaFila+="<small class=\"text-muted\">" +
                    						"<strong>"+valor.usuario+"</strong>&emsp;<em>coment&oacute el "+valor.fecha+"</em></small>";
		                    		if(id==valor.idusu.trim()){
		            					nuevaFila+="&emsp;<button class=\"btn btn-light\" style=\"color:red\" title=\"Eliminar Comentario\" onclick=\"borrar_c("+valor.id+");\" aria-label=\"Left Align\">" +
		            							"<span class=\"fa fa-fw fa-trash-o\"></span></button>";	
		            				}
                    				nuevaFila+="<p>"+valor.texto+"</p>"
                    				+"</div>"
                    				+"</div>"
                    				+"</div>";
	                $("#divcarga_comentario").append(nuevaFila);
	                console.log("ingreso4 ");
				}
			}	
				
	    
		},
		error: function(jqXHR, exception){
			
		}
	});
}

///MI POSTEO
function cargarposteo(ultimo){
	 console.log("ingreso cargar mi posteo ");
	ultimovalor=ultimo;
	var datos=$('#busquedaposteo').val();
	var id=$('#id_perfil').val();
	console.log("ingresooo"+ultimo+" "+datos+" "+id);
		accion='Filtromipost';
		$.ajax
		    ({
		    type: "POST",           
		    data: {process:accion,id:id,datos:datos,ultimo:ultimo},
		    url: 'controlador',
		    success:function(datos)
		    {
		    	console.log("ingresooo"+ultimo);
		    	
		    	if(ultimo==0){/*$("#divposteo").empty();*/ $("#tablaPosteo tbody tr").remove(); }
		    	var jsonData = JSON.parse(datos);
				for (var i = 0; i < jsonData.contenido.length; i++) {
						var resul = jsonData.contenido[i];
					for (var j = 0; j < resul.datos.length; j++) {
						var valor = resul.datos[j];
		                var nuevaFila="<tr>"; 
		                nuevaFila+="<td class=\"visible-md visible-lg visible-sm\ post-id1\" id="+valor.codigo+">"+valor.titulo+"<br><small>"+
		 
		                "<button  type=\"button\" class=\"btn btn-info btn-xs\" title=\"Modificar Posteo\" onclick=\"mod('"+valor.codigo+"','"+valor.usuario+"','"+valor.titulo+"','"+valor.idtema+"','"+valor.texto+"')\" aria-label=\"Left Align\"><span class=\"fa fa-edit \"></span></button>&nbsp;&nbsp;"+ 
		                "<button  type=\"button\" class=\"btn btn-danger btn-xs\" title=\"Eliminar Posteo\" onclick=\"borrar("+valor.codigo+")\"   aria-label=\"Left Align\"><span class=\"fa fa-fw fa-trash-o  \"></span></button>" +
		                "</small></td>"
		                nuevaFila+="</tr>";
		                
		                $("#tablaPosteo").append(nuevaFila);
		                	
					}
				}	
				
		    },
		    error : function(xhr, status) 
        {
              alert('sin respuesta...');
        }
		    });
}
	 function mensaje(){
		var temas=$("#temas").val();

	}
	function mensaje2(){
		var privacidad=$("#privacidad").val();
		
	}

	function publicar() {
		   var id_perfil=$("#id_perfil").val();
		   var id_posteo=$("#id_posteo").val();
		   var titulo = $("#titulo").val();
		   var temas = $("#temas").val();
		   var privacidad = $("#privacidad").val();
		   var texto=tinyMCE.activeEditor.getContent();
		      
		   if (titulo==""){
				$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Titulo no ingresado</div>");
				document.getElementById('titulo').focus();
		   }else  if (temas==null){
				$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Tema no seleccionado</div>");
				document.getElementById('temas').focus();
		   }else if (privacidad==null){
				$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Privacidad no seleccionado</div>");
				document.getElementById('privacidad').focus();
		   }else if (tinyMCE.activeEditor.isDirty()) {
			     	
		   $.ajax({
					url : "controlador",
					method: "POST",
					data: { process:"altaposteo",id_perfil:id_perfil,titulo:titulo,temas:temas,privacidad:privacidad,texto:texto,id_posteo:id_posteo},
					beforeSend: function(){
						$("#mensaje").html("<img src=\"views/img/status.gif\"></img>");
					},
					success: function(respuesta){
						tinymce.activeEditor.setContent("");
						$("#titulo").val('');
						$("#mensaje").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Publicacion realizada con Exito</div>");
					//	location.href ="publicaciones";
						$('#divmiposteo').show();
						$('#divnuevoposteo').hide();
						limpiar();
						cargarposteo(0);
					},
					error: function(jqXHR, exception){
						$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Verifique  </div>");
					}
				});
			   
			} else { 
				
				$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Area de texto vacio</div>");
			}
		   function limpiar(){ 
				$("#id_posteo").val("0");
				$("#busqueda").val('');
				$("#titulo").val('');
				$("#msj").hide();
				$("#fin").hide();
				$("#mensaje").hide();
				tinymce.activeEditor.setContent("");
				document.getElementById("temas").selectedIndex = "0";
				document.getElementById("privacidad").selectedIndex = "0";
			}	
}

