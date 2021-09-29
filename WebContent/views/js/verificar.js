/*function existe(){
                var xmlhttp = new XMLHttpRequest();
                var correo = $("#correo").val();
                xmlhttp.onreadystatechange = function(){
                    if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
                        if(xmlhttp.responseText == "\n\n\n\n\nEl correo ya existe")
                            document.getElementById("ver").style.color = "red";
                        else
                            document.getElementById("ver").style.color = "green";
                        document.getElementById("ver").innerHTML = xmlhttp.responseText;
                    }
                    
                };
    }*/
$(document).ready(function() {
			$("#correo").live("blur", function(e) {
				
				$('#msg').hide();
				if ($('#correo').val()==null || $('#correo').val()== "") {
					$('#msg').show();
					$("#msg").html("Correo es un campo obligatorio.").css("color", "red");
				} else {
					$.ajax({
						type: "POST",
						url: "controlador",
						//data: { process:"verificaCorreo",correo:correo},
						data: {process:"verificaCorreo", },
						dataType: "html",
						cache: false,
						success: function(msg) {
							$('#msg').show();
							$("#msg").html(msg);
						},
						error: function(jqXHR, textStatus, errorThrown) {
							$('#msg').show();
							$("#msg").html(textStatus + " " + errorThrown);
						}
					});
				}
			});
		});