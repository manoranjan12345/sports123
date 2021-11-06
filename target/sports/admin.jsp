<%@page import="sports.onlineshopping.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message", "You are not logged in ! Login First");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "WARNING !!!");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container">
	
	<div class="container-fluid mt-3">
	<%@include file="components/message.jsp" %>
	</div>
		<div class="row mt-3">

			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid"
								src="image/man.png" alt="user_icon">
						</div>
						<h6>123</h6>
						<h5>User</h5>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid"
								src="image/options.png" alt="user_icon">
						</div>
						<h6>123</h6>
						<h5>Category</h5>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid"
								src="image/note.png" alt="user_icon">
						</div>
						<h6>123</h6>
						<h5>Product</h5>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid"
								src="image/add-to-basket.png" alt="user_icon">
						</div>
						<h5><a href="adminAddCategory.jsp">Add Category</a></h5>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid"
								src="image/add-to-basket.png" alt="user_icon">
						</div>
						<h5><a href="adminAddProduct.jsp">Add Product</a></h5>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>