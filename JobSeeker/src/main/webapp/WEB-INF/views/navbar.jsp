
<%@taglib prefix="p" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<head>
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
	<nav class="navbar navbar-expand-md navbar-dark" style="background-color:blue">
  	<!-- Brand -->
  	<a class="navbar-brand" href="#">JobSeeker</a>

  	<!-- Toggler/collapsibe Button -->
  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
   		 <span class="navbar-toggler-icon"></span>
  	</button>

 	 <!-- Navbar links -->
 	 <div class="collapse navbar-collapse nav justify-content-end" id="collapsibleNavbar">
 	 	
   		 
   		 <ul class="navbar-nav">
   		 <p:choose>
   		 	<p:when test="${sessionScope.user != null}">
   			
   		 	<li class="nav-item">
       			 <a class="nav-link white"  href="home">Home</a>
      		  </li>
      		  <li class="nav-item">
       			 <a class="nav-link" href="logout">Logout</a>
       		 </li>
      		
      		
      		</p:when>
      		 <p:otherwise>
      		
   		 		<li class="nav-item"><a class="nav-link" href="home">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="regester">Register</a>
					</li>
   		 
   		 </p:otherwise>
   		 </p:choose>
   		 	
   			 
    	</ul>	
  	</div>
  
  		
  	
	</nav>
	
	
		
	
	
	
	
	
