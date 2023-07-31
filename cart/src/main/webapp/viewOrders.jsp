<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <style type="text/css">@font-face { font-family: Roboto; src: url("chrome-extension://mcgbeeipkmelnpldkobichboakdfaeon/css/Roboto-Regular.ttf"); }</style>
    <style type="text/css">
        .order-card {
            display: flex;
            height: 100px;
            align-items: center;
            margin-bottom: 20px;
        }

        .product-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-left: 0px;
        }
    </style>
</head>

<body>
    <div class="container">
        <jsp:include page="header.jsp"></jsp:include>
        <h1>Order History</h1>
        <br>
        <br>
        <br>
        <% 
            // Retrieve form data
            String userId = request.getParameter("userId");
            Orderdao od = new Orderdao();
            ArrayList<Orders> ordersList = od.vieworders(userId);
        %>

        <div class="order-history">
            <% if (ordersList != null && !ordersList.isEmpty()) { %>
                <% for (Orders order : ordersList) { %>
                    <div class="order-card">
                        <div class="card">
                            <div class="card-header">
                                Order ID: <%= order.getOrderid() %>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-8">
                                        <p>Product ID: <%= order.getPid() %></p>
                                        <p>Price: <%= order.getPrice() %></p>
                                        <p>Status: <%= order.getStatus() %></p>
                                    </div>
                                    <div class="col-md-4">
                                        <img src="https://static.zara.net/photos///2023/V/0/2/p/0761/438/251/2/w/463/0761438251_2_5_1.jpg?ts=1674145336175" alt="Product Image" class="product-image">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <% } %>
            <% } else { %>
                <p>No orders found.</p>
            <% } %>
        </div>
<br>
<br>
        <button type="button" onclick="window.location.href='/cart'" class="btn btn-primary">HOME</button>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
