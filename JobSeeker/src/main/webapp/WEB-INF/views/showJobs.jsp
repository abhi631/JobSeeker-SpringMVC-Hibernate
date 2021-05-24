<%@include file="navbar.jsp" %><br>
<div class="row">
			<div class="col-sm-5 bg-light text-center ">
			<div class="card" style="background:gray">
			<div class="text-center">
				<img src='<p:url value="/${user.getProfilepic() }" />' 	class="rounded-circle" alt="Cinque Terre" style="width:80%;height:300px"><br>
			</div>	
			<h5 class="text-left">	
				<label >Id : </label><label>${user.getId() }</label><br>
   				<label >Name : </label><label>${user.getName() }</label><br>
				<label >Email : </label><label>${user.getEmail() }</label><br>
			</h5><br>
			<ul>
					<a class="btn btn-primary col-sm-5" color="white" href="updateUserInfo">Update user</a>
					<a class="btn btn-primary col-sm-5" color="white" href="logout">Logout</a>
			
			</ul>
			</div>
			</div>
			<div class="card col-sm-7" >
			
				<div class="card-header">
					<h3>Recomended jobs</h3>
				</div>
				<table class="table">
  				<thead>
    				<tr>
      					<th scope="col">S_No</th>
      					<th scope="col">Job Place</th>
      					<th scope="col">Location</th>
      					<th scope="col">Technology</th>
      					<th scope="col">Job Provider</th>
    					</tr>
  				</thead>
  				<tbody>
  					<p:forEach var="x" items="${list}">
    					<tr>
      					<th scope="row"><p:out value="${x.getId()}"/></th>
      					<td><p:out value="${x.getJobPlace()}"/></td>
      					<td><p:out value="${x.getLocation()}"/></td>
      					<td><p:out value="${x.getTech()}"/></td>
      					<td><p:out value="${x.getUser().getName()}"/></td>
    					<td>
    					<form action="applyForJob" method="post">
    						<input type="hidden" name="id" value="${x.getId()}"/>
    						<input type="hidden" name="jobtaker" value="${sessionScope.user.getEmail()}"/>
							<button class="btn btn-primary" type="submit">Apply</button>    			
    					</form>
    					</td>
    					</tr>
    				</p:forEach>	
    			</tbody>
		</table>
		<hr>
		<br>
		
		<div class="card-header">
					<h3>Applied on jobs</h3>
				</div>
		<table class="table">
  				<thead>
    				<tr>
      					<th scope="col">S_No</th>
      					<th scope="col">Job Place</th>
      					<th scope="col">Location</th>
      					<th scope="col">Technology</th>
      					<th scope="col">Job Provider</th>
    					</tr>
  				</thead>
  				<tbody>
  					<p:forEach var="y" items="${joblist}">
    					<tr>
      					<th scope="row"><p:out value="${y.getJobprovider().getId()}"/></th>
      					<td><p:out value="${y.getJobprovider().getJobPlace()}"/></td>
      					<td><p:out value="${y.getJobprovider().getLocation()}"/></td>
      					<td><p:out value="${y.getJobprovider().getTech()}"/></td>
      					<td><p:out value="${y.getJobprovider().getUser().getName()}"/></td>
      					</tr>
    				</p:forEach>	
    			</tbody>
		</table>
	</div>
	
</div>
