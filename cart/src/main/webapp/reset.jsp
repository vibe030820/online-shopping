<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="users.User" %>
<%@ page import="users.UserDao" %>
<!DOCTYPE html>
<html>
<%
  String userId = request.getParameter("userId");
  String password = request.getParameter("password");
  UserDao userDao = new UserDao();
  User user = userDao.updatePassword(userId, password);
%>
<body>
  <%-- Check if password was successfully updated --%>
  <% if (user != null) { %>
    <h1>Password updated successfully!</h1>
    <p>Your password has been updated for user ID: <%= user.getUserId() %>.</p>
  <% } else { %>
    <h1>Password update failed!</h1>
    <p>Invalid credentials or an error occurred during password update.</p>
  <% } %>
</body>
</html>
