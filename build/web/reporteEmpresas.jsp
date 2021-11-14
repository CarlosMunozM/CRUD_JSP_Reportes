<%-- 
    Document   : reporteEmpresas
    Created on : 11/11/2021, 11:31:37
    Author     : Carlos
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Clases.ConexionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="javax.servlet.ServletResponse"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            /*
            RECORDAR
            <jasperReport xmlns="http://jasperreports.sourceforge.net/jasperreports" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd" name="null" language="java" pageWidth="595" pageHeight="842" columnWidth="555" leftMargin="20" rightMargin="20" topMargin="20" bottomMargin="20" uuid="b8e5c7b3-ff91-45f5-9ffe-4653c3bf4834">
            
            Colocar language="java" en el XML del reporte
             */

            ConexionBD cnn = new ConexionBD();
            Connection con = cnn.getConexion();
            try {

                File reportFile = new File(application.getRealPath("reportes/rptEmpresas.jasper"));
                Map<String, Object> parametros = new HashMap<String, Object>();

                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros, con);

                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream outputStream = response.getOutputStream();
                outputStream.write(bytes, 0, bytes.length);
                outputStream.flush();
                outputStream.close();
            } catch (Exception e) {
                out.println(e);
                //System.out.println(e.getMessage());
            }
        %>
    </body>
</html>
