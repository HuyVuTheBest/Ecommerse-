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


@WebServlet(urlPatterns= {"/remove"})
public class RemoveFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        
        HttpSession session = request.getSession(false);
        
        if(session != null) {
            
            User acc = (User) session.getAttribute("account");
            if(acc != null) {
                Cart userCart = (Cart) session.getAttribute("cart");
                
                String prID = request.getParameter("pid");
                if(prID != null) {                    
                    userCart.removeItem(prID);
                    response.sendRedirect("UserCart"); 
                } else {
                    request.setAttribute("Error", "Có lỗi khi xóa sản phẩm vào giỏ hàng");
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
