$(document).ready(function() {
	
		
});

$('#busqueda').on('keyup',function(){
	document.getElementById("n_n2").disabled = true;
	document.getElementById("n_n3").disabled = true;
	document.getElementById("n_n4").disabled = true;
});
function BuscarSolicitud(valores){
	var datos=$('#busqueda').val();
	Filtroeventototal(valores,datos);
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
function Filtroeventototal(turno,datos,id){
	DesabilitaNavCaja("true");
	$("#tablaSolicitud tbody tr").remove();
	MensajeBuscarTablaNota("tablaSolicitud");
    total_reg1 = $('#n_total_reg1').html();
	posicion1 = $('#n_pos1_autor').val();
	posiciones="6";
	accion='Filtroeventototal';
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
                
                
                
                nuevaFila+="<td class=\"user-avatar cell-detail user-info\"><img src=\"views/images/perfil.png\"></td>";
               
                nuevaFila+="<td class=\"cell-detail\"> <span>"+valor.usuario+"</span><span class=\"cell-detail-description\">"+valor.nombre+"</span></td>";
                nuevaFila+="<td class=\"cell-detail\"> <span>"+valor.titulo+"</span><span class=\"cell-detail-description\">"+valor.tema+"</span></td>";
                nuevaFila+="<td class=\"cell-detail\"> <span>"+valor.fecha+"</span><span class=\"cell-detail-description\">"+valor.hora+"</span></td>";
                
                nuevaFila+="<td class=\"textoderecha\">" +
                "<td class=\"actions\"><a class=\"icon\"  href ="+valor.enlace+" aria-label=\"Left Align\"><span class=\"fa fa-fw fa-calendar\"></span></a>"
                
      
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
