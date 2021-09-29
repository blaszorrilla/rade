 idmax();
function guardarespuesta(){           //GUARDAR  RESPUESTA  
	var idpregunta = $("#id_pregunta").val();
	var idrespuesta = $("#id_respuesta").val();
	var idperfil= $("#id_perfil").val();
	var texto=tinyMCE.activeEditor.getContent();
    var codigo=idpregunta;
   
	if (texto!=''){
	$.ajax({
		url : "/rade/controlador",
		method: "POST",
		data: { process:"altarespuesta", idperfil:idperfil,idpregunta:idpregunta,idrespuesta:idrespuesta,texto:texto},
	
		beforeSend: function(){
			
		},
		success: function(respuesta){	
		tinymce.activeEditor.setContent("");
		cargar_respuestas('0');
		$("#id_respuesta").val("0");
		},
		error: function(jqXHR, exception){
			
		}
	});
	
	}else{
		tinyMCE.activeEditor.focus();
	}
}



function modificarespuesta(codigo,texto){        // MODIFICAR RESPUESTA 
	$("#id_respuesta").val(codigo.trim());
	tinyMCE.activeEditor.focus();
	tinyMCE.activeEditor.setContent(texto);
	document.getElementById('modi').disabled=true;
	document.getElementById('bor').disabled=true;
	document.getElementById('points').disabled=true;


}

function puntuarespuesta(codigo,punto){           //PUNTUAR  RESPUESTA  
	
	var idperfil= $("#id_perfil").val();
	$.ajax({
		url : "/rade/controlador",
		method: "POST",
		data: { process:"puntuacionrespuesta", idperfil:idperfil,idrespuesta:codigo,punto:punto},
	
		beforeSend: function(){
			
		},
		success: function(respuesta){	
			cargar_respuestas('0');
		},
		error: function(jqXHR, exception){
			
		}
	});
}

function pointsrespuesta(codigo,punto){          //quien puntuo la respuesta
	$.ajax({
		url : "/rade/controlador",
		method: "POST",
		data: { process:"pointsrespuesta", idrespuesta:codigo},
	
		beforeSend: function(){
			
		},
		  success:function(datos){	
			
			  $(".modal-body").empty()
			  $(".modal-body").append("<tr><td><strong>Usuario&nbsp;</strong></td><td><strong>&nbsp;Puntos</strong></td></tr>");
			  var jsonData = JSON.parse(datos);
				for (var i = 0; i < jsonData.contenido.length; i++) {
						var resul = jsonData.contenido[i];
					for (var j = 0; j < resul.datos.length; j++) {
						var valor = resul.datos[j];	  
						var nuevaFila=valor.usuario
						$(".modal-body").append("<tr><td>"+valor.usuario+"</td><td align=\"center\">"+valor.punto+"</td></tr>"); 
						
				}
					$("#puntosModal").modal()
			}
		},
		error: function(jqXHR, exception){
			
		}
	});
}




function puntos(codigo){           //traer puntos de las respuestas 
	$.ajax({
		url : "/rade/controlador",
		method: "POST",
		data: { process:"puntosrespuesta",codigo:codigo},
	
		beforeSend: function(){
			
		},
		success: function(respuesta){
			if(respuesta=='null'){
				$("#resul"+codigo+"").html("<div class=\"float-none\"><i class=\"fa fa-thumbs-o-up\"></i> <small>0</small></div>");
			}else{
				$("#resul"+codigo+"").html("<div class=\"float-none\"><i class=\"fa fa-thumbs-o-up\"></i> <small>"+respuesta+"</small></div>");	
			}
			
		},
		error: function(jqXHR, exception){
			
		}
	});

    
}

function idmax(){   //trae el maximo id de la respuesta para parar el scroll
	  var id_pregunta=$("#id_pregunta").val();
		$.ajax({
		url : "/rade/controlador",
		method: "POST",
		data: { process:"maximorespuesta",id_pregunta:id_pregunta},
		beforeSend: function(){
		
		},
		success: function(respuesta){	
			$("#max_respuesta").val(respuesta);
		},
		error: function(jqXHR, exception){
			
		}
	});
}

             
		/*	-----------------------------------------------------ver respuestas-----------------------------------------------------*/
$(window).scroll(function() {
    if($(window).scrollTop() + $(window).height() >= $(document).height()) {
    var last_id = $(".post-id3:last").attr("id");
    idmax();
    var parar2=$("#max_respuesta").val();
        if (last_id<parar2) {
        	cargar_respuestas(last_id);
        }else{
            $('.ajax-loadrespuesta').hide();
            $('.finrespuesta').show();
          
        }
    }
});



