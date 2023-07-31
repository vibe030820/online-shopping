<%@page import="com.google.gson.Gson"%>
<%@page import="users.User"%>
<%@page import="users.UserDao"%>
<%@page import="users.UserDao"%>
<%@page import="products.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="products.Productdao"%>
<%@ page language="java" contentType="text/html"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://getbootstrap.com/docs/4.0/assets/img/favicons/favicon.ico">

    <title>Online Shopping</title>

    <link rel="canonical" href="#">

    <!-- Bootstrap core CSS -->
    <link href="./asset/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./asset/album.css" rel="stylesheet">
  <style type="text/css">@font-face { font-family: Roboto; src: url("chrome-extension://mcgbeeipkmelnpldkobichboakdfaeon/css/Roboto-Regular.ttf"); }</style></head>

  <body>

	<%

	
			Productdao pd = new Productdao();
			ArrayList<Products> pList =  pd.getProductList();
	%>
 <jsp:include page="header.jsp"></jsp:include>

    <main role="main">

      <section class="jumbotron text-center">
        <div class="container">
          <h1 class="jumbotron-heading">Apparel Shopping</h1>
          <p class="lead text-muted">Discover a wide range of stylish and trendy clothing options for every occasion.</p>
         
          <p>
            <%if(null!=session.getAttribute("userId")){ %>   
            <a href="viewOrders.jsp?userId=<%=session.getAttribute("userId") %>" class="btn btn-primary my-2">OrderHistory</a>
            <a href="viewCart.jsp?userId=<%=session.getAttribute("userId") %>"  class="btn btn-secondary my-2">View Cart<i id="cartItemNo"></i></a>
       <%} %>
          </p>
            
        </div>
      </section>

      <div class="album py-5 bg-light">
        <div class="container">

          <div class="row">
          	<%
			
				for (int i=0; i<pList.size();i++){
					Products p = pList.get(i); 
					System.out.println(p);
					Gson g = new Gson();
					String prodJsonObj =g.toJson(p);
			
			%>
          <div class="col-md-4">
              <div class="card mb-4 box-shadow">
                <img class="card-img-top"  src="<%=p.getImgurl()%>" alt="Product Image" class="col-md-none">                
                <div class="card-body">
                  <p class="card-text"><%= p.getName()%></p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary"><%=p.getPrice() %></button>
                      <button type="button" class="btn btn-sm btn-outline-secondary"><%=p.getDetails()%></button>
                      <button type="button" class="btn btn-primary" onclick="addToCart('<%=p%>')">Add To Cart</button>
                    </div>
                    <small class="text-muted"><%=p.getCat_id()%></small>
                  </div>
                </div>
              </div>
            </div>
            <%} %>
          </div>
          </div> 
      </div>


    </main>

    <footer class="text-muted">
      <div class="container">
        <p class="float-right">
          <a href="#">Back to top</a>
        </p>
        <p>Apparel Shopping @ampmclothing.com !</p>
        <p>New to Apparel shopping? <a href="#">Explore our Collections</a> or <a href="#">contact us</a>for assistance.</p>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	var cartOrders = '';
    	
    });
    
    var cartItem = [];
    function addToCart(p){
    	cartItem.push(p);
    	$('#cartItemNo').html(cartItem.length);
    }
    
    
    </script>
  

<script>
		
	</script><svg xmlns="http://www.w3.org/2000/svg" width="348" height="225" viewBox="0 0 348 225" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs><text x="0" y="17" style="font-weight:bold;font-size:17pt;font-family:Arial, Helvetica, Open Sans, sans-serif">Thumbnail</text></svg></body></html>