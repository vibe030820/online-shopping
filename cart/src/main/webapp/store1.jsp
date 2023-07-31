<%@page import="users.User"%>
<%@page import="users.UserDao"%>
<%@page import="users.UserDao"%>
<%@page import="products.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="products.Productdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0049)https://getbootstrap.com/docs/4.0/examples/album/ -->
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
			String userId = (String) session.getAttribute("userid");
	User u;
			if (userId !=null){
				UserDao ud = new UserDao();
				 u = ud.getUser(userId);
			}
	
			Productdao pd = new Productdao();
			ArrayList<Products> pList =  pd.getProductList();
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
  <h4 class="text-white">LOGIN</h4>
  <ul class="list-unstyled">
    <li><a href="#" onclick="showLoginForm()" class="text-white">Already a user?</a></li>
    <li><a href="regform.jsp" class="text-white">Create a new account!</a></li>
    <li><a href="#" onclick="resetPassword()" class="text-white">Forgot Password!!</a></li>
  </ul>
  <form action="login.jsp" method="post" id="loginForm" style="display: none;">
    <div class="form-group">
      <label for="userId" class="text-white">UserId:</label>
      <input type="text" class="form-control" id="userId" name="userId" required>
    </div>
    <div class="form-group">
      <label for="password" class="text-white">Password:</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <button type="submit" class="btn btn-primary">Login</button>
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
    var registrationForm = document.getElementById("registrationForm");
    var resetForm = document.getElementById("resetForm");

    loginForm.style.display = "block";
    registrationForm.style.display = "none";
    resetForm.style.display = "none";
  }

  function showRegistrationForm() {
    var loginForm = document.getElementById("loginForm");
    var registrationForm = document.getElementById("registrationForm");
    var resetForm = document.getElementById("resetForm");

    loginForm.style.display = "none";
    registrationForm.style.display = "block";
    resetForm.style.display = "none";
  }
  function resetPassword() {
	    var resetForm = document.getElementById("resetForm");
	    var loginForm = document.getElementById("loginForm");
	    var registrationForm = document.getElementById("registrationForm");
	    
	    loginForm.style.display = "none";
	    registrationForm.style.display = "none";
	    resetForm.style.display = "block";}
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

    <main role="main">

      <section class="jumbotron text-center">
        <div class="container">
          <h1 class="jumbotron-heading">Apparel Shopping</h1>
          <p class="lead text-muted">Discover a wide range of stylish and trendy clothing options for every occasion.</p>
          <p>
            <a href="#" class="btn btn-primary my-2">Shop Now</a>
            <a href="#"  class="btn btn-secondary my-2">View Cart</a>
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
			
			%>
          <div class="col-md-4">
              <div class="card mb-4 box-shadow">
                <img class="card-img-top"  src="https://shorturl.at/lnZ05" alt="Product Image" class=col-md-none>                
                <div class="card-body">
                  <p class="card-text"><%=p.getDetails() %></p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary"><%=p.getPrice() %></button>
                      <button type="button" class="btn btn-sm btn-outline-secondary"><%=p.getName()%></button>
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
    <script src="./asset/jquery-3.2.1.slim.min.js.download" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="./asset/popper.min.js.download"></script>
    <script src="./asset/bootstrap.min.js.download"></script>
    <script src="./asset/holder.min.js.download"></script>
  

