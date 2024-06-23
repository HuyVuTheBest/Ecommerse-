package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import model.OrderDetails;
import model.Product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dao.DAO;

@SuppressWarnings("serial")
@WebServlet(urlPatterns="/OrderDetails")
public class UserOrderDetails extends HttpServlet {
	private static final long serialVersionoid = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAO dao = new DAO();
        String oid = request.getParameter("oid");
        if (oid != null && !oid.isEmpty()) {
            Order order = dao.getOrderByOID(Integer.parseInt(oid));
            List<Order> odList = dao.getUserOrder(order.getUserID());
            List<Map<String, Object>> orderLineList = dao.getOrderDetailsForOrder(order.getOrderID());

            request.setAttribute("orderList", odList);
            request.setAttribute("userOrder", order);

            request.setAttribute("OrderLine", orderLineList);


            HttpSession session = request.getSession();
            String successMessage = (String) session.getAttribute("success");
            String failMessage = (String) session.getAttribute("fail");

            if (successMessage != null) {
                request.setAttribute("success", successMessage);
                session.removeAttribute("success");
            }
            if (failMessage != null) {
                request.setAttribute("fail", failMessage);
                session.removeAttribute("fail");
            }
            
            request.getRequestDispatcher("OrderDetails.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAO dao = new DAO();
        String oid = request.getParameter("orderid");
        
        if (oid != null && !oid.isEmpty()) {
            Order order = dao.getOrderByOID(Integer.parseInt(oid));
            
            HttpSession session = request.getSession();
            if(order.getStatusID()==2) {
                session.setAttribute("fail", "Đơn Hàng Đã bị hủy trước đó!");	
            }else {
            	 if (dao.CancelOrder(order)) {
                     session.setAttribute("success", "Hủy Đơn Hàng Thành Công!");
                 } else {
                     session.setAttribute("fail", "Hủy Đơn Hàng Thất Bại!");
                 }
            }
           
            response.sendRedirect("OrderDetails?oid=" + order.getOrderID());
        }
    }
	

}
