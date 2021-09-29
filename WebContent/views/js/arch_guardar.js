$( document ).ready(function() {
		$("#guardaMemo").click(function(){
			var para=$("#id_arch_para").val();
			var de = $("#id_arch_de").val();
			var fecha = $("#id_arch_fecha").val();
			var asunto = $("#id_arch_re").val();
			var cargo =  $("#id_arch_cargo").val();
			var texto = $("#textarea").val();
			var empresa = $("#id_arch_empresa").val();
			var id_perfil = $("#id_perfil").val();
			var id_nombre = $("#id_nombre").val();
			$.ajax({
					url : "controlador",
					method: "POST",
					data: { process:"altaMemo", id_perfil:id_perfil,id_nombre:id_nombre,para:para,de:de,fecha:fecha,asunto:asunto,cargo:cargo,texto:texto, empresa:empresa},
					beforeSend: function(){
						$("#mensaje").html("<img src=\"../views/img/status.gif\"></img>");
					},
					success: function(respuesta){
						console.log("Se ejecuto guardaMemo");
					},
					error: function(jqXHR, exception){
						$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Verifique  </div>");
					}
				});
		});
	});