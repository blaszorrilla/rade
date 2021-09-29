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
//nuevas librerias --->
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
//<---
import net.sf.jasperreports.engine.JasperRunManager;

/**
 * Servlet implementation class Informe
 */
@WebServlet("/Informe")
public class Informe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Informe() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void procesoPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	String cedula = ""; // request.getParameter("codigo");
		String nombre = ""; // request.getParameter("codigo");
		String apellido = ""; // request.getParameter("codigo");
		String texto = "";
		String texto2 = "";
		String texto3 = "";
		String fecha = "";
		String tel = "";
		String direccion = "";
		String conocimiento = "";
		String ref_laboral = "";
		String ref_personal= "";
		String id_perfil="";
		String id_nombre="";
		String diseno="";
	HttpSession sesion=request.getSession(true);
	if(request.getParameter("envio") != null){
		
		System.out.println("entro en Informe");
		String valor=String.valueOf(request.getParameter("envio"));
		System.out.println("estamos en informe = "+valor);
		
		if(valor.equals("curriculum")){
			
			sesion.setAttribute("cedula",String.valueOf(request.getParameter("cedula")));
			sesion.setAttribute("nombre",String.valueOf(request.getParameter("nombre")));
			sesion.setAttribute("apellido",String.valueOf(request.getParameter("apellido")));
			sesion.setAttribute("texto",String.valueOf(request.getParameter("texto")));
			sesion.setAttribute("texto2",String.valueOf(request.getParameter("texto2")));
			sesion.setAttribute("texto3",String.valueOf(request.getParameter("texto3")));
			sesion.setAttribute("fecha",String.valueOf(request.getParameter("fecha")));
			sesion.setAttribute("tel",String.valueOf(request.getParameter("tel")));
			sesion.setAttribute("direccion",String.valueOf(request.getParameter("direccion")));
			sesion.setAttribute("conocimiento",String.valueOf(request.getParameter("conocimiento")));
			sesion.setAttribute("ref_personal",String.valueOf(request.getParameter("ref_personal")));
			sesion.setAttribute("ref_laboral",String.valueOf(request.getParameter("ref_laboral")));
			sesion.setAttribute("id_perfil",String.valueOf(request.getParameter("id_perfil")));
			sesion.setAttribute("id_nombre",String.valueOf(request.getParameter("id_nombre")));
			sesion.setAttribute("id_tipo_curri",String.valueOf(request.getParameter("id_tipo_curri")));
			sesion.setAttribute("envio","");
			
		}else if(valor.equals("impresion")){
			
			sesion.setAttribute("id_curriculum",String.valueOf(request.getParameter("id_curriculum")));
			sesion.setAttribute("id_nombre",String.valueOf(request.getParameter("id_nombre")));
			sesion.setAttribute("id_perfil",String.valueOf(request.getParameter("id_perfil")));
			String id_curri=String.valueOf(sesion.getAttribute("id_curriculum"));
			Procedimiento pross = new Procedimiento();
			ArrayList<ArrayList<String>> datos = pross.FiltroGeneralString("SELECT `nombre`,`apellido`,`direccion`,`telefono`,`cedula`,`fecha_nac`,"
					+ "`info_academica`,`info_experiencia`,`info_idioma`,`refe_laboral`,`refe_personal`,`conocimientos`, `id_tipo_diseno_curri` FROM `Filtro_curri` WHERE `id_curriculum`="+id_curri, "13", "Informe impresion curriculum");
			sesion.setAttribute("nombre",String.valueOf(datos.get(0).get(0)));
			sesion.setAttribute("apellido",String.valueOf(datos.get(0).get(1)));
			sesion.setAttribute("direccion",String.valueOf(datos.get(0).get(2)));
			sesion.setAttribute("tel",String.valueOf(datos.get(0).get(3)));
			sesion.setAttribute("cedula",String.valueOf(datos.get(0).get(4)));
			sesion.setAttribute("fecha",String.valueOf(datos.get(0).get(5)));
			
			sesion.setAttribute("texto",String.valueOf(datos.get(0).get(6)));
			sesion.setAttribute("texto2",String.valueOf(datos.get(0).get(7)));
			sesion.setAttribute("texto3",String.valueOf(datos.get(0).get(8)));
			
			sesion.setAttribute("ref_laboral",String.valueOf(datos.get(0).get(9)));
			sesion.setAttribute("ref_personal",String.valueOf(datos.get(0).get(10)));
			sesion.setAttribute("conocimiento",String.valueOf(datos.get(0).get(11)));
			sesion.setAttribute("id_tipo_curri",String.valueOf(datos.get(0).get(12)));
			sesion.setAttribute("envio","");
			
			}
	
	}else{
		cedula = String.valueOf(sesion.getAttribute("cedula"));
		nombre = String.valueOf(sesion.getAttribute("nombre"));
		apellido = String.valueOf(sesion.getAttribute("apellido"));
		texto = String.valueOf(sesion.getAttribute("texto"));
		texto2 = String.valueOf(sesion.getAttribute("texto2"));
		texto3 = String.valueOf(sesion.getAttribute("texto3"));
		fecha = String.valueOf(sesion.getAttribute("fecha"));
		tel = String.valueOf(sesion.getAttribute("tel"));
		direccion = String.valueOf(sesion.getAttribute("direccion"));
		conocimiento = String.valueOf(sesion.getAttribute("conocimiento"));
		ref_laboral= String.valueOf(sesion.getAttribute("ref_laboral"));
		ref_personal = String.valueOf(sesion.getAttribute("ref_personal"));
		id_perfil = String.valueOf(sesion.getAttribute("id_perfil"));
		id_nombre = String.valueOf(sesion.getAttribute("id_nombre"));
		diseno = String.valueOf(sesion.getAttribute("id_tipo_curri"));
		System.out.println("entro en el else... >"+texto+"<--");
		System.err.println("se recibe id_perfil... >"+id_perfil+"<--");
		System.err.println("se recibe id_nombre... >"+id_nombre+"<--");
		
	}
	
	Map parameters = new HashMap();
	parameters.clear();
	parameters.put("cedula",cedula);
	parameters.put("nombre",nombre);
	parameters.put("apellido",apellido);
	parameters.put("texto",texto);
	parameters.put("texto2",texto2);
	parameters.put("texto3",texto3);
	parameters.put("fecha",fecha);
	parameters.put("tel",tel);
	parameters.put("direccion",direccion);
	parameters.put("conocimiento",conocimiento);
	parameters.put("ref_laboral",ref_laboral);
	parameters.put("ref_personal",ref_personal);

		byte[] bytes;
		try {
			Reporte rp=new Reporte();
			response.setContentType("application/pdf");
			
			bytes = JasperRunManager.runReportToPdf(rp.ReporteCurriculum(id_nombre, id_perfil, texto, texto2, texto3,conocimiento,ref_personal,ref_laboral,diseno),parameters, new JREmptyDataSource());
			
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

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		procesoPost(request, response);
	}

}
