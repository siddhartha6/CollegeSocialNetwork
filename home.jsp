<!--
      Author        : iddhartha Karnam, Shashank Bhaskaruni, Shivaji Goud P
      Description   : This is the home page of our college social network site where user can login or register.
      College       : CVR College of Engineering
-->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>SOCIAL NETWORK</title>
	<link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<div class="sn-headBg">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4">
					<img src="images/logo.png" class="img-responsive">
				</div>
				<div class="col-md-8">
					<div class="pull-right">
						<div class="PDTB25">
							<form action="login.jsp" method="post" class="form-horizontal">
								<div class="row">
                                  <div class="col-md-2">
                                    <label> 
                                     <select name="role" class="form-control">
                                        <option value="1">student</option>
                                        <option  value="2">faculty</option>
                                        <option value="3">placement officer</option>
                                     </select>
                                    </label>

                                   </div>
									<div class="col-md-3">
										<input class="form-control" type="text" name="username" placeholder="Username" required="">
									</div>
									<div class="col-md-3">
										<input class="form-control" type="password" name="password" placeholder="Password" required="">
									</div>
									<div class="col-md-2">
										<input type="submit" class="btn sn-btn form-control" value="Login">
									</div>
									<div class="col-md-2">
										<a href="register.jsp" class="btn sn-btn form-control">Register</a>
									</div>
								</div>
							</form>
						</div>
					</div>					
				</div>
			</div>
		</div>
	</div>
	<div class="sn-mainBg">
		<div class="container">
			<div class="row PDTB50">
				<div id="carousel1" class="carousel slide" data-ride="carousel">
				  <!-- Indicators -->
				  <ol class="carousel-indicators">
				    <li data-target="#carousel1" data-slide-to="0" class="active"></li>
				    <li data-target="#carousel1" data-slide-to="1"></li>
				    <li data-target="#carousel1" data-slide-to="2"></li>
				  </ol>

				  <!-- Wrapper for slides -->
				  <div class="carousel-inner" role="listbox">
				    <div class="item active">
				      <img src="images/8.jpg">
				      <div class="carousel-caption">
				      </div>
				    </div>
				    <div class="item">
				      <img src="images/2.jpg">
				      <div class="carousel-caption">
				      </div>
				    </div>
				    <div class="item">
				      <img src="images/2.jpg">
				      <div class="carousel-caption">
				      </div>
				    </div>
				  </div>

				  <!-- Controls -->
				  <a class="left carousel-control" href="#carousel1" role="button" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="right carousel-control" href="#carousel1" role="button" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
			</div>
			<div class="row">
				<h2>About Us</h2>
				<p>Social Network Connectivity Grid. A large social network of people grows quickly. - HD</p>
			</div>
		</div>
	</div>
	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>