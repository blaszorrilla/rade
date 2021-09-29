var validarRegistro = document.getElementById("validarRegistro");
validarRegistro.disabled = true;
$(document).ready(function(){
	$("#validarRegistro").click(function(){
			var codigo= $("#codigo").val();
			var usuario = $("#usuario").val();
			var pass = $("#pass").val();
			$.ajax({
				url : "controlador",
				method: "POST",
				data: { process:"validarUsuario", usuario:usuario,pass:pass,codigo:codigo},
				beforeSend: function(){
					$("#mensaje").html("<img src=\"views/img/status.gif\"></img>");
				},
				success: function(respuesta){
					$("#mensaje").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Registro finalizado con \u00E9xito!</div>");
					location.href = 'login';
				},
				error: function(jqXHR, exception){
					$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
					console.log("error")
				}
			});
	});
	$('#usuario').change(function(){
		var validarRegistro = document.getElementById("validarRegistro");
		var datos=$('#usuario').val();
		var codigoUsuario=/^[A-Za-z0-9]+$/; 
		 if(!codigoUsuario.test(datos)){
			 $('#mensaje').hide();
			 validarRegistro.disabled = true;
			 $("#msjUsuario").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Utilice solamente letras y numeros</div>");
			 $(this).css("border", "1px solid red");
			
		 }else{
			 $(this).css("border", "1px solid green");
		 }
		
		$.ajax({
			type: "POST",
			url:"controlador",
			data: {process : "validar",datos:datos},
			success:function(resultado){
				$('#mensaje').html(resultado);
				//console.log("Proceso exitoso");
			},
			error:function(resultado){
				console.log("Ocurrio un error");
			} 
		});
	});
	$('#pass').change(function(){
		$('#mensaje').hide();
		var validarRegistro = document.getElementById("validarRegistro");
		validarRegistro.disabled = true;
		var pass=$('#pass').val();
		var cod=/^[A-Za-z0-9]+$/; 
		if(!cod.test(pass)){
				$(this).css("border", "1px solid red");
				validarRegistro.disabled = true;
		 }
		else if( pass.length<8){
			$("#msjPass").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Contrase\u00F1a muy d\u00E9bil</div>");
			$(this).css("border", "1px solid red");
			validarRegistro.disabled = true;
		}
		else{
			$("#msjPass").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Bien!</div>");
			 $(this).css("border", "1px solid green");
			 validarRegistro.disabled = false;
		 }
	});
	////////////////	 
});




