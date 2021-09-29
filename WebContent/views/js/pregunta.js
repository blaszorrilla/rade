
var scroll=0;
$(document).ready(function() {
	//inicio
	$('#contenedor2').hide();  
	$('#contenedor3').hide();   
	$('#contenedor1').hide(); 
	document.getElementById('AbrirContenedor4').disabled=true;
	cargar_mas_muro('0');
	scroll=4;
	$('#contenedor4').show();
	
	$("#AbrirContenedor1").click(function(event) { // contenedor que trae las preguntas del usuario
		limpiar();
		scroll=1;
		idminimo();
		document.getElementById('AbrirContenedor1').disabled=true;
		document.getElementById('AbrirContenedor2').disabled=false;
		document.getElementById('AbrirContenedor4').disabled=false;
		$('#contenedor2').hide();
		$('#contenedor3').hide();
		$('#contenedor4').hide();
		cargar_mis_preguntas('0');
		$('#contenedor1').show();
	});
	
	$("#AbrirContenedor2").click(function(event) {  //contenedor para formular preguntas 
		document.getElementById('AbrirContenedor2').disabled=true;
		document.getElementById('AbrirContenedor1').disabled=false;
		document.getElementById('AbrirContenedor4').disabled=false;
		document.getElementById('publica').disabled=true;
		$("#titulo").attr("onblur");
		$("#min_pregunta").val(0);
		$('#contenedor1').hide();
		$('#contenedor4').hide();
		$('#contenedor3').hide();
		$('#contenedor2').show();
	});

	$("#AbrirContenedor4").click(function(event) { // contenedor del muro de preguntas 
		limpiar();
		$("#min_pregunta").val(0);
		scroll=4;
		document.getElementById('AbrirContenedor4').disabled=true;
		document.getElementById('AbrirContenedor2').disabled=false;
		document.getElementById('AbrirContenedor1').disabled=false;
		cargar_mas_muro('0');
		$('#contenedor1').hide();
		$('#contenedor2').hide();
		$('#contenedor3').hide();
		$('#contenedor4').show();
	
	});

});
/*---------------------------------------------------------------VALIDACION------------------------------------------------------*/
function NumText(string){//solo letras y numeros
  /*  verifica();*/
	var out = '';
    //Se añaden las letras validas
    var filtro = 'abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890? ';
    for (var i=0; i<string.length; i++)
       if (filtro.indexOf(string.charAt(i)) != -1) 
	     out += string.charAt(i);
    return out;
}

/*---------------------------------------------------ALTA PREGUNTA-------------------------------------------------------------*/
function mensaje(){
	var temas=$("#temas").val();
}
function mensaje2(){
	var privacidad=$("#privacidad").val();	
}



function preguntar() {
	  var id_pregunta=$("#id_pregunta").val();
	   var id_perfil=$("#id_perfil").val();
	   var titulo = $("#titulo").val();
	   var temas = $("#temas").val();
	   var privacidad = $("#privacidad").val();
	   var texto=tinyMCE.activeEditor.getContent();
	   
	   if (titulo==""){
			$("#titulo").focus();
	   }else  if (temas==null){
			$("#temas").focus();
	   }else if (privacidad==null){
			$("#privacidad").focus();
	   }else if (texto!='') {
		     	
	   $.ajax({
				url : "controlador",
				method: "POST",
				data: { process:"altapregunta",id_pregunta:id_pregunta,id_perfil:id_perfil,titulo:titulo,temas:temas,privacidad:privacidad,texto:texto},
				beforeSend: function(){
					$("#msj").html("<img src=\"views/img/status.gif\"></img>");
				},
				success: function(respuesta){
					
					$("#AbrirContenedor4").click();
					limpiar();
					$("#msj").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Publicaci&oacute;n realizada con Exito</div>");
					$("#msj").html("");
				},
				error: function(jqXHR, exception){
					$("#msj").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button><strong>Atencioacuteon</strong>  - Verifique  </div>");
				}
			});
		   
		} else { 
			tinyMCE.activeEditor.focus();
		}
	 
}

