<%@ page import="com.paytm.pg.merchant.*" %>  
<%@ page import="java.util.TreeMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Enumeration" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%!
  public class PaytmConstants {
    public final static String MID = "put your mid";
    public final static String MERCHANT_KEY = "put your merchant id";
    public final static String INDUSTRY_TYPE_ID = "Retail";
    public final static String CHANNEL_ID = "WEB";
    public final static String WEBSITE = "WEBSTAGING";
    public final static String PAYTM_URL = "put paytm url";
  }
%>

<% 
  Enumeration<String> paramNames = request.getParameterNames();
  Map<String, String[]> mapData = request.getParameterMap();
  TreeMap<String, String> parameters = new TreeMap<String, String>();
  String paytmChecksum = "";
  while (paramNames.hasMoreElements()) {
    String paramName = paramNames.nextElement();
    if (paramName.equals("CHECKSUMHASH")) {
      paytmChecksum = mapData.get(paramName)[0];
    } else {
      parameters.put(paramName, mapData.get(paramName)[0]);
    }
  }
  boolean isValidChecksum = false;
  String outputHTML = "";
  try {
    isValidChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY, parameters, paytmChecksum);
    if (isValidChecksum && parameters.containsKey("RESPCODE")) {
      if (parameters.get("RESPCODE").equals("01")) {
        outputHTML = parameters.toString();
%>
        <h2>Your Payment Has Been Done Successfully</h2>
<%
        Enumeration<String> aa = request.getParameterNames();
        while (aa.hasMoreElements()) {
          String a = aa.nextElement();
%>
          <%= a %>
<%
        }
      } else {
        outputHTML = "<b>Payment Failed.</b>";
        Enumeration<String> aa = request.getParameterNames();
        while (aa.hasMoreElements()) {
          String a = aa.nextElement();
          out.println(a);
        }
      }
    } else {
      outputHTML = "<b>Checksum mismatched.</b>";
    }
  } catch (Exception e) {
    outputHTML = e.toString();
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%= outputHTML %>
</body>
</html>
