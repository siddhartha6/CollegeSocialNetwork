<!--
      Author        : Siddhartha Karnam, Shashank bhaskaruni, Shivaji goud
      Description   : This is code for registration page of our College Social Network site.
      College       : CVR College of Engineering
-->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

		<!-- Website CSS style -->
		<link rel="stylesheet" type="text/css" href="css/register.css">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

		<title>Registration</title>
	</head>
	<body>
		<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title">CVR Social Network</h1>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center">
					<form class="form-horizontal" method="post" action="Registration_store.jsp">
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Your Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="text" class="form-control" name="name" id="name"  placeholder="Enter your Name" required=""/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email" required=""/>
								</div>
							</div>
						</div>



                       <div class="form-group">
							<label for="role" class="cols-sm-2 control-label">Role</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<label> 
                                     <select name="role" class="form-control">
                                        <option value="1">student</option>
                                        <option  value="2">faculty</option>
                                        <option value="3">placement officer</option>
                                     </select>
                                    </label>
								</div>
							</div>
						</div>

                       <div class="form-group">
							<label for="monile" class="cols-sm-2 control-label">Mobile</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="text" class="form-control" name="mobile" id="mobile"  placeholder="Enter your mobile number" required=""/>
								</div>
							</div>
						</div>
                       


						<div class="form-group">
							<label for="collegename" class="cols-sm-2 control-label">College-Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="text" class="form-control" name="cname" id="cname"  placeholder="Enter your college name" required=""/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="rollno" class="cols-sm-2 control-label">University Rollno</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="text" class="form-control" name="rollno" id="cname"  placeholder="Enter your Rollno" required=""/>
								</div>
							</div>
						</div>

						<div class="form-group ">
							<button type="submit" class="btn btn-primary btn-lg btn-block login-button">Register</button>
						</div>
						<div class="login-register">
				            <a href="home.jsp">Login</a>
				         </div>
					</form>
				</div>
			</div>
		</div>

		<script type="text/javascript" src="assets/js/bootstrap.js"></script>
	</body>
</html>