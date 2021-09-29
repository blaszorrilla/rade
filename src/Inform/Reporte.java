package Inform;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;

public class Reporte {
	String diseno1= "<?xml version=\"1.0\" encoding=\"UTF-8\"?><!-- Created with Jaspersoft Studio version 6.6.0.final using JasperReports Library version 6.6.0  --><jasperReport xmlns=\"http://jasperreports.sourceforge.net/jasperreports\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd\" name=\"Blank_A4\" pageWidth=\"595\" pageHeight=\"842\" columnWidth=\"555\" leftMargin=\"20\" rightMargin=\"20\" topMargin=\"20\" bottomMargin=\"20\" uuid=\"7b3af311-9544-4aac-b646-e902f500184d\"><property name=\"com.jaspersoft.studio.data.defaultdataadapter\" value=\"One Empty Record\"/><parameter name=\"nombre\" class=\"java.lang.String\"/><parameter name=\"apellido\" class=\"java.lang.String\"/><parameter name=\"cedula\" class=\"java.lang.String\"/><parameter name=\"fecha\" class=\"java.lang.String\"/><parameter name=\"direccion\" class=\"java.lang.String\"/><parameter name=\"texto\" class=\"java.lang.String\"/><parameter name=\"texto2\" class=\"java.lang.String\"/><parameter name=\"texto3\" class=\"java.lang.String\"/><parameter name=\"Parameter9\" class=\"java.lang.String\"/><queryString><![CDATA[]]></queryString><background><band splitType=\"Stretch\"/></background><title><band height=\"43\" splitType=\"Stretch\"><staticText><reportElement x=\"150\" y=\"0\" width=\"203\" height=\"30\" uuid=\"3b154334-faad-4783-b1cf-a972c830a2e0\"/><textElement textAlignment=\"Center\"><font size=\"15\" isBold=\"true\"/></textElement><text><![CDATA[Curriculum Vitae]]></text></staticText></band></title><detail><band height=\"676\" splitType=\"Stretch\"><staticText><reportElement x=\"30\" y=\"72\" width=\"100\" height=\"30\" uuid=\"9c0dbef1-b9e0-4504-8205-6c8a142f9209\"/><textElement><font size=\"14\" isBold=\"true\"/></textElement><text><![CDATA[Apellido:]]></text></staticText><staticText><reportElement x=\"30\" y=\"42\" width=\"100\" height=\"30\" uuid=\"c731c5bf-03dd-45ab-b80b-cf80aed32c2b\"/><textElement><font size=\"14\" isBold=\"true\"/></textElement><text><![CDATA[Nombre:]]></text></staticText><staticText><reportElement x=\"30\" y=\"102\" width=\"100\" height=\"30\" uuid=\"09e2bacf-9fdb-4290-a5ee-f72cc665ef8b\"/><textElement><font size=\"14\" isBold=\"true\"/></textElement><text><![CDATA[N° de Cedula:]]></text></staticText><staticText><reportElement x=\"30\" y=\"162\" width=\"100\" height=\"30\" uuid=\"96b1f964-6be9-4b72-8cb5-978ac24d2259\"/><textElement><font size=\"14\" isBold=\"true\"/></textElement><text><![CDATA[Direccion:]]></text></staticText><staticText><reportElement x=\"30\" y=\"132\" width=\"100\" height=\"30\" uuid=\"72b7cb4c-d1bd-49f7-9352-ec5c16910994\"/><textElement><font size=\"14\" isBold=\"true\"/></textElement><text><![CDATA[Fecha de Nacimiento:]]></text></staticText><textField><reportElement x=\"130\" y=\"42\" width=\"280\" height=\"30\" uuid=\"016edc0a-976b-44ca-a6e1-8ce620f192f7\"/><textElement><font size=\"12\"/></textElement><textFieldExpression><![CDATA[$P{nombre}]]></textFieldExpression></textField><textField><reportElement x=\"130\" y=\"72\" width=\"280\" height=\"30\" uuid=\"24421b01-2736-4392-8053-dbf38cd738a8\"/><textElement><font size=\"12\"/></textElement><textFieldExpression><![CDATA[$P{apellido}]]></textFieldExpression></textField><textField><reportElement x=\"130\" y=\"102\" width=\"280\" height=\"30\" uuid=\"9e4c0b62-cd3c-4dda-8e6e-12a3e556d4ec\"/><textElement><font size=\"12\"/></textElement><textFieldExpression><![CDATA[$P{cedula}]]></textFieldExpression></textField><textField><reportElement x=\"130\" y=\"132\" width=\"280\" height=\"30\" uuid=\"d46b1737-6ffa-4660-a363-333f48db48d2\"/><textElement><font size=\"12\"/></textElement><textFieldExpression><![CDATA[$P{fecha}]]></textFieldExpression></textField><textField><reportElement x=\"130\" y=\"162\" width=\"280\" height=\"30\" uuid=\"1d088d2d-1d54-48ee-9c69-f506b8fb5e37\"/><textElement><font size=\"12\"/></textElement><textFieldExpression><![CDATA[$P{direccion}]]></textFieldExpression></textField><staticText><reportElement x=\"30\" y=\"0\" width=\"210\" height=\"30\" uuid=\"160859ca-24c7-46d7-b7a6-9e14fedb17c1\"/><textElement><font size=\"15\" isBold=\"true\" isItalic=\"true\"/></textElement><text><![CDATA[Información Personal]]></text></staticText><line><reportElement x=\"31\" y=\"24\" width=\"441\" height=\"1\" uuid=\"adc81c54-eeb4-49e6-b9a7-de7581bd884d\"><property name=\"com.jaspersoft.studio.unit.height\" value=\"px\"/></reportElement></line></band>";
	public String sacar(String valor){
		int cal= valor.length();
		String resul="";
		for (int i = 0; i < cal; i++) {
			resul=valor.replace("file:", "");
		}
		return resul;
	}
	public JasperReport ReporteCurriculum(String parametro1, String parametro2, String texto, String texto2, String texto3,String conocimiento,String ref_personal,String ref_laboral, String diseno) throws IOException{

		JasperReport masterReport = null;
		System.out.println("Ingreso a ReporteCurriculum");
        try {
        	
			File archivo = new File(sacar(String.valueOf(Reporte.class.getResource("")))+parametro1+parametro2+".jrxml");
			String arch_dir=sacar(String.valueOf(Reporte.class.getResource("")))+parametro1+parametro2+".jrxml";
	        BufferedWriter bw;
	        
	        System.out.print("los datos que se reciben son -->"+parametro1+"<-->"+parametro2+"<-->"+texto+"<-->"+texto2+"<-->"+texto3+"<--");

	        String cabeza_azul="<?xml version=\"1.0\" encoding=\"UTF-8\"?><!-- Created with Jaspersoft Studio version 6.6.0.final using JasperReports Library version 6.6.0  --><jasperReport xmlns=\"http://jasperreports.sourceforge.net/jasperreports\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd\" name=\"curri_rojo\" pageWidth=\"595\" pageHeight=\"842\" columnWidth=\"555\" leftMargin=\"20\" rightMargin=\"20\" topMargin=\"20\" bottomMargin=\"20\" uuid=\"10ae9809-4469-45d1-b03e-d44106c45f8c\"><property name=\"com.jaspersoft.studio.data.defaultdataadapter\" value=\"One Empty Record\"/><parameter name=\"nombre\" class=\"java.lang.String\"/><parameter name=\"direccion\" class=\"java.lang.String\"/><parameter name=\"tel\" class=\"java.lang.String\"/><parameter name=\"cedula\" class=\"java.lang.String\"/><parameter name=\"fecha\" class=\"java.lang.String\"/><parameter name=\"apellido\" class=\"java.lang.String\"/><parameter name=\"texto\" class=\"java.lang.String\"/><parameter name=\"texto2\" class=\"java.lang.String\"/><parameter name=\"ref_laboral\" class=\"java.lang.String\"/><parameter name=\"ref_personal\" class=\"java.lang.String\"/><parameter name=\"texto3\" class=\"java.lang.String\"/><parameter name=\"conocimiento\" class=\"java.lang.String\"/><queryString><![CDATA[]]></queryString><background><band splitType=\"Stretch\"/></background><title><band height=\"138\" splitType=\"Stretch\"><rectangle><reportElement stretchType=\"RelativeToBandHeight\" x=\"0\" y=\"10\" width=\"555\" height=\"110\" forecolor=\"#3E55ED\" backcolor=\"#3E55ED\" uuid=\"782e994e-5dc5-4162-a1bc-918c6475ea28\"/></rectangle><textField><reportElement x=\"10\" y=\"17\" width=\"280\" height=\"54\" forecolor=\"#FFFFFF\" backcolor=\"#FFFFFF\" uuid=\"abf7283a-04b2-4133-bbc3-f8cc7e09634c\"/><textElement verticalAlignment=\"Bottom\"><font fontName=\"Sahadeva\" size=\"30\" isBold=\"true\" isItalic=\"false\"/></textElement><textFieldExpression><![CDATA[$P{nombre}]]></textFieldExpression></textField><textField isStretchWithOverflow=\"true\"><reportElement positionType=\"Float\" x=\"370\" y=\"90\" width=\"174\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"961e9723-6d21-4557-ad28-c7cf95045ec4\"/><textElement><font fontName=\"Sahadeva\"/></textElement><textFieldExpression><![CDATA[$P{direccion}]]></textFieldExpression></textField><staticText><reportElement x=\"308\" y=\"90\" width=\"60\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"273479ac-e5b6-465c-97fe-283c972669a3\"/><textElement><font fontName=\"Sahadeva\" isBold=\"true\"/></textElement><text><![CDATA[Dirección]]></text></staticText><staticText><reportElement positionType=\"Float\" x=\"308\" y=\"70\" width=\"60\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"e9112acd-0095-40bf-97ea-ac491caf5cf7\"/><textElement><font fontName=\"Sahadeva\" isBold=\"true\"/></textElement><text><![CDATA[Teléfono]]></text></staticText><textField><reportElement x=\"370\" y=\"70\" width=\"174\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"5b58af78-9fc2-4278-b6c3-bf1877f68584\"/><textElement><font fontName=\"Sahadeva\"/></textElement><textFieldExpression><![CDATA[$P{tel}]]></textFieldExpression></textField><staticText><reportElement positionType=\"Float\" x=\"308\" y=\"30\" width=\"60\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"6d400861-6fca-4e4e-a204-06bcb3543078\"/><textElement><font fontName=\"Sahadeva\" isBold=\"true\"/></textElement><text><![CDATA[Cedula]]></text></staticText><textField><reportElement x=\"370\" y=\"30\" width=\"175\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"e26d465c-b74d-4a79-8b15-047842f994b2\"/><textElement><font fontName=\"Sahadeva\"/></textElement><textFieldExpression><![CDATA[$P{cedula}]]></textFieldExpression></textField><staticText><reportElement positionType=\"Float\" x=\"308\" y=\"50\" width=\"60\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"b2187583-3451-4c03-ad7d-018064381f0b\"/><textElement><font fontName=\"Sahadeva\" isBold=\"true\"/></textElement><text><![CDATA[Nacimiento]]></text></staticText><textField><reportElement x=\"370\" y=\"50\" width=\"174\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"1871afc0-5da0-42ae-be02-60a8afd97e34\"/><textElement><font fontName=\"Sahadeva\"/></textElement><textFieldExpression><![CDATA[$P{fecha}]]></textFieldExpression></textField><textField><reportElement x=\"10\" y=\"64\" width=\"280\" height=\"54\" forecolor=\"#FFFFFF\" uuid=\"80bdd84e-0618-4d1c-bc59-7edd047b0c7f\"/><textElement><font fontName=\"Sahadeva\" size=\"30\" isBold=\"true\"/></textElement><textFieldExpression><![CDATA[$P{apellido}]]></textFieldExpression></textField></band></title><detail>";
	        String cabeza_rojo="<?xml version=\"1.0\" encoding=\"UTF-8\"?><!-- Created with Jaspersoft Studio version 6.6.0.final using JasperReports Library version 6.6.0  --><jasperReport xmlns=\"http://jasperreports.sourceforge.net/jasperreports\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd\" name=\"curri_rojo\" pageWidth=\"595\" pageHeight=\"842\" columnWidth=\"555\" leftMargin=\"20\" rightMargin=\"20\" topMargin=\"20\" bottomMargin=\"20\" uuid=\"10ae9809-4469-45d1-b03e-d44106c45f8c\"><property name=\"com.jaspersoft.studio.data.defaultdataadapter\" value=\"One Empty Record\"/><parameter name=\"nombre\" class=\"java.lang.String\"/><parameter name=\"direccion\" class=\"java.lang.String\"/><parameter name=\"tel\" class=\"java.lang.String\"/><parameter name=\"cedula\" class=\"java.lang.String\"/><parameter name=\"fecha\" class=\"java.lang.String\"/><parameter name=\"apellido\" class=\"java.lang.String\"/><parameter name=\"texto\" class=\"java.lang.String\"/><parameter name=\"texto2\" class=\"java.lang.String\"/><parameter name=\"ref_laboral\" class=\"java.lang.String\"/><parameter name=\"ref_personal\" class=\"java.lang.String\"/><parameter name=\"texto3\" class=\"java.lang.String\"/><parameter name=\"conocimiento\" class=\"java.lang.String\"/><queryString><![CDATA[]]></queryString><background><band splitType=\"Stretch\"/></background><title><band height=\"138\" splitType=\"Stretch\"><rectangle><reportElement stretchType=\"RelativeToBandHeight\" x=\"0\" y=\"10\" width=\"555\" height=\"110\" forecolor=\"#CC5852\" backcolor=\"#CC5852\" uuid=\"782e994e-5dc5-4162-a1bc-918c6475ea28\"/></rectangle><textField><reportElement x=\"10\" y=\"17\" width=\"280\" height=\"54\" forecolor=\"#FFFFFF\" backcolor=\"#FFFFFF\" uuid=\"abf7283a-04b2-4133-bbc3-f8cc7e09634c\"/><textElement verticalAlignment=\"Bottom\"><font fontName=\"Sahadeva\" size=\"30\" isBold=\"true\" isItalic=\"false\"/></textElement><textFieldExpression><![CDATA[$P{nombre}]]></textFieldExpression></textField><textField isStretchWithOverflow=\"true\"><reportElement positionType=\"Float\" x=\"370\" y=\"90\" width=\"174\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"961e9723-6d21-4557-ad28-c7cf95045ec4\"/><textElement><font fontName=\"Sahadeva\"/></textElement><textFieldExpression><![CDATA[$P{direccion}]]></textFieldExpression></textField><staticText><reportElement x=\"308\" y=\"90\" width=\"60\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"273479ac-e5b6-465c-97fe-283c972669a3\"/><textElement><font fontName=\"Sahadeva\" isBold=\"true\"/></textElement><text><![CDATA[Dirección]]></text></staticText><staticText><reportElement positionType=\"Float\" x=\"308\" y=\"70\" width=\"60\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"e9112acd-0095-40bf-97ea-ac491caf5cf7\"/><textElement><font fontName=\"Sahadeva\" isBold=\"true\"/></textElement><text><![CDATA[Teléfono]]></text></staticText><textField><reportElement x=\"370\" y=\"70\" width=\"174\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"5b58af78-9fc2-4278-b6c3-bf1877f68584\"/><textElement><font fontName=\"Sahadeva\"/></textElement><textFieldExpression><![CDATA[$P{tel}]]></textFieldExpression></textField><staticText><reportElement positionType=\"Float\" x=\"308\" y=\"30\" width=\"60\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"6d400861-6fca-4e4e-a204-06bcb3543078\"/><textElement><font fontName=\"Sahadeva\" isBold=\"true\"/></textElement><text><![CDATA[Cedula]]></text></staticText><textField><reportElement x=\"370\" y=\"30\" width=\"175\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"e26d465c-b74d-4a79-8b15-047842f994b2\"/><textElement><font fontName=\"Sahadeva\"/></textElement><textFieldExpression><![CDATA[$P{cedula}]]></textFieldExpression></textField><staticText><reportElement positionType=\"Float\" x=\"308\" y=\"50\" width=\"60\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"b2187583-3451-4c03-ad7d-018064381f0b\"/><textElement><font fontName=\"Sahadeva\" isBold=\"true\"/></textElement><text><![CDATA[Nacimiento]]></text></staticText><textField><reportElement x=\"370\" y=\"50\" width=\"174\" height=\"17\" forecolor=\"#FFFFFF\" uuid=\"1871afc0-5da0-42ae-be02-60a8afd97e34\"/><textElement><font fontName=\"Sahadeva\"/></textElement><textFieldExpression><![CDATA[$P{fecha}]]></textFieldExpression></textField><textField><reportElement x=\"10\" y=\"64\" width=\"280\" height=\"54\" forecolor=\"#FFFFFF\" uuid=\"80bdd84e-0618-4d1c-bc59-7edd047b0c7f\"/><textElement><font fontName=\"Sahadeva\" size=\"30\" isBold=\"true\"/></textElement><textFieldExpression><![CDATA[$P{apellido}]]></textFieldExpression></textField></band></title><detail>";
	        String academico="<band height=\"60\" splitType=\"Stretch\"><staticText><reportElement x=\"10\" y=\"0\" width=\"134\" height=\"14\" uuid=\"e37ad0d1-d6b1-4d07-bc99-455c26f399a9\"/><textElement><font fontName=\"Serif\" isBold=\"true\"/></textElement><text><![CDATA[Información Académica]]></text></staticText><textField isStretchWithOverflow=\"true\"><reportElement x=\"20\" y=\"21\" width=\"524\" height=\"20\" uuid=\"b0e4a4ab-b8bb-4470-b9cd-c13b4e7c5a9b\"/><textElement markup=\"html\"><font fontName=\"Sahadeva\"/></textElement><textFieldExpression><![CDATA[$P{texto}]]></textFieldExpression></textField><line><reportElement positionType=\"Float\" x=\"10\" y=\"14\" width=\"534\" height=\"1\" uuid=\"7a4f7c86-f9e4-4665-b2a4-d25705409ac4\"/></line></band>";
	        String exp_laboral="<band height=\"60\" splitType=\"Stretch\"><staticText><reportElement x=\"10\" y=\"0\" width=\"134\" height=\"14\" uuid=\"0baf9ab9-702e-4661-8026-8518a412a085\"/><textElement><font fontName=\"Serif\" isBold=\"true\"/></textElement><text><![CDATA[Experiencia Laboral]]></text></staticText><textField isStretchWithOverflow=\"true\"><reportElement x=\"20\" y=\"21\" width=\"524\" height=\"20\" uuid=\"15af6831-3e60-465b-b659-1b459e611115\"/><textElement><font fontName=\"Sahadeva\"/></textElement><textFieldExpression><![CDATA[$P{texto2}]]></textFieldExpression></textField><line><reportElement positionType=\"Float\" x=\"10\" y=\"14\" width=\"534\" height=\"1\" uuid=\"f0261219-fcd8-421e-982b-1499ed4075b0\"/></line></band>";
	        String refe_laboral="<band height=\"60\" splitType=\"Stretch\"><staticText><reportElement x=\"10\" y=\"0\" width=\"134\" height=\"14\" uuid=\"e14ac3f1-0683-4504-a279-0c001724a945\"/><textElement><font fontName=\"Serif\" isBold=\"true\"/></textElement><text><![CDATA[Referencia Laboral]]></text></staticText><textField isStretchWithOverflow=\"true\"><reportElement x=\"20\" y=\"21\" width=\"524\" height=\"20\" uuid=\"ad9241a3-c250-46d0-b214-463245142f0d\"/><textElement><font fontName=\"Sahadeva\"/></textElement><textFieldExpression><![CDATA[$P{ref_laboral}]]></textFieldExpression></textField><line><reportElement positionType=\"Float\" x=\"10\" y=\"14\" width=\"534\" height=\"1\" uuid=\"645f9400-2f33-4cb3-8472-4a752bceb1c3\"/></line></band>";
	        String refe_personal="<band height=\"60\" splitType=\"Stretch\"><staticText><reportElement x=\"10\" y=\"0\" width=\"134\" height=\"14\" uuid=\"44166034-7ef2-4c41-b264-ff81d27a437b\"/><textElement><font fontName=\"Serif\" isBold=\"true\"/></textElement><text><![CDATA[Referencia Personal]]></text></staticText><textField isStretchWithOverflow=\"true\"><reportElement x=\"20\" y=\"21\" width=\"524\" height=\"20\" uuid=\"d844956c-4873-484d-830d-72079ee77c01\"/><textElement><font fontName=\"Sahadeva\"/></textElement><textFieldExpression><![CDATA[$P{ref_personal}]]></textFieldExpression></textField><line><reportElement positionType=\"Float\" x=\"10\" y=\"14\" width=\"534\" height=\"1\" uuid=\"80991147-2e25-42c8-ad76-8cb227dc9f03\"/></line></band>";
	        String idioma="<band height=\"60\" splitType=\"Stretch\"><staticText><reportElement x=\"10\" y=\"0\" width=\"134\" height=\"14\" uuid=\"e737e452-5ab4-4a78-8cad-d4f675243124\"/><textElement><font fontName=\"Serif\" isBold=\"true\"/></textElement><text><![CDATA[Idioma]]></text></staticText><textField isStretchWithOverflow=\"true\"><reportElement x=\"20\" y=\"21\" width=\"524\" height=\"20\" uuid=\"b0bd7514-9d69-4071-b9e0-eff1eaadc7fe\"/><textElement><font fontName=\"Sahadeva\"/></textElement><textFieldExpression><![CDATA[$P{texto3}]]></textFieldExpression></textField><line><reportElement positionType=\"Float\" x=\"10\" y=\"14\" width=\"534\" height=\"1\" uuid=\"501c56b6-9d90-4447-88d6-601c7f15ba38\"/></line></band>";
	        String conocimientos="<band height=\"60\" splitType=\"Stretch\"><staticText><reportElement x=\"10\" y=\"0\" width=\"134\" height=\"14\" uuid=\"518f95ca-28e1-4fc9-8c21-c566f6e03627\"/><textElement><font fontName=\"Serif\" isBold=\"true\"/></textElement><text><![CDATA[Conocimientos]]></text></staticText><textField isStretchWithOverflow=\"true\"><reportElement x=\"20\" y=\"21\" width=\"524\" height=\"20\" uuid=\"d0abeaa2-0c6d-4f80-a0d5-c85472749092\"/><textElement><font fontName=\"Sahadeva\"/></textElement><textFieldExpression><![CDATA[$P{conocimiento}]]></textFieldExpression></textField><line><reportElement positionType=\"Float\" x=\"10\" y=\"14\" width=\"534\" height=\"1\" uuid=\"b65bfdbb-9e5b-4dbe-9992-8c8b0fd3ab6b\"/></line></band>";
	        String pies="</detail></jasperReport>";

	        String [] variable= new String[6];
	        String [] documento= new String[6];
	        variable[0]=texto;variable[1]=texto2;
	        variable[2]=texto3;variable[3]=ref_laboral;
	        variable[4]=ref_personal;variable[5]=conocimiento;
	        String Resultado=cabeza_rojo;
	        
	        if(diseno.equals("2")){
	        	Resultado=cabeza_azul;	
	        }
	        
	        documento[0]=academico;documento[1]=exp_laboral;
	        documento[2]=idioma;documento[3]=refe_laboral;
	        documento[4]=refe_personal;documento[5]=conocimientos;
	        
	        
	        for(int i=0 ; i<variable.length; i++){
	        	System.out.println("recorrio el for "+(i+1)+" veces");
	        	if(variable[i].equals("") || variable[i].equals(" ")){
	        		System.out.println(variable[0]);
	        		Resultado.concat("");
	        		System.out.println("entro en el if del for "+(i+1));
	        	}else{
	        		System.out.println("entro en el else del for "+(i+1));
	        		Resultado=Resultado+documento[i];
	        	}
	        }
	        Resultado=Resultado+pies;
	        //Resultado.concat(pies);
	        
	        if(archivo.exists()) {
	            bw = new BufferedWriter(new FileWriter(archivo));
	            bw.write(Resultado);
	        } else {
	            bw = new BufferedWriter(new FileWriter(archivo));
	            bw.write(Resultado);
	        }
	        bw.close();
			System.out.println(arch_dir);
	        masterReport = JasperCompileManager.compileReport(arch_dir);
		
        } catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return masterReport;
	}
	public JasperReport ReporteMemo(String id_nombre, String id_perfil, String cargo, String empresa){
		System.err.println("ingreso reporte memo");
		JasperReport masterReport = null;
		
		String encabezado = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><!-- Created with Jaspersoft Studio version 6.6.0.final using JasperReports Library version 6.6.0  --><jasperReport xmlns=\"http://jasperreports.sourceforge.net/jasperreports\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd\" name=\"memo\" pageWidth=\"595\" pageHeight=\"842\" columnWidth=\"555\" leftMargin=\"20\" rightMargin=\"20\" topMargin=\"20\" bottomMargin=\"20\" uuid=\"4760d592-4f7d-4220-b480-3ef4f04995ae\"><property name=\"com.jaspersoft.studio.data.defaultdataadapter\" value=\"One Empty Record\"/><parameter name=\"para\" class=\"java.lang.String\"/><parameter name=\"de\" class=\"java.lang.String\"/><parameter name=\"cargo\" class=\"java.lang.String\"/><parameter name=\"fecha\" class=\"java.lang.String\"/><parameter name=\"asunto\" class=\"java.lang.String\"/><parameter name=\"empresa\" class=\"java.lang.String\"/><parameter name=\"texto\" class=\"java.lang.String\"/><queryString><![CDATA[]]></queryString><background><band splitType=\"Stretch\"/></background><title><band height=\"148\" splitType=\"Stretch\">";
		String medio = "<staticText><reportElement x=\"10\" y=\"70\" width=\"340\" height=\"65\" uuid=\"f6126277-edbc-4ff2-ac86-1c92a4d46abe\"/><textElement><font size=\"50\" isBold=\"true\"/></textElement><text><![CDATA[Memorando]]></text></staticText></band></title><detail><band height=\"172\" splitType=\"Stretch\"><staticText><reportElement x=\"40\" y=\"10\" width=\"80\" height=\"20\" uuid=\"f894cb60-2e5b-4191-9038-177fdc02f5d3\"/><textElement><font size=\"15\" isBold=\"true\"/></textElement><text><![CDATA[Para:]]></text></staticText><staticText><reportElement x=\"40\" y=\"40\" width=\"80\" height=\"20\" uuid=\"b03fbf47-0bae-455a-ac1f-cb7a370c6255\"/><textElement><font size=\"15\" isBold=\"true\"/></textElement><text><![CDATA[De:]]></text></staticText><textField><reportElement x=\"120\" y=\"10\" width=\"210\" height=\"20\" uuid=\"bc26a02f-cae9-44f1-9cf4-9bddb524eca9\"/><textElement><font size=\"15\"/></textElement><textFieldExpression><![CDATA[$P{para}]]></textFieldExpression></textField><textField><reportElement x=\"120\" y=\"40\" width=\"210\" height=\"20\" uuid=\"f89506a7-0bb5-4fe7-a91d-c46a5c5d5cec\"/><textElement><font size=\"15\"/></textElement><textFieldExpression><![CDATA[$P{de}]]></textFieldExpression></textField><staticText><reportElement x=\"40\" y=\"71\" width=\"80\" height=\"20\" uuid=\"aeee8609-a728-4a83-85ba-7cc1eed33c1a\"/><textElement><font size=\"15\" isBold=\"true\"/></textElement><text><![CDATA[Fecha:]]></text></staticText><textField><reportElement x=\"120\" y=\"71\" width=\"210\" height=\"20\" uuid=\"f5151106-9deb-4263-a9f2-14e3af653abc\"/><textElement><font size=\"15\"/></textElement><textFieldExpression><![CDATA[$P{fecha}]]></textFieldExpression></textField><staticText><reportElement x=\"40\" y=\"100\" width=\"80\" height=\"20\" uuid=\"842480c6-906b-4635-9d1f-b325927577d0\"/><textElement><font size=\"15\" isBold=\"true\"/></textElement><text><![CDATA[Re:]]></text></staticText><textField><reportElement x=\"120\" y=\"101\" width=\"210\" height=\"19\" uuid=\"ae901ee4-1c92-4e83-8514-38219b5b19be\"/><textElement><font size=\"15\"/></textElement><textFieldExpression><![CDATA[$P{asunto}]]></textFieldExpression></textField><textField isStretchWithOverflow=\"true\"><reportElement x=\"40\" y=\"141\" width=\"490\" height=\"23\" uuid=\"4f37821e-fab0-4583-afbd-81390ec94a7f\"/><textElement textAlignment=\"Justified\"><font size=\"12\"/></textElement><textFieldExpression><![CDATA[$P{texto}]]></textFieldExpression></textField><line><reportElement x=\"40\" y=\"124\" width=\"490\" height=\"1\" uuid=\"434fa9f4-e73a-4c94-b5c2-4cce651fe41d\"/></line></band><band height=\"93\"><textField><reportElement x=\"315\" y=\"31\" width=\"220\" height=\"20\" uuid=\"cd0945f1-9a36-42a8-9bb7-0ace33b418ea\"/><textElement textAlignment=\"Center\"><font size=\"15\"/></textElement><textFieldExpression><![CDATA[$P{de}]]></textFieldExpression></textField>";
        String fin = "</band></detail></jasperReport>";
        String xcargo = "<textField isStretchWithOverflow=\"true\"><reportElement x=\"325\" y=\"51\" width=\"204\" height=\"20\" uuid=\"39e3a1cf-0f22-4705-9daa-4e3708856ca7\"/><textElement textAlignment=\"Center\"><font size=\"10\"/></textElement><textFieldExpression><![CDATA[$P{cargo}]]></textFieldExpression></textField>";
		String xempresa = "<textField><reportElement x=\"320\" y=\"10\" width=\"210\" height=\"50\" uuid=\"c3c266ed-cc82-4ca3-a9cf-7fe31c6515fe\"/><textElement textAlignment=\"Right\"><font size=\"15\" isItalic=\"true\"/></textElement><textFieldExpression><![CDATA[$P{empresa}]]></textFieldExpression></textField>";
        
		try {
        	File archivo = new File(sacar(String.valueOf(Reporte.class.getResource("")))+id_nombre+id_perfil+"memo.jrxml");
			String arch_dir=sacar(String.valueOf(Reporte.class.getResource("")))+id_nombre+id_perfil+"memo.jrxml";
			System.err.println(archivo);
	        BufferedWriter bw;
        	if(empresa==""){
		        if(cargo==""){
		        	// Se genera sin empresa y sin cargo
		        	if(archivo.exists()) {
			            bw = new BufferedWriter(new FileWriter(archivo));
			            bw.write(encabezado+medio+fin);
			        }else{
			        	 bw = new BufferedWriter(new FileWriter(archivo));
				         bw.write(encabezado+medio+fin);
			        }
			        bw.close();
		        }else{
		        	// Se genera sin empresa y con cargo
		        	if(archivo.exists()) {
			            bw = new BufferedWriter(new FileWriter(archivo));
			            bw.write(encabezado+medio+xcargo+fin);
			        }else{
			        	 bw = new BufferedWriter(new FileWriter(archivo));
				         bw.write(encabezado+medio+xcargo+fin);
			        }
			        bw.close();
		        }
        	}else{
        		if(cargo==""){
        			// Se genera con empresa y sin cargo
        			if(archivo.exists()) {
        	            bw = new BufferedWriter(new FileWriter(archivo));
        	            bw.write(encabezado+xempresa+medio+fin);
        	        }else{
        	        	 bw = new BufferedWriter(new FileWriter(archivo));
        		         bw.write(encabezado+xempresa+medio+fin);
        	        }
        	        bw.close();
        		}else{
        			// Se genera con empresa y con cargo
        			if(archivo.exists()) {
        	            bw = new BufferedWriter(new FileWriter(archivo));
        	            bw.write(encabezado+xempresa+medio+xcargo+fin);
        	        }else{
        	        	 bw = new BufferedWriter(new FileWriter(archivo));
        		         bw.write(encabezado+xempresa+medio+xcargo+fin);
        	        }
        	        bw.close();
        		}
        	}
        	
	       
          //------------------Aqui se compila el .jrxml-------------------------------------------
			masterReport = JasperCompileManager.compileReport(arch_dir);
	//---------------------------------------------------------------------------------------------------------
		} catch (JRException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return masterReport;
	}
	
	
	
	
}
