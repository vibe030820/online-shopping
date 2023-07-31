<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="users.User" %>
<%@ page import="users.UserDao" %>

<%
  // Retrieve form data
  String userId = request.getParameter("userId");
  String password = request.getParameter("password");
  UserDao ud = new UserDao();
  String u=ud.doHashing(password);
  User user = ud.login(userId, u);
%>

  <%-- Access the user object to perform further operations --%>
  <%-- For example, you can display a success message or redirect to another page --%>
  <% if (user != null) { 
  		session.setAttribute("userId", user.getUserId());
  		response.setContentType("text/plain");
  		response.getWriter().write("1");
  		//request.getRequestDispatcher("/cart").forward(request, response);
  } else {   		response.setContentType("text/plain");
	response.getWriter().write("0"); } %>

