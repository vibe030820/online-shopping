
    
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="users.User" %>
<%@ page import="users.UserDao" %>
 <%@page import="users.User"%>
  <%@page import="products.Productdao"%>
 
<!DOCTYPE html>
<html>

  <% String pname = request.getParameter("pname"); %>
    <% String pid = request.getParameter("pid"); %>
    <% String cat_id = request.getParameter("cat_id"); %>
    <% String price = request.getParameter("price"); %>
    <% String details = request.getParameter("details"); %>
    <% String inventory = request.getParameter("inventory"); %>
<%String imgurl=request.getParameter("imgurl"); %>
    <%-- Register the user --%>
    <% 
    Productdao pDao = new Productdao();
   int newp = pDao.productupdate(pname,pid,cat_id,price,details,inventory,imgurl);
 %>

<body>
  <%-- Display registration status --%>
    <% if (newp > 1) { %>
        <h2>success!</h2>
        
    <%    
    } else { %>
        <h2>failed!</h2>
    <% } %>
</body>
</html>
    