function cargar_respuestas(ultimo){
	  $('.ajax-loadrespuesta').show();
      $('.finrespuesta').hide();
	var datos= $("#id_pregunta").val();
	var id=$('#id_perfil').val();
		accion='respuestas';
		$.ajax
		    ({
		    type: "POST",           
		    data: {process:accion,id:id,datos:datos,ultimo:ultimo},
		    url: '/rade/controlador',
		    success:function(datos)
		    {
		    	$("#divposteo").html("");
		    	var jsonData = JSON.parse(datos);
				for (var i = 0; i < jsonData.contenido.length; i++) {
						var resul = jsonData.contenido[i];
					for (var j = 0; j < resul.datos.length; j++) {
						var valor = resul.datos[j];	  
						var nuevaFila=	"<div class=\"posteo\">"
					  
						+"<div class=\"media border p-2\">";
						
						if(valor.tipo=='1 '){
							nuevaFila+="<img src=\"a<../../../views/images/institucion.png\" class=\"mr-2 mt-2 rounded-circle\" style=\"width:45px;\" >";	
						}else if(valor.tipo=='2 '){
							nuevaFila+="<img src=\"a<../../../views/images/user.png\" class=\"mr-2 mt-2 rounded-circle\" style=\"width:45px;\" >";	
						}else if(valor.tipo=='3 '){
							nuevaFila+="<img src=\"a<../../../views/images/Logoo_rade-copia.png\" class=\"mr-2 mt-2 rounded-circle\" style=\"width:45px;\" >";	
						}else{
							nuevaFila+="<img src=\"a<../../../views/images/pregunta.png\" class=\"mr-2 mt-2 rounded-circle\" style=\"width:45px;\" >";	
						}
						
						nuevaFila+="<div class=\"media-body\">"
						 nuevaFila+="<small><p>"+"<strong>"+valor.usuario+"</strong><em>respondi&oacute el "+valor.fecha+" a las "+valor.hora+"</em></p></small>"
						 nuevaFila+="<p  class=\"post-id3\" id="+valor.codigo+">"+valor.texto+"</p>"
						if(id==valor.idusu.trim()){
							
							 nuevaFila+="<small><p><button type=\"button\" class=\"btn btn-link btn-xs float-right\" id=\"modi\"onclick=\"baja_res('"+valor.codigo+"')\">Eliminar</button>" +
							 "<button type=\"button\" class=\"btn btn-link btn-xs float-right\" id=\"bor\" onclick=\"modificarespuesta('"+valor.codigo+"','"+valor.texto+"')\">Modificar</button>"+
							 "<button type=\"button\" class=\"btn btn-link btn-xs float-right\" id=\"points\" onclick=\"pointsrespuesta('"+valor.codigo+"')\">Puntos</button></small>"
							 nuevaFila+="</p>"
						 			
						}else{}

				nuevaFila+="<small>"
				+"<div class=\"panel panel-default\">"
						  +"<div class=\"panel-heading\">"
						  +"  <p class=\"panel-title\">"
						  +"<a data-toggle=\"collapse\" data-parent=\"#accordion\"  href=\"#collapse"+valor.codigo+"\" class=\"\" aria-expanded=\"true\">Puntuar</a>"
						  +"</p>"
						  +"</div>"
						 +"<div id=\"collapse"+valor.codigo+"\" class=\"panel-collapse collapse in\" aria-expanded=\"true\" style=\"\"\">"
						  +"<div class=\"panel-body\">"
						   +"<span><button type=\"button\" class=\"btn btn-link btn-xs \" onclick=\"puntuarespuesta("+valor.codigo+",'5')\">+5</button> " 
						  + "<button type=\"button\" class=\"btn btn-link btn-xs \" onclick=\"puntuarespuesta("+valor.codigo+",'4')\">+4</button>"
						  + "<button type=\"button\" class=\"btn btn-link btn-xs \" onclick=\"puntuarespuesta("+valor.codigo+",'3')\">+3</button>"
						  + "<button type=\"button\" class=\"btn btn-link btn-xs \" onclick=\"puntuarespuesta("+valor.codigo+",'2')\">+2</button>"
						  + "<button type=\"button\" class=\"btn btn-link btn-xs \" onclick=\"puntuarespuesta("+valor.codigo+",'1')\">+1</button>"
						  +"</span>"
						   +"  </div>"
						   +" </div>"
						   +"</div>"
						 +"</small>" 			
						nuevaFila+="</div>"
					    puntos(valor.codigo);
				
					nuevaFila+="<div id=\"resul"+valor.codigo.trim()+"\"></div>";
						nuevaFila+="</div>";
			             $("#divposteo").append(nuevaFila);
			         
					}
				}
		


		    },
		   
		    error : function(xhr, status) 
        {
            /*  alert('sin respuesta...');*/
        }
		    });
}
/*--------------------------------------------------BAJA RESPUESTA-----------------------------------------------------*/
function baja_res(codigo){ 
	var idpregunta = $("#id_pregunta").val();
	$.ajax({
		url : "/rade/controlador",
		method: "POST",
		
		data: { process:"bajarespuesta", codigo:codigo},
	
		beforeSend: function(){	
		},
		success: function(respuesta){
			cargar_respuestas('0',idpregunta);
		},
		error: function(jqXHR, exception){
			
		}
	});
}



