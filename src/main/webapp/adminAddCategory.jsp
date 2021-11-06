<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Category</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header custom-bg text-white">
						<h3 class="text-center">Adding Category</h3>
					</div>
					<div class="card-body">
						<form action="ProductOperationServlet" method="post">
						<input type="hidden" name="operation" value="addcategory" />
							<div class="form-group">
								<label for="title">Add</label> <input
									type="text" name="catTitle" class="form-control" id="catTitle"
									aria-describedby="catTitle" placeholder="Enter Title">
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