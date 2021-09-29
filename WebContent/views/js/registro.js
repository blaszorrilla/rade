$(document).ready(function(){
	$("#registro").click(function(){
		if($('#terminos').is(':checked')){
			
			var nombre = $("#nombre").val();
			var apellido = $("#apellido").val();
			var correo = $("#correo").val();
			var fecha = $("#fecha_nac").val();
			var carrera = $("#carrera").val();
			var sexo = $("#genero").val();
			var ci = $("#ci").val();
			var ciudad = $("#ciudad").val();
			
			$.ajax({
				url : "controlador",
				method: "POST",
				data: { process:"registro", nombre:nombre,apellido:apellido,correo:correo,carrera:carrera, fecha:fecha,sexo:sexo,ci:ci,ciudad:ciudad},
				beforeSend: function(){
					$("#mensaje").html("<img src=\"views/img/status.gif\"></img>");
				},
				success: function(respuesta){
					$("#mensaje").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Solicitud enviada con \u00E9xito!</div>");
					location.href = 'confirmacion';
				},
				error: function(jqXHR, exception){
					$("#mensaje").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
				}
			});
			
			
			
		}else{
			console.log("no esta cke");
		}
	});
	
	$("#terminos").click(function(){
		var resul = aceptartermino();
		btnValidar(resul);
		if(resul == false){
			$("#"+foco).focus();
		}
	});
	
	
	$('#correo').on('input',function(e){
		btnValidar(validar("correo",codigoCorreo));
	});
	$('#nombre').on('input',function(e){
		btnValidar(validar("nombre",codigoCarcater));
	});
	$('#apellido').on('input',function(e){
		btnValidar(validar("apellido",codigoCarcater));
	});

	$('#universidad').on('input',function(e){
		btnValidar(validar("universidad",codigoNumeros));
	});
	$('#carrera').on('input',function(e){
		btnValidar(validar("carrera",codigoNumeros));
	});
	$('#genero').on('input',function(e){
		btnValidar(validar("genero",codigoCarcater));
	});
	$('#fecha_nac').on('input',function(e){
		btnValidar(validar("fecha_nac",fechaValida));
	});
	/*$('#sede').on('input',function(e){
		btnValidar(validar("sede",codigoNumeros));
	});*/
	$('#ci').on('input',function(e){
		btnValidar(validar("ci",codigoNumeros));
	});
	$('#ciudad').on('input',function(e){
		btnValidar(validar("ciudad",codigoCarcater));
	});
	
	
	$("#universidad").on('click',function(){
		var codigo = $("#universidad").val();
		console.log(codigo);
		$.ajax({
			url : "controlador",
			method: "POST",
			data: { process:"verificacarrera", codigo:codigo},
			beforeSend: function(){
				$("#mensajecarrera").html("<img src=\"views/img/status.gif\"></img>");
			},
			success: function(respuesta){
				$("#mensajecarrera").html('');
				$("#carrera").html(respuesta);
			},
			error: function(jqXHR, exception){
				$("#mensajecarrera").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
			}
		});
	});
	/*$("#sede").on('click',function(){
		var sede = $("#sede").val();
		console.log(sede);
		$.ajax({
			url : "controlador",
			method: "POST",
			data: { process:"verificacarrera", sede:sede},
			beforeSend: function(){
				$("#mensajecarrera").html("<img src=\"views/img/status.gif\"></img>");
			},
			success: function(respuesta){
				$("#mensajecarrera").html('');
				$("#carrera").html(respuesta);
			},
			error: function(jqXHR, exception){
				$("#mensajecarrera").html("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">Se Produjo un Error!</div>");
			}
		});
	});*/
});
/*$("#carrera").on('click',function(){
	var carrera = $("#carrera").val();
	console.log(carrera);
});*/

var habilitarbtn=true;		// variable manejador btn
var foco="";
var codigoCorreo = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
var codigoCarcater= /^[a-zA-Z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF\s]+$/;  //validacion que permita letras a-z A-Z la letra ñ, acentos y los espacios
var codigoNumeros=/^[0-9]+$/;
var codigoUsuario= /([A-Za-z0-9])+$/;
var codigoPass=/^[A-Za-z0-9]+$/;
var fechaValida = /^(?:(?:(0?[1-9]|1\d|2[0-8])[/](0?[1-9]|1[0-2])|(29|30)[/](0?[13-9]|1[0-2])|(31)[/](0?[13578]|1[02]))[/](0{2,3}[1-9]|0{1,2}[1-9]\d|0?[1-9]\d{2}|[1-9]\d{3})|(29)[/](0?2)[/](\d{1,2}(?:0[48]|[2468][048]|[13579][26])|(?:0?[48]|[13579][26]|[2468][048])00))$/;

function btnValidar(check){
	if(check) {
        $("#registro").prop("disabled", false);
    }
    else {
        $("#registro").prop("disabled", true);
    }
}
function validar(nombre,tipo){
	///////////////////////////////////////////////////////////////////////////
	var email = $("#"+nombre).val();
	var re = tipo;
	if (re.test(email) ) {
		//console.log("verdadero");
		 $('#'+nombre).removeClass('is-invalid').addClass('is-valid');
		 return true;
	}else{
		//console.log("falso");
		$('#'+nombre).removeClass('is-valid').addClass('is-invalid');
		$("#terminos").prop('checked', false);
		return false;
	}
}
function validarnom(){
	var nombre=$('#nombre').val();
		if(nombre==''){
			
			$('#nombre').html("<span class=\"input-group-text\" title=\"INGRESAR NOMBRE\"id=\"span_nombre\"> " +
			"<span class=\"fa fa-exclamation text-red\"></span></span>");
		}else{
					
					$('#nombre').html("<span class=\"input-group-text\" title=\"INGRESAR NOMBRE\"id=\"span_nombre\"> " +
					"<span class=\"fa fa-check text-red\"></span></span>");	
		}
}

function aceptartermino(){
	var verifcar=true;
	var input = ["nombre", "apellido","ci","ciudad","genero","correo","fecha_nac","universidad","carrera"];
	var tipo = [codigoCarcater,codigoCarcater,codigoNumeros,codigoCarcater,codigoCarcater, codigoCorreo,fechaValida,codigoNumeros,codigoNumeros];
	foco="";
	for (var i = 0; i < input.length; i++) {
		var resul = validar(input[i],tipo[i]);
		if(resul==false){
			if(foco==""){
				foco=input[i];				
			}
			verifcar=false
		}
	}
	
	if(verifcar==false){
		$("#terminos").prop('checked', false);
		return false;
	}else{
		return true;
	}
}
/////////////////
/*$('#correo').change(function(){
	var datos=$('#correo').val();
	

	$.ajax({
		type: "POST",
		url:"controlador",
		data: {process : "validarMail",datos:datos},
		success:function(resultado){
			$('#msj').html(resultado);
			//console.log("Proceso exitoso");
		},
		error:function(resultado){
			console.log("Ocurrio un error");
		} 
	});
});*/
//////////////