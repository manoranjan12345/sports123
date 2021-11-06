<%@page import="sports.onlineshopping.entities.Category"%>
<%@page import="sports.onlineshopping.dao.CategoryDao"%>
<%@page import="sports.onlineshopping.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="sports.onlineshopping.dao.ProductDao"%>
<%@page import="sports.onlineshopping.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP PAGE</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="row mt-3 mx-3">
		<%
		String cat = request.getParameter("category");
		//out.println(cat);

		ProductDao dao = new ProductDao(FactoryProvider.getFactory());
		List<Product> list = null;
		if (cat == null) {
			list = dao.getAllProducts();
		} else if (cat.trim().equals("all")) {
			list = dao.getAllProducts();
		} else {
			int cid = Integer.parseInt(cat.trim());
			list = dao.getAllProductsById(cid);
		}

		CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> clist = cdao.getCategories();
		%>
		<div class="col-md-2">

			<div class="list-group mt-4">
				<a href="index.jsp?category=all"
					class="list-group-item list-group-item-action btn custom-bg text-white">All
					Products</a>


				<%
				for (Category c : clist) {
				%>
				<a href="index.jsp?category=<%=c.getCategoryId()%>"
					class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
				<%
				}
				%>

			</div>

		</div>
		<div class="col-md-10">
			<div class="row mt-4">
				<div class="col-md-12">
					<div class="card-columns">
						<%
						for (Product p : list) {
						%>
						<div class="card">
							<div class="conateiner text-center">
								<img class="card-img-top m-3"
									style="max-height: 200px; max-width: 100px; width: auto"
									src="image/products/<%=p.getpPhoto()%>" alt="Card image cap">
							</div>
							<div class="card-body">
								<h5 class="card-title"><%=p.getpName()%></h5>
								<p class="card-text"><%=p.getpDesc()%></p>
								<h6>
									&#8377;
									<%=p.getPriceAfterApplyingDiscount()%>/-
								</h6>
								<span class="text-secondary">&#8377;<strike><%=p.getpPrice()%></strike>
								</span><%=p.getpDiscount()%>% off
							</div>
							<div class="card-footer">
								<button class="btn custom-bg text-white"
									onclick="add_to_cart(<%=p.getpId()%>,`<%=p.getpName()%>`,<%=p.getPriceAfterApplyingDiscount()%>)">Add
									to Cart</button>
								<button class="btn custom-bg text-white">Buy Now</button>
							</div>
						</div>
						<%
						}

						if (list.size() == 0) {
						out.println("<h3>No items available in this category.</h3>");
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>