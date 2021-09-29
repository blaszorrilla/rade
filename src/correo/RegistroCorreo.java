package correo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

@WebServlet("/RegistroCorreo")
public class RegistroCorreo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RegistroCorreo() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void procesoRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    		String contenido="<div style=\"margin:0;padding:0\">"
+"<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding:0;margin:0\">"
+"  <tbody><tr>"
+"    <td style=\"font-size:0\"><span></span></td>"
+"    <td valign=\"top\" align=\"left\" style=\"width:640px;max-width:640px\">"
+"        <table width=\"100%\" bgcolor=\"#FFFFFF\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding:0;margin:0;border:0\">"
+"            <tbody><tr>"
+"              <td align=\"left\" style=\"padding:32px 63px 0 63px\" id=\"m_-2777389246196442201main-pad\">"
+"                   <img alt=\"\" src=\"https://avatars3.githubusercontent.com/u/43255178?s=400&u=70439acd8896b8a1f5a707ae5638e3ee2d8eebd5&v=4\" width=\"136\" data-image-whitelisted=\"\" class=\"CToWUd\">"
+"                  <h1 style=\"font-family:Helvetica,Arial,sans-serif;font-size:24px;line-height:31px;color:#777777;padding:0;margin:28px 0 32px 0;font-weight:400;text-align:left;text-decoration:none\"><span style=\"display:block\"> Hola, usuario: </span></h1>"
+"                  <p style=\"font-size:16px;line-height:20px;color:#333333;padding:0;margin:0 0 11px 0;text-align:left;font-family:Helvetica,Arial,sans-serif\">"
+"                    Tenemos el agrado de informarle que recibimos la aprobación a su solicitud a una cuenta en RADE, por parte de “UTIC”. Te damos la bienvenida en RADE, y esperamos que puedas aprovechar al máximo esta plataforma, que fue creado con el objetivo de compartir conocimientos con otras personas."
+"                  </p>"
+"                  <p style=\"font-size:16px;line-height:20px;color:#333333;padding:0;margin:24px 0 32px 0;text-align:left;font-family:Helvetica,Arial,sans-serif\">"
+"                    Sigue el siguiente enlace para culminar el proceso de registro <span style=\"color:#d90007\"></span>."
+"                  </p>"
+"                  <table cellpadding=\"0\" cellspacing=\"0\" style=\"padding:0;margin:0 0 20px 0;border:0;width:213px\">"
+"                      <tbody><tr>"
+"                        <td id=\"m_-2777389246196442201bottom-button-bg\" valign=\"top\" align=\"center\" style=\"border-radius:3px;padding:12px 20px 16px 20px;background-color:#28a745\">"
+"                            <a id=\"m_-2777389246196442201bottom-button\" href=\"http://localhost:8080/rade/\" style=\"font-family:Helvetica,Arial,sans-serif;font-size:16px;color:#ffffff;background-color:#28a745;border-radius:3px;text-align:center;text-decoration:none;display:block;margin:0\" target=\"_blank\">"
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
			//"<body><img src=https://avatars3.githubusercontent.com/u/43255178?s=400&u=70439acd8896b8a1f5a707ae5638e3ee2d8eebd5&v=4> <h1>Este correo fue enviado desde rade</h1><br/><h3>Saludos!!</h3></body>"
			SendingEmail("blassalvador03@gmail.com", contenido);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			procesoRequest(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			procesoRequest(request, response);

	}
	
	public void SendingEmail(String Email,String Body) throws MessagingException, javax.mail.MessagingException
    {

             String host ="smtp.gmail.com";
             String from ="rade.encarnacion@gmail.com";  //Your mail id
             String pass ="rade12345";   // Your Password
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
             message.setSubject("Registro RADE");

             message.setContent(Body,"text/html");
             Transport transport = session.getTransport("smtp");
             transport.connect(host, from, pass);
             transport.sendMessage(message, message.getAllRecipients());
                 transport.close();
        }

}
