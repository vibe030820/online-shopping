<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<% 
	  	session.setAttribute("userId", null);
  		session.invalidate();
  		response.sendRedirect("/cart");
  %>
</body>
</html>