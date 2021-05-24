<%@include file="navbar.jsp" %><br>
<body style="background-image:url(<p:url value="/img/backimg.jpeg"/>)">
<div class="row">
			<div class="col-sm-1 ">
   					
			</div>
<div class="col-sm-10 row">
<br>
<div class="col-sm-6 ">
	
</div>
<div class="card col-sm-6 " style="border-radius:40px">
<div class="card-header ">
<h3>sign_up</h3></div><br>
<form action="Userregesteration" method="post" enctype="multipart/form-data">
<div class="form-group">
	<label for="email">Name</label>
    <input type="text" class="form-control" placeholder="User name" name="name">
  </div>
  <div class="form-group">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" placeholder="Enter email" name="email">
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" placeholder="Enter password" name="password">
  </div>
  <div class="form-group">
	<input type="file"  class="form-control-file" name="myfile" />
	
  </div>
    <div class="custom-control custom-radio custom-control-inline">
    <input type="radio" class="custom-control-input" id="customRadio" name="type" value="JobProvider">
    <label class="custom-control-label" for="customRadio">JobProvider</label>
  </div>
  <div class="custom-control custom-radio custom-control-inline">
    <input type="radio" class="custom-control-input" id="customRadio2" name="type" value="JobTaker">
    <label class="custom-control-label" for="customRadio2">JobTaker</label>
  </div>
  <div class="text-right">
  <button type="submit" class="btn btn-primary" style="border-radius:10px">Submit</button>
  <button type="reset" class="btn btn-primary"  style="border-radius:10px">Reset</button>
  </div>
</form>
</div>

</div>
		</div></body>