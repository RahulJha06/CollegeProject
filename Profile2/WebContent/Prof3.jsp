<!DOCTYPE html>
<html lang="en">
<head>
	<!--The title of the website-->
	<title>Social Media</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<!--Link to bootstrap for css-->
	<link
	rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="prof2.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" 
	crossorigin="anonymous">

	
</head>



<body>
<!-- JSP class -->
<%	class User{
	public String firstName, lastName;
	public String department;
	public String cls;
	public String yoe;
};
	User data = new User();
	data.firstName="Amruta";
	data.lastName="Gurav";
	data.department="Computer";
	data.cls="A";
	data.yoe="TY";
%>

<!--The background image division with fluidity-->
	<div class="bg img-fluid container-fluid">

	<section id="header">
	 	<div class="container-fluid">
	<!--The navigation bar-->

			<nav class="navbar navbar-expand-lg navbar-dark bg-transparent ">
			<div class="container">
				<a class="navbar-brand" href="#">VIIT SOCIAL FORUM</a>
		
		</div>
		</nav>
			</div>
			
		</div>
		
	</section>

<!--The divisions of the main page-->

<div class="LeftColumn img-fluid" >
<!--The buttons of the left column-->
<button type="button" class="btn btn-block" id="ButtonOne">Profile</button> 
<button type="button" class="btn  btn-block" id="ButtonTwo">Upload</button> 
<button type="button" class="btn  btn-block" id="ButtonThree">History</button> 
<button type="button" class="btn  btn-block" id="ButtonThree">Feed</button>
</div>


<div class="MiddleColumn ">

<!--  <div class="container-fluid"> -->
<!--Card-->
  <div class="card testimonial-card mt-2 mb-3">

    <!-- Background color -->
    <div class="card-up aqua-gradient"></div>

    <!-- Avatar -->
    <div class="avatar mx-auto white">
      <img src="C:\Users\Amruta\Downloads\viit.png" class="rounded-circle img-responsive">  
    </div>

    <!-- Content -->
    <div class="card-body">
      <!-- Name -->
      <h4 class="card-title font-weight-bold" align="center"><%=data.firstName %></h4>
      <hr>
      <!-- Quotation -->
      
      <div class="for-profile">Name<br/></div>
      <div class="for-roundcorners"><p class="RoundCorners" ><%= data.firstName%>  <%= data.lastName %></p></div><br/>
      
      <div class="for-profile">Department <br/></div>
      <div class="for-roundcorners"><p class="RoundCorners" ><%= data.department%></p></div>
      
      <div class="for-profile">Class <br/></div>
      <div class="for-roundcorners"><p class="RoundCorners " ><%= data.cls%></p>
      </div><br/>
      
      <div class="for-profile">Year of Engineering<br/></div>
      <div class="for-roundcorners"><p class="RoundCorners" ><%= data.yoe%></p></div><br/>
      
      <div class="for-profile"><button type="button" class="btn btn-outline-primary">Reset Password</button></div><br/>
     <div class="for-profile"><button type="button" class="btn btn-outline-primary">Delete Profile</button></div>
    </div>

  </div>
  <!--Card-->





</div>

<div class=" RightColumn img-fluid">

</div>



<!--Ending of the background image division-->
</div>

<script
src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
crossorigin="anonymous"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
crossorigin="anonymous"></script>
<script
src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
crossorigin="anonymous"></script>
</body>
</html>