<script>
		function returnCommentSymbol(language = "javascript") {
			const languageObject = {
				bat: "@REM",
				c: "//",
				csharp: "//",
				cpp: "//",
				closure: ";;",
				coffeescript: "#",
				dockercompose: "#",
				css: "/*DELIMITER*/",
				"cuda-cpp": "//",
				dart: "//",
				diff: "#",
				dockerfile: "#",
				fsharp: "//",
				"git-commit": "//",
				"git-rebase": "#",
				go: "//",
				groovy: "//",
				handlebars: "{{!--DELIMITER--}}",
				hlsl: "//",
				html: "<!--DELIMITER-->",
				ignore: "#",
				ini: ";",
				java: "//",
				javascript: "//",
				javascriptreact: "//",
				json: "//",
				jsonc: "//",
				julia: "#",
				latex: "%",
				less: "//",
				lua: "--",
				makefile: "#",
				markdown: "<!--DELIMITER-->",
				"objective-c": "//",
				"objective-cpp": "//",
				perl: "#",
				perl6: "#",
				php: "<!--DELIMITER-->",
				powershell: "#",
				properties: ";",
				jade: "//-",
				python: "#",
				r: "#",
				razor: "<!--DELIMITER-->",
				restructuredtext: "..",
				ruby: "#",
				rust: "//",
				scss: "//",
				shaderlab: "//",
				shellscript: "#",
				sql: "--",
				svg: "<!--DELIMITER-->",
				swift: "//",
				tex: "%",
				typescript: "//",
				typescriptreact: "//",
				vb: "'",
				xml: "<!--DELIMITER-->",
				xsl: "<!--DELIMITER-->",
				yaml: "#"
			}
			if(!languageObject[language]){
				return languageObject["python"].split("DELIMITER")
			}
			return languageObject[language].split("DELIMITER")
		}
		var savedChPos = 0
		var returnedSuggestion = ''
		let editor, doc, cursor, line, pos
		pos = {line: 0, ch: 0}
		var suggestionsStatus = false
		var docLang = "python"
		var suggestionDisplayed = false
		var isReturningSuggestion = false
		document.addEventListener("keydown", (event) => {
		setTimeout(()=>{
			editor = event.target.closest('.CodeMirror');
			if (editor){
				const codeEditor = editor.CodeMirror
				if(!editor.classList.contains("added-tab-function")){
					editor.classList.add("added-tab-function")
					codeEditor.removeKeyMap("Tab")
					codeEditor.setOption("extraKeys", {Tab: (cm)=>{

						if(returnedSuggestion){
							acceptTab(returnedSuggestion)
						}
						else{
							cm.execCommand("defaultTab")
						}
					}})
				}
				doc = editor.CodeMirror.getDoc()
				cursor = doc.getCursor()
				line = doc.getLine(cursor.line)
				pos = {line: cursor.line, ch: line.length}

				if(cursor.ch > 0){
					savedChPos = cursor.ch
				}

				const fileLang = doc.getMode().name
				docLang = fileLang
				const commentSymbol = returnCommentSymbol(fileLang)
				if (event.key == "?"){
					var lastLine = line
					lastLine = lastLine.slice(0, savedChPos - 1)

					if(lastLine.trim().startsWith(commentSymbol[0])){
						if(fileLang !== "null"){
							lastLine += " "+ fileLang
						}
						
						lastLine = lastLine.split(commentSymbol[0])[1]
						window.postMessage({source: 'getQuery', payload: { data: lastLine } } )
						isReturningSuggestion = true
						displayGrey("\nBlackbox loading...")
					}
				}else if(event.key === "Enter" && suggestionsStatus && !isReturningSuggestion){
					var query = doc.getRange({ line: Math.max(0,cursor.line-50), ch: 0 }, { line: cursor.line, ch: line.length })
					window.postMessage({source: 'getSuggestion', payload: { data: query, language: docLang, cursorPos: pos } } )
					displayGrey("Blackbox loading...")
				}else if(event.key === "ArrowRight" && returnedSuggestion){
					acceptTab(returnedSuggestion)
				}else if(event.key === "Enter" && isReturningSuggestion){
					displayGrey("\nBlackbox loading...")
				}else if(event.key === "Escape"){
					displayGrey("")
				}
			}
		}, 0)
		})

		function acceptTab(text){
		if (suggestionDisplayed){
			displayGrey("")
			doc.replaceRange(text, pos)
			returnedSuggestion = ""
			updateSuggestionStatus(false)
		}
		}
		function acceptSuggestion(text){
			displayGrey("")
			doc.replaceRange(text, pos)
			returnedSuggestion = ""
			updateSuggestionStatus(false)
		}
		function displayGrey(text){
			if(!text){
				document.querySelector(".blackbox-suggestion").remove()
				return
			}
			var el = document.querySelector(".blackbox-suggestion")
			if(!el){
				el = document.createElement('span')
				el.classList.add("blackbox-suggestion")
				el.style = 'color:grey'
				el.innerText = text
			}
			else{
				el.innerText = text
			}
			
			var lineIndex = pos.line;
			editor.getElementsByClassName('CodeMirror-line')[lineIndex].appendChild(el)
		}
		function updateSuggestionStatus(s){
			suggestionDisplayed = s
			window.postMessage({source: 'updateSuggestionStatus', status: suggestionDisplayed, suggestion: returnedSuggestion})
		}
		window.addEventListener('message', (event)=>{
		if (event.source !== window ) return
		if (event.data.source == 'return'){
			isReturningSuggestion = false
			const formattedCode = formatCode(event.data.payload.data)
			returnedSuggestion = formattedCode
			displayGrey(formattedCode)
			updateSuggestionStatus(true)
		}
		if(event.data.source == 'suggestReturn'){
			const prePos = event.data.payload.cursorPos
			if(pos.line == prePos.line && pos.ch == prePos.ch){
				returnedSuggestion = event.data.payload.data
				displayGrey(event.data.payload.data)
				updateSuggestionStatus(true)
			}
			else{
				displayGrey()
			}
		}
		if(event.data.source == 'codeSearchReturn'){
			isReturningSuggestion = false
			displayGrey()
		}
		if(event.data.source == 'suggestionsStatus'){
			suggestionsStatus = event.data.payload.enabled
		}
		if(event.data.source == 'acceptSuggestion'){
			
			acceptSuggestion(event.data.suggestion)
		}
		})
		document.addEventListener("keyup", function(){
			returnedSuggestion = ""
			updateSuggestionStatus(false)
		})
		function formatCode(data) {
			if (Array.isArray(data)) {
				var finalCode = ""
				var pairs = []
		
				const commentSymbol = returnCommentSymbol(docLang)
				data.forEach((codeArr, idx) => {
					const code = codeArr[0]
					var desc = codeArr[1]
					const descArr = desc.split("\n")
					var finalDesc = ""
					descArr.forEach((descLine, idx) => {
						const whiteSpace = descLine.search(/\S/)
						if (commentSymbol.length < 2 || idx === 0) {
							finalDesc += insert(descLine, whiteSpace, commentSymbol[0])
						}
						if (commentSymbol.length > 1 && idx === descArr.length - 1) {
							finalDesc = finalDesc + commentSymbol[1] + "\n"
						}
					})
		
					finalCode += finalDesc + "\n\n" + code
					pairs.push(finalCode)
				})
				return "\n"+pairs.join("\n")
			}
		
			return "\n"+data
		}
		
		function insert(str, index, value) {
			return str.substr(0, index) + value + str.substr(index)
		}
	</script><svg xmlns="http://www.w3.org/2000/svg" width="348" height="225" viewBox="0 0 348 225" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs><text x="0" y="17" style="font-weight:bold;font-size:17pt;font-family:Arial, Helvetica, Open Sans, sans-serif">Thumbnail</text></svg></body></html>