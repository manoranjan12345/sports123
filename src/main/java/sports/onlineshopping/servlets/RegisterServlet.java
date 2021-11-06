package sports.onlineshopping.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import sports.onlineshopping.entities.User;
import sports.onlineshopping.helper.FactoryProvider;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		
			try {
				String user_Name = request.getParameter("userName");
				String user_Email = request.getParameter("userEmail");
				String user_Password = request.getParameter("userPassword");
				String user_Phone = request.getParameter("userPhone");
				String user_Address = request.getParameter("userAddress");
				
				if(user_Name.isEmpty()) {
					System.out.println("Name is Blank");
					return;
				}
				User user = new User(user_Name, user_Email, user_Password, user_Phone, user_Address,"normal");
				
				Session hibernateSession = FactoryProvider.getFactory().openSession();
				Transaction tx = hibernateSession.beginTransaction();
				
				int userId = (Integer) hibernateSession.save(user);
				
				tx.commit();
				hibernateSession.close();
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Registration Successful !");
				
				response.sendRedirect("register.jsp");
				return;
				
			} catch (Exception e) {
				e.printStackTrace();
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
