$(document).ready(function() {
	//inicio
	$('#contenedor2').hide();
	$('#contenedor1').show();
	$( "#buscar_presupuesto" ).focus();
	
	$("#AbrirContenedor1").click(function(event) {
		$('#contenedor1').hide();
		$('#contenedor2').show();
	});
	
	$("#CerrarContenedor1").click(function(event) {
		$('#contenedor2').hide();
		$('#contenedor1').show();
	});
	
	
});