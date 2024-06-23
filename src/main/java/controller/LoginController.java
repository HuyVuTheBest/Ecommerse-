package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Category;
import model.User;
import util.Encrypt;

import java.io.IOException;
import java.util.List;

import dao.DAO;

@WebServlet(urlPatterns= {"/login"})
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	

		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    DAO dao = new DAO();
		String encryptpassword = Encrypt.encryptSHA1(password);

	    User user = dao.Login(username, encryptpassword);
	    

	    if(user != null) {
	    	
	    	if(user.isIsLock()==1) {
		        request.setAttribute("error", "Tài khoản bạn đã bị khóa");
		        request.getRequestDispatcher("Login.jsp").forward(request, response);


	    		
	    	}else {
	    		HttpSession session = request.getSession(true);
		    	String userRole = user.getRole();
		        session.setAttribute("account", user);
		        session.setAttribute("loginSuccess", true);
		    	
			    if(userRole.equals("Admin")) {
			        

			        response.sendRedirect("ProductManager");

			    }else {
			        
			        Cart shoppingcart = (Cart) session.getAttribute("cart");
			        
			        if (shoppingcart == null) {
			            shoppingcart = new Cart();
			            session.setAttribute("cart", shoppingcart);
			        }
			        
			       

			       

			        response.sendRedirect("home");
			    	
			    }  
	    	}
	    	
	    	  	
	    } else {
	        request.setAttribute("error", "Tài khoản bạn đăng nhập sai hoặc không tồn tại");
	        request.getRequestDispatcher("Login.jsp").forward(request, response);
	    }
		
		
		
		
		
	}
	


}
