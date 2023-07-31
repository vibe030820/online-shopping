<%@ page import="java.util.TreeMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Enumeration" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%
    Enumeration<String> paramNames = request.getParameterNames();
    Map<String, String[]> mapData = request.getParameterMap();
    TreeMap<String, String> parameters = new TreeMap<String, String>();
    String paytmChecksum = "";

    while (paramNames.hasMoreElements()) {
        String paramName = paramNames.nextElement();
        parameters.put(paramName, mapData.get(paramName)[0]);
    }

    // Define your PaytmConstants here
    String MID = "ABC123456789";
    String MERCHANT_KEY = "MID12345678901234";
    String INDUSTRY_TYPE_ID = "Retail";
    String CHANNEL_ID = "WEB";
    String WEBSITE = "WEBSTAGING";
    String PAYTM_URL = "https://securegw-stage.paytm.in/theia/processTransaction";

    parameters.put("MID", MID);
    parameters.put("CHANNEL_ID", CHANNEL_ID);
    parameters.put("INDUSTRY_TYPE_ID", INDUSTRY_TYPE_ID);
    parameters.put("WEBSITE", WEBSITE);
    parameters.put("MOBILE_NO", "7000787954");
    parameters.put("EMAIL", "mr.chhotelal09@gmail.com");
    parameters.put("CALLBACK_URL", "/cart/buyNow.jsp"); // if payment is canceled then return this page

    StringBuilder outputHtml = new StringBuilder();
    outputHtml.append("<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>");
    outputHtml.append("<html>");
    outputHtml.append("<head>");
    outputHtml.append("<title>Merchant Check Out Page</title>");
    outputHtml.append("</head>");
    outputHtml.append("<body>");
    outputHtml.append("<center><h1>Please do not refresh this page...</h1></center>");
    outputHtml.append("<form method='post' action='" + PAYTM_URL + "' name='f1'>");
    outputHtml.append("<table border='1'>");
    outputHtml.append("<tbody>");

    for (Map.Entry<String, String> entry : parameters.entrySet()) {
        String key = entry.getKey();
        String value = entry.getValue();
        outputHtml.append("<input type='hidden' name='" + key + "' value='" + value + "'>");
    }

    outputHtml.append("</tbody>");
    outputHtml.append("</table>");
    outputHtml.append("<script type='text/javascript'>");
    outputHtml.append("document.f1.submit();");
    outputHtml.append("</script>");
    outputHtml.append("</form>");
    outputHtml.append("</body>");
    outputHtml.append("</html>");

    out.println(outputHtml);
%>
