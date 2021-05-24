<%@include file="navbar.jsp" %>
<div class="row">
			<div class="col-sm-5 bg-light text-center ">
			<div class="card">
				<div class="text-center">
				<img src="<p:url value="/ ${user.getProfilepic()}" /> "	class="rounded-circle" alt="Cinque Terre" style="width:80%;height:300px" /><br>
				</div>
				<h5 class="text-left">	
				<label >Id : </label><label>${user.getId() }</label><br>
   				<label >Name : </label><label>${user.getName() }</label><br>
				<label >Email : </label><label>${user.getEmail() }</label><br>
			</h5><br>
			<ul>
					<a class="btn btn-primary col-sm-5" color="white" href="showJobs">Show Jobs</a>
					<a class="btn btn-primary col-sm-5" color="white" href="logout">Logout</a>
			
			</ul>
			</div>
			</div>
			<div class="col-sm-7">
					<br>
			<div class="card">
			<div class="card-header" ><h3>Job Description</h3></div>
			<br>
			<form action="postJobDesc" method="post">
				<div>
					<label for="text">Job Search By:</label>
   					<input type="text" class="form-control" placeholder="${user.getName() }" value="${user.getEmail() }"name="jobfindby">
  				</div>
			
				<div>
					<label for="text">Relevent Job Place :</label>
   					<input type="text" class="form-control" placeholder="Job Place" name="jobPlace">
  				</div><br>
  				<div>
					<label for="text">SGPA :</label>
   					<input type="text" class="form-control" placeholder="SGPA" name="sgpa">
  				</div><br>
				
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
  					<button type="submit" class="btn btn-primary">Submit</button>
  					<button type="reset" class="btn btn-primary">Reset</button>
  				</div>
			</form>				
			</div>
</div>