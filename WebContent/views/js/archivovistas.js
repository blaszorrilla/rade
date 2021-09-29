/**
 * AQUI YO AGREGO EN SESION LOS CONTENEDORES QUE VOY A VISUALIZAR
 */

$( document ).ready(function() {
	cargarArchivosCurriculum();
	cargarArchivosMemo();
		$("#curriculum").click(function(){

				$.ajax({
						url : "../controlador",
						method: "POST",
						data: { process:"misarchivos", ver : "curriculum"},
						beforeSend: function(){
							//$("#mensaje").html("<img src=\"../views/img/status.gif\"></img>");
						},
						success: function(respuesta){
							location.href = respuesta;
						},
						error: function(jqXHR, exception){
							//$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Verifique  </div>");
						}
					});
		});
		$("#memo").click(function(){

			$.ajax({
					url : "../controlador",
					method: "POST",
					data: { process:"misarchivos", ver : "memo"},
					beforeSend: function(){
						//$("#mensaje").html("<img src=\"../views/img/status.gif\"></img>");
					},
					success: function(respuesta){
						location.href = respuesta;
					},
					error: function(jqXHR, exception){
						//$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Verifique  </div>");
					}
				});
	});
		$("#carta").click(function(){

			$.ajax({
					url : "../controlador",
					method: "POST",
					data: { process:"misarchivos", ver : "carta"},
					beforeSend: function(){
						//$("#mensaje").html("<img src=\"../views/img/status.gif\"></img>");
					},
					success: function(respuesta){
						location.href = respuesta;
					},
					error: function(jqXHR, exception){
						//$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Verifique  </div>");
					}
				});
	});
});

