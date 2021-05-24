<%@page import="com.spring.model.JobDescription"%>
<%@include file="navbar.jsp" %><br>
<div class="row">
			<div class="col-sm-5 bg-light text-center ">
			<div class="card " style="background:gray">
			<div class="text-center">
				<img 	class="rounded-circle" alt="Cinque Terre" src='<p:url value="/${user.getProfilepic() }" />'  style="width:80%;height:300px"
				class="rounded-circle" alt="Cinque Terre"><br>
			</div>
			<h5 class="text-left">	
				<label >Id : </label><label>${sessionScope.user.getId() }</label><br>
   				<label >Name : </label><label>${sessionScope.user.getName() }</label><br>
				<label >Email : </label><label>${sessionScope.user.getEmail() }</label><br>
			</h5><br>
			<ul>
					<a class="btn btn-primary col-sm-3" color="white" href="addJob">Add Jobs</a>
					<a class="btn btn-primary col-sm-3" color="white" href="getApplicants">Applicants</a>
					<a class="btn btn-primary col-sm-3" color="white" href="logout">logout</a>
			
			</ul>
			</div>
			</div>
			<div class="card col-sm-7">
			<div class="card-header" >
					<h3>Added Jobs</h3>
					<br>
				</div>
			<table class="table">
  				<thead>
    				<tr>
      					<th scope="col">Job Place</th>
      					<th scope="col">Location</th>
      					<th scope="col">Technology</th>
      					<th scope="col">Post By</th>
    					</tr>
  				</thead>
  				<tbody>
  					<p:forEach var="x" items="${list}">
    					<tr>
      					<td><p:out value="${x.getJobPlace()}"/></td>
      					<td><p:out value="${x.getLocation()}"/></td>
      					<td><p:out value="${x.getTech()}"/></td>
      					<td><p:out value="${x.getUser().getName()}"/></td>
    					<td>
    					<form action="deleteJob">
    						<input type="hidden" name="id" value="${x.getId() }"/>
    						<input type="hidden" name="jobPlace" value="${x.getJobPlace() }"/>
    						<input type="hidden" name="location" value="${x.getLocation()}"/>
    						<input type="hidden" name="tech" value="${x.getTech() }"/>
    						<input type="hidden" name="jobpackage" value="${x.getJobpackage()  }"/>
    						<button class="btn btn-primary" type="submit">Delete</button>
    					</form>
    					</td>
    					</tr>
    				</p:forEach>	
    			</tbody>
		</table>
			</div>
</div>