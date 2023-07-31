
    
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="users.User" %>
<%@ page import="users.UserDao" %>
 <%@page import="users.User"%>
  <%@page import="products.Productdao"%>
 
<!DOCTYPE html>
<html>
    <% String pid = request.getParameter("pid"); %>
    <%-- Register the user --%>
    <% 
    Productdao pDao = new Productdao();
   int newp = pDao.productdelete(pid);
 %>

<body>
  <%-- Display registration status --%>
    <% if (newp >=1) { %>
        <h2>success!</h2>
        
    <%    
    } else { %>
        <h2>failed!</h2>
    <% } %>
</body>
</html>
    