package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import configuracion.Conexion;
import configuracion.Procedimiento;
import configuracion.Validar;
import java.sql.Connection;

@WebServlet("/controlador")
public class controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public controlador() {
        super();
    }
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispacher = request.getRequestDispatcher("views/pagina/error/error.jsp");
        dispacher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("INGRESO EN CONTROLADOR POST");
		try {
			if(request.getParameter("process")!=null){
				String registro = String.valueOf(request.getParameter("datos"));
				System.out.println("entro no null");
				
				String proceso = String.valueOf(request.getParameter("process"));
				System.out.println("entro "+proceso);
				
				///////////////////INICIO PARTE DE BLAS////////////////
				if(proceso.equals("validar")){ 
					System.out.println("ingreso en validar");
					 String	contenido="";
					  //String cod = String.valueOf(request.getParameter("cod"));
					  String valor="vacio";
					  Validar n=new Validar();
					  String imagen=n.Metodo(registro, "0",
								"SELECT id_usuario FROM usuario WHERE id_usuario='"+0+"'", 
								"SELECT id_usuario FROM usuario WHERE usu='"+registro+"'",
								"SELECT id_usuario FROM usuario WHERE usu='"+registro+"' and id_usuario<>'"+0+"'"
								);
					  valor=n.valortodo;
					  System.out.println("ingreso en validar "+valor);
					  if(valor.equals("vacio")){
						  contenido=contenido.concat("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\"></div>");
					 }else{
						 if(valor.equals("si")){
							
							 contenido=contenido.concat("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">El usuario ya existe</div>");
						 }else{
							 contenido=contenido.concat("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">El usuario esta disponible!</div>");
						 }
					 }
					  PrintWriter out = response.getWriter();
					  out.println(contenido.concat("")); 
					  
				}else if(proceso.equals("ingreso")){
					Procedimiento pross = new Procedimiento();
					String usuario = String.valueOf(request.getParameter("usuario"));
					String pass = String.valueOf(request.getParameter("pass"));
					String dato="usuario";
					String enlace="";
					ArrayList<ArrayList<String>> valor=pross.FiltroGeneralString("SELECT  id_usuario,usu,tipo,id,verificapass (id_usuario,'"+pass+"') AS pass FROM acceso WHERE BINARY usu='"+usuario+"'", "5", "INGRESO");
					for (int i = 0; i < valor.size(); i++) {
						dato="pass";
						System.out.println("1-"+valor.get(i).get(0)+" 2-"+valor.get(i).get(2)+" 3-"+valor.get(i).get(3)+" 4-"+valor.get(i).get(4));
						if(String.valueOf(valor.get(i).get(4)).equals("SI")){
							dato="si";
							dato=dato.concat(enlace.concat("/rade/"+String.valueOf(valor.get(i).get(1))));
							System.out.println("EL DATO ES --->"+dato);
							//////////
							HttpSession session = request.getSession( true );
		    				session.setAttribute("login", "si");
		    				session.setAttribute("usuario", String.valueOf(valor.get(i).get(1)));
		    				session.setAttribute("tipo", String.valueOf(valor.get(i).get(2)));
		    				session.setAttribute("id", String.valueOf(valor.get(i).get(3)));
		    				//	session.setAttribute("enlace", enlace);
						}
					}	
					PrintWriter out = response.getWriter();
					out.print(dato);
				
				}else if(proceso.equals("registro")){
					String carrera = String.valueOf(request.getParameter("carrera"));
					String nombre = String.valueOf(request.getParameter("nombre"));
					String apellido = String.valueOf(request.getParameter("apellido"));
					String sexo = String.valueOf(request.getParameter("sexo"));
					String fecha_nac = String.valueOf(request.getParameter("fecha"));
					String correo = String.valueOf(request.getParameter("correo"));
					String ci = String.valueOf(request.getParameter("ci"));
					String ciudad = String.valueOf(request.getParameter("ciudad"));
					Procedimiento pross = new Procedimiento();
					String fecha=pross.FechaYMD(fecha_nac);
					pross.procedimientoDatos("CALL abmRegistro('A',0,'"+carrera+"','"+nombre+"','"+apellido+"','"+ci+"','"+ciudad+"','"+sexo+"','"+fecha+"','"+correo+"','PENDIENTE')","REGISTRO NUEVO");
					
				}else if(proceso.equals("validarUsuario")){
					System.out.println("entro validarusuario");
					String usuario = String.valueOf(request.getParameter("usuario"));
					String pass = String.valueOf(request.getParameter("pass"));
					String codigo = String.valueOf(request.getParameter("codigo"));
					Procedimiento pross = new Procedimiento();
					pross.procedimientoDatos("CALL abmValidarusuario('A','"+codigo+"','"+usuario+"','"+"ACTIVO"+"','"+"ESTUDIANTE"+"','"+"2"+"','"+pass+"')","REGISTRO ACTIVADO");
				
				}
				else if(proceso.equals("verificacarrera")){ 
					Procedimiento pross = new Procedimiento();
					String codigo = String.valueOf(request.getParameter("codigo"));
					if(codigo.equals("")){
						codigo="0";
					}
					
					ArrayList<ArrayList<String>> datos = pross.FiltroGeneralString("SELECT universidad_carrera.`id_universidad_carrera`, carrera.nombre,universidad_carrera.id_institucion  FROM universidad_carrera INNER JOIN carrera ON carrera.id_carrera=universidad_carrera.`id_carrera` WHERE universidad_carrera.`id_institucion`="+codigo, "2", "verifica carrera");
					String cuerpo="<option disabled selected >Seleccione una Carrera</option>";
					for (int i = 0; i < datos.size(); i++) {
						cuerpo=cuerpo.concat("<option value="+datos.get(i).get(0)+">"+datos.get(i).get(1)+"</option>");
					}
					PrintWriter out = response.getWriter();
					out.print(cuerpo);
				}else if(proceso.equals("restablecerPass")){
					//String id=String.valueOf(request.getParameter("id_usuario"));
					String Email=String.valueOf(request.getParameter("correo"));
					System.out.println("entro restablecer pass");
					Procedimiento pross=new Procedimiento();
					String enlaceDinamico="";
					String valor="";
					try{
						enlaceDinamico=pross.AccesoAleatorio();
						System.out.println("entro  enlace correo-->"+enlaceDinamico);
					}finally{
						ArrayList<ArrayList<String>> datosvalor = pross.FiltroGeneralString("SELECT verificaCorreo('"+Email+"','"+enlaceDinamico+"')", "1", "restablecerPass");
						valor=String.valueOf(datosvalor.get(0).get(0));
						if(valor.equals("SI")){
							try {
								System.out.println("entro guardar correo");
								RecuperarPass(Email,enlaceDinamico);
							}catch (javax.mail.MessagingException e) {
								e.printStackTrace();
							} 
						}else{
							
						}
					}
					PrintWriter out = response.getWriter();
					out.print(valor);
				
				}else if(proceso.equals("reenviarrestablecerPass")){
					String Email=String.valueOf(request.getParameter("correo"));
					System.out.println("entro restablecer pass");
					Procedimiento pross=new Procedimiento();
					String enlaceDinamico="";
					String valor="";
					String envio = "";
					try{
						/*enlaceDinamico=pross.AccesoAleatorio();
						System.out.println("entro  enlace correo-->"+enlaceDinamico);*/
					}finally{
						ArrayList<ArrayList<String>> datosvalor = pross.FiltroGeneralString("SELECT verificaPassRegistro('"+Email+"')", "1", "reenviarrestablecerPass");
						valor=String.valueOf(datosvalor.get(0).get(0));
						if(!valor.equals("NO")){
							envio="SI";
							try {
								System.out.println("entro guardar correo");
								RecuperarPass(Email,valor);
							}catch (javax.mail.MessagingException e) {
								e.printStackTrace();
							} 
						}else{
							envio="NO";
						}					 
					}
					PrintWriter out = response.getWriter();
					out.print(envio);
				
				}else if(proceso.equals("cambiarPass")){
					String pass=String.valueOf(request.getParameter("pass2"));
					System.out.println("entro cambiarpass");
					Procedimiento pross = new Procedimiento();
					try{
						pross.procedimientoDatos("CALL cambiarPass('M',0,0,NOW(),'"+pass+"','ACTIVO')", "CAMBIAR PASS");	
					}catch(Exception e){
						System.out.println(e.getMessage());
					}
					
				}else if(proceso.equals("verificaCorreo")){
					 String	contenido="";
					 String reg = String.valueOf(request.getParameter("datos"));
					 String cod = String.valueOf(request.getParameter("codigo"));
					  String valor="vacio";
					  Validar n=new Validar();
					  String imagen=n.Metodo(reg, "cod",
								"SELECT id_registro FROM registro WHERE id_registro='"+cod+"'", 
								"SELECT id_registro FROM registro WHERE correo='"+reg+"'",
								"SELECT id_registro FROM registro WHERE correo='"+reg+"' and id_registro<>'"+cod+"'"
								);
					  valor=n.valortodo;
					  
					  System.out.println("ingreso en verificaCorreo "+valor);
					  if(valor.equals("vacio")){
						  contenido=contenido.concat("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\"></div>");
					 }else{
						 if(valor.equals("si")){
							 String id_usuario="";
							 Procedimiento con=new Procedimiento();
							 ArrayList<ArrayList<String>> datos = con.FiltroGeneralString("SELECT `id_usuario` FROM `usuario_registro` WHERE `id_registro`="+cod, "1", "filtrar id");
							 for (int i = 0; i < datos.size(); i++) {
								 id_usuario=datos.get(i).get(0); 
							 }
							 
							 contenido=contenido.concat("<div class=\"alert alert-success\" style=\"text-align: left;\" role=\"alert\">Correcto!"
							 		+ "<input type=\"hidden\" id=\"id_usuario\" value="+id_usuario+"></div>");
							
						 }else{
							 contenido=contenido.concat("<div class=\"alert alert-danger\" style=\"text-align: left;\" role=\"alert\">El correo no es valido</div>");
						 }
					 }
					  PrintWriter out = response.getWriter();
					  out.println(contenido.concat("")); 	
					  
				}
				////////////////////////////////////////////FIN PARTE DE BLAS//////////////////////////////////////////
				/*		--------------------------------------------ACA FER------------------------------------------------------------------------------------	*/	
				else if(proceso.equals("altapregunta")){	 
					  int id_pregunta = Integer.parseInt(String.valueOf(request.getParameter("id_pregunta")));
					int id_perfil = Integer.parseInt(String.valueOf(request.getParameter("id_perfil")));
					String titulo = String.valueOf(request.getParameter("titulo"));
					int temas = Integer.parseInt(String.valueOf(request.getParameter("temas")));
					int privacidad = Integer.parseInt(String.valueOf(request.getParameter("privacidad")));
					String texto = String.valueOf(request.getParameter("texto"));
					Procedimiento pross = new Procedimiento();	
					if(id_pregunta==0) {
					String tipo="A";
					pross.guardarPregunta(tipo,id_perfil,id_pregunta,titulo, temas, privacidad, texto,"ACTIVO");	
					}else{
					String tipo="M";
					pross.guardarPregunta(tipo,id_perfil,id_pregunta,titulo, temas, privacidad, texto,"ACTIVO");	
					}	
					
					}else if(proceso.equals("bajapregunta")){
					String codigo = String.valueOf(request.getParameter("codigo"));
					Procedimiento pross = new Procedimiento();	
					pross.procedimientoDatos("CALL `abmPregunta`('B','"+codigo+"', 0, 0, 0,now(),'','','INACTIVO')","Borrar pregunta");
					
					}else if(proceso.equals("verificapregunta")){
					String titulo = String.valueOf(request.getParameter("titulo"));
				  Procedimiento pross = new Procedimiento();	
					ArrayList<ArrayList<String>> val=pross.FiltroGeneralString("SELECT COUNT(id_pregunta) FROM pregunta WHERE titulo='"+titulo+"'","1","verifica titulo");
			    String valor=String.valueOf(val.get(0).get(0));
			    PrintWriter out = response.getWriter();
			    out.print(valor);	
		  
					} else if(proceso.equals("traermispreguntas")){
						Procedimiento pross = new Procedimiento();
						String actual = String.valueOf(request.getParameter("ultimo"));
						String codigo = String.valueOf(request.getParameter("datos"));
						String id = String.valueOf(request.getParameter("id"));
						//Configuración para la generar la paginación
					
						String[] columna= {"codigo","usuario","titulo","tema","fecha","hora","tem","permiso","url"};  
						String scritp="";
						if(actual.equals("0")){
							scritp="SELECT id_pregunta,usuario,titulo,tema,fecha,hora,id_temas,id_permiso,url FROM mispreguntas \r\n" + 
									
									"WHERE id_pregunta>"+actual+" and (tema like '%' '"+codigo+"' '%'  OR titulo like '%' '"+codigo+"' '%') AND id_prefil='"+id+"' LIMIT 7 ";
						}else{
						
							scritp="SELECT id_pregunta,usuario,titulo,tema,fecha,hora,id_temas,id_permiso,url FROM mispreguntas \r\n" + 
							
									"WHERE id_pregunta<"+actual+" and (tema like '%' '"+codigo+"' '%'  OR titulo like '%' '"+codigo+"' '%') AND id_prefil='"+id+"'  LIMIT 7 ";
					
						}
						
						String cantidad = "9";
						String lugar = "Filtro mis preguntas";
						String valor=pross.Filtro2(scritp, cantidad,columna, lugar);
						PrintWriter out = response.getWriter();
						out.print(valor);
					
					}else if(proceso.equals("traerpregunta")){	
						String id_pregunta = String.valueOf(request.getParameter("id_pregunta"));
		        Procedimiento pross = new Procedimiento();
		        ArrayList<ArrayList<String>> val=pross.FiltroGeneralString("SELECT texto FROM pregunta  WHERE id_pregunta="+id_pregunta,"1","traer texto");
		        String valor=String.valueOf(val.get(0).get(0));
		        PrintWriter out = response.getWriter();
		        out.print(valor);	
						
				} else if(proceso.equals("todaspreguntas")){
					Procedimiento pross = new Procedimiento();
					
					String actual = String.valueOf(request.getParameter("ultimo"));
					String codigo = String.valueOf(request.getParameter("datos"));
					//Configuración para la generar la paginación
					String[] columna= {"codigo","usuario","titulo","tema","fecha","hora","url"}; 
					String scritp="";
					if(actual.equals("0")){
						 scritp="SELECT id_pregunta,usuario,titulo,tema,fecha,hora,url FROM muropreguntas \r\n" + 
						" WHERE id_pregunta>"+actual+" and (tema like '%' '"+codigo+"' '%'  OR titulo like '%' '"+codigo+"' '%' ) LIMIT 7";
					}else{
						 scritp="SELECT id_pregunta,usuario,titulo,tema,fecha,hora,url FROM muropreguntas \r\n" +  		
						" WHERE id_pregunta<"+actual+" and (tema like '%' '"+codigo+"' '%'  OR titulo like '%' '"+codigo+"' '%' ) LIMIT 7";
					}
					
					String cantidad = "7";
					String lugar = "Filtro todas las preguntas";
					String valor=pross.Filtro2(scritp, cantidad,columna, lugar);
					PrintWriter out = response.getWriter();
					out.print(valor);
						
				}else if(proceso.equals("altarespuesta")){
						int id_pregunta = Integer.parseInt(String.valueOf(request.getParameter("idpregunta")));
						int id_respuesta = Integer.parseInt(String.valueOf(request.getParameter("idrespuesta")));
		    			int id_perfil = Integer.parseInt(String.valueOf(request.getParameter("idperfil")));
		    			String texto = String.valueOf(request.getParameter("texto"));
		    			Procedimiento pross = new Procedimiento();
		    			
		    			if(id_respuesta==0) {
			    			String tipo="A";
			    			pross.procedimientoDatos("CALL abmRespuesta('"+tipo+"',0,'"+id_perfil+"','"+id_pregunta+"',NOW(),'"+texto+"','ACTIVO')", "altarespuesta");
			    			}else{
			    			String tipo="M";
			    			pross.procedimientoDatos("CALL abmRespuesta('"+tipo+"','"+id_respuesta+"','"+id_perfil+"','"+id_pregunta+"',NOW(),'"+texto+"','ACTIVO')", "modificaespuesta");
			    			}	
		    		
					
				} else if(proceso.equals("respuestas")){
						Procedimiento pross = new Procedimiento();
						String actual = String.valueOf(request.getParameter("ultimo"));
						String codigo = String.valueOf(request.getParameter("datos"));
						//Configuración para la generar la paginación
						String[] columna= {"codigo","pregunta","idusu","tipo","usuario","texto","fecha","hora"};  
						String scritp="";
						if(actual.equals("0")){
							scritp="SELECT id_respuesta,id_pregunta,id_prefil,tipo,usuario,texto,fecha,hora FROM todasrespuestas \r\n" + 
								
									"WHERE id_pregunta='"+codigo+"' and id_respuesta>"+actual+" limit 7";
							
						}else{
						
							scritp="SELECT id_respuesta,id_pregunta,id_prefil,tipo,usuario,texto,fecha,hora FROM todasrespuestas\r\n" + 
							
									"WHERE id_pregunta='"+codigo+"' and id_respuesta>"+actual+" limit 7";
						}
						
						String cantidad = "8";
						String lugar = "Filtro respuestas";
						String valor=pross.Filtro2(scritp, cantidad,columna, lugar);
						PrintWriter out = response.getWriter();
						out.print(valor);
				}else if(proceso.equals("bajarespuesta")){
						String codigo = String.valueOf(request.getParameter("codigo"));
					  Procedimiento pross = new Procedimiento();					
						pross.procedimientoDatos("CALL abmRespuesta('B','"+codigo+"',0,0,now(),0,'Inactivo')", "borrar respuesta");
						
				}else if(proceso.equals("puntuacionrespuesta")){
						String id_perfil = String.valueOf(request.getParameter("idperfil"));
						String id_respuesta = String.valueOf(request.getParameter("idrespuesta"));
						String punto = String.valueOf(request.getParameter("punto"));
						Procedimiento pross = new Procedimiento();	
						pross.procedimientoDatos("CALL `abmPuntuacion`('"+punto+"','"+id_respuesta+"','"+id_perfil+"')","puntuar respuesta");	
						
				}else if(proceso.equals("puntosrespuesta")){
						String codigo = String.valueOf(request.getParameter("codigo"));
					  Procedimiento pross = new Procedimiento();	
						ArrayList<ArrayList<String>> val=pross.FiltroGeneralString("SELECT SUM(punto_respuesta) FROM puntuacion_respuesta WHERE id_respuesta='"+codigo+"'","1","puntos");
				    String valor=String.valueOf(val.get(0).get(0));
				    PrintWriter out = response.getWriter();
				    out.print(valor);	
				    
				}else if(proceso.equals("minimopregunta")){	
						String id_perfil = String.valueOf(request.getParameter("id_perfil"));
			        Procedimiento pross = new Procedimiento();
			        ArrayList<ArrayList<String>> val=pross.FiltroGeneralString("SELECT MIN(id_pregunta) FROM mispreguntas WHERE id_prefil="+id_perfil,"1","pregunta minimo");
			        String valor=String.valueOf(val.get(0).get(0));
			        PrintWriter out = response.getWriter();
			        out.print(valor);	
				}else if(proceso.equals("maximorespuesta")){	
						String id_pregunta = String.valueOf(request.getParameter("id_pregunta"));
						Procedimiento pross = new Procedimiento();
			        ArrayList<ArrayList<String>> val=pross.FiltroGeneralString("SELECT MAX(id_respuesta) FROM todasrespuestas WHERE id_pregunta="+id_pregunta,"1","id respuesta");
			        String valor=String.valueOf(val.get(0).get(0));
			        PrintWriter out = response.getWriter();
			        out.print(valor);	
					    
				}else if(proceso.equals("pointsrespuesta")){
					String codigo = String.valueOf(request.getParameter("idrespuesta"));
					Procedimiento pross = new Procedimiento();
					String[] columna= {"usuario","punto"}; 
					String scritp="SELECT perfil.usuario,puntuacion_respuesta.punto_respuesta\r\n" + 
							"FROM  puntuacion_respuesta \r\n" + 
							"INNER JOIN perfil ON puntuacion_respuesta.id_prefil=perfil.id_prefil \r\n" + 
							"INNER JOIN tipo_perfil ON tipo_perfil.id_tipo_perfil=perfil.id_tipo_perfil WHERE id_respuesta='"+codigo+"'";
					String cantidad = "2";
					String lugar = "Filtro quien puntuo";
					String valor=pross.Filtro2(scritp, cantidad,columna, lugar);
					PrintWriter out = response.getWriter();
					out.print(valor); 
					/*	     -----------------------------------------------------aca termino FER ----------------------------------------------------------------- */ 				
				}else if(proceso.equals("filtrocarreraperfil")){
						String id=String.valueOf(request.getParameter("datos"));
						Procedimiento pross = new Procedimiento();
						String valor = "";
						ArrayList<ArrayList<String>> datos=pross.FiltroGeneralString("SELECT universidad_carrera.id_universidad_carrera,carrera.nombre AS carrera FROM universidad_carrera "
						+" INNER JOIN carrera ON carrera.id_carrera=universidad_carrera.id_carrera "
						+" WHERE id_institucion="+id, "2", "INGRESO");
						for (int i = 0; i < datos.size(); i++) {
							valor=valor.concat("<option value=\""+datos.get(i).get(0)+"\" selected=\"\">"+datos.get(i).get(1)+"</option>");
						}	
						PrintWriter out = response.getWriter();
						out.print(valor);
					
 
////////////////////////////////-------yoshio
			
				}else if(proceso.equals("guardardatosperfil")){
					System.out.println("entro controlador guardardatosperfil");
					HttpSession session = request.getSession( true );
					String id=String.valueOf(session.getAttribute("id"));
					String tipo=String.valueOf(session.getAttribute("tipo"));
					String nombre=String.valueOf(request.getParameter("nombre"));
					String apellido=String.valueOf(request.getParameter("apellido"));
					String sexo=String.valueOf(request.getParameter("sexo"));
					//String institucion=String.valueOf(request.getParameter("institucion"));
					String carrera=String.valueOf(request.getParameter("carrera"));
					
					Procedimiento Proceso = new Procedimiento();
					Proceso.procedimientoDatos("CALL abmperfildatos('M','"+tipo+"',"+id+",'"+nombre+"','"+apellido+"','"+sexo+"',"+carrera+")", "guardardatosperfil");
				
				}else if(proceso.equals("guardardatosinsti")){
					System.out.println("entro controlador guardardatosinsti");
					HttpSession session = request.getSession( true );
					String id=String.valueOf(session.getAttribute("id"));
					String tipo=String.valueOf(session.getAttribute("tipo"));
					String nombre=String.valueOf(request.getParameter("nombre"));
					String direccion=String.valueOf(request.getParameter("direccion"));
					String telefono=String.valueOf(request.getParameter("telefono"));
					
					Procedimiento Proceso = new Procedimiento();
					Proceso.procedimientoDatos("CALL abminstituciondatos('M','"+tipo+"',"+id+",'"+nombre+"','"+direccion+"','"+telefono+"')", "guardardatosinsti");
					
				}else if(proceso.equals("guardardatosceo")){
					System.out.println("entro controlador guardardatosceo");
					HttpSession session = request.getSession( true );
					String id=String.valueOf(session.getAttribute("id"));
					String tipo=String.valueOf(session.getAttribute("tipo"));
					String nombre=String.valueOf(request.getParameter("nombre"));
					String apellido=String.valueOf(request.getParameter("apellido"));
					String direccion=String.valueOf(request.getParameter("direccion"));
					String telefono=String.valueOf(request.getParameter("telefono"));
					String pagina=String.valueOf(request.getParameter("pagina"));
					//String institucion=String.valueOf(request.getParameter("institucion"));
					
					Procedimiento Proceso = new Procedimiento();
					Proceso.procedimientoDatos("CALL abmceodatos('M','"+tipo+"',"+id+",'"+nombre+"','"+apellido+"','"+direccion+"','"+telefono+"','"+pagina+"')", "guardardatosceo");
				
					/*------------------------------------------------FINAL YOSHIO-------------------------------------------------*/
				}else if(proceso.equals("guardarInsti")){
					System.out.println("entro controlador guardarInsti");
					HttpSession session = request.getSession( true );
					
					String tipo=String.valueOf(session.getAttribute("tipo"));
					
					String nombre=String.valueOf(request.getParameter("nombre"));
					String direccion=String.valueOf(request.getParameter("direccion"));
					String telefono=String.valueOf(request.getParameter("telefono"));
					String correo=String.valueOf(request.getParameter("correo"));
					String tipoInsti=String.valueOf(request.getParameter("tipoInsti"));
					
					String usuario=String.valueOf(request.getParameter("usuario"));
					String pass=String.valueOf(request.getParameter("pass"));
					String ciudad=String.valueOf(request.getParameter("ciudad"));
					
					Procedimiento Proceso = new Procedimiento();
				
					Proceso.procedimientoDatos("CALL abmInstitucion('A','"+tipo+"',0,1,'"+nombre+"','"+ciudad+"','"+direccion+"','"+telefono+"','"+correo+"','"+usuario+"','"+pass+"',"+tipoInsti+",'ACTIVO')", "guardarInsti");
				
				}else if(proceso.equals("buscarInstitucion")){
					System.out.println("entro buscarInstitucion");
					HttpSession session = request.getSession( true );
					String tipo=String.valueOf(session.getAttribute("tipo"));
					String nombre=String.valueOf(request.getParameter("nombre"));
					Procedimiento Proceso = new Procedimiento();
					String	contenido="";
					//ArrayList<ArrayList<String>> datosvalor = Proceso.FiltroGeneralString("SELECT verificaPassRegistro('"+Email+"')", "1", "reenviarrestablecerPass");
					try {
			    		contenido="<table id=\"tablaInstitucion\" class=\"table table-striped table-sm\"><th>NOMBRE</th><th>CIUDAD</th><th>DIRECCION</th><th>TELEFONO</th><th>E-MAIL</th></tr>";
			    		ArrayList<ArrayList<String>> valor = Proceso.FiltroGeneralString("SELECT nombre,ciudad,direccion,telefono,email FROM institucion WHERE nombre LIKE '"+nombre+"' '%'", "5", "BUSCAR INSTITUCION");
			    		
			    		for (int i = 0; i < valor.size(); i++) {
			    			contenido=contenido.concat("<tr>"
									+"<td>"+valor.get(i).get(0)+"</td>"
									+"<td>"+valor.get(i).get(1)+"</td>"
									+"<td>"+valor.get(i).get(2)+"</td>"
									+"<td>"+valor.get(i).get(3)+"</td>"
									+"<td>"+valor.get(i).get(4)+"</td>"
									+"<td>"
									+ "</td>"
									+"</tr>");
						}
			    	} catch (Exception e) {
						// TODO: handle exception
			    		System.out.println("error-- "+e);
					}
			    	PrintWriter out = response.getWriter();
			    	out.println(contenido.concat(""));
					/////////////////////////////////////
					/*------------------------------------------------FINAL YOSHIO-------------------------------------------------*/

				}
				else if(proceso.equals("guardarCarrera")){
					System.out.println("entro controlador guardarCarrera");
					HttpSession session = request.getSession( true );
					String tipo=String.valueOf(session.getAttribute("tipo"));
					String carrera=String.valueOf(request.getParameter("carrera"));
					String codigo=String.valueOf(request.getParameter("id_institucion"));
					Procedimiento Proceso = new Procedimiento();
					
					Proceso.procedimientoDatos("CALL abmCarrera('A','"+tipo+"','"+codigo+"','"+carrera+"')", "guardarCarrera");
					
				}
				else if(proceso.equals("altaceo")){
					String codigo = String.valueOf(request.getParameter("codigo"));
					String cedula = String.valueOf(request.getParameter("cedula"));
					String nombre = String.valueOf(request.getParameter("nombre"));
					String apellido = String.valueOf(request.getParameter("apellido"));
					String direccion = String.valueOf(request.getParameter("direccion"));
					String telefono = String.valueOf(request.getParameter("telefono"));
					String email = String.valueOf(request.getParameter("email"));
					String pagina = String.valueOf(request.getParameter("pagina"));
					String estado = String.valueOf(request.getParameter("estado"));
					Procedimiento pross = new Procedimiento();
					pross.procedimientoDatos("CALL abmceo('A',0,'"+cedula+"','"+nombre+"','"+apellido+"','"+direccion+"','"+telefono+"','"+email+"','"+pagina+"','"+estado+"')", "altaceo");			
				
				
////////////////////////////////////////////////////////////////				// xyntia
				
				}else if(proceso.equals("altaposteo")){
	    			int id_perfil = Integer.parseInt(String.valueOf(request.getParameter("id_perfil")));
	    			
	    			String titulo = String.valueOf(request.getParameter("titulo"));
	    			int temas = Integer.parseInt(String.valueOf(request.getParameter("temas")));
	    			
	    			int privacidad = Integer.parseInt(String.valueOf(request.getParameter("privacidad")));
	    			
	    			String texto = String.valueOf(request.getParameter("texto"));
	    			String valor=(String.valueOf(request.getParameter("id_posteo")));
	    			int cal= valor.length();
	    			String resul="";
	    			for (int i = 0; i < cal; i++) {
	    				resul=valor.replace(" ", "");
	    			}
	    			
	    			int id_posteo=Integer.parseInt(resul);
	    			
	    			Procedimiento pross = new Procedimiento();	
	    			if(id_posteo==0) {
	    				String tipo="A";
	    				pross.guardarPosteo(id_perfil,titulo, temas, privacidad, texto,id_posteo,"ACTIVO",tipo);		
	    				}else{
	    				String tipo="M";
	    				pross.guardarPosteo(id_perfil,titulo, temas, privacidad, texto,id_posteo,"ACTIVO",tipo);		
	    				}	
	    			
	    			
			
				}else if(proceso.equals("bajaposteo")){
	    			String codigo = String.valueOf(request.getParameter("codigo"));
	    			Procedimiento pross = new Procedimiento();	
	    			pross.procedimientoDatos("CALL `abmPosteo`('B','"+codigo+"', 0, 0, 0,0,'','',0,'INACTIVO')","Borrar posteo");
	    		
	    		}else if(proceso.equals("altacomentario")){
	    			System.err.println("ingreo alta_comentario");
	    			String idperfil = String.valueOf(request.getParameter("idperfil"));
	    			String idposteo = String.valueOf(request.getParameter("idposteo"));
	    			String texto = String.valueOf(request.getParameter("texto"));
	    			Procedimiento pross = new Procedimiento();
	    			pross.procedimientoDatos("CALL abmComentario('A',0,'"+idperfil+"','"+idposteo+"',NOW(),'"+texto+"',0,'ACTIVO')", "altacomentario");
	    		}else if(proceso.equals("bajacomentario")){
	    			System.err.println("ingreo alta_comentario");
	    			String idposteo = String.valueOf(request.getParameter("codigo"));
	    			Procedimiento pross = new Procedimiento();
	    			pross.procedimientoDatos("CALL abmComentario('B',"+idposteo+",'"+"0"+"','"+"0"+"',NOW(),'"+"0"+"',0,'INACTIVO')", "altacomentario");
	  
	    		} else if(proceso.equals("Filtromipost")){
					Procedimiento pross = new Procedimiento();
					String actual = String.valueOf(request.getParameter("ultimo"));
					String codigo = String.valueOf(request.getParameter("datos"));
					String id = String.valueOf(request.getParameter("id"));
			
					//Configuración para la generar la paginación
				
					String[] columna= {"codigo","usuario","titulo","tema","fecha","hora", "texto","idtema"}; 
					String scritp="";
					if(actual.equals("0")){
						 scritp="SELECT posteo.id_posteo, "
						 		+ "perfil.usuario,posteo.titulo,temas.tema,DATE_FORMAT(posteo.fecha,'%d %b %Y'), "
						 		+ "DATE_FORMAT(posteo.fecha,'%H:%i:%s'), posteo.texto,`temas`.`id_temas` FROM posteo "
						 		+ "INNER JOIN perfil ON posteo.id_prefil=perfil.id_prefil "
						 		+ "INNER JOIN tipo_perfil ON tipo_perfil.id_tipo_perfil=perfil.id_tipo_perfil  "
						 		+ "INNER JOIN temas ON temas.id_temas=posteo.id_temas  "
						 		+ "WHERE posteo.id_posteo>"+actual+" and (temas.tema like  '"+codigo+"' '%'  OR posteo.titulo like '%' '"+codigo+"' '%') "
											+ "AND posteo.estado='ACTIVO'  AND perfil.id_prefil LIKE '"+id+"' '%' "
													+ "ORDER BY posteo.fecha DESC  LIMIT 3";
					}else{

						 scritp="SELECT posteo.id_posteo, "
						 		+ "perfil.usuario,posteo.titulo,temas.tema,DATE_FORMAT(posteo.fecha,'%d %b %Y'), "
						 		+ "DATE_FORMAT(posteo.fecha,'%H:%i:%s'), posteo.texto,`temas`.`id_temas`  FROM posteo "
						 		+ "INNER JOIN perfil ON posteo.id_prefil=perfil.id_prefil "
						 		+ "INNER JOIN tipo_perfil ON tipo_perfil.id_tipo_perfil=perfil.id_tipo_perfil  "
						 		+ "INNER JOIN temas ON temas.id_temas=posteo.id_temas  "
						 		+ "WHERE posteo.id_posteo<"+actual+" and (temas.tema like '"+codigo+"' '%'  OR posteo.titulo like '%' '"+codigo+"' '%') "
											+ "AND posteo.estado='ACTIVO' AND perfil.id_prefil LIKE '"+id+"' '%' "
													+ "ORDER BY posteo.fecha DESC  LIMIT 3";
					}
					
					String cantidad = "8";
					String lugar = "Filtro mis posteos";
					String valor=pross.Filtro2(scritp, cantidad,columna, lugar);
					PrintWriter out = response.getWriter();
					out.print(valor);
	    		} else if(proceso.equals("Filtromuro")){
	    			Procedimiento pross = new Procedimiento();
					String actual = String.valueOf(request.getParameter("ultimo"));
					String codigo = String.valueOf(request.getParameter("datos"));
					
					//Configuración para la generar la paginación
				
					String[] columna= {"codigo","usuario","nombre","titulo","tema","fecha","hora","enlace","puntaje"}; 
					
					String scritp="";
					if(actual.equals("0")){
						System.err.println("ingreso muro "+actual);
						 scritp="SELECT posteo.id_posteo,perfil.usuario,tipo_perfil.nombre,posteo.titulo,temas.tema,DATE_FORMAT(posteo.fecha,'%d %b %Y'), "
						 		+ "DATE_FORMAT(posteo.fecha,'%H:%i:%s'),enlacesistema.`url`,`posteo_puntaje`( posteo.id_posteo)   "
						 		+ "FROM posteo INNER JOIN perfil ON posteo.id_prefil=perfil.id_prefil  "
						 		+ "INNER JOIN tipo_perfil ON tipo_perfil.id_tipo_perfil=perfil.id_tipo_perfil   "
						 		+ "INNER JOIN temas ON temas.id_temas=posteo.id_temas  "
						 		+ "LEFT JOIN enlace_posteo ON posteo.`id_posteo`=enlace_posteo.`id_posteo`  "
						 		+ "LEFT JOIN enlacesistema ON enlace_posteo.`id_enlacesistema`=enlacesistema.`id_enlacesistema` "
									+ "WHERE  posteo.id_posteo>"+actual+" and (temas.tema like '%' '"+codigo+"' '%'  OR posteo.titulo like '%' '"+codigo+"' '%') "
											+ "AND posteo.estado='ACTIVO' "
													+ "ORDER BY posteo.fecha DESC  LIMIT 3";
					}else{
						System.err.println("ingreso muro2 "+actual);
						 scritp="SELECT posteo.id_posteo,perfil.usuario,tipo_perfil.nombre,posteo.titulo,temas.tema,DATE_FORMAT(posteo.fecha,'%d %b %Y'), "
						 		+ "DATE_FORMAT(posteo.fecha,'%H:%i:%s'),enlacesistema.`url`,`posteo_puntaje`( posteo.id_posteo)   "
						 		+ "FROM posteo INNER JOIN perfil ON posteo.id_prefil=perfil.id_prefil  "
						 		+ "INNER JOIN tipo_perfil ON tipo_perfil.id_tipo_perfil=perfil.id_tipo_perfil   "
						 		+ "INNER JOIN temas ON temas.id_temas=posteo.id_temas  "
						 		+ "LEFT JOIN enlace_posteo ON posteo.`id_posteo`=enlace_posteo.`id_posteo`  "
						 		+ "LEFT JOIN enlacesistema ON enlace_posteo.`id_enlacesistema`=enlacesistema.`id_enlacesistema` "
						 		+ "WHERE posteo.id_posteo<"+actual+" and (temas.tema like '%' '"+codigo+"' '%'  OR posteo.titulo like '%' '"+codigo+"' '%') "
											+ "AND posteo.estado='ACTIVO' "
													+ "ORDER BY posteo.fecha DESC  LIMIT 3";
					}
					
					String cantidad = "9";
					String lugar = "Filtro mis posteos";
					String valor=pross.Filtro2(scritp, cantidad,columna, lugar);
					PrintWriter out = response.getWriter();
					out.print(valor);
				}else if(proceso.equals("cargar_posteo")){
					Procedimiento pross = new Procedimiento();
					String url = String.valueOf(request.getAttribute("javax.servlet.forward.request_uri"));
					ArrayList<ArrayList<String>> desdeurl = null;
					ArrayList<ArrayList<String>> cargar = null;
					String idposteo="";
					String cuerpo="";
					try{
						desdeurl=pross.FiltroGeneralString("SELECT  `enlace_posteo`.`id_posteo` FROM `enlace_posteo` "
								+ " INNER JOIN `enlacesistema` ON `enlacesistema`.`id_enlacesistema`=`enlace_posteo`.`id_enlacesistema`  "
								+ " WHERE `enlacesistema`.`url`='"+url+"'","1","");
						for(int i=0;i<desdeurl.size();i++){
							idposteo=desdeurl.get(i).get(0);
						}
						cargar=pross.FiltroGeneralString("SELECT posteo.titulo,posteo.texto,DATE_FORMAT(posteo.fecha,'%d %b %Y'), "
								+ "DATE_FORMAT(posteo.fecha,'%H:%i:%s'),perfil.usuario,tipo_perfil.nombre "
								+ "FROM posteo LEFT JOIN perfil ON posteo.id_prefil=perfil.id_prefil "
								+ "LEFT JOIN tipo_perfil ON perfil.id_tipo_perfil=tipo_perfil.id_tipo_perfil "
								+ "WHERE posteo.id_posteo="+idposteo,"6","trayendo todo");
						 for(int i=0;i<cargar.size();i++){
							 cuerpo=cuerpo.concat("<div class=\"posteo\"><center><h3>"+(cargar.get(i).get(0))+"</h3></center>  <br>	");
                        	
                        	}
                          
                            for(int i=0;i<cargar.size();i++){
                            	cuerpo=cuerpo.concat("<p>"+(cargar.get(i).get(1))+"</p>  <br> <br> <br>");
                        	}
					}catch(Exception e){
					}
					PrintWriter out = response.getWriter();
					out.print(cuerpo);
				} else if(proceso.equals("cargar_comentario")){
					Procedimiento pross = new Procedimiento();
					String idposteo=String.valueOf(request.getParameter("codigo"));
					String actual=String.valueOf(request.getParameter("ultimo"));
					System.err.println(idposteo+" id cargar_comentario"+ actual+" actual");
					String[] columna= {"usuario","fecha","texto","id","idusu"}; 
					
					String scritp="";
					if(actual.equals("0")){
						System.err.println("ingreso muro "+actual);
						 scritp="SELECT pe.usuario,DATE_FORMAT(pc.fecha, '%d %b %Y' ' a las '  '%H:%i:%s'),pc.texto,pc.id_posteo_comentario,pe.id_prefil "
						 		+ "FROM posteo_comentario pc "
						 		+ "INNER JOIN perfil pe ON pe.id_prefil=pc.id_prefil WHERE pc.estado='ACTIVO' AND  pc.id_posteo_comentario>"+actual+" and  pc.id_posteo="+idposteo+" limit 5";
					}else{
						System.err.println("ingreso muro2 "+actual);
						 scritp="SELECT pe.usuario,DATE_FORMAT(pc.fecha, '%d %b %Y' ' a las '  '%H:%i:%s'),pc.texto,pc.id_posteo_comentario,pe.id_prefil "
							 		+ "FROM posteo_comentario pc "
							 		+ "INNER JOIN perfil pe ON pe.id_prefil=pc.id_prefil WHERE pc.estado='ACTIVO' AND  pc.id_posteo_comentario>"+actual+" and  pc.id_posteo="+idposteo+" limit 5";;
					}
					
					String cantidad = "5";
					String lugar = "Filtro mis cometarios";
					String valor=pross.Filtro2(scritp, cantidad,columna, lugar);
					PrintWriter out = response.getWriter();
					out.print(valor);	
				}else if(proceso.equals("alta_puntaje_posteo")){
					String perfil = String.valueOf(request.getParameter("idperfil"));
					System.out.println("entro alta_puntaje_posteo "+perfil);
					String punto = String.valueOf(request.getParameter("puntaje"));
					System.out.println("entro alta_puntaje_posteo "+punto);
					String posteo = String.valueOf(request.getParameter("posteo"));
					System.out.println("entro alta_puntaje_posteo "+posteo);
					System.out.println("entro alta_puntaje_posteo "+posteo+" "+perfil+" "+punto);
					Procedimiento pross = new Procedimiento();
					pross.procedimientoDatos("call guardar_puntaje_posteo("+Integer.parseInt(perfil)+", "+Integer.parseInt(punto)+","+Integer.parseInt(posteo)+")","REGISTRO PUNTAJE-POSTEO");
					ArrayList<ArrayList<String>> cargar=pross.FiltroGeneralString("SELECT `posteo_puntaje`("+posteo+") ", "1", "filtropuntaje");
					String cuerpo="";
					for(int i=0;i<cargar.size();i++){
		            	cuerpo=cuerpo.concat(cargar.get(i).get(0));
		        	}
					PrintWriter out = response.getWriter();
					out.print(cuerpo);
				}else if(proceso.equals("traerprivacidad")){	
					String id_posteo = String.valueOf(request.getParameter("id_posteo"));
			        Procedimiento pross = new Procedimiento();
			        ArrayList<ArrayList<String>> val=pross.FiltroGeneralString("SELECT `permiso`.`id_permiso`  FROM posteo INNER JOIN `permiso`  ON `permiso`.`id_permiso`=`posteo`.`id_permiso` WHERE `posteo`.id_posteo="+id_posteo,"1","traer privacidad");
			        String valor="";
			        for(int i=0;i<val.size();i++){
			         valor=String.valueOf(val.get(i).get(0));
			        }
			        PrintWriter out = response.getWriter();
			        out.print(valor);	
					}
	    		// fin parte cyntia
	    		else if(proceso.equals("FiltroCeo")){
					Procedimiento pross = new Procedimiento();
					String posiciones = String.valueOf(request.getParameter("posiciones"));
					String total_reg = String.valueOf(request.getParameter("total_reg"));
					String actual = String.valueOf(request.getParameter("actual"));
					String turno = String.valueOf(request.getParameter("turno"));
					String codigo = String.valueOf(request.getParameter("datos"));
					//Configuraci�n para la generar la paginaci�n
					String[] columna= {"codigo","ci","nombre","apellido","direccion"}; // ,"telefono","email","pagina","estado" 
					String Script = "SELECT id_ceo,ci,nombre,apellido,direccion FROM ceo WHERE nombre LIKE '"+codigo+"' '%'"; // ,telefono,email,pagina,estado
					String cantidad = "5";
					String lugar = "FiltroCeo";
					String valor=pross.FiltroCeo(posiciones, total_reg, actual, turno, Script, cantidad,columna, lugar);
					PrintWriter out = response.getWriter();
					out.print(valor);
				
				////////parte de hugo/////////////////
				
			}else	if(proceso.equals("altaevento")){
					System.err.println(proceso+" proceso");
					String titulo = String.valueOf(request.getParameter("titulo"));
					String fecha = String.valueOf(request.getParameter("fecha"));
					String busqueda = String.valueOf(request.getParameter("ubicacion"));
					String contenido = String.valueOf(request.getParameter("texto"));
					String id_permiso = String.valueOf(request.getParameter("id_permiso"));
					String id_perfil = String.valueOf(request.getParameter("id_perfil"));
					System.err.println(titulo+" "+fecha+" "+busqueda+" "+contenido+" "+id_permiso+" "+id_perfil);
			
				
					System.out.println("holaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
					Procedimiento pross = new Procedimiento();
					pross.procedimientoDatos("CALL abmevento('A',0,"+Integer.parseInt(id_permiso)+",'"+fecha+"','"+titulo+"','"+contenido+"','"+busqueda+"','ACTIVO',"+Integer.parseInt(id_perfil)+")", "altaevento");			
			
			}else if(proceso.equals("bajaevento")){
				System.err.println(proceso+" proceso");
    			String codigo = String.valueOf(request.getParameter("codigo"));
    			System.err.println(codigo+" codigo proceso");
    			String id_perfil = String.valueOf(request.getParameter("id_perfil"));	
    			System.err.println(id_perfil+" id_perfil proceso");
    			Procedimiento pross = new Procedimiento();	
    			pross.procedimientoDatos("CALL abmevento('B',"+Integer.parseInt(codigo)+","+1+",NOW(),'"+" "+"','"+" "+"','"+" "+"','INACTIVO',"+Integer.parseInt(id_perfil)+")","Borrar evento");
    			System.err.println(" BORRO proceso");
    		
			}else if(proceso.equals("Filtroeventototal")){
					Procedimiento pross = new Procedimiento();
					String posiciones = String.valueOf(request.getParameter("posiciones"));
					String total_reg = String.valueOf(request.getParameter("total_reg"));
					String actual = String.valueOf(request.getParameter("actual"));
					String turno = String.valueOf(request.getParameter("turno"));
					String codigo = String.valueOf(request.getParameter("datos"));
					
					//Configuraci�n para la generar la paginaci�n
					String[] columna= {"codigo","usuario","nombre","titulo","fecha","hora","enlace"}; 
					String scritp="SELECT evento.id_evento,perfil.usuario,tipo_perfil.nombre,evento.titulo,DATE_FORMAT(evento.fecha,'%d %b %Y'),DATE_FORMAT(evento.fecha,'%H:%i:%s'),enlacesistema.`url`\r\n" + 
							"FROM evento\r\n" + 
							"INNER JOIN perfil ON evento.id_prefil=perfil.id_prefil  \r\n" + 
							"INNER JOIN tipo_perfil ON tipo_perfil.id_tipo_perfil=perfil.id_tipo_perfil \r\n" + 
							"LEFT JOIN enlace_evento ON evento.`id_evento`=enlace_evento.`id_evento`\r\n" + 
							"LEFT JOIN enlacesistema ON enlace_evento.`id_enlacesistema`=enlacesistema.`id_enlacesistema`\r\n" + 
							"WHERE evento.titulo LIKE '%' '"+codigo+"' '%' ORDER BY evento.fecha DESC ";
					String cantidad = "7";
					String lugar = "FiltroMuroevento";
					String valor=pross.FiltroCeo(posiciones, total_reg, actual, turno, scritp, cantidad,columna, lugar);
					PrintWriter out = response.getWriter();
					out.print(valor);
    			} else if(proceso.equals("Filtroevento")){
					Procedimiento pross = new Procedimiento();
					String posiciones = String.valueOf(request.getParameter("posiciones"));
					String total_reg = String.valueOf(request.getParameter("total_reg"));
					String actual = String.valueOf(request.getParameter("actual"));
					String turno = String.valueOf(request.getParameter("turno"));
					String codigo = String.valueOf(request.getParameter("datos"));
					String id = String.valueOf(request.getParameter("id_perfil"));
			
					//Configuraci�n para la generar la paginaci�n
					System.err.println(codigo+"codigo- id "+id);
					String[] columna= {"codigo","titulo","ubicacion","fecha","hora","enlace"}; 
					String scritp="SELECT evento.id_evento,evento.titulo,evento.ubicacion,DATE_FORMAT(evento.fecha,'%d %b %Y'),DATE_FORMAT(evento.fecha,'%H:%i:%s'),enlacesistema.`url`\r\n" + 
							"FROM evento\r\n" + 
							"INNER JOIN perfil ON evento.id_prefil=perfil.id_prefil  \r\n" + 
							"INNER JOIN tipo_perfil ON tipo_perfil.id_tipo_perfil=perfil.id_tipo_perfil \r\n" + 
							"LEFT JOIN enlace_evento ON evento.`id_evento`=enlace_evento.`id_evento`\r\n" + 
							"LEFT JOIN enlacesistema ON enlace_evento.`id_enlacesistema`=enlacesistema.`id_enlacesistema` WHERE perfil.id_prefil ='"+id+"' AND evento.titulo LIKE '"+codigo+"' '%' ";
					String cantidad = "6";
					String lugar = "Filtro_evento";
					String valor=pross.FiltroCeo(posiciones, total_reg, actual, turno, scritp, cantidad,columna, lugar);
					PrintWriter out = response.getWriter();
					out.print(valor);
				
					////////parte de hugo/////////////////
    			}else if(proceso.equals("Filtroeventotal")){
						Procedimiento pross = new Procedimiento();
						
						String actual = String.valueOf(request.getParameter("ultimo"));
						System.err.println("evento 3");
						
						String codigo = String.valueOf(request.getParameter("datos"));
						System.err.println("actual "+actual+" "+codigo);
						String id = String.valueOf(request.getParameter("id"));
						System.err.println("actual "+actual+" "+codigo);
						
						
						
						//Configuraci�n para la generar la paginaci�n
						String[] columna= {"codigo","usuario","nombre","titulo","fecha","hora","enlace"}; 
						String scritp="";
						if(actual.equals("0")) {
							

							scritp="SELECT evento.id_evento,perfil.usuario,tipo_perfil.nombre,evento.titulo,DATE_FORMAT(evento.fecha,'%d %b %Y'),DATE_FORMAT(evento.fecha,'%H:%i:%s'),enlacesistema.`url` \r\n" + 
								"FROM evento \r\n" + 
								"INNER JOIN perfil ON evento.id_prefil=perfil.id_prefil \r\n" + 
								"INNER JOIN tipo_perfil ON tipo_perfil.id_tipo_perfil=perfil.id_tipo_perfil \r\n" + 
								"LEFT JOIN enlace_evento ON evento.`id_evento`=enlace_evento.`id_evento` \r\n" + 
								"LEFT JOIN enlacesistema ON enlace_evento.`id_enlacesistema`=enlacesistema.`id_enlacesistema` \r\n" + 
								"WHERE evento.id_evento>"+actual+" and  evento.titulo LIKE '"+codigo+"' '%' limit 15";
						}else {
							scritp="SELECT evento.id_evento,perfil.usuario,tipo_perfil.nombre,evento.titulo,DATE_FORMAT(evento.fecha,'%d %b %Y'),DATE_FORMAT(evento.fecha,'%H:%i:%s'),enlacesistema.`url` \r\n" + 
									"FROM evento \r\n" + 
									"INNER JOIN perfil ON evento.id_prefil=perfil.id_prefil \r\n" + 
									"INNER JOIN tipo_perfil ON tipo_perfil.id_tipo_perfil=perfil.id_tipo_perfil \r\n" + 
									"LEFT JOIN enlace_evento ON evento.`id_evento`=enlace_evento.`id_evento` \r\n" + 
									"LEFT JOIN enlacesistema ON enlace_evento.`id_enlacesistema`=enlacesistema.`id_enlacesistema` \r\n" + 
									"WHERE evento.id_evento<"+actual+" and evento.titulo LIKE '"+codigo+"' '%' limit 15";
						}
						String cantidad = "7";
						String lugar = "Filtroeventototal";
						String valor=pross.Filtro2(scritp, cantidad, columna, lugar);
						PrintWriter out = response.getWriter();
						out.print(valor);
	    			
    			}else if(proceso.equals("Filtromisevento")){
						System.err.println("entro-----------------------------------");
						Procedimiento pross = new Procedimiento();
						String actual = String.valueOf(request.getParameter("ultimo"));
						String codigo = String.valueOf(request.getParameter("datos"));
						String id = String.valueOf(request.getParameter("id"));
						
						//Configuraci\F3n para la generar la paginaci\F3n
						String[] columna= {"codigo","titulo","fecha","hora","ubicacion","asistencia"}; 
						String scritp="";
						if(actual.equals("0")) {
							
						 scritp="SELECT  id_evento,titulo,DATE_FORMAT(fecha,'%Y-%m-%d') AS fecha,DATE_FORMAT(fecha,'%T') AS hora,"
						 		+ "ubicacion,cant_evento_asis(id_evento) "
						 		+ "FROM evento "
								+"WHERE estado='ACTIVO' AND  evento.id_evento>"+actual+" and   evento.id_prefil="+id+" and evento.titulo LIKE '%' '"+codigo+"' '%'  LIMIT 10 ";
						}else {
							
							 scritp="SELECT  id_evento,titulo,DATE_FORMAT(fecha,'%Y-%m-%d') AS fecha,DATE_FORMAT(fecha,'%T') AS hora,ubicacion,cant_evento_asis(id_evento)  FROM evento "
										+"WHERE  estado='ACTIVO'  AND  evento.id_evento<"+actual+" and  evento.id_prefil="+id+" and evento.titulo LIKE '%' '"+codigo+"' '%'  LIMIT 10 ";
						}
						String cantidad = "6";
						String lugar = "Filtromisevento";
						String valor=pross.Filtro2( scritp, cantidad,columna, lugar);
						PrintWriter out = response.getWriter();
						out.print(valor);
						System.err.println(valor);	
		    			
		    			
		    		}
				    else if(proceso.equals("Filtroeventoasistencia")){
						System.err.println("entro-----------------------------------");
						Procedimiento pross = new Procedimiento();
						String actual = String.valueOf(request.getParameter("ultimo"));
						String codigo = String.valueOf(request.getParameter("datos"));
						String id = String.valueOf(request.getParameter("id"));
						
						//Configuraci\F3n para la generar la paginaci\F3n
						String[] columna= {"codigo","titulo","fecha","hora","ubicacion","asistencia","codigo_asistencia"}; 
						String scritp="";
						if(actual.equals("0")) {
							
						 scritp="SELECT  `evento`.id_evento,`evento`.titulo,DATE_FORMAT(`evento`.fecha,'%Y-%m-%d') AS fecha,DATE_FORMAT(`evento`.fecha,'%T') AS hora,`evento`.ubicacion,cant_evento_asis(`evento`.id_evento) \r\n" + 
						 		", asistencia_evento.id_asistencia_evento FROM evento INNER JOIN `asistencia_evento` ON `asistencia_evento`.`id_evento`=`evento`.`id_evento` \r\n" + 
						 		"WHERE  `evento`.estado='ACTIVO' AND `asistencia_evento`.`id_prefil`="+id+"  ORDER BY evento.fecha DESC LIMIT 10 ";
						}else {
							
							 scritp="SELECT  `evento`.id_evento,`evento`.titulo,DATE_FORMAT(`evento`.fecha,'%Y-%m-%d') AS fecha,DATE_FORMAT(`evento`.fecha,'%T') AS hora,`evento`.ubicacion,cant_evento_asis(`evento`.id_evento) \r\n" + 
								 		" , asistencia_evento.id_asistencia_evento FROM evento INNER JOIN `asistencia_evento` ON `asistencia_evento`.`id_evento`=`evento`.`id_evento` \r\n" + 
								 		"WHERE  `evento`.estado='ACTIVO' AND `asistencia_evento`.`id_prefil`="+id+"  ORDER BY evento.fecha DESC LIMIT 10 ";
						}
						String cantidad = "7";
						String lugar = "Filtroeventoasistencia";
						String valor=pross.Filtro2( scritp, cantidad,columna, lugar);
						PrintWriter out = response.getWriter();
						out.print(valor);
						System.err.println(valor);	
		    			
		    			
		    		}
				    else if(proceso.equals("bajaasistenciaevento")){
		    			String codigo = String.valueOf(request.getParameter("codigo"));
		    			Procedimiento pross = new Procedimiento();	
		    			pross.procedimientoDatos("CALL `abmasistenciaevento`('B','"+Integer.parseInt(codigo)+"', 0, 0)","Borrar asistenciaevento");
		    		
		    		}
				    else if(proceso.equals("altacomentarioevento")){
	        			String idperfil = String.valueOf(request.getParameter("idperfil"));
	        			String id_evento = String.valueOf(request.getParameter("codigo"));
	        			String texto = String.valueOf(request.getParameter("texto"));
	        			System.out.println("idperfil "+idperfil+"id_evento"+id_evento+"texto"+texto);
	        			Procedimiento pross = new Procedimiento();
	        			pross.procedimientoDatos("CALL abmComentarioevento('A',0,'"+idperfil+"','"+id_evento+"',NOW(),'"+texto+"','ACTIVO')", "altacomentarioevento");
	      
		    		}
		    		else if(proceso.equals("Asistenciaevento")){
	        			String idperfil = String.valueOf(request.getParameter("id_perfil"));
	        			String id_evento = String.valueOf(request.getParameter("id_evento"));
	        			System.out.println("idperfil "+idperfil+"id_evento"+id_evento);
	        			Procedimiento pross = new Procedimiento();
	        			pross.procedimientoDatos("CALL abmAsistenciaevento('A',0,'"+idperfil+"','"+id_evento+"')", "Asistenciaevento");
	      
		    		}
					else if(proceso.equals("Filtroevento")){
						Procedimiento pross = new Procedimiento();
						String posiciones = String.valueOf(request.getParameter("posiciones"));
						String total_reg = String.valueOf(request.getParameter("total_reg"));
						String actual = String.valueOf(request.getParameter("actual"));
						String turno = String.valueOf(request.getParameter("turno"));
						String codigo = String.valueOf(request.getParameter("datos"));
						String id = String.valueOf(request.getParameter("id_perfil"));
				
						//Configuraci�n para la generar la paginaci�n
					System.err.println(codigo+"codigo- id "+id);
						String[] columna= {"codigo","titulo","ubicacion","fecha","hora","enlace"}; 
						String scritp="SELECT evento.id_evento,evento.titulo,evento.ubicacion,DATE_FORMAT(evento.fecha,'%d %b %Y'),DATE_FORMAT(evento.fecha,'%H:%i:%s'),enlacesistema.`url`\r\n" + 
								"FROM evento\r\n" + 
								"INNER JOIN perfil ON evento.id_prefil=perfil.id_prefil  \r\n" + 
								"INNER JOIN tipo_perfil ON tipo_perfil.id_tipo_perfil=perfil.id_tipo_perfil \r\n" + 
								"LEFT JOIN enlace_evento ON evento.`id_evento`=enlace_evento.`id_evento`\r\n" + 
								"LEFT JOIN enlacesistema ON enlace_evento.`id_enlacesistema`=enlacesistema.`id_enlacesistema` WHERE perfil.id_prefil ='"+id+"' AND evento.titulo LIKE '"+codigo+"' '%' ";
						String cantidad = "6";
						String lugar = "Filtroevento";
						String valor=pross.FiltroCeo(posiciones, total_reg, actual, turno, scritp, cantidad,columna, lugar);
						PrintWriter out = response.getWriter();
						out.print(valor);
						System.out.println(valor);
				
					
    			
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    			}else if(proceso.equals("cerrar")){
				/*	System.out.println("esta adentro de controlador cerrar");
					HttpSession session = request.getSession( true );
					response.setContentType("text/html");
					response.setHeader("Cache-Control", "no-cache");
					response.setHeader("Cache-Control", "no-store");
					response.setDateHeader("Expires", 0);
					response.setHeader("Pragma", "no-cache");
					request.getSession().removeAttribute("login");
					request.getSession().removeAttribute("enlace");
					session.invalidate();	
					PrintWriter out = response.getWriter();
					out.print("index"); */
    				//HttpSession session = request.getSession( true );
    				//String url = String.valueOf(request.getAttribute("javax.servlet.forward.request_uri"));
    		//		String url = String.valueOf(session.getAttribute("url"));
        	//		System.out.println("direccion url--"+url);
        	//		int c=0;
        	//		for (int i = 0; i < url.length(); i++) {
    		//			if(String.valueOf(url.charAt(i)).equals("/")){
    		//				c++;
    		//			}
    		//		}
        	//		String link="/rade/index";
        	//		for (int i = 2; i < c; i++) {
        				//link=link.concat("../");
    		//		}
        			
        	/*		HttpSession session = request.getSession( true ); 
					response.setContentType("text/html");
					response.setHeader("Cache-Control", "no-cache");
					response.setHeader("Cache-Control", "no-store");
					response.setDateHeader("Expires", 0);
					response.setHeader("Pragma", "no-cache");
					request.getSession().removeAttribute("login");
					request.getSession().removeAttribute("enlace");
					session.invalidate();
					cerrarSession(request, response); */
    				cerrarSession(request, response);
        			//abrirSession(request, response);
        			PrintWriter out = response.getWriter();
        	//		System.out.println("url formateado--"+"no"+link+"index");
    		//		out.print(link);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    			}else if(proceso.equals("FiltroSolicitud")){

					Procedimiento pross = new Procedimiento();
					String posiciones = String.valueOf(request.getParameter("posiciones"));
					String total_reg = String.valueOf(request.getParameter("total_reg"));
					String actual = String.valueOf(request.getParameter("actual"));
					String turno = String.valueOf(request.getParameter("turno"));
					String codigo = String.valueOf(request.getParameter("datos"));
					String id = String.valueOf(request.getParameter("id"));
					//Configuraci�n para la generar la paginaci�n
					String[] columna= {"codigo","carrera","nombre","apellido","correo"}; // ,"telefono","email","pagina","estado" 
					String Script = "SELECT  id_registro,carrera,nombre,apellido,correo FROM filtro_solicitud "
							+ " WHERE `estado`='PENDIENTE' AND  `institucion`="+Integer.parseInt(id)+" and `carrera`  LIKE '"+codigo+"' '%' ORDER BY `carrera`"; // ,telefono,email,pagina,estado
					String cantidad = "5";
					String lugar = "FiltroSolicitud";
					String valor=pross.FiltroCeo(posiciones, total_reg, actual, turno, Script, cantidad,columna, lugar);
					PrintWriter out = response.getWriter();
					out.print(valor);
				
				} else if(proceso.equals("modificarSolicitud")){
					String id=String.valueOf(request.getParameter("id_registro"));
					String estado=String.valueOf(request.getParameter("estado"));
					Procedimiento pross=new Procedimiento();
					
					String enlaceDinamico="";
					try {
						enlaceDinamico=pross.AccesoAleatorio();
						System.out.println("entro accesoaleatorio");
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} finally {
						// TODO: handle finally clause
						System.out.println("entro finally id-"+id+" estado--"+estado+" enlace--"+enlaceDinamico);
						pross.procedimientoDatos("CALL modificar_estado_registro('"+id+"','"+estado+"','"+enlaceDinamico+"')", "modificar_estado_registro");
						System.out.println("entro arraylist");
						ArrayList<ArrayList<String>> datos = pross.FiltroGeneralString("SELECT UPPER(CONCAT(registro.nombre,', ',registro.apellido)) AS nombre,registro.correo,institucion.nombre FROM registro INNER JOIN universidad_carrera AS a ON a.`id_universidad_carrera`=registro.`id_universidad_carrera`  INNER JOIN institucion ON institucion.`id_institucion`=a.`id_institucion` WHERE registro.id_registro='"+id+"' LIMIT 1", "3", "modificarSolicitud");
						try {
							System.out.println("entro sendmail -- "+datos+" enlace-- "+enlaceDinamico);
							SendingEmail(datos, enlaceDinamico);
						} catch (javax.mail.MessagingException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} 
					}
				}
				////////////////////-------FACUNDO----------------////////////////////////////////
				else if(proceso.equals("misarchivos")){
					String ver = String.valueOf(request.getParameter("ver"));
					HttpSession session = request.getSession( true );
    				String viendo = "" ;

					if(ver.equals("curriculum")){
						viendo = "curriculum";
					}else if(ver.equals("memo")){
						viendo = "memo";
					}else if(ver.equals("carta")){
						viendo = "carta";
					}
					session.setAttribute("misarchivosviendo",viendo);
					PrintWriter out = response.getWriter();
					out.println("/rade/archivos"); 
		
				}else if(proceso.equals("ingresocurri")){
					Procedimiento pross = new Procedimiento();
					String id = String.valueOf(request.getParameter("id"));
					String dato="";
					String enlace="";
					ArrayList<ArrayList<String>> valor=pross.FiltroGeneralString("SELECT `id_enlacesistema`, `url` FROM `enlacesistema` WHERE url='/rade/archivos/curriculum1'", "2", "INGRESO");
					for (int i = 0; i < valor.size(); i++) {
					
							dato="si";
							dato=dato.concat(enlace.concat(String.valueOf(valor.get(i).get(1))));
							//////////
							HttpSession session = request.getSession( true );
		    				
		    				session.setAttribute("id",id);
		    				
					}
					
					PrintWriter out = response.getWriter();
					out.print(dato);
	
				} else if(proceso.equals("altacurri")){
						System.err.println("ingreso alta curriculum");
						String id_tipo = String.valueOf(request.getParameter("id"));
						String nombre = String.valueOf(request.getParameter("nombre"));
						String apellido = String.valueOf(request.getParameter("apellido"));
						String direccion = String.valueOf(request.getParameter("direccion"));
						String telefono = String.valueOf(request.getParameter("tel"));
						String fecha=String.valueOf(request.getParameter("fecha"));
						String id_perfil=String.valueOf(request.getParameter("id_perfil"));
						String academico = String.valueOf(request.getParameter("texto"));
						String laboral = String.valueOf(request.getParameter("texto"));
						String idioma  = String.valueOf(request.getParameter("texto3"));
						String r_laboral = String.valueOf(request.getParameter("texto2"));
						String r_personal = String.valueOf(request.getParameter("ref_personal"));
						String conocimiento = String.valueOf(request.getParameter("conocimiento"));
						String ci  = String.valueOf(request.getParameter("cedula"));
						String foto=" ";
						
						
						
						Procedimiento pross = new Procedimiento();
						pross.procedimientoDatos("CALL `abmArchivo`("+0+", '"+nombre+"', '"+academico+"', '"+laboral+"', '"+idioma+"', '"+r_laboral+"', '"+r_personal+"', '"+conocimiento+"', '"+foto+"', '"+id_perfil+"', '"+id_tipo+"', '"+apellido+"', '"+direccion+"', '"+telefono+"', '"+ci+"', '"+fecha+"', '"+"ACTIVO"+"','"+"A"+"')", "altaCurrilum");			
				
				}else if(proceso.equals("Mcurri")){
						System.err.println("ingreso alta curriculum");
						String id_curriculum = String.valueOf(request.getParameter("id_curriculum"));
						String id_tipo = String.valueOf(request.getParameter("id"));
						String nombre = String.valueOf(request.getParameter("nombre"));
						String apellido = String.valueOf(request.getParameter("apellido"));
						String direccion = String.valueOf(request.getParameter("direccion"));
						String telefono = String.valueOf(request.getParameter("tel"));
						String fecha=String.valueOf(request.getParameter("fecha"));
						String id_perfil=String.valueOf(request.getParameter("id_perfil"));
						String academico = String.valueOf(request.getParameter("texto"));
						String laboral = String.valueOf(request.getParameter("texto"));
						String idioma  = String.valueOf(request.getParameter("texto3"));
						String r_laboral = String.valueOf(request.getParameter("texto2"));
						String r_personal = String.valueOf(request.getParameter("ref_personal"));
						String conocimiento = String.valueOf(request.getParameter("conocimiento"));
						String ci  = String.valueOf(request.getParameter("cedula"));
						String foto=" ";
						
						
						
						Procedimiento pross = new Procedimiento();
						pross.procedimientoDatos("CALL `abmArchivo`("+id_curriculum+", '"+nombre+"', '"+academico+"', '"+laboral+"', '"+idioma+"', '"+r_laboral+"', '"+r_personal+"', '"+conocimiento+"', '"+foto+"', '"+id_perfil+"', '"+id_tipo+"', '"+apellido+"', '"+direccion+"', '"+telefono+"', '"+ci+"', '"+fecha+"', '"+"ACTIVO"+"','"+"M"+"')", "Modificacion del Curriculum");			
				
				}else if(proceso.equals("bajacurri")){
						System.err.println("ingreso baja curriculum");
						String id_curriculum = String.valueOf(request.getParameter("id_curriculum"));
						Procedimiento pross = new Procedimiento();
						pross.procedimientoDatos("CALL `abmArchivo`("+id_curriculum+", '', '', '', '', '', '', '', '', '0', '0', '', '', '', '', '1997/10/15', 'INACTIVO','B')", "bajaCurrilum");			
				
				}else if(proceso.equals("mandaCurri")){
						Procedimiento pross = new Procedimiento();
						HttpSession session = request.getSession( true );
						String id_curri=String.valueOf(request.getParameter("id_curriculum"));
						ArrayList<ArrayList<String>> datos = pross.FiltroGeneralString("SELECT `nombre`,`apellido`,`info_academica`,`info_experiencia`,"
								+ "`info_idioma`,`refe_laboral`,`refe_personal`,`conocimientos`,`id_tipo_diseno_curri`,`direccion`,`telefono`,"
								+ "`cedula`,`fecha_nac` FROM Filtro_curri WHERE `estado`='ACTIVO' AND `id_curriculum`="+id_curri, "13", "Informe impresion curriculum");
						session.setAttribute("nombre_a", String.valueOf(datos.get(0).get(0)));
						session.setAttribute("apellido_a", String.valueOf(datos.get(0).get(1)));
						session.setAttribute("info_academica_a", String.valueOf(datos.get(0).get(2)));
						session.setAttribute("info_experiencia_a", String.valueOf(datos.get(0).get(3)));
						session.setAttribute("info_idioma_a", String.valueOf(datos.get(0).get(4)));
						session.setAttribute("refe_laboral_a", String.valueOf(datos.get(0).get(5)));
						session.setAttribute("refe_personal_a", String.valueOf(datos.get(0).get(6)));
						session.setAttribute("conocimientos_a", String.valueOf(datos.get(0).get(7)));
						session.setAttribute("id_tipo_diseno_a", String.valueOf(datos.get(0).get(8)));
						session.setAttribute("direccion_a", String.valueOf(datos.get(0).get(9)));
						session.setAttribute("telefono_a", String.valueOf(datos.get(0).get(10)));
						session.setAttribute("cedula_a", String.valueOf(datos.get(0).get(11)));
						session.setAttribute("fecha_nac_a", String.valueOf(datos.get(0).get(12)));
						session.setAttribute("id_curriculum",id_curri);
						session.setAttribute("modificar", "0");

						System.out.println("Manda curri manda Nombre "+String.valueOf(datos.get(0).get(0))+" apellido "+String.valueOf(datos.get(0).get(1)));
						System.err.println("Manda curri manda info"+String.valueOf(datos.get(0).get(2))+" info_experiencia "+String.valueOf(datos.get(0).get(3)));
						
				
				}else if(proceso.equals("FiltroCurriculum")){
							
							HttpSession session2 = request.getSession( true );
							String id=String.valueOf(session2.getAttribute("id"));
							Procedimiento pross = new Procedimiento();
							
							System.out.println("id perfil en controlador es -->"+id);
							
							String[] columna= {"id_curriculum", "nombre","apellido","fecha_nac","id_tipo_diseno_curri"}; 
						
							
							String scritp="SELECT id_curriculum, nombre,`apellido`,`fecha_nac`, id_tipo_diseno_curri "
								 		+ "FROM `Filtro_curri` WHERE estado='ACTIVO' AND id_prefil="+id;
							
							String cantidad = "5";
							String lugar = "Filtro mis Curriculums";
							String valor = "";
							valor=pross.Filtro2(scritp, cantidad,columna, lugar);
							System.out.println("valor -- "+valor);
							PrintWriter out = response.getWriter();
							out.print(valor);
				
				}else if(proceso.equals("altaMemo")){
					
					String para=String.valueOf(request.getParameter("para"));
					String de = String.valueOf(request.getParameter("de"));
					String fecha = String.valueOf(request.getParameter("fecha"));
					String asunto = String.valueOf(request.getParameter("asunto"));
					String cargo =  String.valueOf(request.getParameter("cargo"));
					String texto = String.valueOf(request.getParameter("texto"));
					String empresa = String.valueOf(request.getParameter("empresa"));
					String id_perfil = String.valueOf(request.getParameter("id_perfil"));
					
					System.out.println("esto recibe altaMemo---"+para+" "+de+" "+fecha+" "+asunto+" "+cargo+" "+texto+" "+empresa+" "+id_perfil);
					Procedimiento pross = new Procedimiento();
					pross.procedimientoDatos("CALL `abmMemo`("+0+", '"+id_perfil+"', '"+para+"', '"+de+"', '"+cargo+"', '"+fecha+"', '"+asunto+"', '"+empresa+"', '"+texto+"','ACTIVO','A')", "altaMemo");			
			
				}else if(proceso.equals("bajaMemo")){
					
					System.err.println("ingreso baja memo");
					String id_memo = String.valueOf(request.getParameter("id_memo"));
					Procedimiento pross = new Procedimiento();
					pross.procedimientoDatos("CALL `abmMemo`("+id_memo+", 0, '', '', '', '1997/10/15', '', '', '', 'INACTIVO','B')", "bajaMemo");			
			
				}else if(proceso.equals("FiltroMemo")){
							HttpSession session2 = request.getSession( true );
							String id=String.valueOf(session2.getAttribute("id"));
							Procedimiento pross = new Procedimiento();
							String[] columna= {"id_memo", "id_prefil","para","de","fecha",}; 
							String scritp="SELECT `id_memo`,`id_prefil`,`para`,`de`,`fecha`"
										+ "FROM `Filtro_memo` WHERE estado='ACTIVO' AND id_prefil="+id;
							String cantidad = "5";
							String lugar = "Filtro mis Memos";
							String valor = "";
							valor=pross.Filtro2(scritp, cantidad,columna, lugar);
							System.out.println("valor -- "+valor);
							PrintWriter out = response.getWriter();
							out.print(valor);
				}else if(proceso.equals("mandaMemo")){
					Procedimiento pross = new Procedimiento();
					HttpSession session = request.getSession( true );
					String id_memo=String.valueOf(request.getParameter("id_memo"));
					ArrayList<ArrayList<String>> datos = pross.FiltroGeneralString("SELECT `para`,`de`,`cargo`,`fecha`,`asunto`,`nombre_empresa`,`texto` "
							+ "FROM `Filtro_memo` WHERE `id_memo`="+id_memo, "7", "controlador mandaMemo memo");
					session.setAttribute("para_a", String.valueOf(datos.get(0).get(0)));
					session.setAttribute("de_a", String.valueOf(datos.get(0).get(1)));
					session.setAttribute("cargo_a", String.valueOf(datos.get(0).get(2)));
					session.setAttribute("fecha_a", String.valueOf(datos.get(0).get(3)));
					session.setAttribute("asunto_a", String.valueOf(datos.get(0).get(4)));
					session.setAttribute("nombre_empresa_a", String.valueOf(datos.get(0).get(5)));
					session.setAttribute("texto_a", String.valueOf(datos.get(0).get(6)));
					
					session.setAttribute("id_memo",id_memo);
					session.setAttribute("modificarMemo", "0");
				
				}else if(proceso.equals("ModificaMemo")){
					
					String para=String.valueOf(request.getParameter("para"));
					String de = String.valueOf(request.getParameter("de"));
					String fecha = String.valueOf(request.getParameter("fecha"));
					String asunto = String.valueOf(request.getParameter("asunto"));
					String cargo =  String.valueOf(request.getParameter("cargo"));
					String texto = String.valueOf(request.getParameter("texto"));
					String empresa = String.valueOf(request.getParameter("empresa"));
					String id_perfil = String.valueOf(request.getParameter("id_perfil"));
					String id_memo = String.valueOf(request.getParameter("id_memo"));
					
					System.out.println("esto recibe altaMemo---"+para+" "+de+" "+fecha+" "+asunto+" "+cargo+" "+texto+" "+empresa+" "+id_perfil);
					Procedimiento pross = new Procedimiento();
					pross.procedimientoDatos("CALL `abmMemo`("+id_memo+", '"+id_perfil+"', '"+para+"', '"+de+"', '"+cargo+"', '"+fecha+"', '"+asunto+"', '"+empresa+"', '"+texto+"','ACTIVO','M')", "ModificaMemo");			
			
			}
				
			}

		} catch (Exception e) {
			System.out.println("ERROR EN CONTROLADOR -- "+e);
		}
	}
	
	
	/////////////////GENERACION DE EMAIL PARA CREAR USUARIO//////////////////////////////
	public void SendingEmail(ArrayList<ArrayList<String>> datos,String enlaceDinamico) throws javax.mail.MessagingException
    {		String CorreoNombre = "";
			String Email = "";
			String universidad = "";
			for (int i = 0; i < datos.size(); i++) {
				CorreoNombre = datos.get(i).get(0);
				Email = datos.get(i).get(1);
				universidad = datos.get(i).get(2);
			}
			String Body =  contenido(CorreoNombre, universidad, enlaceDinamico);
             String host ="smtp.gmail.com";
             String from ="rade.encarnacion@gmail.com"; //Your mail id	-- rade.encarnacion@gmail.com
             String pass ="rade12345";   				// Your Password	--	rade12345
             Properties props = System.getProperties();
             props.put("mail.smtp.starttls.enable", "true"); // added this line
             props.put("mail.smtp.host", host);
             props.put("mail.smtp.user", from);
             props.put("mail.smtp.password", pass);
             props.put("mail.smtp.port", "587");
             props.put("mail.smtp.auth", "true");
             String[] to = {Email}; // To Email address
             Session session = Session.getDefaultInstance(props, null);
             MimeMessage message = new MimeMessage(session);
             message.setFrom(new InternetAddress(from));
             InternetAddress[] toAddress = new InternetAddress[to.length];        
             // To get the array of addresses
              for( int i=0; i < to.length; i++ )
              { // changed from a while loop
                  toAddress[i] = new InternetAddress(to[i]);
              }
             System.out.println(Message.RecipientType.TO);
             for( int j=0; j < toAddress.length; j++)
             { // changed from a while loop
             message.addRecipient(Message.RecipientType.TO, toAddress[j]);
             }
             message.setSubject("Registro RADE");

             message.setContent(Body,"text/html");
             Transport transport = session.getTransport("smtp");
             transport.connect(host, from, pass);
             transport.sendMessage(message, message.getAllRecipients());
                 transport.close();
        }
		private String contenido(String CorreoNombre,String universidad,String enlaceDinamico){ //se crea el mensaje y se envia en el body
			String contenido="<div style=\"margin:0;padding:0\">"
		    		+"<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding:0;margin:0\">"
		    		+"  <tbody><tr>"
		    		+"    <td style=\"font-size:0\"><span></span></td>"
		    		+"    <td valign=\"top\" align=\"left\" style=\"width:640px;max-width:640px\">"
		    		+"        <table width=\"100%\" bgcolor=\"#FFFFFF\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding:0;margin:0;border:0\">"
		    		+"            <tbody><tr>"
		    		+"              <td align=\"left\" style=\"padding:32px 63px 0 63px\" id=\"m_-2777389246196442201main-pad\">"
		    		+"                   <img alt=\"\" src=\"https://avatars3.githubusercontent.com/u/43255178?s=400&u=70439acd8896b8a1f5a707ae5638e3ee2d8eebd5&v=4\" width=\"136\" data-image-whitelisted=\"\" class=\"CToWUd\">"
		    		+"                  <h1 style=\"font-family:Helvetica,Arial,sans-serif;font-size:24px;line-height:31px;color:#777777;padding:0;margin:28px 0 32px 0;font-weight:400;text-align:left;text-decoration:none\"><span style=\"display:block\"> Hola, "+CorreoNombre+": </span></h1>"
		    		+"                  <p style=\"font-size:16px;line-height:20px;color:#333333;padding:0;margin:0 0 11px 0;text-align:left;font-family:Helvetica,Arial,sans-serif\">"
		    		+"                    Tenemos el agrado de informarle que recibimos la aprobacion a su solicitud a una cuenta en RADE, por parte de "+universidad+". Te damos la bienvenida en RADE, y esperamos que puedas aprovechar al m�ximo esta plataforma, que fue creado con el objetivo de compartir conocimientos con otras personas."
		    		+"                  </p>"
		    		+"                  <p style=\"font-size:16px;line-height:20px;color:#333333;padding:0;margin:24px 0 32px 0;text-align:left;font-family:Helvetica,Arial,sans-serif\">"
		    		+"                     Presione en el Boton <span style=\"color:#28a745\">Activar Cuenta</span> para culminar el proceso de registro <span style=\"color:#d90007\"></span>."
		    		+"                  </p>"
		    		+"                  <table cellpadding=\"0\" cellspacing=\"0\" style=\"padding:0;margin:0 0 20px 0;border:0;width:213px\">"
		    		+"                      <tbody><tr>"
		    		+"                        <td id=\"m_-2777389246196442201bottom-button-bg\" valign=\"top\" align=\"center\" style=\"border-radius:3px;padding:12px 20px 16px 20px;background-color:#28a745\">"
		    		+"                            <a id=\"m_-2777389246196442201bottom-button\" href=\"http://localhost:8080"+enlaceDinamico+"\" style=\"font-family:Helvetica,Arial,sans-serif;font-size:16px;color:#ffffff;background-color:#28a745;border-radius:3px;text-align:center;text-decoration:none;display:block;margin:0\" target=\"_blank\">"
		    		+"                              Activar Cuenta"
		    		+"                            </a>"
		    		+"                        </td>"
		    		+"                      </tr>"
		    		+"                  </tbody></table>"
		    		+"                  <p style=\"font-family:Helvetica,Arial,sans-serif;font-size:16px;line-height:20px;color:#333333;padding:0;margin:0 0 20px 0;text-align:left\"><a href=\"#\" style=\"font-size:16px;line-height:20px;color:#d90007;text-decoration:none;overflow:hidden;text-overflow:ellipsis;word-wrap:break-word;word-break:break-all\" lang=\"en\"  >Si el correo le ha llegado por error le pedimos que lo ignore y lo elimine.</a></p>"
		    		+"                  <p style=\"font-family:Helvetica,Arial,sans-serif;font-size:16px;line-height:20px;color:#333333;padding:0;margin:33px 0 0 0;text-align:left\">"
		    		+"                    Saludos cordiales,<br>El Equipo RADE"
		    		+"                  </p>"
		    		+"              </td>"
		    		+"            </tr>"
		    		+"        </tbody></table>"
		    		+"    </td>"
		    		+"    <td style=\"font-size:0\"><span></span></td>"
		    		+"  </tr>"
		    		+"  <tr>"
		    		+"    <td style=\"font-size:0\"><span></span></td>"
		    		+"    <td valign=\"middle\" align=\"center\" style=\"width:640px;max-width:640px;padding:25px 0 28px 0\" id=\"m_-2777389246196442201copyrights-block\">"
		    		+"        <p style=\"font-family:Helvetica,Arial,sans-serif;font-size:14px;line-height:20px;color:#999999;padding:0;margin:4px 0 22px 0\">RADE 2018 </p>"
		    		+"    </td>"
		    		+"    <td style=\"font-size:0\"><span></span></td>"
		    		+"  </tr>"
		    		+"</tbody></table>"
		    		+"</div>";
			return contenido;
		}
		/////////////////FIN EMAIL PARA CREAR USUARIO//////////////////////////////		
		///////////////////EMAIL PARA RECUPERAR CONTRASEÑA//////////////////////////////////////
		public void RecuperarPass(String Email,String enlaceDinamico) throws javax.mail.MessagingException
		{		//ArrayList<ArrayList<String>> CorreoNombre= null;
				String CorreoNombre = "";
				String Body =  contenidoCorreo(CorreoNombre, enlaceDinamico);
	             String host ="smtp.gmail.com";
	             String from ="rade.encarnacion@gmail.com"; //Your mail id	-- rade.encarnacion@gmail.com
	             String pass ="rade12345";   				// Your Password	--	rade12345
	             Properties props = System.getProperties();
	             props.put("mail.smtp.starttls.enable", "true"); // added this line
	             props.put("mail.smtp.host", host);
	             props.put("mail.smtp.user", from);
	             props.put("mail.smtp.password", pass);
	             props.put("mail.smtp.port", "25");
	             props.put("mail.smtp.auth", "true");
	             String[] to = {Email}; // To Email address
	             Session session = Session.getDefaultInstance(props, null);
	             MimeMessage message = new MimeMessage(session);
	             message.setFrom(new InternetAddress(from));
	             InternetAddress[] toAddress = new InternetAddress[to.length];        
	             // To get the array of addresses
	              for( int i=0; i < to.length; i++ )
	              { // changed from a while loop
	                  toAddress[i] = new InternetAddress(to[i]);
	              }
	             System.out.println(Message.RecipientType.TO);
	             for( int j=0; j < toAddress.length; j++)
	             { // changed from a while loop
	             message.addRecipient(Message.RecipientType.TO, toAddress[j]);
	             }
	             message.setSubject("Restablecer Contrase�a - RADE");

	             message.setContent(Body,"text/html");
	             Transport transport = session.getTransport("smtp");
	             transport.connect(host, from, pass);
	             transport.sendMessage(message, message.getAllRecipients());
	                 transport.close();
	        }
		
		private String contenidoCorreo(String CorreoNombre, String enlaceDinamico){
			String contenidoCorreo="<div style=\"margin:0;padding:0\">"
		    		+"<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding:0;margin:0\">"
		    		+"  <tbody><tr>"
		    		+"    <td style=\"font-size:0\"><span></span></td>"
		    		+"    <td valign=\"top\" align=\"left\" style=\"width:640px;max-width:640px\">"
		    		+"        <table width=\"100%\" bgcolor=\"#FFFFFF\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding:0;margin:0;border:0\">"
		    		+"            <tbody><tr>"
		    		+"              <td align=\"left\" style=\"padding:32px 63px 0 63px\" id=\"m_-2777389246196442201main-pad\">"
		    		+"                   <img alt=\"\" src=\"https://avatars3.githubusercontent.com/u/43255178?s=400&u=70439acd8896b8a1f5a707ae5638e3ee2d8eebd5&v=4\" width=\"136\" data-image-whitelisted=\"\" class=\"CToWUd\">"
	
		    		+"                  <p style=\"font-size:16px;line-height:20px;color:#333333;padding:0;margin:0 0 11px 0;text-align:left;font-family:Helvetica,Arial,sans-serif\">"
		    		+"                    Recibimos su solicitud de cambio de contrase�a a la plataforma "
		    		+"                  </p>"
		    		+"                  <p style=\"font-size:16px;line-height:20px;color:#333333;padding:0;margin:24px 0 32px 0;text-align:left;font-family:Helvetica,Arial,sans-serif\">"
		    		+"                     Presione en el Bot�n <span style=\"color:#f70707\">Cambiar contrase�a</span> para continuar. <span style=\"color:#f70707\"></span>"
		    		+"                  </p>"
		    		+"                  <table cellpadding=\"0\" cellspacing=\"0\" style=\"padding:0;margin:0 0 20px 0;border:0;width:213px\">"
		    		+"                      <tbody><tr>"
		    		+"                        <td id=\"m_-2777389246196442201bottom-button-bg\" valign=\"top\" align=\"center\" style=\"border-radius:3px;padding:12px 20px 16px 20px;background-color:#f70707\">"
		    		+"                            <a id=\"m_-2777389246196442201bottom-button\" href=\"http://localhost:8080"+enlaceDinamico+"\" style=\"font-family:Helvetica,Arial,sans-serif;font-size:16px;color:#ffffff;background-color:#f70707;border-radius:3px;text-align:center;text-decoration:none;display:block;margin:0\" target=\"_blank\">"
		    		+"                              Cambiar Contrase�a"
		    		+"                            </a>"
		    		+"                        </td>"
		    		+"                      </tr>"
		    		+"                  </tbody></table>"
		    		
		    		+"                  <p style=\"font-family:Helvetica,Arial,sans-serif;font-size:16px;line-height:20px;color:#333333;padding:0;margin:33px 0 0 0;text-align:left\">"
		    		+"                    Saludos cordiales,<br>El Equipo RADE"
		    		+"                  </p>"
		    		+"              </td>"
		    		+"            </tr>"
		    		+"        </tbody></table>"
		    		+"    </td>"
		    		+"    <td style=\"font-size:0\"><span></span></td>"
		    		+"  </tr>"
		    		+"  <tr>"
		    		+"    <td style=\"font-size:0\"><span></span></td>"
		    		+"    <td valign=\"middle\" align=\"center\" style=\"width:640px;max-width:640px;padding:25px 0 28px 0\" id=\"m_-2777389246196442201copyrights-block\">"
		    		+"        <p style=\"font-family:Helvetica,Arial,sans-serif;font-size:14px;line-height:20px;color:#999999;padding:0;margin:4px 0 22px 0\">RADE 2018 </p>"
		    		+"    </td>"
		    		+"    <td style=\"font-size:0\"><span></span></td>"
		    		+"  </tr>"
		    		+"</tbody></table>"
		    		+"</div>";
			return contenidoCorreo;
		}		
		//////////////////FIN EMAIL RECUPERAR CONTRASEÑA///////////////////////////////////////
		protected void cerrarSession(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	HttpSession session = request.getSession( true );
	    	session.setAttribute("login", "no");
	    	session.setAttribute("enlace", "");
	    	
	    	response.setContentType("text/html");
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Cache-Control", "no-store");
			response.setDateHeader("Expires", 0);
			response.setHeader("Pragma", "no-cache");
			request.getSession().removeAttribute("login");
			request.getSession().removeAttribute("enlace");
			session.invalidate();
		//	response.setContentType("text/html");
		//	response.setHeader("Cache-Control", "no-cache");
		//	response.setHeader("Cache-Control", "no-store");
		//	response.setDateHeader("Expires", 0);
		//	response.setHeader("Pragma", "no-cache");
		//	request.getSession().removeAttribute("login");
		//	request.getSession().removeAttribute("enlace");
		//	session.invalidate();
		}
}

////////////////parte de hugo/////////////////////////////////////////////////////



