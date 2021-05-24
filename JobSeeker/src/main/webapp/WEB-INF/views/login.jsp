
<%@ include file="navbar.jsp" %><br><br><br><br>
<body style="background-image:url(<p:url value="/img/backimg.jpeg"/>)">
<div class="row">
			<div class="col-sm-1 ">
   					
			</div>
<div class="col-sm-10 row" >

<div class="col-sm-6">
	
</div>

<div class="card col-sm-6 " style="border-radius:40px">
<div class="card-header"><br>
<h3>login</h3></div>
<form action="loginUser" method="post">
  <div class="form-group">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" placeholder="Enter email" name="email">
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" placeholder="Enter password" name="password">
  </div>
  <div class="text-right">
  <button type="submit" class="btn btn-primary " style="border-radius:10px;">Submit</button>
  <button type="reset" class="btn btn-primary " style="border-radius:10px">Reset</button>
  </div>
</form>

		<h3 align="center" style="color:red">${msg}</h3>
</div>
</div>
		</div>