package Inform;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import configuracion.Procedimiento;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 * Servlet implementation class Memo_inf
 */
@WebServlet("/Memoo")
public class Memoo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Memoo() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void procesoPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	String para= ""; // request.getParameter("codigo");
		String de= ""; // request.getParameter("codigo");
		String fecha= ""; // request.getParameter("codigo");
		String asunto= "";
		String cargo= "";
		String texto = "";
		String empresa = "";
		String id_nombre="", id_perfil="";
		System.out.println("ingreso a memo");
	HttpSession sesion=request.getSession(true);
		if(request.getParameter("envio") != null){
			
    		String valor=String.valueOf(request.getParameter("envio"));
    	
    		
    		if(valor.equals("memo")){
    			
    			
    			sesion.setAttribute("para",String.valueOf(request.getParameter("para")));
    			sesion.setAttribute("de",String.valueOf(request.getParameter("de")));
    			sesion.setAttribute("fecha",String.valueOf(request.getParameter("fecha")));
    			sesion.setAttribute("asunto",String.valueOf(request.getParameter("asunto")));
    			sesion.setAttribute("cargo",String.valueOf(request.getParameter("cargo")));
    			sesion.setAttribute("texto",String.valueOf(request.getParameter("texto")));
    			sesion.setAttribute("empresa",String.valueOf(request.getParameter("empresa")));
    			sesion.setAttribute("envio","");
    			
    			sesion.setAttribute("id_nombre",String.valueOf(request.getParameter("id_nombre")));
    			sesion.setAttribute("id_perfil",String.valueOf(request.getParameter("id_perfil")));
    		
    		}else if(valor.equals("impresion")){
    			
    			sesion.setAttribute("id_memo",String.valueOf(request.getParameter("id_memo")));
    			sesion.setAttribute("id_nombre",String.valueOf(request.getParameter("id_nombre")));
    			sesion.setAttribute("id_perfil",String.valueOf(request.getParameter("id_perfil")));
    			String id_memo=String.valueOf(sesion.getAttribute("id_memo"));
    			
    			Procedimiento pross = new Procedimiento();
    			ArrayList<ArrayList<String>> datos = pross.FiltroGeneralString("SELECT `para`,`de`,`fecha`,`asunto`,`nombre_empresa`,`texto`,`cargo`"
										+ "FROM `Filtro_memo` WHERE id_memo="+id_memo, "7", "Informe impresion Memo");
    			
    			sesion.setAttribute("para",String.valueOf(datos.get(0).get(0)));
    			sesion.setAttribute("de",String.valueOf(datos.get(0).get(1)));
    			sesion.setAttribute("fecha",String.valueOf(datos.get(0).get(2)));
    			sesion.setAttribute("asunto",String.valueOf(datos.get(0).get(3)));
    			sesion.setAttribute("empresa",String.valueOf(datos.get(0).get(4)));
    			sesion.setAttribute("texto",String.valueOf(datos.get(0).get(5)));
    			sesion.setAttribute("cargo",String.valueOf(datos.get(0).get(6)));
    			sesion.setAttribute("envio","");
    			
    		}	
		
    	}else{
			para = String.valueOf(sesion.getAttribute("para"));
			de= String.valueOf(sesion.getAttribute("de"));
			fecha= String.valueOf(sesion.getAttribute("fecha"));
			asunto= String.valueOf(sesion.getAttribute("asunto"));
			cargo= String.valueOf(sesion.getAttribute("cargo"));
			texto = String.valueOf(sesion.getAttribute("texto"));
			empresa = String.valueOf(sesion.getAttribute("empresa"));
			id_nombre= String.valueOf(sesion.getAttribute("id_nombre"));
			id_perfil= String.valueOf(sesion.getAttribute("id_perfil"));
			System.out.println("entro en el else... >"+texto);
		}
		
		Map parameters = new HashMap();
		parameters.clear();
		parameters.put("para",para);
		parameters.put("de",de);
		parameters.put("fecha",fecha);
		parameters.put("asunto",asunto);
		parameters.put("cargo",cargo);
		parameters.put("empresa",empresa);
		
		parameters.put("texto",texto);
		
		byte[] bytes;
		try {
			Reporte rp=new Reporte();
			response.setContentType("application/pdf");
			
			bytes = JasperRunManager.runReportToPdf(rp.ReporteMemo(id_nombre, id_perfil, cargo, empresa),parameters, new JREmptyDataSource());
			
			response.setContentLength(bytes.length);
			OutputStream outStream = response.getOutputStream(); 
			outStream.write(bytes, 0, bytes.length);
			outStream.flush();
			outStream.close();
		} catch (JRException e) {
			System.out.print("el error se encuentra en informe, error: "+e);
			e.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		procesoPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		procesoPost(request, response);
	}

}
