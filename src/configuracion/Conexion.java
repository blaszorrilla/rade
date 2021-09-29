package configuracion;

import org.apache.commons.dbcp.BasicDataSource;

public class Conexion {

    private static BasicDataSource basicDataSource=null;
    
   /* private String user = "server";
    private String pass = "admin";
    private String url = "jdbc:mysql://181.123.10.120/rade";*/
    
 
    private static String url="jdbc:mysql://localhost/rade"; 
	private static String user="root";
	private static String pass="1234";
  


    /**
     * 
     */
    public Conexion(){
    		//System.out.println("se instancia conexion");
         if (null==basicDataSource){
        	 //System.out.println("basicDataSource = null");
             basicDataSource = new BasicDataSource();
             basicDataSource.setDriverClassName("com.mysql.jdbc.Driver");
             basicDataSource.setUrl(url);
             basicDataSource.setUsername(user);
             basicDataSource.setPassword(pass);
             basicDataSource.setInitialSize(5);
             basicDataSource.setMaxActive(200);
             basicDataSource.setMinIdle(50);
             basicDataSource.setMaxIdle(100);
             //System.out.println("basicDataSource = null - termino de configurarse");
         }
     }
     public BasicDataSource getDataSource(){
    	 //System.out.println("getDataSource - envia basicDataSource");
         return basicDataSource;
     }
}
