$(document).ready(function() {
	//inicio
	$('#contenedor2').hide();
	$('#contenedor3').hide();
	$('#contenedor1').show();
	$( "#buscar_presupuesto" ).focus();
	
	$("#AbrirContenedor1").click(function(event) {
		$('#contenedor1').hide();
		$('#contenedor2').show();
		$('#cedula').focus();
	});
	
	$("#CerrarContenedor1").click(function(event) {
		$('#contenedor2').hide();
		$('#contenedor1').show();
		
		$('#busqueda').focus();
	});
	
	$("#CerrarContenedor3").click(function(event) {
		$('#contenedor3').hide();
		$('#contenedor1').show();
		
		$('#busqueda').focus();
	});
	
		$("#guardar").click(function(){
			var codigo = $("#codigo").val();
			var cedula = $("#cedula").val();
			var nombre = $("#nombre").val();
			var apellido = $("#apellido").val();
			var direccion = $("#direccion").val();
			var telefono = $("#telefono").val();
			var email = $("#email").val();
			var pagina = $("#pagina").val();
			var estado = "INACTIVO";
			if($("#estado").is(':checked')){
				estado = "ACTIVO";
			}

			
			$.ajax({
				url : "controlador",
				method: "POST",
				data: { process:"altaceo", codigo:codigo,cedula:cedula,nombre:nombre,apellido:apellido,direccion:direccion,telefono:telefono,email:email,pagina:pagina,estado:estado},
				beforeSend: function(){
					$("#mensaje").html("<img src=\"views/img/status.gif\"></img>");
				},
				success: function(respuesta){
					$("#mensaje").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Registro Guardado con Exito</div>");
				},
				error: function(jqXHR, exception){
					$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
				}
			});
			
		});
		
		$('#busqueda').on('keyup',function(){
			document.getElementById("n_n2").disabled = true;
			document.getElementById("n_n3").disabled = true;
			document.getElementById("n_n4").disabled = true;
		});
	
});


function BuscarCeo(valores){
	var datos=$('#busqueda').val();
	FiltroCeo(valores,datos);
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
function FiltroCeo(turno,datos){
	DesabilitaNavCaja("true");
	$("#tablaceo tbody tr").remove();
	MensajeBuscarTablaNota("tablaceo");
    total_reg1 = $('#n_total_reg1').html();
	posicion1 = $('#n_pos1_autor').val();
	posiciones="3";
	accion='FiltroCeo';
	$.ajax
    ({
    type: "POST",           
    data: {process:accion,posiciones:posiciones,total_reg:total_reg1,actual:posicion1,turno:turno,datos:datos},
    url: 'controlador',
    success:function(datos)
    {
    	var pos_total="0";
    	$("#tablaceo tbody tr").remove();
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
                nuevaFila+="<td class=\"visible-md visible-lg visible-sm\">"+valor.ci+"</td>";
                nuevaFila+="<td class=\"textoderecha\">"+valor.nombre+"</td>";
                nuevaFila+="<td class=\"visible-md visible-lg\">"+valor.apellido+"</td>";
                nuevaFila+="<td class=\"textoderecha\">" +
	                		"<button class=\"btn btn-success float-right\" style=\"margin-right: 10px;\">Usuario</button>" +
	                		"<button class=\"btn btn-info float-right\" style=\"margin-right: 10px;\" onclick=\"modificar('"+valor.codigo+"','"+valor.ci+"','"+valor.nombre+"','"+valor.apellido+"');\">Modificar</button>" +
	                		"<button class=\"btn btn-danger float-right\" style=\"margin-right: 10px;\">Eliminar</button>" +
	                		"</td>";
                nuevaFila+="</tr>";
                $("#tablaceo").append(nuevaFila);
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
		colo_tabla("tablaceo"); 	
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

function modificar(codigo,ci,nombre,apellido){
	$("#codigo").val(codigo);
	$("#cedula").val(ci);
	$("#nombre").val(nombre);
	$("#apellido").val(apellido);
	
	$('#contenedor1').hide();
	$('#contenedor2').show();
	$('#cedula').focus();
}