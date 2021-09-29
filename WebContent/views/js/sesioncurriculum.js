
	var variable="";
	function cargar(id){
		$.ajax({
			url : "controlador",
			method: "POST",
			data: { process:"ingresocurri",id:id},
			beforeSend: function(){
			
			},
			success: function(respuesta){
				//$("#mensaje").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Registro Guardado con Exito</div>");
				var pi="";	//	primer caracter
				var sg=""; //	segundo caracter
				for (var i = 0; i < respuesta.length; i++) {
					if(respuesta.charAt(i)=="s"){
						pi=respuesta.charAt(i);
						sg=i+1;
					}else if(pi=="s" && respuesta.charAt(i)=="i" && i==sg){
						variable="xctrx";
					}
				}
				if(variable=="xctrx"){
					//location.reload();
					//window.location.href(respuesta.replace('si'));
				
					console.log(respuesta);
					console.log(respuesta.replace('si',''));
					
					location.href = respuesta.replace('si','');
				}
			},
			error: function(jqXHR, exception){
				
			}
		});
	}


