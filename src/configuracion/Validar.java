package configuracion;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Validar {
	
	public String valortodo;
	public String nombrelabel;

	public String verificacodigo(String codigo, String sql){
		String valor="";
		Conexion llamars=null;
		Connection cons=null;
		 PreparedStatement pstm=null;
		 ResultSet res =null;
		
	     try {
	    	 llamars= new Conexion();
			cons = llamars.getDataSource().getConnection();
	    	 if(codigo.equals("")){
	    	 }else{
				pstm = cons.prepareStatement(sql);
		    	 res = pstm.executeQuery();
		         if(res.next()){
		        	 valor=res.getString(1);
		         }else{
		        	 valor="0";
		         }
	    	 } 
	      }catch(SQLException e){
	         System.out.println(e);
	      }finally {
	    	  try {
	    		  if(res!=null){	res.close();  System.out.println("CIERRA RES ");
	    		  }
	    		 
	    		  if(pstm!=null){pstm.close(); System.out.println("CIERRA PSTM ");}
	 	         
				if(cons!=null){ cons.close(); System.out.println("CIERRA CONEXION ");
				
				}
			} catch (Exception e2) {
				// TODO: handle exception
				System.out.println("Error Final: "+e2+" - LUGAR -> validar");
			}
	      }
	      return valor;
	}
	
	public String verificaModificar(String dato,String codigo, String sql){
		String valor="";
		Conexion llamars=null;
		Connection cons=null;
		 PreparedStatement pstm=null;
		 ResultSet res =null;

	     try {
	    	 llamars= new Conexion();
				cons = llamars.getDataSource().getConnection();
	    	 if(dato.equals("")){
	    	 }else{
				pstm = cons.prepareStatement(sql);
		    	res =pstm.executeQuery();
		         if(res.next()){
		        	 valor=res.getString(1);
		         }else{
		        	 valor="0";
		         }
	    	 } 
	      }catch(SQLException e){
	         System.out.println(e);
	      }finally {
	    	  try {
	    		  if(res!=null){	res.close();  System.out.println("CIERRA RES ");
	    		  }
	    		 
	    		  if(pstm!=null){pstm.close(); System.out.println("CIERRA PSTM ");}
	 	         
				if(cons!=null){ cons.close(); System.out.println("CIERRA CONEXION ");
				
				}
			} catch (Exception e2) {
				// TODO: handle exception
				System.out.println("Error Final: "+e2+" - LUGAR -> validar");
			}
	      }
	      return valor;
	}
	
	public String verificaGuardar(String dato, String sql){
		String valor="";
		Conexion llamars=null;
		Connection cons=null;
		 PreparedStatement pstm=null;
		 ResultSet res =null;
	     try {
	    	 llamars= new Conexion();
			cons = llamars.getDataSource().getConnection();
	    	 if(dato.equals("")){
	    	 }else{
				pstm =cons.prepareStatement(sql);
		    	res = (ResultSet) pstm.executeQuery();
		         if(res.next()){
		        	 valor=res.getString(1);
		         }else{
		        	 valor="0";
		         }
	    	 } 
	      }catch(SQLException e){
	         System.out.println(e);
	      }finally {
	    	  try {
	    		  if(res!=null){	res.close();  System.out.println("CIERRA RES ");
	    		  }
	    		 
	    		  if(pstm!=null){pstm.close(); System.out.println("CIERRA PSTM ");}
	 	         
				if(cons!=null){ cons.close(); System.out.println("CIERRA CONEXION ");
				
				}
			} catch (Exception e2) {
				// TODO: handle exception
				System.out.println("Error Final: "+e2+" - LUGAR -> validar");
			}
	      }
	      return valor;
	}
	
	public String Metodo(String dato, String codigo, String sqlC, String sqlG, String sqlM){
		String imagen="";
		if(dato.equals("")){
		//	imagen="/imagen/Zoom_00001_00001_00001.png";
			valortodo="vacio";
		//	nombrelabel="INGRESE NOMBRE";
		}else{
		
		int existecodigo=Integer.parseInt(verificacodigo(codigo, sqlC));
		int existenombreM=Integer.parseInt(verificaModificar(dato,codigo, sqlM));
		int existenombreI=Integer.parseInt(verificaGuardar(dato, sqlG));
		
		
		//System.out.println("resul --> "+existecodigo);
		if(existecodigo>0){ //modificar
			if(existenombreM>0){
			//	System.out.println("existe nombre modificar");
			//	imagen="/imagen/delete_00001_00001.png";
				valortodo="si";
				nombrelabel="EL REGISTRO YA EXISTE";
			}else{
			//	System.out.println("no existe nombre modificar");
			//	imagen="/imagen/apply_00001_2_00001.png";
				valortodo="no";
				//nombrelabel="ES CORRECTO";
			}
		}else{//insertar
			if(existenombreI>0){
			//	System.out.println("existe nombre guardar");
			//	imagen="/imagen/delete_00001_00001.png";
				valortodo="si";
				nombrelabel="EL REGISTRO YA EXISTE";
			}else{
			//	System.out.println("no existe nombre guardar");
			//	imagen="/imagen/apply_00001_2_00001.png";
				valortodo="no";
				//nombrelabel="EL NOMBRE ES CORRECTO";
				
			}
		}
		}
		return imagen;
	}
}
