package controller.admin;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import model.Product;
import model.User;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import dao.DAO;

 @WebServlet(urlPatterns="/StatisticManager")
public class StatisticManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int TotalProduct = 0 ;

		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("account");
		if(user.getRole()!="Customer") {
			DAO dao = new DAO();
			Gson gson = new Gson();
	        List<Double> odList = dao.getOrderEarnStatistic();	
	        List<Date> orderDates= dao.getOrderDates();
	        List<Order> oderList = dao.getAllOrder();
	        
	        
	        for(Product pr : dao.getAllProduct()) {
	        	TotalProduct ++;
	        }
	        
	        List<Map<String,Object>> countOrderbyCategory =dao.getOrderCategoryStatistic();
	        
	        
	        String jsonCountOrderByCategory = gson.toJson(countOrderbyCategory);
	        String jsonOrderList = gson.toJson(odList);
	        String jsonOrderDates = gson.toJson(orderDates);
	        
	        
	        request.setAttribute("OrderList", oderList);
	        request.setAttribute("totalProduct", TotalProduct);
	        request.setAttribute("jsonCountOrderByCategory", jsonCountOrderByCategory);
	        request.setAttribute("jsonOrderDates", jsonOrderDates);
	        request.setAttribute("jsonOrderList", jsonOrderList);
	        
	        request.getRequestDispatcher("admin/QLTKe.jsp").forward(request, response);
			
		}else {
			  response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		        response.setContentType("text/plain");
		        response.getWriter().write("Page Not Found");
		}
		
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
