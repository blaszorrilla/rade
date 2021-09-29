var nuevo_pass = document.getElementById("nuevo_pass");
nuevo_pass.disabled = true;
var cod=/^[A-Za-z0-9]+$/; 
$('#pass').change(function(){
	var pass=$('#pass').val();
		if(!cod.test(pass)){
				$(this).css("border", "1px solid red");
				nuevo_pass.disabled = true;
		 }
		else if( pass.length<8){
			$("#msjPass").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Contrase\u00F1a muy d\u00E9bil</div>");
			$(this).css("border", "1px solid red");
			nuevo_pass.disabled = true;
		}
		else{
			$("#msjPass").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Bien!</div>");
			 $(this).css("border", "1px solid green");
			 nuevo_pass.disabled = false;
		 }
	});

$('#pass2').change(function(){
	$('#msjPass').hide();
	var pass=$('#pass').val();
	var pass2=$('#pass2').val();
	if(!cod.test(pass2)){
			$(this).css("border", "1px solid red");
			nuevo_pass.disabled = true;
	 }
	else if(pass2.length<8){
		$("#msjPass2").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Contrase\u00F1a muy d\u00E9bil</div>");
		$(this).css("border", "1px solid red");
		nuevo_pass.disabled = true;
	}
	else if(pass2!=pass){
		$(this).css("border", "1px solid red");
		$("#msjPass2").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Las contrase\u00F1as no coinciden</div>");
		nuevo_pass.disabled = true;
	}
	else{
		$("#msjPass2").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Bien!</div>");
		 $(this).css("border", "1px solid green");
		 nuevo_pass.disabled = false;
	 }
});
$("#nuevo_pass").click(function(){
	var pass2 = $("#pass2").val();
	$.ajax({
		url : "controlador",
		method: "POST",
		data: { process:"cambiarPass", pass2:pass2},
		beforeSend: function(){
			$("#mensaje").html("<img src=\"views/img/status.gif\"></img>");
		},
		success: function(respuesta){
			$("#mensaje").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Cambio de contrase\u00F1a realizado con \u00E9xito!</div>");
			location.href = 'login';
		},
		error: function(jqXHR, exception){
			$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
			console.log("error")
		}
	});
});