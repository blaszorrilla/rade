$(document).ready(function() {
	
	
			
	
});

$('#busqueda').on('keyup',function(){
	document.getElementById("n_n2").disabled = true;
	document.getElementById("n_n3").disabled = true;
	document.getElementById("n_n4").disabled = true;
});
function BuscarSolicitud(valores,id){
	var datos=$('#busqueda').val();
	FiltroSolicitud(valores,datos,id);
}
function DesabilitaNavCaja(datos){
	document.getElementById("n_n1").disabled = datos;
	document.getElementById("n_n2").disabled = datos;
	document.getElementById("n_n3").disabled = datos;
	document.getElementById("n_n4").disabled = datos;
}
function MensajeBuscarTablaNota(fTabla){
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
function FiltroSolicitud(turno,datos,id){
	DesabilitaNavCaja("true");
	$("#tablaSolicitud tbody tr").remove();
	MensajeBuscarTablaNota("tablaSolicitud");
    total_reg1 = $('#n_total_reg1').html();
	posicion1 = $('#n_pos1_autor').val();
	posiciones="10";
	accion='FiltroSolicitud';
	$.ajax
    ({
    type: "POST",           
    data: {process:accion,posiciones:posiciones,total_reg:total_reg1,actual:posicion1,turno:turno,datos:datos,id:id},
    url: 'controlador',
    success:function(datos)
    {
    	var pos_total="0";
    	$("#tablaSolicitud tbody tr").remove();
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
                nuevaFila+="<td class=\"visible-md visible-lg visible-sm\">"+valor.carrera+"</td>";
                nuevaFila+="<td class=\"textoderecha\">"+valor.nombre+"</td>";
                nuevaFila+="<td class=\"visible-md visible-lg\">"+valor.apellido+"</td>";
                nuevaFila+="<td class=\"textoderecha\">" +
	                		"<button class=\"btn btn-info float-right\" style=\"margin-right: 10px;\" onclick=\"Modificar('"+"ACEPTADO"+"','"+id+"','"+valor.codigo+"');\">Aceptar</button>" +
	                		"<button class=\"btn btn-danger float-right\" style=\"margin-right: 10px;\" onclick=\"Modificar('"+"RECHAZADO"+"','"+id+"','"+valor.codigo+"');\">Rechazar</button>" +
	                		"</td>";
                nuevaFila+="</tr>";
                $("#tablaSolicitud").append(nuevaFila);
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
		colo_tabla("tablaSolicitud"); 	
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
}


function Modificar(estado, institucion, id_registro){
	var valor="primero";
	 accion='modificarSolicitud';
	$.ajax
    ({
   
    type: "POST",           
    data: {process:accion,estado:estado,institucion:institucion,id_registro:id_registro},
    url: 'controlador',
			success:function(resultado){
				BuscarSolicitud('primero',institucion)
				//console.log("Proceso exitoso");
			},
			error:function(resultado){
				console.log("Ocurrio un error");
			}
	});
	}
