$( document ).ready(function() {
		$("#infInstitucion").click(function(){			
				$.ajax({
						url : "Informe2",
						method: "POST",
						data: { envio:"curriculum"},
						beforeSend: function(){
							
						},
						success: function(respuesta){
							window.open("Informe2",'First','height=600,width=800,toolbar=no,scrollbars=yes');
							console.log("ejecuta Informe///////////");
						},
						error: function(jqXHR, exception){
							
						}
					});
		});

	});