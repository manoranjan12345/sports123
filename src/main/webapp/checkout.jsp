
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message", "You are not logged in ! Login First to access checkout page");
	response.sendRedirect("login.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check out page</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Your Selected Items</h3>
						<div class="cart-body"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Your details for order</h3>
						<form action="">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									value="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="name">Your Name</label> <input value="<%= user.getUserName() %>" type="text"
									class="form-control" id="name" aria-describedby="emailHelp"
									placeholder="Enter name">
							</div>
							<div class="form-group">
								<label for="phone">Your Phone number</label> <input value="<%= user.getUserPhone()%>" type="number"
									class="form-control" name="userPhone" id="phone" placeholder="Enter here">
							</div>
							<div class="form-group">
								<label for="exampleFormControlTextarea1">Your shipping
									address</label>
								<textarea value="<%= user.getUserAddress() %>" class="form-control" id="exampleFormControlTextarea1"
									placeholder="Enter your Address" rows="3"></textarea>
							</div>
							<div class="container ">
								<a class="btn btn-success" href="order.jsp" role="button">Order Now</a>
								<a class="btn btn-primary" href="index.jsp" role="button">Continue Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="components/common_modals.jsp"%>
</body>
</html>