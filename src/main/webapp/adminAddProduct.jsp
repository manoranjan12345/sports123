<%@page import="sports.onlineshopping.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="sports.onlineshopping.helper.FactoryProvider"%>
<%@page import="sports.onlineshopping.dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
<div class="container">
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header custom-bg text-white">
						<h3 class="text-center">Adding Product</h3>
					</div>
					<div class="card-body">
						<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
						<input type="hidden" name="operation" value="addproduct"></input>
							<div class="form-group">
								<label for="name">Product Name</label> <input
									type="text" name="pName" class="form-control" id="name"
									aria-describedby="name" placeholder="Enter name">
							</div>
							<div class="form-group">
								<label for="description">Description</label> <textarea style=150px; 
									name="pDescription" class="form-control" id="description"
									aria-describedby="description" placeholder="Description"></textarea>
							</div>
							<div class="form-group">
								<label for="pic">Select Product Picture</label>
								<input type="file" id="pic" name="pPic" required ></input>
							</div>
							<div class="form-group">
								<label for="price">Price</label> <input
									type="number" name="pPrice" class="form-control" id="price"
									aria-describedby="price" placeholder="Enter Price">
							</div>
							<div class="form-group">
								<label for="discount">Discount</label> <input
									type="number" name="pDiscount" class="form-control" id="discount"
									aria-describedby="discount" placeholder="Discount">
							</div>
							<div class="form-group">
								<label for="quantity">Quantity</label> <input type="number"
									name="pQuantity" class="form-control" id="quantity"
									aria-describedby="quantity" placeholder="Quantity">
							</div>
							
							<%
								CategoryDao cdao = new CategoryDao (FactoryProvider.getFactory());
								List<Category> list = cdao.getCategories();
								
							%>
							
							<div class="form-group">
								<label for="category">Select Product Category</label>
								<select name="catId" class="form-control" id="">
									<%
										for(Category c : list) {
									%>
									<option value="<%= c.getCategoryId() %>"> <%= c.getCategoryTitle() %> </option>
									<%} %>
								</select>
							</div>
							
							<button type="submit" class="btn btn-success">Submit</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>