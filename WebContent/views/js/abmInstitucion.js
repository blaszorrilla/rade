////////////////////
$(document).ready(function(){
	
	function limpiar(){ // borrar todos los campos 
		$("#nombreInstitucion").val('');
		$("#ciuInsti").val('');
		$("#dirInstitucion").val('');
		$("#telInstitucion").val('');
		$("#correoInstitucion").val('');
		$("#usuInsti").val('');
		$("#pssInsti").val('');
		document.getElementById("#tipoInsti").selectedIndex = "0";
		
	}
	$("#cancelInsti").click(function(){
		limpiar();
	});
$("#guardarInsti").click(function(){
		var nombre ="";
		var direccion ="";
		var telefono ="";
		var correo ="";
		var tipoInsti =0;
		var usuario="";
		var pass="";
		var ciudad="";
		
		if($('#tipoacceso').val()=="CEO"){
			nombre=$('#nombreInstitucion').val();
			direccion=$('#dirInstitucion').val();
			telefono=$('#telInstitucion').val();
			correo=$('#correoInstitucion').val();
			tipoInsti=$('#tipoInsti').val();
			usuario=$('#usuInsti').val();
			pass=$('#pssInsti').val();
			ciudad=$('#ciuInsti').val();
		}
		
		$.ajax({
			url : "controlador",
			method: "POST",
			data: { process:"guardarInsti",nombre:nombre,direccion:direccion,telefono:telefono,correo:correo,usuario:usuario,pass:pass,tipoInsti:tipoInsti,ciudad:ciudad},
			success: function(respuesta){
				$("#msjGuardar").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Institucion registrada con \u00E9xito!</div>");
				console.log(respuesta);
				//location.reload();
			},
			error: function(jqXHR, exception){
				$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
			}
		});
		
	});
	$("#bscInstitucion").click(function(event) { 
	document.getElementById('contenedor1').disabled=true;
	document.getElementById('contenedor2').disabled=false;
	$('#contenedor2').show();
	$('#contenedor1').hide();
	
	
	});
	$("#contAgregInstitucion").click(function(event) { 
	document.getElementById('contenedor1').disabled=false;
	document.getElementById('contenedor2').disabled=true;
	$('#contenedor2').hide();
	$('#contenedor1').show();
	
});
	$("#buscarInstitucion").click(function(){
		var nombre = $("#mibusqueda").val();
		$("#tablaInstitucion tbody tr").remove();	
			$.ajax({
				url : "controlador",
				method: "POST",
				data: { process:"buscarInstitucion",nombre:nombre},
				beforeSend: function(){
					$("#mensaje").html("<img src=\"views/img/status.gif\"></img>");
				},
				success: function(respuesta){
					$("#busqueda").html(respuesta);
					$("#mensaje").html("");
					
					
				},
				error: function(jqXHR, exception){
					$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
				}
			});
			
		});
	
});
	/////////////////////7