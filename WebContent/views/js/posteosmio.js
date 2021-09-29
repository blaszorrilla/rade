var titu;

$('#busqueda').on('keyup',function(){
	document.getElementById("n_n2").disabled = true;
	document.getElementById("n_n3").disabled = true;
	document.getElementById("n_n4").disabled = true;
});
function BuscarSolicitud(valores){
	var datos=$('#busqueda').val();
	var id=$('#id_perfil').val();
	Filtromipost(valores,datos,id);
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
function Filtromipost(turno,datos,id){
	DesabilitaNavCaja("true");
	$("#tablaSolicitud tbody tr").remove();
	MensajeBuscarTablaNota("tablaSolicitud");
    total_reg1 = $('#n_total_reg1').html();
	posicion1 = $('#n_pos1_autor').val();
	posiciones="8";
	accion='Filtromipost';
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
                nuevaFila+="<td class=\"visible-md visible-lg visible-sm\">"+valor.titulo+"</td>";
                nuevaFila+="<td class=\"textoderecha\">"+valor.tema+"</td>";
                nuevaFila+="<td class=\"visible-md visible-lg\">"+valor.fecha+"</td>";
                nuevaFila+="<td class=\"textoderecha\">"+valor.hora+"</td>";
                nuevaFila+="<td class=\"textoderecha\">" +
                "<td class=\"actions\"><a class=\"icon\" title=\"Ver Posteo\" href ="+valor.enlace+" aria-label=\"Left Align\"><span class=\"fa fa-fw fa-file-text\"></span></button>"+ 
                "<td class=\"actions\"><button class=\"icon\" title=\"Modificar Posteo\" onclick=\"mod()\" aria-label=\"Left Align\"><span class=\"fa fa-fw fa-gear \"></span></button>"+ 
                "<td class=\"actions\"><button class=\"icon\" title=\"Eliminar Posteo\" onclick=\"borrar("+valor.codigo+")\"   aria-label=\"Left Align\"><span class=\"fa fa-fw fa-trash-o  \"></span></button>" +
                
	            "</td>";
                nuevaFila+="</tr>";
                titu=valor.titulo;
               
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

function borrar(codigo){
	$.ajax({
		url : "controlador",
		method: "POST",
		
		data: { process:"bajaposteo", codigo:codigo},
	
		beforeSend: function(){
			
		},
		success: function(respuesta){
			/*$("#resultado").html(respuesta);*/
			location.reload();
		},
		error: function(jqXHR, exception){
			
		}
	});
}

function mod(){
	location.href ="posteonuevo";
}
