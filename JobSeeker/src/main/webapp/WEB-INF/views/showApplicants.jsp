<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
   		 		<form class="form-inline" action="sortedlist">
    			<input class="form-control mr-sm-2" type="text" placeholder="SGPA" name="sgpa">
    			<button class="btn btn-success" type="submit">Filter</button>
  				</form>
   			 
    	</ul>	
  	</div>
  
  		
  	
	</nav>
	
<!------------------------------------------------------------------------------------------------------------------------------------------------->

<div class="row">

	<div class="col-sm-5 bg-light text-center ">
		<div class="card" style="background-color:gray">
			<div class="text-center" >
				<img class="rounded-circle" alt="Cinque Terre" src="<p:url value="/${sessionScope.user.getProfilepic() }" />" 	 style="width:80%;height:300px"
				class="rounded-circle" alt="Cinque Terre"><br>
			</div>
				<h5 class="text-left">	
				<label >Id : </label><label>${sessionScope.user.getId() }</label><br>
   				<label >Name : </label><label>${sessionScope.user.getName() }</label><br>
				<label >Email : </label><label>${sessionScope.user.getEmail() }</label><br>
			</h5><br>
			<ul>
					<a class="btn btn-primary col-sm-3" color="white" href="addedJobs">Added Jobs</a>
					<a class="btn btn-primary col-sm-3" color="white" href="addJob">Add Job</a>
					<a class="btn btn-primary col-sm-3" color="white" href="logout">Logout</a>
			</ul>
		</div>
	</div>
	
	<div class="col-sm-7">
		<div class="card">
			<div class="container">
				<div class="card-header" >
					<h3>Applicants</h3>
					<br>
				</div>
				<table class="table">
  				<thead>
    				<tr>
      					<th scope="col">Applicant</th>
      					<th scope="col">Applicant_Email</th>
						<th scope="col">Technology</th>
						<th scope="col">SGPA</th>      					

      					
    				</tr>
  				</thead>
  				<tbody>
  					<p:forEach var="x" items="${list}">
    					<tr>
      					
      						<td><p:out value="${x.getJobtaker().getUser().name}"/></td>
      						<td><p:out value="${x.getJobtaker().getUser().email}"/></td>
      						<td><p:out value="${x.getJobtaker().tech}"/></td>
      						<td><p:out value="${x.getJobtaker().sgpa}"/></td>
      					</tr>
      					
    					
    					
    				</p:forEach>	
    			</tbody>
		</table>
			</div>
		</div>
	</div>

</body>