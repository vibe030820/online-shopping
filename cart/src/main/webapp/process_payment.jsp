<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.razorpay.RazorpayClient" %>
<%@ page import="com.razorpay.Order" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="com.razorpay.RazorpayException" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="javax.crypto.Mac" %>
<%@ page import="javax.crypto.spec.SecretKeySpec" %>
<%@ page import="org.apache.commons.codec.binary.Hex" %>

<%
    RazorpayClient razorpayClient = new RazorpayClient("rzp_test_f5bn7PCjRUkuOL", "Oq0aUJcJ9wLUouXC0AqKrv2E");

    String orderId = request.getParameter("order_id");
    String paymentId = request.getParameter("razorpay_payment_id");
    String signature = request.getParameter("razorpay_signature");

    try {
        Order order = razorpayClient.orders.fetch(orderId);
        JSONObject orderJson = order.toJson();

        // Construct the verification string
        String verificationString = orderId + "|" + paymentId;
        String secretKey = "Oq0aUJcJ9wLUouXC0AqKrv2E";

        // Calculate the HMAC SHA256 hash of the verification string using the secret key
        Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
        SecretKeySpec secretKeySpec = new SecretKeySpec(secretKey.getBytes(), "HmacSHA256");
        sha256_HMAC.init(secretKeySpec);
        byte[] hmacBytes = sha256_HMAC.doFinal(verificationString.getBytes());
        String calculatedSignature = Hex.encodeHexString(hmacBytes);

        // Verify the payment signature
        boolean isSignatureValid = calculatedSignature.equals(signature);

        if (isSignatureValid) {
            // Payment is successful
            out.println("<h2>Payment successful!</h2>");
            out.println("<p>Order ID: " + orderId + "</p>");
            out.println("<p>Payment ID: " + paymentId + "</p>");
            out.println("<p>Signature: " + signature + "</p>");

            // Perform further actions like updating the order status, saving payment details, etc.
        } else {
            // Payment signature verification failed
            out.println("<h2>Payment verification failed!</h2>");
        }
    } catch (RazorpayException e) {
        e.printStackTrace();
        out.println("<h2>Error occurred while processing the payment.</h2>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h2>Error occurred while calculating the signature.</h2>");
    }
%>
