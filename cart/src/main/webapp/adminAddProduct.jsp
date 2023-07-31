<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
 <jsp:include page="header.jsp"></jsp:include>
<div class="container">
<div class="col-md-10">
<form action="addproduct.jsp" method="post" id="registrationForm">
	<div style="text-align: Center;"><h3>Add Product</h3></div>
    <div class="form-group">
      <label for="pname" >PName:</label>
      <input type="text" class="form-control" id="pname" name="pname" required>
    </div>
    <div class="form-group">
      <label for="pid" >Pid:</label>
      <input type="text" class="form-control" id="pid" name="pid" required>
    </div>
    <div class="form-group">
      <label for="cat_id" >Phone CategoryId :</label>
      <input type="text" class="form-control" id="cat_id" name="cat_id" required>
    </div>
    <div class="form-group">
      <label for="price" >Price:</label>
      <input type="text" class="form-control" id="price" name="price" required>
    </div>
    <div class="form-group">
      <label for="details" >Details:</label>
      <input type="text" class="form-control" id="details" name="details" required>
    </div>
    <div class="form-group">
      <label for="inventory" >Inventory:</label>
      <input type="text" class="form-control" id="inventory" name="inventory" required>
    </div>
    <div class="form-group">
      <label for="imgurl" >ImgURl:</label>
      <input type="text" class="form-control" id="imgurl" name="imgurl" required>
    </div>
    <button type="submit" class="btn btn-primary">Register</button>
  </form>
 </div> 
  
    <footer class="text-muted">
      <div class="container">
        <p class="float-right">
          <a href="#">Back to top</a>
        </p>
        <p>Apparel Shopping @ampmclothing.com !</p>
        <p>New to Apparel shopping? <a href="#">Explore our Collections</a> or <a href="#">contact us</a>for assistance.</p>
      </div>
    </footer>
</div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./asset/jquery-3.2.1.slim.min.js.download" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="./asset/popper.min.js.download"></script>
    <script src="./asset/bootstrap.min.js.download"></script>
    <script src="./asset/holder.min.js.download"></script>
  
</body>
</html>