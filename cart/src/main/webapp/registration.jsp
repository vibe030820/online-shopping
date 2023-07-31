
    
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="users.User" %>
<%@ page import="users.UserDao" %>
 <%@page import="users.User"%>
<!DOCTYPE html>
<html>

  <% String name = request.getParameter("name"); %>
    <% String address = request.getParameter("address"); %>
    <% String email = request.getParameter("email"); %>
    <% String phno = request.getParameter("phno"); %>
    <% String userId = request.getParameter("userId"); %>
    <% String password = request.getParameter("password"); %>

    <%-- Register the user --%>
    
    <% 
    UserDao userDao = new UserDao();
    String u=userDao.doHashing(password);
   User newUser = userDao.registerUser(name, address, email, phno, userId, u);
 %>

<body>
  <%-- Display registration status --%>
   <% if (newUser != null) { %>
    <h2>Registration successful!</h2>
    <p>Thank you for registering, <%= newUser.getName() %>!</p>
    <p>Your user ID: <%= newUser.getUserId() %></p>
 <p>Please wait, you will be redirected in 5 seconds...</p>
  <p>Then Login to continue Shopping</p>
    <script>
        setTimeout(function() {
            window.location.href = "/cart";
        }, 5000);
    </script>
<% } else { %>
    <h2>Registration failed!</h2>
    <p>Failed to register the user. Please try again.</p>
    <script>
        setTimeout(function() {
            window.location.href = "/cart/regform.jsp";
        }, 5000);
    </script>
<% } %>

</body>
</html>
    