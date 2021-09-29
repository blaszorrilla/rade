$(document).ready(function(){
	function limpiar(){ // borrar todos los campos 
		$("#instiCarrera").val('');
		document.getElementById("#instiCarrera").selectedIndex = "0";
		
	}
	$("#cancelCarrera").click(function(){
		limpiar();
	});
	
	$("#guardarCarrera").click(function(){
		var carrera ="";
		var id_institucion=0;
		if($('#tipoacceso').val()=="CEO"){
			carrera=$('#instiCarrera').val();
			id_institucion=$('#agrrInsti').val();
			console.log(id_institucion);
			console.log(carrera);
		}
		$.ajax({
			url : "controlador",
			method: "POST",
			data: { process:"guardarCarrera",carrera:carrera,id_institucion:id_institucion},
			success: function(respuesta){
				$("#msjCarrera").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Carrera registrada con \u00E9xito!</div>");
				console.log(respuesta);
				//location.reload();
			},
			error: function(jqXHR, exception){
				$("#msjCarrera").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
			}
		});
	});
});