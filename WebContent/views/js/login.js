var variable="";
$(document).ready(function(){
	var variable="";
	$("#inicio").click(function(){
		$("#mensajeusuario").html("");
		$("#mensajepass").html("");
		var usuario = $("#usuario").val();
		var pass = $("#pass").val();
		
		$.ajax({
			url : "controlador",
			method: "POST",
			data: { process:"ingreso",usuario:usuario,pass:pass},
			beforeSend: function(){
				$("#mensaje").html("<img src=\"views/img/status.gif\"></img>");
			},
			success: function(respuesta){
				//$("#mensaje").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Registro Guardado con Exito</div>");
				var pi="";	//	primer caracter
				var sg=""; //	segundo caracter
				for (var i = 0; i < respuesta.length; i++) {
					if(respuesta.charAt(i)=="s"){
						pi=respuesta.charAt(i);
						sg=i+1;
					}else if(pi=="s" && respuesta.charAt(i)=="i" && i==sg){
						variable="xctrx";
					}
				}
				if(variable=="xctrx"){
					//location.reload();
					//window.location.href(respuesta.replace('si'));
					$("#mensaje").html("");
					console.log(respuesta);
					console.log(respuesta.replace('si',''));
					
					location.href = respuesta.replace('si','');
				}else if(respuesta=="usuario"){
					$("#mensaje").html("");
					$("#mensajeusuario").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">El Usuario no Existe</div>");
				}else if(respuesta=="pass"){
					$("#mensaje").html("");
					$("#mensajepass").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">La Contrase\u00f1a no es valida</div>");
				}
			},
			error: function(jqXHR, exception){
				$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Error. Intente nuevamente</div>");
			}
		});
	});
});


