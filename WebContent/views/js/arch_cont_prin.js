$( document ).ready(function() {
	$("#cont_memo_1").show();	
	$("#cont_memo_2").hide();

	$( "#abrirDescarga" ).click(function() {
		console.log("Se presiono el boton de siguiente");
		var para=$("#id_arch_para").val();
		var de = $("#id_arch_de").val();
		var fecha = $("#id_arch_fecha").val();
		var asunto = $("#id_arch_re").val();
		var texto = $("#textarea").val();
		if(para==""){
			$("#mensaje_para").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Destinatario no ingresado</div>");
			document.getElementById('id_arch_para').focus();
		}else if(de==""){
			$("#mensaje_de").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Emisor no ingresado</div>");
			document.getElementById('id_arch_de').focus();
		}else if(fecha==""){
			$("#mensaje_fecha").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Fecha no ingresado</div>");
			document.getElementById('id_arch_fecha').focus();				
		}else if(asunto==""){
			$("#mensaje_asunto").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Asunto no ingresado</div>");
			document.getElementById('id_arch_asunto').focus();
		}else if(texto==""){
			$("#mensaje_texto").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Texto no ingresado</div>");
			document.getElementById('textarea').focus();
		}else{
			$("#cont_memo_1").hide();
			$("#cont_memo_2").show();
		}
	});
	$( "#abrirMemo" ).click(function() {
		$("#cont_memo_2").hide();
		$("#cont_memo_1").show();
	});	
});
$( document ).ready(function() {
	$("#guardaMemo").click(function(){
		var modi=$("#modi").val();
		var para=$("#id_arch_para").val();
		var de = $("#id_arch_de").val();
		var fecha = $("#id_arch_fecha").val();
		var asunto = $("#id_arch_re").val();
		var cargo =  $("#id_arch_cargo").val();
		var texto = $("#textarea").val();
		var empresa = $("#id_arch_empresa").val();
		var id_perfil = $("#id_perfil").val();
		var id_nombre = $("#id_nombre").val();
		var id_memo = $("#id_memo").val();
		if($("#modi").val()==0){
			 $.ajax({
				 
			 
					url : "../controlador",
					method: "POST",
					data: { process:"ModificaMemo", id_memo:id_memo, id_perfil:id_perfil,id_nombre:id_nombre,para:para,de:de,fecha:fecha,asunto:asunto,cargo:cargo,texto:texto, empresa:empresa},
					beforeSend: function(){
						
					},
					success: function(respuesta){
						console.log("modi recibe" + modi);
						console.log("Se ejecuto modificaMemo");
						$("#mensaje").html("<img src=\"../views/img/status.gif\"></img>");
					},
					error: function(jqXHR, exception){
					
					}
			});
		} else if($("#modi").val()!=null){
			 $.ajax({
					url : "../controlador",
					method: "POST",
					data: { process:"altaMemo", id_perfil:id_perfil,id_nombre:id_nombre,para:para,de:de,fecha:fecha,asunto:asunto,cargo:cargo,texto:texto, empresa:empresa},
					beforeSend: function(){
						$("#mensaje").html("<img src=\"../views/img/status.gif\"></img>");
					},
					success: function(respuesta){
						console.log("modi recibe" + modi);
						console.log("Se ejecuto guardaMemo");
					},
					error: function(jqXHR, exception){
						console.log("No se pudo guardar guardaMemo");
						$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Verifique  </div>");
					}
				});
		 }
			 
			 
	});
});