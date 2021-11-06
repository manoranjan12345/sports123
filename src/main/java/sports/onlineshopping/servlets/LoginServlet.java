package sports.onlineshopping.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sports.onlineshopping.dao.UserDao;
import sports.onlineshopping.entities.User;
import sports.onlineshopping.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDao userDao = new UserDao(FactoryProvider.getFactory());
		User user = userDao.getUserByEmailAndPassword(email, password);
		
		HttpSession httpSession = request.getSession();
		
		if(user==null) {
			httpSession.setAttribute("message", "Invalid Details ! Please try again");
			response.sendRedirect("login.jsp");
		}else {
			
			
			httpSession.setAttribute("current-user", user);
			
			if(user.getUserType().equals("admin")) {
				response.sendRedirect("admin.jsp");
			}else if (user.getUserType().equals("normal")) {
				response.sendRedirect("normal.jsp");
			}else {
				System.out.println("Please Register First !");
			}
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
