$( document ).ready(function() {
	$("#contenedor8").hide();
	$("#contenedor7").hide();
	$("#contenedor6").hide();
	$("#contenedor5").hide();
	$("#contenedor4").hide();
	$("#contenedor3").hide();
	$("#contenedor2").hide();
	$("#contenedor1").show();	
	$( "#abrirContenedor2" ).click(function() {
		$("#contenedor1").hide();
		$("#contenedor2").show();
		$("#contenedor3").hide();
		$("#contenedor4").hide();
		$("#contenedor5").hide();
		$("#contenedor6").hide();
		$("#contenedor7").hide();
		$("#contenedor8").hide();
	});
	$( "#abrirContenedor3" ).click(function() {
		$("#contenedor1").hide();
		$("#contenedor2").hide();
		$("#contenedor3").show();
		$("#contenedor4").hide();
		$("#contenedor5").hide();
		$("#contenedor6").hide();
		$("#contenedor7").hide();
		$("#contenedor8").hide();
	});
	$( "#abrirContenedor4" ).click(function() {
		$("#contenedor1").hide();
		$("#contenedor2").hide();
		$("#contenedor3").hide();
		$("#contenedor4").show();
		$("#contenedor5").hide();
		$("#contenedor6").hide();
		$("#contenedor7").hide();
		$("#contenedor8").hide();
	});	
	$( "#abrirContenedor5" ).click(function() {
		$("#contenedor1").hide();
		$("#contenedor2").hide();
		$("#contenedor3").hide();
		$("#contenedor4").hide();
		$("#contenedor5").show();
		$("#contenedor6").hide();
		$("#contenedor7").hide();
		$("#contenedor8").hide();
	});
	$( "#abrirContenedor6" ).click(function() {
		$("#contenedor1").hide();
		$("#contenedor2").hide();
		$("#contenedor3").hide();
		$("#contenedor4").hide();
		$("#contenedor5").hide();
		$("#contenedor6").show();
		$("#contenedor7").hide();
		$("#contenedor8").hide();
	});	
	$( "#abrirContenedor7" ).click(function() {
		$("#contenedor1").hide();
		$("#contenedor2").hide();
		$("#contenedor3").hide();
		$("#contenedor4").hide();
		$("#contenedor5").hide();
		$("#contenedor6").hide();
		$("#contenedor7").show();
		$("#contenedor8").hide();
	});
	$( "#abrirContenedor8" ).click(function() {
		$("#contenedor1").hide();
		$("#contenedor2").hide();
		$("#contenedor3").hide();
		$("#contenedor4").hide();
		$("#contenedor5").hide();
		$("#contenedor6").hide();
		$("#contenedor7").hide();
		$("#contenedor8").show();
	});
	$( "#cerrarContenedor2" ).click(function() {
		$("#contenedor8").hide();
		$("#contenedor7").hide();
		$("#contenedor6").hide();
		$("#contenedor5").hide();
		$("#contenedor4").hide();
		$("#contenedor3").hide();
		$("#contenedor2").hide();
		$("#contenedor1").show();
	});
	$( "#cerrarContenedor3" ).click(function() {
		$("#contenedor8").hide();
		$("#contenedor7").hide();
		$("#contenedor6").hide();
		$("#contenedor5").hide();
		$("#contenedor4").hide();
		$("#contenedor3").hide();
		$("#contenedor2").show();
		$("#contenedor1").hide();
	});
	$( "#cerrarContenedor4" ).click(function() {
		$("#contenedor8").hide();
		$("#contenedor7").hide();
		$("#contenedor6").hide();
		$("#contenedor5").hide();
		$("#contenedor4").hide();
		$("#contenedor3").show();
		$("#contenedor2").hide();
		$("#contenedor1").hide();
	});
	$( "#cerrarContenedor5" ).click(function() {
		$("#contenedor8").hide();
		$("#contenedor7").hide();
		$("#contenedor6").hide();
		$("#contenedor5").hide();
		$("#contenedor4").show();
		$("#contenedor3").hide();
		$("#contenedor2").hide();
		$("#contenedor1").hide();
	});
	$( "#cerrarContenedor6" ).click(function() {
		$("#contenedor8").hide();
		$("#contenedor7").hide();
		$("#contenedor6").hide();
		$("#contenedor5").show();
		$("#contenedor4").hide();
		$("#contenedor3").hide();
		$("#contenedor2").hide();
		$("#contenedor1").hide();
	});
	$( "#cerrarContenedor7" ).click(function() {
		$("#contenedor8").hide();
		$("#contenedor7").hide();
		$("#contenedor6").show();
		$("#contenedor5").hide();
		$("#contenedor4").hide();
		$("#contenedor3").hide();
		$("#contenedor2").hide();
		$("#contenedor1").hide();
	});
	$( "#cerrarContenedor8" ).click(function() {
		$("#contenedor8").hide();
		$("#contenedor7").show();
		$("#contenedor6").hide();
		$("#contenedor5").hide();
		$("#contenedor4").hide();
		$("#contenedor3").hide();
		$("#contenedor2").hide();
		$("#contenedor1").hide();
	});
	
	
	$( "#guardar" ).click(function(){
		var modi=$("#modi").val();
		var id_curriculum=$("#id_curriculum").val();
		var id=$("#tipo_curri").val();
		var nombre=$("#id_cu_nombre").val();
		var apellido = $("#id_cu_apellido").val();
		var cedula = $("#id_cu_cedula").val();
		var fecha = $("#id_cu_fecha").val();
		var tel = $('#id_cu_tel').val();
		var direccion = $("#id_cu_dir").val();
		var texto = $("#id_cu_academico").val();
		var texto2 = $("#id_cu_laboral").val();
		var texto3 = $("#id_cu_idioma").val();
		var id_nombre = $("#id_nombre").val();
		var id_perfil = $("#id_perfil").val();
		var ref_laboral = $("#id_cu_ref_laboral").val();
		var ref_personal = $("#id_cu_ref_personal").val();
		var conocimiento = $("#id_cu_conocimiento").val();
		console.log("modi imprime = "+modi);
		console.log("id "+id+"texto2 "+texto2+" texto3 "+texto3+"id_nombre"+id_nombre+"id_perfil"+id_perfil+"ref_laboral "+ref_laboral+"ref_personal"+ref_personal+"conocimiento"+conocimiento);
		  if(modi=="" || modi==null){
			  $.ajax({
				   url : "/rade/controlador",
					method: "POST",
					data: { process:"altacurri", nombre:nombre,apellido:apellido,cedula:cedula,tel:tel,texto:texto,texto2:texto2,texto3:texto3, direccion:direccion, fecha:fecha, id_nombre:id_nombre, id_perfil:id_perfil, ref_laboral:ref_laboral, ref_personal:ref_personal, conocimiento:conocimiento, id:id},
					beforeSend: function(){
					
					},
					success: function(respuesta){
					
						console.log("ejecuta guardar///////////");
					},
					error: function(jqXHR, exception){}
				});
		  }else if(modi=="0"){
			  console.log("ingreso para modificar");
			  $.ajax({
				   url : "/rade/controlador",
					method: "POST",
					data: { process:"Mcurri", nombre:nombre,apellido:apellido,cedula:cedula,tel:tel,texto:texto,texto2:texto2,texto3:texto3, direccion:direccion, fecha:fecha, id_nombre:id_nombre, id_perfil:id_perfil, ref_laboral:ref_laboral, ref_personal:ref_personal, conocimiento:conocimiento, id:id,id_curriculum:id_curriculum },
					beforeSend: function(){
					
					},
					success: function(respuesta){
					
						console.log("ejecuta la modificacion///////////");
					},
					error: function(jqXHR, exception){}
				});
		  }
		
			   
	});
	
	
});

