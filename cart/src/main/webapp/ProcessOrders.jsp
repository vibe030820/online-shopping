
    
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="users.User" %>
<%@ page import="users.UserDao" %>
 <%@page import="users.User"%>
  <%@page import="products.Productdao"%>
  <%@ page import="orders.Orderdao" %>
 
<!DOCTYPE html>
<html>
    <% String pid = request.getParameter("pid"); %>
    <% String status = request.getParameter("status"); %>
    <%-- Register the user --%>
    <% 
    Orderdao od = new Orderdao();
    int ordersList = od.adminstatusupdate(pid, status);
 %>

<body>
  <%-- Display registration status --%>
    <% if (ordersList >= 1  ) { %>
        <h2>success!</h2>
        
    <%    
    } else { %>
        <h2>failed!</h2>
    <% } %>
</body>
</html>
    