function baja(codigo){  // eliminar una pregunta
	$.ajax({
		url : "controlador",
		method: "POST",
		
		data: { process:"bajapregunta", codigo:codigo},
	
		beforeSend: function(){	
		},
		success: function(respuesta){
			cargar_mis_preguntas('0');
		},
		error: function(jqXHR, exception){
			
		}
	});
}

function verifica(){    //verifica el titulo si ya existe
	$("#msj").html("");
	document.getElementById('publica').disabled=false;
	  var titulo = $("#titulo").val();
	$.ajax({
		url : "controlador",
		method: "POST",
		data: { process:"verificapregunta",titulo:titulo},
		beforeSend: function(){
			
		},
		success: function(respuesta){	
			if (respuesta>0){
				
				 $("#msj").html("<div class=\"alert alert-danger alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button><strong>Atenci&oacute;n</strong> - Titulo ya existente</div>");
               
				document.getElementById('publica').disabled=true;
			}else{
				document.getElementById('publica').disabled=false;
			}
			
		
		},
		error: function(jqXHR, exception){
			
		}
	});
}


function modificar(codigo,titulo,tem,permiso){    //modificar una pregunta 
	$("#id_pregunta").val(codigo.trim());
	$("#titulo").val(titulo);
	$("#AbrirContenedor2").click();
	document.getElementById("temas").selectedIndex =tem;
	document.getElementById("privacidad").selectedIndex =permiso;	
	
	$.ajax({
		url : "controlador",
		method: "POST",
		data: { process:"traerpregunta",id_pregunta:codigo},
		beforeSend: function(){
			
		},
		success: function(respuesta){	
			tinyMCE.activeEditor.setContent(respuesta);
			document.getElementById('publica').disabled=false;
			$("#titulo").removeAttr('onblur');
		},
		error: function(jqXHR, exception){
			
		}
	});
}

function limpiar(){ // borrar todos los campos 
	$("#id_pregunta").val("0");
	$("#busqueda").val('');
	$("#titulo").val('');
	$("#msj").html("");
	tinymce.activeEditor.setContent("");
	document.getElementById("temas").selectedIndex = "0";
	document.getElementById("privacidad").selectedIndex = "0";
}

function idminimo(){   //trae el minimo id de las preguntas del usuario para parar el scroll
	  var id_perfil=$("#id_perfil").val();
		$.ajax({
		url : "controlador",
		method: "POST",
		data: { process:"minimopregunta",id_perfil:id_perfil},
		beforeSend: function(){
		
		},
		success: function(respuesta){	
			$("#min_pregunta").val(respuesta);
		},
		error: function(jqXHR, exception){
			
		}
	});
}

/*---------------------------------------------------------SCROLL----------------------------------------------------------------------------*/
$(window).scroll(function(){	
    if($(window).scrollTop() + $(window).height() >= $(document).height()) {
    	if(scroll==1){
    		
    		var parar=$("#min_pregunta").val();
    		var last_id = $(".post-id2:last").attr("id");
            if (last_id>parar) { 	
            	cargar_mis_preguntas(last_id);
            	
            }else{
                $('.ajax-mispregun').hide();
               $('.finmispregun').show();
            }
    	}else{
    		if(scroll==4){
    		var last_id = $(".post-id:last").attr("id");
            if (last_id>1) {
            	   cargar_mas_muro(last_id); 
            }else{
             $('.ajax-load').hide();
             $('.fin').show();
            }
    		}
    	}
    
    }
});


/*-------------------------------------------------------------MURO PREGUNTAS-------------------------------------------------------*/

