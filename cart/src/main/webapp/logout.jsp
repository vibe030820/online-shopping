<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="users.User" %>
<%@ page import="users.UserDao" %>

<%
  // Retrieve form data
  String userId = (String)session.getAttribute("userId");

%>

  <%-- Access the user object to perform further operations --%>
  <%-- For example, you can display a success message or redirect to another page --%>
  <% if (userId != null) { 
	  	session.setAttribute("userId", null);
  		session.invalidate();
  		response.sendRedirect("/cart");
  }  %>

