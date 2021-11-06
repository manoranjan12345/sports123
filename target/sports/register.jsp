<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Registration</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row mt-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
				<%@include file="components/message.jsp" %>
					<div class="card-body px-4">
						<form action="RegisterServlet" method="post">
							<h3 class="text-center">Sign Up</h3>
							<div class="form-group">
								<label for="name">User Name</label> <input type="text"
									class="form-control" name="userName" id="name" aria-describedby="nameHelp"
									placeholder="Enter here">
							</div>
							<div class="form-group">
								<label for="email">User Email</label> <input type="email"
									class="form-control" name="userEmail" id="email" aria-describedby="emailHelp"
									placeholder="Enter here">
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" name="userPassword" id="Password" placeholder="Password">
							</div>
							<div class="form-group">
								<label for="phone">User Phone</label> <input type="number"
									class="form-control" name="userPhone" id="phone" placeholder="Enter here">
							</div>
							<div class="form-group">
								<label for="Address">User Address</label>
								<textarea style="height: 100px;" class="form-control"
									name="userAddress" placeholder="Enter Address"></textarea>
							</div>
							<div class="container text-center">
								<button class="btn btn-success">Register</button>
								<button class="btn btn-warning">Reset</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>