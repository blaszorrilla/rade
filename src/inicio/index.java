package inicio;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import configuracion.Procedimiento;

/**
 * Servlet implementation class index
 */
@WebServlet("/index")
public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public index() {
        super();
    }
 
	protected void procesoRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = String.valueOf(request.getAttribute("javax.servlet.forward.request_uri"));
		System.out.println("url--"+url);
		try {
			Procedimiento proceso= new Procedimiento();
			if(proceso.ValidarURL(url)==false){
				if(url.equals("null")){
					RequestDispatcher dispacher = request.getRequestDispatcher("views/pagina/publico/publico.jsp");
                    dispacher.forward(request, response);
				}else if(url.equals("/rade")){
					RequestDispatcher dispacher = request.getRequestDispatcher("views/pagina/publico/publico.jsp");
                    dispacher.forward(request, response);
				}else if(url.equals("/rade/index")){
					RequestDispatcher dispacher = request.getRequestDispatcher("views/pagina/publico/publico.jsp");
                    dispacher.forward(request, response);
				}else if(url.equals("/rade/controlador")){
					RequestDispatcher dispacher = request.getRequestDispatcher("controlador");
                    dispacher.forward(request, response);
				}else{
					String direccion = "views/pagina/error/error.jsp";
					try {
						Procedimiento datos = new Procedimiento();
						ArrayList<ArrayList<String>> valores = datos.FiltroGeneralString("SELECT direccion FROM enlacesistema WHERE estado='ACTIVO' AND url='"+url+"' LIMIT 1", "1", "ENLACE INDEX");
						for (int i = 0; i < valores.size(); i++) {
							direccion = String.valueOf(valores.get(0).get(0));
						}
					} catch (Exception e) {
						System.out.println("ERROR EN FILTRO "+e);
					}
					
					RequestDispatcher dispacher = request.getRequestDispatcher(direccion);
		            dispacher.forward(request, response);
				}
				System.out.println("LA URL ES CORRECTA");
			}else{
				System.out.println("LA URL ES INCORRECTA");
				RequestDispatcher dispacher = request.getRequestDispatcher("views/pagina/error/error.jsp");
	            dispacher.forward(request, response);
			}
		} catch (Exception e) {
			System.out.println("ERROR EN INDEX "+e);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		procesoRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		procesoRequest(request, response);
	}

}
