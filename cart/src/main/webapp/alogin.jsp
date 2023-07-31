<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="users.User" %>
<%@ page import="users.UserDao" %>
<%@ page import="admin.Admindao" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <% String id = request.getParameter("userid");
       String password = request.getParameter("password");
      // System.out.println(id+"---------"+password);
       // Register the user
       Admindao adminDao = new Admindao();
       User newUser = adminDao.adminlogin(id, password);
      // System.out.println(newUser);
    %>

    <%-- Display registration status --%>
    <% if (null != newUser) { %>
    	session.setAttribute("role","admin");
        <h2>Login successful!</h2>
        <p>Welcome, <%= newUser.getName() %>!</p>
        
    <% 
     response.sendRedirect("admindashboard.jsp");
    
    } else if(newUser ==null) { %>
        <h2>Login failed!</h2>
        <p>Failed to Login as admin, Please try again.</p>
    <% } %>
</body>
</html>
