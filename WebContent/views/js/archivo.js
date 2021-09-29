var c=1;
var a=1;
var d=1;
var arrayformacion = new Array();
$(document).ready(function(){
	$("#btn_agregar").click(function(){
		c++;
		//$( "#tabla_estudio" ).append( "<div class=\"jumbotron\" id=\"jumbo_"+c+"\"><div class=\"widget-header\"><div class=\"widget-main\"><div class=\"row\"><div class=\"col-sm-6\"><div class=\"form-group\"><label class=\"col-sm-4 control-label no-padding-right\" for=\"form-field-titulacion\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Grado de titulaci&oacute;n</font></font></label><div class=\"col-sm-8\"><input class=\"form-control\" type=\"text\" placeholder=\"Titulacion\" id=\"titulacion_"+c+"\"></div></div><div class=\"space-4\"></div></div><div class=\"col-sm-6\"><div class=\"form-group\"><label class=\"col-sm-4 control-label no-padding-right\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Instituci&oacute;n</font></font></label><div class=\"col-sm-8\"><input class=\"form-control\" type=\"text\" placeholder=\"Institucion\" id=\"institucion_"+c+"\"></div></div><div class=\"space-4\"></div></div></div><div class=\"row\"><div class=\"col-sm-6\"><div class=\"form-group\"><h4 class=\"col-sm-4 \">Fecha de inicio (mes / a&ntilde;o)</h4><div class=\"col-sm-8\"><input class=\"form-control\" type=\"text\" id=\"fechai_"+c+"\"></div></div><div class=\"space-4\"></div></div><div class=\"col-sm-6\"><div class=\"form-group\"><label class=\"col-sm-4 control-label no-padding-right\" for=\"form-field-finalizaci&oacute;n\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Fecha de finalizaci&oacute;n (mes / a&ntilde;o)</font></font></label><div class=\"col-sm-8\"><input class=\"form-control\" type=\"text\" id=\"fechaf_"+c+"\"><br><input type=\"checkbox\" ><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Presente</font></font></div></div><div class=\"space-4\"></div></div></div></div></div></div>" );
		agregararray = { 0: $("#titulacion_1").val() , 1 : $("#institucion_1").val(),2: $("#fechai_1").val() , 3 : $("#fechaf_1").val()};
		arrayformacion.push([agregararray]);
		console.log(arrayformacion);
		document.getElementById("titulacion_1").value = "";
		document.getElementById("institucion_1").value = "";
		document.getElementById("fechai_1").value = "";
		document.getElementById("fechaf_1").value = "";
		$("#mensaje_formacion").html("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Agregado correctamente</div>");
	});
	$("#btn_eliminar").click(function(){
		$( "#jumbo_"+c ).remove();
		c--;
	});
	
	$("#btn_agregar1").click(function(){
		a++;
		$( "#tabla_experiencia" ).append( "<div class=\"jumbotron\" id=\"jumbo_"+a+"\"><div class=\"widget-header\"><div class=\"widget-main\"><div class=\"row\"><div class=\"col-sm-12\"><div class=\"form-group\"><label class=\"h5 col-sm-3 no-padding-right\" ><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">T&iacute;tulo profesional</font></font></label><div class=\"col-sm-10\"><input class=\"form-control\" type=\"text\" placeholder=\"Nombre del puesto\" id=\"puesto_"+a+"\"></div></div><div class=\"space-4\"></div></div><div class=\"col-sm-12\"><div class=\"form-group\"><label class=\"h5 col-sm-3 no-padding-right\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Empleador</font></font></label><div class=\"col-sm-10\"><input class=\"form-control\" placeholder=\"Empleador\" id=\"empleador_"+a+"\"></div></div><div class=\"space-4\"></div></div><div class=\"col-sm-12\"><div class=\"form-group\"><div class=\"row\"><div class=\"col-sm-6\"><label class=\"h5 col-sm no-padding-right\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Fecha de inicio (mes / a&ntilde;o)</font></font></label><div class=\"col-sm-10\"><input class=\"form-control\" type=\"text\"></div></div><div class=\"col-sm-6\"><label class=\"h5 col-sm no-padding-right\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Fecha de finalizaci&oacute;n (mes / a&ntilde;o)</font></font></label><div class=\"col-sm-10\"><input class=\"form-control\" type=\"text\"><input type=\"checkbox\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"> Presente</font></font></div></div></div></div></div><div class=\"col-sm-12\"><div class=\"form-group\"><label class=\"h5 col-sm-3 no-padding-right\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Ubicaci&oacute;n</font></font></label><div class=\"col-sm-10\"><input class=\"form-control\" type=\"text\" placeholder=\"Ubicaci&oacute;n\"></div></div><div class=\"space-4\"></div></div></div></div></div></div>");
	});
	$("#btn_eliminar1").click(function(){
		$( "#jumbo_"+a ).remove();
		a--;
	});
	$("#btn_agregar3").click(function(){
		d++;
		$( "#tabla_idioma" ).append("<div class=\"jumbotron\" id=\"jumbo_"+d+"\"><div class=\"widget-main\"><div class=\"row\"><div class=\"h5 col-sm-6\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Idioma:</font></font></div><div class=\"h5 col-sm-6\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Competencia:</font></font></div></div><div class=\"row\"><div class=\"col-sm-6\"><input class=\"form-control\" type=\"text\"></div><div class=\"col-sm-6\"><select class=\"col-xs-12 col-sm-10\"><option value=\"0#Elementary proficiency\" selected=\"\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Competencia básica</font></font></option><option value=\"1#Limited working proficiency\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Competencia básica limitada</font></font></option><option value=\"2#Professional working proficiency\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Competencia de trabajo profesional</font></font></option><option value=\"3#Full professional proficiency\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Competencia profesional completa</font></font></option><option value=\"4# Native or bilingual proficiency\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\"> Competencia bilingüe o nativa</font></font></option></select></div></div></div></div>");
		
	});
	$("#btn_eliminar3").click(function(){
		$( "#jumbo_"+d ).remove();
		d--;
	});
	
	$("#verinforme").click(function(){
		alert("ver todo");
	});
	
});