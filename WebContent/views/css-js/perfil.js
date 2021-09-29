$(document).ready(function(){
	$("#cerrar").click(function(){
		
		$.ajax({
			url : "controlador",
			method: "POST",
			data: { process:"cerrar"},
			success: function(respuesta){
				console.log(respuesta);
				location.reload();
			},
			error: function(jqXHR, exception){
				$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
			}
		});
		
	});
	
	$("#guardardatosperfil").click(function(){
		var nombre ="";
		var apellido ="";
		var sexo ="";
		var institucion ="";
		var carrera ="";

		
		if($('#tipoacceso').val()=="PERFIL"){
			nombre=$('#perfilnombre').val();
			apellido=$('#perfilapellido').val();
			sexo=$('#perfilsexo').val();
			institucion=$('#instiperfil').val();
			carrera=$('#carreraPerfil').val();
		}
		//console.log("carrera-- "+carrera);
		$.ajax({
			url : "controlador",
			method: "POST",
			data: { process:"guardardatosperfil",nombre:nombre,apellido:apellido,sexo:sexo,carrera:carrera},
			success: function(respuesta){
				console.log(respuesta);
				location.reload();
			},
			error: function(jqXHR, exception){
				$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
			}
		});
		
	});
	//////////////////////
	$("#instiPerfil").on('click',function(){
		var insti = $("#instiPerfil").val();
		cargarCarrera(insti);
		console.log(insti);
	});
	
	$("#carreraPerfil").on('click',function(){
		var carreras = $("#carreraPerfil").val();
		console.log(carreras);
	});
	
	///////////////////////
	$("#guardardatosceo").click(function(){
		var nombre ="";
		var apellido ="";
		var direccion ="";
		var telefono ="";
		var pagina ="";
		//var institucion ="";
		
		if($('#tipoacceso').val()=="CEO"){
			nombre=$('#ceonombre').val();
			apellido=$('#ceoapellido').val();
			direccion=$('#ceodireccion').val();
			telefono=$('#ceotelefono').val();
			pagina=$('#ceopagina').val();
			//institucion=$('#insticeo').val();
		}
		
		$.ajax({
			url : "controlador",
			method: "POST",
			data: { process:"guardardatosceo",nombre:nombre,apellido:apellido,direccion:direccion,telefono:telefono,pagina:pagina},
			success: function(respuesta){
				console.log(respuesta);
				location.reload();
			},
			error: function(jqXHR, exception){
				$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
			}
		});
		
	});

});

////////////////////
$("#guardardatosinsti").click(function(){
	var nombre ="";
	var direccion ="";
	var telefono ="";
	
	if($('#tipoacceso').val()=="INSTITUCION"){
		nombre=$('#instinombre').val();
		direccion=$('#instidireccion').val();
		telefono=$('#institelefono').val();
		
	}
	
	$.ajax({
		url : "controlador",
		method: "POST",
		data: { process:"guardardatosinsti",nombre:nombre,direccion:direccion,telefono:telefono},
		success: function(respuesta){
			console.log(respuesta);
			location.reload();
		},
		error: function(jqXHR, exception){
			$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
		}
	});
	
});

function cargarCarrera(datos){
	$("#carreraPerfil").html('');
	$.ajax({
		url : "controlador",
		method: "POST",
		data: { process:"filtrocarreraperfil",datos:datos},
		success: function(respuesta){
			$("#carreraPerfil").html(respuesta);
		},
		error: function(jqXHR, exception){
			$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
		}
	});
}