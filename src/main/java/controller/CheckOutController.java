package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.CartItem;
import model.Order;
import model.OrderDetails;
import model.User;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import dao.DAO;

@WebServlet(urlPatterns ="/CheckOutPayment")
public class CheckOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	        response.sendRedirect("CheckOut.jsp");

		 
	    }

	 
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	 	String name = request.getParameter("name");
	    	    String address = request.getParameter("address");
	    	    String phone = request.getParameter("phone");
	    	    String paymentMethod = request.getParameter("paymentMethod");
	    	    
	    	  

	    	    
	    	    
	    	    int status = 1;

	            LocalDateTime orderDate = LocalDateTime.now();

	    	    DAO dao = new DAO();
	    	    HttpSession session = request.getSession(false);
	    	    Cart cart = (Cart) session.getAttribute("cartItem");

	    	    if (cart != null) {
	    	        List<OrderDetails> orderDetailsList = new ArrayList<>();
	    	        User user = (User) session.getAttribute("account");
	    	        double totalPrice = cart.getTotalCartPrice();
	    	        int totalQuantity = cart.getTotalQuantity();
	    	       
	    	        Order order = new Order(user.getUserID(), orderDetailsList, paymentMethod, orderDate.toString(), status, address, phone, name, totalPrice, totalQuantity);

	    	        int orderId = dao.insertOrder(order);
	    	        if (orderId > 0) {
	    	            order.setOrderID(orderId); 

	    	            for (CartItem cartItem : cart.getCartItemList()) {
	    	            	System.out.println(cartItem);
	    	            
	    	                OrderDetails orderDetails = new OrderDetails(orderId, cartItem.getProduct(),cartItem.getQuantity(),cartItem.getItemPrice(),cartItem.getItemSize());
	    	                orderDetailsList.add(orderDetails);
	    	                dao.insertOrderDetail(orderDetails); 
	    	            }

	    	            session.removeAttribute("cartItem");
	    	            session.setAttribute("UserAddress", address);
	    	            
	    	            
	    	            request.setAttribute("status", "success");
	    	            request.setAttribute("message", "Đặt hàng thành công");
	    	        } else {
	    	            System.out.println("Order creation failed.");
	    	            request.setAttribute("status", "failed");
	    	            request.setAttribute("message", "Đặt hàng thất bại");
	    	        }
    	            request.setAttribute("oid",order.getOrderID());
	    	        request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
	    	    } else {
	    	        response.sendRedirect("Cart.jsp");
	    	    }
}}
