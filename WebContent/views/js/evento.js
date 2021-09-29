
$("#guardar_evento").click(function(){
	console.log("holaa llegue");
    var codigo = $("#codigo").val();
    var titulo = $("#evento").val();
	var fecha = ($("#fecha").val()+" "+$("#hora").val());
	var texto = tinyMCE.activeEditor.getContent();
	var ubicacion = $("#busqueda").val();
	var id_perfil = $("#id_perfil").val();
	var id_permiso =  $("#privacidad").val();
	
	if (titulo==""){
		$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Titulo no ingresado</div>");
		document.getElementById('titulo').focus();
   }else  if (fecha==""){
		$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Fecha no seleccionado</div>");
		document.getElementById('fecha').focus();
   }else if (texto==""){
		$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Descripcion no seleccionado</div>");
		document.getElementById('texto').focus();
   }if (ubicacion==""){
		$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Ubicacion no ingresado</div>");
		document.getElementById('busqueda').focus();
   }else  if (privacidad==""){
		$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Privacidad no seleccionado</div>");
		document.getElementById('privacidad').focus();
   }
   
	
	console.log("holaa "+ codigo+" titulo=> "+titulo+"fecha=> "+fecha+"texto=> "+texto+"ubicacion=> "+ubicacion+"id_perfil=> "+id_perfil+"id_permiso=> "+id_permiso);
	$.ajax({
		url : "controlador",
		method: "POST",
		data: { process:"altaevento",codigo:codigo, titulo:titulo,fecha:fecha,texto:texto,ubicacion:ubicacion,id_perfil:id_perfil,id_permiso:id_permiso},
		beforeSend: function(){
			$("#mensaje").html("<img src=\"views/img/status.gif\"></img>");
		},
		success: function(respuesta){
		$("#mensaje").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Registro Guardado con Exito</div>");
		location.reload();
		},
		error: function(jqXHR, exception){
			$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
		}
	});
});
		
		/*function buscarevento() {
			var busca = $("#busca").val();
			$.ajax({
				url : "controlador",
				method: "POST",
				
				data: { process:"buscarevento", busca:busca},
			
				beforeSend: function(){
					
				},
				success: function(respuesta){
					$("#resultado").html(respuesta);
				},
				error: function(jqXHR, exception){
					
				}
			});

		}*/

		
	



		/*function traerevento(){
			var id_evento = $("#id_evento").val();
			console.log(id_evento);
			$.ajax({
				url : "controlador",
				method: "POST",
				
				data: { process:"traerevento", id_evento:id_evento},
			
				beforeSend: function(){
					
				},
				success: function(respuesta){
					$("#resultado2").html(respuesta);
				},
				error: function(jqXHR, exception){
					
				}
			});
		}*/

		function guardarcomentarioevento(){
			var codigo = $("#id_evento").val();
			var idperfil=$("#id_perfil").val();
			
			var texto = $("#textcomentario").val();
			console.log(codigo);
			if(texto!=""){
			console.log(codigo);
			$.ajax({
				url : "/rade/controlador",
				method: "POST",
				
				data: { process:"altacomentarioevento",codigo:codigo, idperfil:idperfil,texto:texto},
			
				beforeSend: function(){
					
				},
				success: function(respuesta){
				$("#textcomentario").val('');
				
				location.reload();
				},
				error: function(jqXHR, exception){
					
				}
			});
			
			}else{
				document.getElementById('textcomentario').focus();
			}
		}

	/*	function traercomentario(){
			var codigo = $("#id_evento").val();
			$.ajax({
				url : "controlador",
				method: "POST",
				
				data: { process:"traercomentario", codigo:codigo},
			
				beforeSend: function(){
					
				},
				success: function(respuesta){
					$("#resultado3").html(respuesta);
				
				},
				error: function(jqXHR, exception){
					
				}
			});
		}
*/


		

	

	

