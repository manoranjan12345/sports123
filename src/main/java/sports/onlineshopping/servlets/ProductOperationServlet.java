package sports.onlineshopping.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import sports.onlineshopping.dao.CategoryDao;
import sports.onlineshopping.dao.ProductDao;
import sports.onlineshopping.entities.Category;
import sports.onlineshopping.entities.Product;
import sports.onlineshopping.helper.FactoryProvider;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("deprecation")
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String op = request.getParameter("operation");
		if (op.trim().equals("addcategory")) {

			String title = request.getParameter("catTitle");

			Category category = new Category();
			category.setCategoryTitle(title);

			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
			int catId = categoryDao.saveCategory(category);

			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("messagae", "Category is saved successfully !");
			response.sendRedirect("admin.jsp");
			return;

		} else if (op.trim().equals("addproduct")) {

			String pName = request.getParameter("pName");
			String pDescription = request.getParameter("pDescription");
			int pPrice = Integer.parseInt(request.getParameter("pPrice"));
			int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
			int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			Part part = request.getPart("pPic");

			Product p = new Product();
			p.setpName(pName);
			p.setpDesc(pDescription);
			p.setpPrice(pPrice);
			p.setpDiscount(pDiscount);
			p.setpQuantity(pQuantity);
			p.setpPhoto(part.getSubmittedFileName());

			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			Category category = cdao.getCategoryById(catId);

			p.setCategory(category);

			ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
			pdao.saveProduct(p);
			
			String path = request.getRealPath("image") + File.separator + "products" + File.separator
					+ part.getSubmittedFileName();
			System.out.println(path);
			try {

				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = part.getInputStream();
				byte[] data = new byte[is.available()];

				is.read(data);

				fos.write(data);

				fos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("messagae", "Product is saved successfully !");
			response.sendRedirect("admin.jsp");
			return;
		}

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
