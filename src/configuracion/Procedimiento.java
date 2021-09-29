package configuracion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.CallableStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.IOUtils;
import configuracion.Conexion;


public class Procedimiento {
	public String FormatearFecha(String valor){
		int cal= valor.length();
		String resul="";
		for (int i = 0; i < cal; i++) {
			resul=valor.replace("/", "-");
		}
		return resul;
	}
	public String FechaYMD(String dia){
		String fechas = FormatearFecha(dia);
        String validar=fechas;
        String fecha_desen="";
        if(validar.equals("")){
            fecha_desen="0000-00-00";
        }else{
            SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd-MM-yyyy");
            String strFecha = fechas;
            String fechs = null;
            Date fecha = null;
            try {
            fecha = formatoDelTexto.parse(strFecha);
            SimpleDateFormat formateadore = new SimpleDateFormat("yyyy-MM-dd");
            fechs=formateadore.format(fecha);
            } catch (ParseException exception) {
            exception.printStackTrace();
            }
            fecha_desen=fechs.toString();
            System.out.println(fechs.toString());   
        }
        return fecha_desen;
    }
	public boolean ValidarURL(String url){
		boolean valor=false;
		String[] letra = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","ñ","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","Ñ","O","P","Q","R","S","T","U","V","W","X","Y","Z","/","@","-","1","2","3","4","5","6","7","8","9","0","="};
		
		for (int i = 0; i < url.length(); i++) {
			if(valor==false){
				int c=0;
				for (int j = 0; j < letra.length; j++) {
					if(String.valueOf(url.charAt(i)).equals(letra[j])){
						c++;
					}
					if(j==(letra.length-1)){
						if(c==0){
							valor=true;
							i=url.length();
						}
					}
				}
				
			}

			
		}
		return valor;
	}
	public ArrayList<ArrayList<String>> FiltroGeneralString(String valor,String cantidad,String lugar){
		ArrayList<ArrayList<String>> dato=new ArrayList<ArrayList<String>>();
		Conexion llamars=null;
		Connection cons=null;
		 PreparedStatement pstm=null;
		 ResultSet res =null;
		int c=0;
		try{ 
			llamars= new Conexion();
			cons = llamars.getDataSource().getConnection();
			pstm= cons.prepareStatement(valor);
			res= pstm.executeQuery();
	         while(res.next())
	         {
	        	dato.add(new ArrayList<String>());
	    		for (int i = 1; i <= Integer.parseInt(cantidad); i++) {
					dato.get(c).add(res.getString(i));
				}
	    		c++;
	         }
	        
      }catch(SQLException e){
         System.out.println("Error FiltroGeneralString: "+e+" lugar: "+lugar);
         
      }finally{
    	  try {
    		  if(res!=null){	res.close();  
    		  }
    		 
    		  if(pstm!=null){pstm.close(); }
 	         
			if(cons!=null){ cons.close();
			
			}
		} catch (Exception e2) {
			// TODO: handle exception
			System.out.println("Error Final: "+e2+" - LUGAR -> "+lugar);
		}
    	 // llamars.desconectar();
      }
	 return dato;
	}
	public void procedimientoDatos(String Script,String lugar){
		Conexion llamars=null;
		Connection cons=null;
		 PreparedStatement pstm=null;
		
		try {
			llamars= new Conexion();
			cons = llamars.getDataSource().getConnection();
			pstm= cons.prepareStatement(Script);
			pstm.executeQuery();
		} catch (SQLException e) {
			System.err.println("Error en "+lugar+" - "+e.getMessage());
		}finally{
			try {
	    		  if(pstm!=null){pstm.close(); }
	 	         
				if(cons!=null){ cons.close(); 
				
				}
			} catch (Exception e2) {
				// TODO: handle exception
				System.out.println("Error Final: "+e2+" - LUGAR -> "+lugar);
			}
		}
	}
	
