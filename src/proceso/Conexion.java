package proceso;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Conexion {
//	private static String servidor="jdbc:mysql://127.0.0.1/talleraguilar";
	private static String servidor="jdbc:mysql://localhost:3306/rade";
//	private static String user="root";
	private static String user="root";
//	private static String pass="admin";
	private static String pass="admin";
	private static String driver="com.mysql.jdbc.Driver";
	public static Connection conexion=null;
	public Conexion(){
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		String fecha = sdf.format(dt);
		try {
			Class.forName(driver);
			conexion=null;
			conexion=DriverManager.getConnection(servidor,user,pass);
			System.out.println("conexion exitosa - "+fecha);
		} catch (Exception e) {
			System.out.println("conexion fallida - "+fecha);
		}
	}
	public Connection getConnection(){
		return conexion;
		
	}
	public void desconectar(){
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		String fecha = sdf.format(dt);
		conexion = null;
	      System.out.println("La conexion a la  base de datos "+servidor+" a terminado - "+fecha);
	}
	public int ContadorGeneral(String valor){
		Conexion con=new Conexion();
		int registros=0;
		try{ 
	    		 PreparedStatement pstm = con.getConnection().prepareStatement(valor);
		    	 ResultSet res = pstm.executeQuery();
		         if(res.next())
		         {	 
		         registros = Integer.parseInt(res.getString(1));
		         }
		         res.close();
		         pstm.close();
	      }catch(SQLException e){
	         System.out.println(e);
	      }finally{
	    	  con.desconectar();
	      }
		return registros;
	}
	public float ContadorGeneralFloat(String valor){
		Conexion con=new Conexion();
		float registros=0;
		try{ 
	    		 PreparedStatement pstm = con.getConnection().prepareStatement(valor);
		    	 ResultSet res = pstm.executeQuery();
		         if(res.next())
		         {	 
		         registros = Float.parseFloat(res.getString(1));
		         }
		         res.close();
		         pstm.close();
	      }catch(SQLException e){
	         System.out.println(e);
	      }finally{
	    	  con.desconectar();
	      }
		return registros;
	}
	public String ContadorGeneralString(String valor){
		Conexion con=new Conexion();
		String registros="0";
		try{ 
	    		 PreparedStatement pstm = con.getConnection().prepareStatement(valor);
		    	 ResultSet res = pstm.executeQuery();
		         if(res.next())
		         {	 
		         registros = res.getString(1);
		         }
		         res.close();
		         pstm.close();
	      }catch(SQLException e){
	         System.out.println(e);
	      }finally{
	    	  con.desconectar();
	      }
		return registros;
	}
	public void GuardarGeneral(String valor){
		Conexion llamars= new Conexion();
		Connection cons = llamars.getConnection();
		Statement sts;
		try {
			sts=cons.createStatement();	
			sts.executeUpdate(valor);
			cons.close();
			sts.close();
			llamars.desconectar();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error GuardarGeneral "+e);
		}
	}
	public String[][] ConversionArray(String s,int nro1,int nro2){
		int e=s.replaceAll("\\[", "").replaceAll("],","]").length(); //replaceAll(" ","").
        String[] rows1 = s.replaceAll("\\[", "").replaceAll("],","]").substring(0, e-2).split("]"); //.replaceAll(" ","")
        String[][] matrix1 = new String[nro1][nro2]; 
        int r1 = 0;
        for (String row1 : rows1) {
            matrix1[r1++] = row1.split(",");
        }

		return matrix1;
	}
	public ArrayList<ArrayList<String>> FiltroGeneralString(String valor,String cantidad){
		ArrayList<ArrayList<String>> dato=new ArrayList<ArrayList<String>>();
		Conexion con=new Conexion();
		int c=0;
		try{ 
    		 PreparedStatement pstm = con.getConnection().prepareStatement(valor);
	    	 ResultSet res = pstm.executeQuery();
	         while(res.next())
	         {
	        	dato.add(new ArrayList<String>());
	    		for (int i = 1; i <= Integer.parseInt(cantidad); i++) {
					dato.get(c).add(res.getString(i));
				}
	    		c++;
	         }
	         res.close();
	         pstm.close();
      }catch(SQLException e){
         System.out.println(e);
      }finally{
    	  con.desconectar();
      }
	 return dato;
	}
}