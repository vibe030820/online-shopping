<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import="users.User" %>
<%@ page import="orders.Orderdao" %>
<%@ page import="orders.Orders" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="icon" href="https://getbootstrap.com/docs/4.0/assets/img/favicons/favicon.ico">

    <title>Online Shopping</title>

    <link rel="canonical" href="#">

    <!-- Bootstrap core CSS -->
    <link href="./asset/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./asset/album.css" rel="stylesheet">
  <style type="text/css">@font-face { font-family: Roboto; src: url("chrome-extension://mcgbeeipkmelnpldkobichboakdfaeon/css/Roboto-Regular.ttf"); }</style></head>

</head>
<head>
    <title>View Cart</title>
   <jsp:include page="header.jsp"></jsp:include>
</head>
<%
  // Retrieve form data
  String userId = request.getParameter("userId");
  Orderdao od = new Orderdao();
  ArrayList<Orders> ordersList = od.viewcart(userId);
%>

<% if (ordersList != null && !ordersList.isEmpty()) { %>
    <% for (Orders order : ordersList) { %>
        <p>Order ID: <%= order.getOrderid() %></p>
        <p>Product ID: <%= order.getPid() %></p>
        <p>Price: <%= order.getPrice() %></p>
        <% } %>
<button type="button" onclick="window.location.href='/cart'" class="btn btn-primary">HOME</button>
    
<% } else { %>
    <p>No orders found.</p>
    <button type="button" onclick="window.location.href='/cart'" class="btn btn-primary">HOME</button>
    
<% } 
%>
