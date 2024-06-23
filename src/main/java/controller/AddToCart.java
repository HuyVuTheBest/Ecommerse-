package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.CartItem;
import model.Product;
import model.User;

import java.io.IOException;

import dao.DAO;



@WebServlet(urlPatterns= {"/AddToCart"})
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	DAO dao = new DAO();
	        Product prd = null;
	        CartItem cit= null;
	        
	        HttpSession session = request.getSession(false);
	        
	        if(session != null) {
	            
	            User acc = (User) session.getAttribute("account");
	            if(acc != null) {
	                Cart userCart = (Cart) session.getAttribute("cart");
	                
	                if (userCart == null) {
	                    userCart = new Cart();
	                    session.setAttribute("cart", userCart);
	                }
	                String size = request.getParameter("size");
	                String prID = request.getParameter("pid");
	                int quantity = 1;
	                
	                if(prID != null ) {                    
	                    prd = dao.getProductById(Integer.parseInt(prID));
	                    
	                    CartItem existingItem = userCart.getCartItemByProductId(Integer.toString(prd.getProductID()));
	                    
	                    if (existingItem != null) {
	                    	quantity+= existingItem.getQuantity();
	                        existingItem.setQuantity(quantity);
	                        
		                    response.sendRedirect("UserCart");

	                    } else {
	                        cit = new CartItem(prd, quantity);   
	                        cit.setItemSize(size);
	                        System.out.println(cit);
	                        userCart.addItem(cit);
	                        System.out.println(userCart);

		                    response.sendRedirect("UserCart");
	                    }
	                    
	                    
	                           
	                } else {
	                    request.setAttribute("Error", "Có lỗi khi thêm sản phẩm vào giỏ hàng");
	                }
	                
	            } else {
	                response.sendRedirect("Login.jsp"); 
	            }
	            
	        } else {
	            response.sendRedirect("Login.jsp"); 
	        } 	
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}


}
