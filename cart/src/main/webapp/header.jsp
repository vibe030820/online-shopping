<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="users.User"%>
<%@page import="users.UserDao"%>
    
    <%
    
	String userId = (String) session.getAttribute("userId");
	User u = null;
	if (userId !=null){
		UserDao ud = new UserDao();
		 u = ud.getUser(userId);
		 
	}
    
    %>
    <header>
      <div class="collapse bg-dark" id="navbarHeader">
        <div class="container">
          <div class="row">
            <div class="col-sm-8 col-md-7 py-4">
              <h4 class="text-white">ampmclothing.com</h4>
              <p class="text-muted">We care,design,manufacture about the things u need to cover yourself 24/7</p>
            </div>
           <div class="col-sm-4 offset-md-1 py-4">
  <h4 class="text-white"><% if(null!=userId){ out.println(null!=u.getName()?u.getName():"LOGIN");} %></h4>
 
    <ul class="list-unstyled">
     <%if(null==userId){ %>
    <li><a href="#" onclick="showLoginForm()" class="text-white">Already a user?</a></li>
    <li><a href="regform.jsp" class="text-white">Create a new account!</a></li>
    <%} %>
    <li><a href="#" onclick="resetPassword()" class="text-white">Forgot Password!!</a></li>
      <%if(null!=userId){ %>
        <li><a href="logout.jsp" class="text-white">Logout</a></li>
        <%} %>
        <%if(null==userId){ %>
         <li><a href="adminlogin.jsp" class="text-white">AdminLogin</a></li>
        <%} %>
  </ul>

  <form id="loginForm" style="display: none;">
    <div class="form-group">
      <label for="userId" class="text-white">UserId:</label>
      <input type="text" class="form-control" id="userId" name="userId" required>
    </div>
    <div class="form-group">
      <label for="password" class="text-white">Password:</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <button type="button" onclick="login()" class="btn btn-primary">login</button>
  </form>
</div>

<form action="reset.jsp" method="post" id="resetForm" style="display: none;">
    <div class="form-group">
      <label for="userId" class="text-white">UserId:</label>
      <input type="text" class="form-control" id="userId" name="userId" required>
    </div>
    <div class="form-group">
      <label for="password" class="text-white">Password:</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <button type="submit" class="btn btn-primary">Reset</button>
  </form>
<script>

  function showLoginForm() {
    var loginForm = document.getElementById("loginForm");
   // var registrationForm = document.getElementById("registrationForm");
    var resetForm = document.getElementById("resetForm");

    loginForm.style.display = "block";
 //   registrationForm.style.display = "none";
    resetForm.style.display = "none";
  }

  function showRegistrationForm() {
    var loginForm = document.getElementById("loginForm");
    //var registrationForm = document.getElementById("registrationForm");
    var resetForm = document.getElementById("resetForm");

    loginForm.style.display = "none";
    //registrationForm.style.display = "block";
    resetForm.style.display = "none";
  }
  function resetPassword() {
	    var resetForm = document.getElementById("resetForm");
	    var loginForm = document.getElementById("loginForm");
	    //var registrationForm = document.getElementById("registrationForm");
	    
	    loginForm.style.display = "none";
	  //  registrationForm.style.display = "none";
	    resetForm.style.display = "block";}
  
  function login() {
	    var userId = $("#userId").val();
	    var password = $("#password").val();

	    $.ajax({
	        type: "POST",
	        url: "loginValidate.jsp",
	        data: {
	        	"userId" : userId,
	    		"password" : password
	        },
	        dataType: "json",
	        success: function(d){
	        	if(d==0)
	            	alert("Login Failed");
	        	else
	        		location.reload();
	        }
	  });
	  }
  
</script>


            </div>
          </div>
        </div>
      
    <div class="navbar navbar-dark bg-dark box-shadow">
  <div class="container d-flex justify-content-between">
    <a href="#" class="navbar-brand d-flex align-items-center">
      <img src="logo.png" height="40" width="60">
      <strong>Welcome</strong>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>
</div>

    </header>
        
    
