$(document).ready(function(){
	$("#restablecer").click(function(){
		var correo = document.getElementById("correo").value;
		//var correo = $("#correo").val();
		//console.log(correo);
		$.ajax({
			url : "controlador",
			method: "POST",
			data: { process:"restablecerPass", correo:correo},
			beforeSend: function(){
				
				$("#mensaje").html("<img src=\"views/img/status.gif\"></img>");
			},
			success: function(respuesta){
				$("#mensaje").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Solicitud enviada con exito!. Revise su bandeja de correo</div>");
			},
			error: function(jqXHR, exception){
				$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
			}
		});
	});
	
	/*function validarEmail(correo) {
		var correo=$('#nombre').val();
		expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if ( !expr.test(correo) ){
			alert("Error: La dirección de correo " + correo + " es incorrecta.");
			//$('#error_data').show();
			//$('#error_data').text('La dirección de correo es incorrecta.');
			return false;
		}   
		return true;
    } */
	restablecer.disabled=true;
	$('#correo').change(function(){
		//var datos= document.getElementById("correo");
		var datos=$('#correo').val();
		var restablecer = document.getElementById("restablecer");
	expr = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if(!expr.test(datos)|| datos=="" || datos==null || datos.length == 0){
		/*$("#mensaje").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">La direccion  es correcta</div>");
		$(this).css("border", "1px solid green");
		restablecer.disabled=false;*/
		$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">La direccion de correo es incorrecta</div>");
		//$(this).css('background-color', 'red');
		// $(this).addClass("red-border");
		$(this).css("border", "1px solid red");	
		restablecer.disabled=true;
	}else{
		$("#mensaje").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">La direccion  es correcta</div>");
		$(this).css("border", "1px solid green");
		restablecer.disabled=false;
	}
});
	/*var restablecer = document.getElementById("restablecer");
	restablecer.disabled=true;
	function activarBoton() {
	    if(verificar()) {
	    	restablecer.disabled=false;
	    }
	    else {
	    	restablecer.disabled=true;
	    }
	}*/
});

	
	

