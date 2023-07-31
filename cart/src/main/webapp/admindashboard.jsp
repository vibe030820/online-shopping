<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
 <jsp:include page="header.jsp"></jsp:include>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h1>Welcome, Admin!</h1>
    <h2>Product Management:</h2>
    <p><a href="adminAddProduct.jsp">Add Product</a></p>
    <p><a href="adminDeleteProduct.jsp">Delete Product</a></p>
    <p><a href="adminEditInventory.jsp">Edit Inventory</a></p>
    
    <h2>Order Management:</h2>
    <p><a href="adminViewOrders.jsp">View Orders</a></p>
    <p><a href="adminProcessOrders.jsp">Process Orders</a></p>
    
    <h2>Customer Management:</h2>
    <p><a href="adminViewUsers.jsp">View Users</a></p>
    <br>
     <p><a href="adminlogout.jsp">Logout</a></p>
</body>
</html>
