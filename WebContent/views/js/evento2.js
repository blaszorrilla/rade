/*$(document).ready(function() {
	
		
});

$('#busqueda').on('keyup',function(){
	document.getElementById("n_n2").disabled = true;
	document.getElementById("n_n3").disabled = true;
	document.getElementById("n_n4").disabled = true;
});
function Buscarevento(valores,id){
	var datos=$('#busqueda').val(); 
	Filtroevento(valores,id,datos);
}
function DesabilitaNavCaja(datos){
	document.getElementById("n_n1").disabled = datos;
	document.getElementById("n_n2").disabled = datos;
	document.getElementById("n_n3").disabled = datos;
	document.getElementById("n_n4").disabled = datos;
}
function MensajeBuscarTablaEvento(fTabla){
    var nuevaFila="<tr>";
    nuevaFila+="<td colspan=\"6\" style=\"text-align: center;\">Buscando...</td>";
    nuevaFila+="</tr>";
    $("#"+fTabla).append(nuevaFila);	 
}
function DesabilitaNavCaja(datos){
	document.getElementById("n_n1").disabled = datos;
	document.getElementById("n_n2").disabled = datos;
	document.getElementById("n_n3").disabled = datos;
	document.getElementById("n_n4").disabled = datos;
}
function Filtroevento(turno,id_perfil,datos)
{
	DesabilitaNavCaja("true");
	$("#tablaevento tbody tr").remove();
    total_reg1 = $('#n_total_reg1').html();
	posicion1 = $('#n_pos1_autor').val();
	posiciones="10";
	accion='Filtroevento';
	$.ajax
    ({
    type: "POST",           
    data: {process:accion,posiciones:posiciones,total_reg:total_reg1,actual:posicion1,turno:turno,id_perfil:id_perfil,datos:datos},
    url: 'controlador',
    success:function(datos)
    {
    	var pos_total="0";
    	$("#tablaevento tbody tr").remove();
    	console.log("llego------------------------------")
    	var jsonData = JSON.parse(datos);
		for (var i = 0; i < jsonData.contenido.length; i++) {
				var resul = jsonData.contenido[i];
				$('#n_total_reg1').html(resul.total);
				$('#n_total_des').html(resul.desde);
				$('#n_total_has').html(resul.hasta);
				$('#n_pos1_autor').val(resul.posicion);
				pos_total=resul.pos_total;
			for (var j = 0; j < resul.datos.length; j++) {
				var valor = resul.datos[j];
                var nuevaFila="<tr>";
               nuevaFila+="<td class=\"visible-xs visible-sm visible-md\">"
                				+"<button type=\"button\" class=\"btn btn-default btn-xs vercaja\" onclick=\"\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"VER REGISTROS\">"
		        		 		+"<span class=\"fa fa-fw fa-eye\"></span>"
		        		 		+"</button></td>";
                nuevaFila+="<td class=\"visible-md visible-lg visible-sm\">"+valor.titulo+"</td>";
                nuevaFila+="<td class=\"textoderecha\">"+valor.fecha+"</td>";
                nuevaFila+="<td class=\"visible-md visible-lg\">"+valor.hora+"</td>";
                nuevaFila+="<td class=\"visible-md visible-lg\">"+valor.ubicacion+"</td>";
                nuevaFila+="<td class=\"textoderecha\">" +
                "<td class=\"actions\"><a class=\"icon\"  href ="+valor.enlace+" aria-label=\"Left Align\"><span class=\"fa fa-fw fa-calendar\"></span></a>"+
                "<td class=\"actions\"><button class=\"icon\" title=\"Modificar Evento\" onclick=\"mod()\" aria-label=\"Left Align\"><span class=\"fa fa-fw fa-gear \"></span></button>"+ 
                "<td class=\"actions\"><button class=\"icon\" title=\"Eliminar Evento\" onclick=\"borrarevento("+valor.codigo+")\"   aria-label=\"Left Align\"><span class=\"fa fa-fw fa-trash-o \"></span></button>" +
	            
                "</td>";
                nuevaFila+="</tr>";
                $("#tablaevento").append(nuevaFila);
			}
			if(Number(resul.total)>=Number(posiciones)){
				if(Number($('#n_pos1_autor').val())==1){
					document.getElementById("n_n1").disabled = true;
					document.getElementById("n_n2").disabled = true;
					document.getElementById("n_n3").disabled = false;
					document.getElementById("n_n4").disabled = false;
				}else{
					if(Number(pos_total)==Number($('#n_pos1_autor').val())){
						document.getElementById("n_n1").disabled = false;
						document.getElementById("n_n2").disabled = false;
						document.getElementById("n_n3").disabled = true;
						document.getElementById("n_n4").disabled = true;
					}else{
						////////////////
						if(pos_total != $('#n_pos1_autor').val()){
							document.getElementById("n_n1").disabled = false;
							document.getElementById("n_n2").disabled = false;
							document.getElementById("n_n3").disabled = false;
							document.getElementById("n_n4").disabled = false;
						}else{
							document.getElementById("n_n1").disabled = true;
							document.getElementById("n_n2").disabled = true;
							document.getElementById("n_n3").disabled = true;
							document.getElementById("n_n4").disabled = true;
						}
						////////////////
					}
				}
			}else{
				document.getElementById("n_n1").disabled = true;
				document.getElementById("n_n2").disabled = true;
				document.getElementById("n_n3").disabled = true;
				document.getElementById("n_n4").disabled = true;
			}
		}	
		colo_tabla("tablaevento"); 	
    },
    error : function(xhr, status) {
    }
    });
}

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
}*/


function borrarevento(codigo){
	var id_perfil=$("#id_perfil").val();
	$.ajax({
		url : "/rade/controlador",
		method: "POST",
		
		data: { process:"bajaevento", codigo:codigo,id_perfil:id_perfil},
	
		beforeSend: function(){
			
		},
		success: function(respuesta){
			location.reload();
			$("#mensaje1").html("<div class=\"alert alert-warning\" style=\"text-align: left;\" role=\"alert\">Evento Eliminado</div>");
			/*cargar_mas(0);*/
			
		},
		error: function(jqXHR, exception){
			
		}
	});
}
function bajaasistenciaevento(codigo){
	$.ajax({
		url : "/rade/controlador",
		method: "POST",
		
		data: { process:"bajaasistenciaevento", codigo:codigo},
	
		beforeSend: function(){
			
		},
		success: function(respuesta){
			location.reload();
			$("#mensaje1").html("<div class=\"alert alert-warning\" style=\"text-align: left;\" role=\"alert\">Asistencia de Evento Eliminado</div>");
			/*cargar_mas(0);*/
			
		},
		error: function(jqXHR, exception){
			
		}
	});
}
function mod(){
	location.href ="evento";
}


function Asistenciaevento(id_evento){
	var id_perfil=$("#id_perfil").val();
	$.ajax({
		url : "/rade/controlador",
		method: "POST",
		
		data: { process:"Asistenciaevento",id_evento:id_evento,id_perfil:id_perfil},
	
		beforeSend: function(){
			
		},
		success: function(respuesta){
			$("#mensaje").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Asistencia Confirmada</div>");
			
			/*location.reload();*/
		},
		error: function(jqXHR, exception){
			
		}
	});
}