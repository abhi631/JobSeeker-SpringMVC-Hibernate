<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@include file="navbar.jsp" %><br>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	
<script type="text/javascript" src="<spring:url value="js/addjob.js"/>"></script>
</head>
<body>
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
					<a class="btn btn-primary col-sm-3" color="white" href="getApplicants">Applicants</a>
					<a class="btn btn-primary col-sm-3" color="white" href="logout">Logout</a>
			</ul>
		</div>
	</div>
	
			<div class="col-sm-7">
			<div class="card">
			<div class="container">
			<div class="card-header" ><h3>Add Job Description</h3><br></div>
			<form action="postjob" method="post">
				<div>
					<label for="text">Job Post By :</label>
   					<input type="text" class="form-control" placeholder="${user.getName() }" value="${user.getEmail() }"name="jobPostby">
  				</div>
			
				<div>
					<label for="text">Job Place :</label>
   					<input type="text" class="form-control" placeholder="Job Place" name="jobPlace" id="jobPlace" >
  				</div><br>
  				<select class="form-select" name="location" aria-label="Default select example">
  					<option selected>Job Location</option>
  					<option value="Noida" >Noida</option>
  					<option value="GudGao" >GudGao</option>
  					<option value="Chandigarh" >Chandigarh</option>
  					<option value="Chennai" >Chennai</option>
  					<option value="Banglore" >Banglore</option>
  					<option value="Mumbai" >Mumbai</option>
				</select>
				
				<select class="form-select" name="tech" aria-label="Default select example">
  					<option selected>Technology</option>
  					<option value="Java" >Java</option>
  					<option value="Python" >Python</option>
  					<option value="JavaScript" >JavaScript</option>
  					<option value="Swift" >Swift</option>
  					<option value="Node.js" >Node.js</option>
  					<option value="Angular.js" >Angular.js</option>
  					<option value="Spring Boot & Security" >Spring Boot & Security</option>
  					<option value="Django" >Django</option>
  					<option value="Machine Learning" >Machine Learning</option>
				</select>
  				<br><br>
    			<div>
					<label for="text">Package :</label>
   					<input type="text" class="form-control" placeholder="Package" name="jobpackage">
  				</div>
    			<br>
  				<div class="text-right">
  					<button type="submit" class="btn btn-primary" id="submit">Submit</button>
  					<button type="reset" class="btn btn-primary">Reset</button>
  				</div>
			</form>
			</div>
			<div class="card-header text-center" ><h5 style="color:green">${msg}</h5></div>
			
			</div></div>
</div>

</body>