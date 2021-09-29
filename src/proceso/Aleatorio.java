package proceso;
public class Aleatorio {
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
//    	String[] alfa=new String[]{"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
    	String[] alfa=new String[]{"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
    	Conexion con=new Conexion();
    	String terminar="NO";
    	int x=0;
    	int far = 0;
    	x=0;
    	do {
    		if(terminar.equals("NO")){
    			String valor=con.ContadorGeneralString("SELECT COUNT(1) FROM enlacesistema WHERE url LIKE Concat('/rade/','"+alfa[x]+"','%') ");
    			far=Integer.parseInt(valor);
    			if(far<=5000){
    				ValorAleatorio=alfa[x].concat(ValorAleatorio(50));
    				String Verifica=con.ContadorGeneralString("SELECT COUNT(1) FROM enlacesistema WHERE url =concat('/rade/','"+ValorAleatorio+"')");
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
    
    public Aleatorio() {
    	String valor = AccesoAleatorio();
    	System.out.println(valor);
    }
    
    public static void main(String args[]) {
    	new Aleatorio();
    }
}