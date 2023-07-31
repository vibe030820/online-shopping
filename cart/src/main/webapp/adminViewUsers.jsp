<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="users.User" %>
<%@ page import="users.UserDao" %>
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
</head>

<body>
    <div class="container">
        <jsp:include page="header.jsp"></jsp:include>
        <h1>OrderList</h1>
        <%
            // Retrieve form data
            UserDao od = new UserDao();
            ArrayList<User> UserList = od.getUserList();
        %>

      <%
if (UserList != null && !UserList.isEmpty()) {
    for (User user : UserList) {
%>
        <p>Name: <%= user.getName() %></p>
        <p>Address: <%= user.getAddress() %></p>
        <p>Email: <%= user.getEmail() %></p>
        <p>Phno: <%= user.getPhno() %></p>
        <p>UserId: <%= user.getUserId() %></p>
        <p>Password: <%= user.getPassword() %></p>
<%
    }
} else {
%>
    <p>No users found.</p>
<%
}
%>
<button type="button" onclick="window.location.href='admindashboard.jsp'" class="btn btn-primary">HOME</button>


    </div>
    <!-- Bootstrap core JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
