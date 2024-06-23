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
import java.util.List;

import dao.DAO;

@WebServlet(urlPatterns="/OrderManager")
public class OrderManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	DAO dao = new DAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("account");
		if(user.getRole()!="Customer") {
			List<Order> odList = dao.getAllOrder();
			request.setAttribute("OrderList", odList);
			request.getRequestDispatcher("admin/QLDH.jsp").forward(request, response);
		}else {
			  response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		        response.setContentType("text/plain");
		        response.getWriter().write("Page Not Found");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String oid = request.getParameter("deleteoid");
	        if (oid != null) {
	            boolean success = dao.deleteOrderByID(Integer.parseInt(oid));
	            if (success) {
	                request.setAttribute("succ", "Xóa đơn hàng thành công");
	            } else {
	                request.setAttribute("fail", "Xóa đơn hàng thất bại");
	            }
	            List<Order> odList = dao.getAllOrder();
	            request.setAttribute("OrderList", odList);
	            request.getRequestDispatcher("admin/QLDH.jsp").forward(request, response);
	        } else {
	            response.sendRedirect("admin/QLDH.jsp");
	        }

		
		
	}

}