	public String FiltroCeo(String posiciones,String total_reg, String actual,String turno,String Script, String cantidad,String[] columna, String lugar){
		 int desde=0;	
		 int hasta=0;
		 int u=0;
		 int ir=Integer.parseInt(actual);
		 int x=0;
		 int c=0;
		 int z=0;
		 int verif=0;
		 int va=0;
		 int posicion=Integer.parseInt(posiciones);
		 int pos_env=1;
		 posicion=posicion-1;
		 x=0;
		 va=1;
		for (int i = 1; i < Integer.parseInt(total_reg); i++) {
			x++;
			if(x==posicion+1){
				x=0;
				va++;
			}
		}
		if(turno.equals("primero")){
			c=0;
			verif=0;
		    z=1;
		    pos_env=1;
		 }else{
			 if(turno.equals("anterior")){
				 ir=Integer.parseInt(actual);
				 if(1<ir){
					ir--; 
				 }
				 verif=0;
				 z=1;
				 pos_env=ir;
			 }else{
				 if(turno.equals("siguiente")){
					 ir=Integer.parseInt(actual);
					 if(va>ir){
						ir++; 
					 }
					 verif=0;
					 z=1;
					 pos_env=ir;
				 }else{
					 if(turno.equals("ultimo")){
						verif=0;
					    z=1;
					    pos_env=va;
					 }
				 }
			 }
		 }
		String contenido="";
		String sql=Script;
		ArrayList<ArrayList<String>> arra1=FiltroGeneralString(sql, cantidad,lugar); 
		for (int i = 0; i < arra1.size(); i++) {			 
	       	 if(turno.equals("primero")){
	       		 if(c==0){
	       			desde=c+1;
	       			contenido=contenido.concat("{");
	           		 for (int j = 0; j < columna.length; j++) {
	           			contenido=contenido.concat("\""+columna[j]+"\": \""+arra1.get(i).get(j)+" \" ");
	           			if(j==columna.length-1){
	           				contenido=contenido.concat("}");
	           			}else{
	           				contenido=contenido.concat(",");
	           			}
					 }
	           		 hasta=c+1;
	       		 }else{
	       			 if(c<=posicion){
		       			contenido=contenido.concat(",{");
		           		 for (int j = 0; j < columna.length; j++) {
		           			contenido=contenido.concat("\""+columna[j]+"\": \""+arra1.get(i).get(j)+" \" ");
		           			if(j==columna.length-1){
		           				contenido=contenido.concat("}");
		           			}else{
		           				contenido=contenido.concat(",");
		           			}
						 }
		           		 hasta=c+1;
	       			 }
	       		}
	       	 }else{
	       		 if(turno.equals("ultimo")){
	       			 if(z==va){
			    			 if(u==0){
			    				desde=c+1;
			 	       			contenido=contenido.concat("{");
			 	           		 for (int j = 0; j < columna.length; j++) {
			 	           			contenido=contenido.concat("\""+columna[j]+"\": \""+arra1.get(i).get(j)+" \" ");
			 	           			if(j==columna.length-1){
			 	           				contenido=contenido.concat("}");
			 	           			}else{
			 	           				contenido=contenido.concat(",");
			 	           			}
			 					 }
			    				 hasta=c+1;
			    			 }else{
				    			 if(u<=posicion+1){
						       		contenido=contenido.concat(",{");
						           	for (int j = 0; j < columna.length; j++) {
						           		contenido=contenido.concat("\""+columna[j]+"\": \""+arra1.get(i).get(j)+" \" ");
						           		if(j==columna.length-1){
						           			contenido=contenido.concat("}");
						           		}else{
						           			contenido=contenido.concat(",");
						           		}
									}
				    				hasta=c+1;
				    			 }
				    		 }
				    		 u++; 
			    		 }		    		 
			    		 verif++;
			    		 if(verif==posicion+1){
			    			 verif=0;
			    			 z++;
			    		 }
	       		 }else{
	       			 if(turno.equals("siguiente")){
	       				 if(z==ir){
	   		    			 if(u==0){
	   		    				desde=c+1;
				 	       		contenido=contenido.concat("{");
				 	           	for (int j = 0; j < columna.length; j++) {
				 	           		contenido=contenido.concat("\""+columna[j]+"\": \""+arra1.get(i).get(j)+" \" ");
				 	           		if(j==columna.length-1){
				 	           			contenido=contenido.concat("}");
				 	           		}else{
				 	           			contenido=contenido.concat(",");
				 	           		}
				 				}
	   		    				hasta=c+1;
	   		    			 }else{
	   			    			 if(u<=posicion+1){
	   			    				hasta=c+1;
						       		contenido=contenido.concat(",{");
						           	for (int j = 0; j < columna.length; j++) {
						           		contenido=contenido.concat("\""+columna[j]+"\": \""+arra1.get(i).get(j)+" \" ");
						           		if(j==columna.length-1){
						           			contenido=contenido.concat("}");
						           		}else{
						           			contenido=contenido.concat(",");
						           		}
									}
	   			    			 }
	   			    		 }
	   			    		 u++; 
	   		    		 }		    		 
	   		    		 verif++;
	   		    		 if(verif==posicion+1){
	   		    			 verif=0;
	   		    			 z++;
	   		    		 }
	       			 }else{
	       				 if(turno.equals("anterior")){
	       					 if(z==ir){
	       						 if(u==0){
	       							desde=c+1;
					 	       		contenido=contenido.concat("{");
					 	           	for (int j = 0; j < columna.length; j++) {
					 	           		contenido=contenido.concat("\""+columna[j]+"\": \""+arra1.get(i).get(j)+" \" ");
					 	           		if(j==columna.length-1){
					 	           			contenido=contenido.concat("}");
					 	           		}else{
					 	           			contenido=contenido.concat(",");
					 	           		}
					 				}
	       						 }else{
	       			    			 if(u<=posicion+1){
	       			    				hasta=c+1;
							       		contenido=contenido.concat(",{");
							           	for (int j = 0; j < columna.length; j++) {
							           		contenido=contenido.concat("\""+columna[j]+"\": \""+arra1.get(i).get(j)+" \" ");
							           		if(j==columna.length-1){
							           			contenido=contenido.concat("}");
							           		}else{
							           			contenido=contenido.concat(",");
							           		}
										}
	       			    			 }
	       			    		 }
	       			    		 u++; 
	       		    		 }		    		 
	       		    		 verif++;
	       		    		 if(verif==posicion+1){
	       		    			 verif=0;
	       		    			 z++;
	       		    		 }
	       				 }
	       			 }
	       		 }
	       	 }
	   		 c++;
		}
		int des=desde;
		int has=hasta;
		String datos="{\"contenido\":["
            +"{\"total\":\""+c+"\","
            +"\"posicion\":\""+pos_env+"\","
            +"\"pos_total\":\""+va+"\","
            +"\"desde\":\""+des+"\","
            +"\"hasta\":\""+has+"\","
			 +"\"datos\": [";
		String registros=datos.concat(contenido.concat("]}]}"));
		return registros;
	}
	public String ContadorGeneralString(String valor){
		
		Conexion llamars=null;
		Connection cons=null;
		 PreparedStatement pstm=null;
		 ResultSet res=null;
		String registros="0";
		try{ 
				llamars= new Conexion();
	    		 cons = llamars.getDataSource().getConnection();
	 			 pstm = cons.prepareStatement(valor);
		    	 res = pstm.executeQuery();
		         if(res.next())
		         {	 
		         registros = res.getString(1);
		         }
	      }catch(SQLException e){
	         System.out.println(e);
	      }finally{
	    	  try {
	    		  if(res!=null){	res.close();  
	    		  }
	    		 
	    		  if(pstm!=null){pstm.close(); }
	 	         
				if(cons!=null){ cons.close();
				
				}
			} catch (Exception e2) {
				// TODO: handle exception
				System.out.println("Error Final: "+e2+" - LUGAR -> ContadorGeneralString");
			}
	      }
		return registros;
	}
	 public String ValorAleatorio(int longitud){
	    	//String[] alfa=new String[]{"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
	    	String[] alfa=new String[]{"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
	    	String[] num=new String[]{"0","1","2","3","4","5","6","7","8","9"};
	    	String[] sel=new String[]{"NUMERO","LETRA"};
	    	String resultado="";
	    	String res="";
	    	for (int i = 0; i < longitud; i++) {
	    		String sorteo=sel[(int)(Math.random()*2)];
	    		if(sorteo.equals("NUMERO")){
	    			res=num[(int)(Math.random()*10)];
	    			resultado=resultado.concat(res);
	    		}else{
	    			if(sorteo.equals("LETRA")){
	    				res=alfa[(int)(Math.random()*26)];
	        			resultado=resultado.concat(res);
	    			}
	    		}
			}
	    	return resultado;
	    }
	    public String AccesoAleatorio(){
	    	String prefijo="/rade/activacion=";
	    	String ValorAleatorio="";
//	    	String[] alfa=new String[]{"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
	    	String[] alfa=new String[]{"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
	    	//Conexion con=new Conexion();
	    	
	    	String terminar="NO";
	    	int x=0;
	    	int far = 0;
	    	x=0;
	    	do {
	    		if(terminar.equals("NO")){
	    			String valor=ContadorGeneralString("SELECT COUNT(1) FROM enlacesistema WHERE url LIKE Concat('/rade/','"+alfa[x]+"','%') ");
	    			far=Integer.parseInt(valor);
	    			if(far<=5000){
	    				ValorAleatorio=alfa[x].concat(ValorAleatorio(50));
	    				String Verifica=ContadorGeneralString("SELECT COUNT(1) FROM enlacesistema WHERE url =concat('/rade/','"+ValorAleatorio+"')");
	    				if(Integer.parseInt(Verifica)>0){
	    				}else{
	    					terminar="SI";
	    				}
	    			}else{
	    				x++;
	    			}
	    		}else{
	    			terminar="SI";
	    		}
			} while (terminar.equals("NO"));
			return ValorAleatorio=prefijo.concat(ValorAleatorio);
	    }
	    
	    public void guardarPosteo(int id_perfil,String titulo,int tema,int privacidad,String texto,int id_posteo,String estado,String tipo) {
	    	Conexion llamars=null;
	    	Connection con=null;
			CallableStatement  stmt1 =null;
			try {
				Date fecha = new Date();
				SimpleDateFormat formatea = new SimpleDateFormat("yyyy-MM-dd");
				String fechas = String.valueOf(formatea.format(fecha));
				InputStream img = new ByteArrayInputStream(texto.getBytes(StandardCharsets.UTF_8));
		    	byte[] bytes = IOUtils.toByteArray(img);
		    	llamars=new Conexion();
				con = llamars.getDataSource().getConnection();
				con.setAutoCommit(false); 
				int punto=0;
				String insertTableSQL=("CALL `abmPosteo`(?, ?, ?, ?, ?, ?,?, ?,?,?)");
				  stmt1= con.prepareCall(insertTableSQL);;
			      stmt1.setString(1, tipo);
			      stmt1.setInt(2, id_posteo);
			      stmt1.setInt(3, tema);
			      stmt1.setInt(4,privacidad);
			      stmt1.setInt(5,id_perfil);
			      stmt1.setString(6,fechas);
			      stmt1.setString(7,titulo);
			      stmt1.setBytes(8, bytes);
			      stmt1.setInt(9,punto);
			      stmt1.setString(10,estado);
			      stmt1.executeUpdate();
			      stmt1.close();
			      con.commit();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("error de codigo --- "+e);
				//dato=String.valueOf(e);
			} finally {
				//llamars.desconectar();
				 try {
					 if(stmt1!=null){ stmt1.close();}
					 if(con!=null){con.close(); }
				} catch (SQLException e) {
					// TODO Auto-generated catch block
				
				}
				
			}
		}
	    
	    
	    public String traertemas(String lugar){
			String scritp="SELECT id_temas,tema FROM temas WHERE estado like  'activo' '%' order by tema desc";
			String valor="";	
			Conexion llamars=null;
			Connection cons=null;
			 PreparedStatement pstm=null;
			 ResultSet res=null;
			try {
				cons = llamars.getDataSource().getConnection();
				pstm = cons.prepareStatement(scritp);
				res= pstm.executeQuery();
				while(res.next()){
				valor=valor.concat("<select class=\"form-control\"  id=\"temas\"><option disabled selected>Seleccione:</option>"
	                     +"<option value"+res.getString(1)+">"+res.getString(2)+"</option></select>"
				
					);
					
				}
			}catch (SQLException e) {
				// TODO: handle exception
				System.err.println("Error en "+lugar+" - "+e.getMessage());
			}finally{
				 try {
					 if(res!=null){	res.close();  
		    		  }
		    		 
		    		  if(pstm!=null){pstm.close(); }
		 	         
					if(cons!=null){ cons.close(); 
					
					}
				} catch (Exception e2) {
					// TODO: handle exception
					System.out.println("Error Final: "+e2+" - LUGAR -> guardarposteo");
				}
			}
			return valor;
		}
	    
	    public void guardarPregunta(String tipo,int id_perfil,int id_pregunta,String titulo,int tema,int privacidad,String texto,String estado) {
			
	    	Conexion llamars=null;
			Connection cons=null;
			 PreparedStatement pstm=null;
			 
			 CallableStatement  stmt1 =null;
			try {
				Date fecha = new Date();
				SimpleDateFormat formatea = new SimpleDateFormat("yyyy-MM-dd");
				String fechas = String.valueOf(formatea.format(fecha));
				InputStream img = new ByteArrayInputStream(texto.getBytes(StandardCharsets.UTF_8));
		    	byte[] bytes = IOUtils.toByteArray(img);
		    	llamars= new Conexion();
				cons = llamars.getDataSource().getConnection();
				cons.setAutoCommit(false);  
				String insertTableSQL=("CALL `abmPregunta`(?,?, ?, ?, ?, ?,?, ?,?)");
				
				  stmt1= cons.prepareCall(insertTableSQL);;
			      stmt1.setString(1,tipo);
			      stmt1.setInt(2, id_pregunta);
			      stmt1.setInt(3, tema);
			      stmt1.setInt(4,privacidad);
			      stmt1.setInt(5,id_perfil);
			      stmt1.setString(6,fechas);
			      stmt1.setString(7,titulo);
			      stmt1.setBytes(8, bytes);
			      stmt1.setString(9,estado);
			      stmt1.executeUpdate();
			      cons.commit();
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("error de codigo --- "+e);
				//dato=String.valueOf(e);
			} finally {
				 try {
		    		 
		    		 
		    		  if(pstm!=null){pstm.close(); }
		 	         
					if(cons!=null){ cons.close(); 
					
					}
				} catch (Exception e2) {
					// TODO: handle exception
					System.out.println("Error Final: "+e2+" - LUGAR -> guardarposteo");
				}
			}
		}
	    
	public String Filtro2(String Script, String cantidad,String[] columna, String lugar){
	  		
	  		String contenido="";
	  		String sql=Script;
	  		ArrayList<ArrayList<String>> arra1=FiltroGeneralString(sql, cantidad,lugar); 
	  		for (int i = 0; i < arra1.size(); i++) {			 
	  	       	 if(i==0){
	  	       		
	  	       			contenido=contenido.concat("{");
	  	           		 for (int j = 0; j < columna.length; j++) {
	  	           			contenido=contenido.concat("\""+columna[j]+"\": \""+arra1.get(i).get(j)+" \" ");
	  	           			if(j==columna.length-1){
	  	           				contenido=contenido.concat("}");
	  	           			}else{
	  	           				contenido=contenido.concat(",");
	  	           			}
	  					 }
	  	           		
	  	       		 }else{
	  	       			
	  		       			contenido=contenido.concat(",{");
	  		           		 for (int j = 0; j < columna.length; j++) {
	  		           			contenido=contenido.concat("\""+columna[j]+"\": \""+arra1.get(i).get(j)+" \" ");
	  		           			if(j==columna.length-1){
	  		           				contenido=contenido.concat("}");
	  		           			}else{
	  		           				contenido=contenido.concat(",");
	  		           			}
	  						 }
	  		 
	  	       		 }
	  		}
	  		String datos="{\"contenido\":["
	             +"{\"total\":\""+"0"+"\","
	             +"\"posicion\":\""+"0"+"\","
	             +"\"pos_total\":\""+"0"+"\","
	             +"\"desde\":\""+"0"+"\","
	             +"\"hasta\":\""+"0"+"\","
	  			 +"\"datos\": [";
	  		String registros=datos.concat(contenido.concat("]}]}"));
	  		return registros;
	  	}  
}
