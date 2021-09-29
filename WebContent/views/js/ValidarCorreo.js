var restablecer = document.getElementById("restablecer");
restablecer.disabled=true;
$('#correo').change(function(){
		var datos=$('#correo').val();
		expr = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if(!expr.test(datos) || datos=="" || datos==null || datos.length == 0){
			$(this).css("border", "1px solid red");	
			restablecer.disabled=true;
		}else{
			$(this).css("border", "1px solid green");
			restablecer.disabled=false;
		}
		$.ajax({
			type: "POST",
			url:"controlador",
			data: {process : "verificaCorreo",datos:datos},
			success:function(resultado){
				$('#mensaje').html(resultado);
				//console.log("Proceso exitoso");
			},
			error:function(resultado){
				console.log("Ocurrio un error");
			} 
		});
	});

$("#restablecer").click(function(){
	$('#msg').hide();
	var correo = document.getElementById("correo").value;
	$.ajax({
		url : "controlador",
		method: "POST",
		data: { process:"restablecerPass", correo:correo},
		beforeSend: function(){
			$("#msg").html("<img src=\"views/img/status.gif\"></img>");
		},
		success: function(respuesta){
			if(respuesta=="NO"){
				$("#contenedorbtn").html('');
				$("#msg").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Ya se gener\u00F3 el enlace de recuperaci\u00F3n de contrase\u00F1a! </div> <button class=\"btn btn-primary btn-block mt-3 \" id=\"reenviarcorreo\">Reenviar Correo</button>");
				//////////////////////////////
				$("#reenviarcorreo").click(function(){
					var correo = document.getElementById("correo").value;
					$.ajax({
						url : "controlador",
						method: "POST",
						data: { process:"reenviarrestablecerPass", correo:correo},
						beforeSend: function(){
							$("#msg").html("<img src=\"views/img/status.gif\"></img>");
						},
						success: function(respuesta){
							if(respuesta=="NO"){
								$("#msg").html('');
								$("#msg").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Ya no se puede reenviar el correo! Consulte su cuenta con la Universidad</div>");
							}else{
								$("#msg").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Solicitud enviada! Revise su bandeja de correo electronico</div>");
								location.href = 'login';
							}
						},
						error: function(jqXHR, exception){
							$("#msg").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
						}
					});
				});
				////////////////////////////////
			}else{
				$("#msg").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Solicitud enviada! Revise su bandeja de correo electronico</div>");
				location.href = 'login';
			}
		},
		error: function(jqXHR, exception){
			$("#msg").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
		}
	});

});

///////////////////////////////////////////////////
/*$("#reenviarcorreo").click(function(){
	var correo = document.getElementById("correo").value;
	$.ajax({
		url : "controlador",
		method: "POST",
		data: { process:"reenviarrestablecerPass", correo:correo},
		beforeSend: function(){
			$("#msg").html("<img src=\"views/img/status.gif\"></img>");
		},
		success: function(respuesta){
			if(respuesta=="NO"){
				$("#msg").html('');
				$("#msg").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Ya no se puede reenviar el correo! Consulte su cuenta con la Universidad</div>");
			}else{
				$("#msg").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Solicitud enviada! Revise su bandeja de correo electronico</div>");
				location.href = 'login';
			}
		},
		error: function(jqXHR, exception){
			$("#msg").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
		}
	});
});*/