function cargar_mas_muro(ultimo){
	   $('.ajax-load').show();
    $('.fin').hide();
	var datos=$('#busqueda').val();
	var id=$('#id_perfil').val();
		accion='todaspreguntas';
		$.ajax
		    ({
		    type: "POST",           
		    data: {process:accion,id:id,datos:datos,ultimo:ultimo},
		    url: 'controlador',
		    success:function(datos)
		    {
		    	$("#tablaPreguntas tbody tr").remove();
		    	var jsonData = JSON.parse(datos);
				for (var i = 0; i < jsonData.contenido.length; i++) {
						var resul = jsonData.contenido[i];
					for (var j = 0; j < resul.datos.length; j++) {
						var valor = resul.datos[j];	   
						  var nuevaFila="<tr>";
			                nuevaFila+="<td class=\"cell-detail\"onclick=\"ir('"+valor.url+"');\"><span class=\"post-id\" id="+valor.codigo+">"+valor.titulo+"</span><em><span class=\"cell-detail-description\"><i class=\"fa fa-user \"></i>&nbsp;"+valor.usuario+"&nbsp;&nbsp;&nbsp;" +
			                		"<i class=\"fa fa-file-text-o \"></i>&nbsp;"+valor.tema+"&nbsp;&nbsp;&nbsp;"
			         if(valor.fecha=='0 '){
			        	 nuevaFila+= "<i class=\"fa fa-clock-o \"></i>&nbsp;hoy a las "+valor.hora+"</span></em></td>"
			         }else{
			        	 if(valor.fecha=='1 '){
			        		 nuevaFila+= "<i class=\"fa fa-calendar \"></i>&nbsp;hace "+valor.fecha+"dia</span></em></td>" 
			        	 }else{
			        		 nuevaFila+= "<i class=\"fa fa-calendar \"></i>&nbsp;hace "+valor.fecha+"dias</span></em></td>" 
			        	 }
			        	
			         }
			                nuevaFila+="</tr>";
			                $("#tablaPreguntas").append(nuevaFila);
			                
			             
			           
					}
				}
		
		    },
		   
		    error : function(xhr, status) 
        {
            /*  alert('sin respuesta...');*/
        }
		    });
}

/*--------------------------------------------------------------ir url de la pregunta------------------------------------------------*/
function ir(url){  
	 location.href =url;
}

    /*  ---------------------------------------------------------- MIS PREGUNTAS ------------------------------------------- */      

function cargar_mis_preguntas(ultimo){
	 $('.ajax-mispregun').show();
	 $('.finmispregun').hide();
	var datos=$('#mibusqueda').val();
	var id=$('#id_perfil').val();
		accion='traermispreguntas';
		$.ajax
		    ({
		    type: "POST",           
		    data: {process:accion,id:id,datos:datos,ultimo:ultimo},
		    url: 'controlador',
		    success:function(datos)
		    {
		    	$("#tablaMisPreguntas tbody tr").remove();
		    	var jsonData = JSON.parse(datos);
				for (var i = 0; i < jsonData.contenido.length; i++) {
						var resul = jsonData.contenido[i];
					for (var j = 0; j < resul.datos.length; j++) {
						var valor = resul.datos[j];	  
						  var nuevaFila="<tr class=\"posteo\">"; 
			                nuevaFila+="<td class=\"post-id2\" id="+valor.codigo+">"+valor.titulo+"<br><small>" +
			                 
			              "<button type=\"button\"  class=\"btn btn-success btn-xs\" onclick=\"ir('"+valor.url+"');\"><i class=\"fa fa-eye\"></i> Ver</button>&nbsp;&nbsp;" +
			              "<button type=\"button\" class=\"btn btn-info btn-xs\" onclick=\"modificar('"+valor.codigo+"','"+valor.titulo+"','"+valor.tem+"','"+valor.permiso+"');\"><i class=\"fa fa-edit\"></i>Modificar</button>&nbsp;&nbsp;"+
			              "<button type=\"button\" class=\"btn btn-danger btn-xs\" onclick=\"baja('"+valor.codigo+"');\"><i class=\"fa fa-trash-o\"></i> Eliminar</button>&nbsp;&nbsp;"+		
			              "</small></td>"
			              
			                nuevaFila+="</tr>";
			              
			    
			                $("#tablaMisPreguntas").append(nuevaFila);
					}
				}
		


		    },
		   
		    error : function(xhr, status) 
        {
           /*   alert('sin respuesta...');*/
        }
		    });
}
             
	
