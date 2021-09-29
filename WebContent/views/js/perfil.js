$(document).ready(function(){
	$("#cerrar").click(function(){
		
		$.ajax({
			url : "../controlador",
			method: "POST",
			data: { process:"cerrar"},
			success: function(respuesta){
				console.log(respuesta);
				location.reload();
				//location.href = respuesta;
			},
			error: function(jqXHR, exception){
				$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
			}
		});

		
	});
});