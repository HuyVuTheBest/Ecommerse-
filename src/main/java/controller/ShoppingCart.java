package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.CartItem;

import java.io.IOException;



@WebServlet(urlPatterns= {"/UserCart"})
public class ShoppingCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HttpSession session = request.getSession(false);
	        if (session != null) {
	            Cart userCart = (Cart) session.getAttribute("cart");
	            if (userCart == null) {
	                userCart = new Cart();
	                session.setAttribute("cart", userCart);
	            }

	            String productId = request.getParameter("pid");
	            String action = request.getParameter("action");

	            if (userCart != null && productId != null && action != null) {
	                int pid = Integer.parseInt(productId);
	                if ("increase".equals(action)) {
	                    userCart.increaseQuantity(pid);
	                } else if ("decrease".equals(action)) {
	                    userCart.decreaseQuantity(pid);
	                }
	            }
	            
	            for(CartItem item :userCart.getCartItemList()) {
		            System.out.println("itemSize :"+item.getItemSize());

	            }
	            
	            System.out.println("Giỏ hÀng"+userCart.getCartItemList());
	            session.setAttribute("cartItem", userCart);
	        } else {
	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Session not found");
	            return;
	        }

	        request.getRequestDispatcher("ShoppingCart.jsp").forward(request, response);
	    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