function cargarArchivosCurriculum(){

	var id=$('#id_perfil').val();
	var id_nombre = $("#id_nombre").val();
		$.ajax({
			method: "POST",           
		    data: {process:"FiltroCurriculum",id:id},
		    url: "../controlador",
		    success:function(datos)
		    {
		    	console.log(datos);
		    	//System.out.println("esta por entrar en el JSON");
		    	$("#tablaCurriculum tbody tr").remove();
		 	
		    	var jsonData = JSON.parse(datos);
				for (var i = 0; i < jsonData.contenido.length; i++) {
						var resul = jsonData.contenido[i];
					for (var j = 0; j < resul.datos.length; j++) {
						/*"id_curriculum", "nombre","info_academica","info_experiencia","info_idioma","refe_laboral",
						 * "refe_personal","conocimientos","apellido","direccion","telefono","cedula","fecha_nac","id_tipo_diseno_curri"*/
						var valor = resul.datos[j];
		                var nuevaFila="<tr>"; 
		                nuevaFila+="<td>"+valor.nombre+"</td>";
		                nuevaFila+="<td>"+valor.apellido+"</td>";
		                nuevaFila+="<td>"+valor.fecha_nac+"</td>";
		                nuevaFila+="<td>" +
		                "<class=\"actions\"><button class=\"icon\" title=\"Modificar\" onclick=\"modificarCurri("+valor.id_curriculum+")\" aria-label=\"Left Align\"><span class=\"fa fa-fw fa-gear \"></span></button>"+ 
		                "<class=\"actions\"><button class=\"icon\" title=\"Eliminar\"  onclick=\"eliminarCurri("+valor.id_curriculum+")\" aria-label=\"Left Align\"><span class=\"fa fa-fw fa-trash-o  \"></span></button>" +
		                "<class=\"actions\"><button class=\"icon\" title=\"Imprimir\"  onclick=\"imprimirCurri('"+id_nombre+"', "+id+","+valor.id_curriculum+")\"  aria-label=\"Left Align\"><span class=\"fa fa-file-pdf-o  \"></span></button>"+ 
		                "</td>";
		                nuevaFila+="</tr>";
		                titu=valor.titulo;
		               
		                $("#tablaCurriculum").append(nuevaFila);
					}
				}	
				colo_tabla("tablaCurriculum"); 	
		    },
		    /*error : function(xhr, status) 
        {
              alert('sin respuesta...');
        }*/
		    });

	
}
function eliminarCurri(id_curriculum){

	console.log("id_curriculum "+id_curriculum);
	   $.ajax({
		   url : "../controlador",
			method: "POST",
			data: { process:"bajacurri", id_curriculum:id_curriculum},
			beforeSend: function(){
			
			},
			success: function(respuesta){
			
				console.log("ejecuta baja///////////");
				location.reload(true);
			},
			error: function(jqXHR, exception){}
		});
}
function modificarCurri(id_curriculum){
	console.log("id_curriculum "+id_curriculum);
	   $.ajax({
		   url : "../controlador",
			method: "POST",
			data: { process:"mandaCurri", id_curriculum:id_curriculum},
			beforeSend: function(){
			
			},
			success: function(respuesta){
			
				console.log("manda datos///////////");
				//location.reload(true);
				location.href = "../archivos/curriculum1";
			},
			error: function(jqXHR, exception){}
		});
}
/***********************************************************/
function cargarArchivosMemo(){

	var id=$('#id_perfil').val();
	var id_nombre = $("#id_nombre").val();
		$.ajax({
			method: "POST",           
		    data: {process:"FiltroMemo",id:id},
		    url: "../controlador",
		    success:function(datos)
		    {
		    	console.log(datos);
		    	//System.out.println("esta por entrar en el JSON");
		    	$("#tablaMemo tbody tr").remove();
		 	
		    	var jsonData = JSON.parse(datos);
				for (var i = 0; i < jsonData.contenido.length; i++) {
						var resul = jsonData.contenido[i];
					for (var j = 0; j < resul.datos.length; j++) {
						var valor = resul.datos[j];
		                var nuevaFila="<tr>"; 
		                nuevaFila+="<td>"+valor.para+"</td>";
		                nuevaFila+="<td>"+valor.de+"</td>";
		                nuevaFila+="<td>"+valor.fecha+"</td>";
		                nuevaFila+="<td>" +
		                "<class=\"actions\"><button class=\"icon\" title=\"Modificar\" onclick=\"modificarMemo("+valor.id_memo+")\" aria-label=\"Left Align\"><span class=\"fa fa-fw fa-gear \"></span></button>"+ 
		                "<class=\"actions\"><button class=\"icon\" title=\"Eliminar\"  onclick=\"eliminarMemo("+valor.id_memo+")\" aria-label=\"Left Align\"><span class=\"fa fa-fw fa-trash-o  \"></span></button>" +
		                "<class=\"actions\"><button class=\"icon\" title=\"Imprimir\"  onclick=\"imprimirMemo('"+id_nombre+"', "+id+","+valor.id_memo+")\"  aria-label=\"Left Align\"><span class=\"fa fa-file-pdf-o  \"></span></button>"+ 
		                "</td>";
		                nuevaFila+="</tr>";
		                titu=valor.titulo;
		               
		                $("#tablaMemo").append(nuevaFila);
					}
				}	
				colo_tabla("tablaMemo"); 	
		    },
		    /*error : function(xhr, status) 
        {
              alert('sin respuesta...');
        }*/
		    });

	
}
function eliminarMemo(id_memo){

	   $.ajax({
		   url : "../controlador",
			method: "POST",
			data: { process:"bajaMemo", id_memo:id_memo},
			beforeSend: function(){
			
			},
			success: function(respuesta){
				location.reload(true);
			},
			error: function(jqXHR, exception){}
		});
}
function imprimirMemo(id_nombre,id_perfil,id_memo){
		
	$.ajax({
				url : "Memoo",
				method: "POST",
				data: { envio:"impresion", id_nombre:id_nombre,id_perfil:id_perfil,id_memo:id_memo},
				beforeSend: function(){
				},
				success: function(respuesta){
					window.open("Memoo",'First','height=600,width=800,toolbar=no,scrollbars=yes');
				},
				error: function(jqXHR, exception){
				}		
		});
			
}
function modificarMemo(id_memo){
	console.log( "recibe algo "+id_memo);
	   $.ajax({
		   url : "../controlador",
			method: "POST",
			data: { process:"mandaMemo", id_memo:id_memo},
			beforeSend: function(){
			
			},
			success: function(respuesta){
				location.href = "../archivos/memo";
			},
			error: function(jqXHR, exception){}
		});
}
/***********************************************************//***********************************************************/

function colo_tabla(datos){
	   var table = document.getElementById(datos);	
	   var celdas = table.getElementsByTagName("tr");
	   for (var i=1; i<celdas.length; i++){
	   if (i%2==0){
	       celdas[i].className ="par";
	   }else {
	       celdas[i].className ="impar";
	       }
	    }
	   }
function imprimirCurri(id_nombre,id_perfil,id_curriculum){
	$.ajax({
			url : "Informe",
			method: "POST",
			data: { envio:"impresion", id_nombre:id_nombre,id_perfil:id_perfil,id_curriculum:id_curriculum},
			beforeSend: function(){
				$("#mensaje").html("<img src=\"../views/img/status.gif\"></img>");
			},
			success: function(respuesta){
				window.open("Informe",'First','height=600,width=800,toolbar=no,scrollbars=yes');
				console.log("ejecuta la impresion");
			},
			error: function(jqXHR, exception){
				$("#mensaje").html("<div class=\"alert alert-warning alert-dismissible\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>Atencion - Verifique  </div>");
						}
			});
		
}
	   
