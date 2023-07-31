

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.razorpay.RazorpayClient" %>
<%@ page import="com.razorpay.Order" %>
<%@ page import="com.razorpay.RazorpayException" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="javax.crypto.Mac" %>
<%@ page import="javax.crypto.spec.SecretKeySpec" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.security.MessageDigest" %>


<%
    // Retrieve the payment response parameters
    String razorpayPaymentId = request.getParameter("razorpay_payment_id");
    String razorpayOrderId = request.getParameter("razorpay_order_id");
    String razorpaySignature = request.getParameter("razorpay_signature");
System.out.println(razorpayPaymentId);
System.out.println(razorpayOrderId);
System.out.println(razorpaySignature);
    // Verify the payment signature
    try {
        String secretKey = "Oq0aUJcJ9wLUouXC0AqKrv2E"; // Replace with your actual Razorpay API secret key

        // Concatenate the payment ID and order ID
        String data = razorpayOrderId + "|" + razorpayPaymentId;

        // Compute SHA-256 hash using the secret key
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(secretKey.getBytes());
        byte[] secretKeyBytes = md.digest();

        // Compute HMAC-SHA256 signature using the secret key bytes
        SecretKeySpec secretKeySpec = new SecretKeySpec(secretKeyBytes, "HmacSHA256");
        Mac sha256Hmac = Mac.getInstance("HmacSHA256");
        sha256Hmac.init(secretKeySpec);
        byte[] signatureBytes = sha256Hmac.doFinal(data.getBytes());
        String computedSignature = Base64.getEncoder().encodeToString(signatureBytes);

        // Compare the computed signature with the provided signature
        boolean signatureValid = computedSignature.equals(razorpaySignature);

        if (signatureValid) {
            // Payment signature is valid, process the payment and update your database
            // Perform any necessary business logic and database operations here
            
            // Display a success message to the user
            out.println("<h1>Payment Successful!</h1>");
        } else {
            // Payment signature is invalid, handle the error
            out.println("<h1>Payment Failed: Invalid Signature</h1>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        // Handle the exception appropriately
        out.println("<h1>Payment Failed: Error occurred while processing the payment</h1>");
    }
%>
