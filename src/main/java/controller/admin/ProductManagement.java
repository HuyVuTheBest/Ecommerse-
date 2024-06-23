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

@WebServlet(urlPatterns= {"/ProductManager"})
public class ProductManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("account");
		if(user.getRole()!="Customer") {
			DAO mydao = new DAO();
			
			
			List<Product> productList;
		

			 productList = mydao.getAllProduct();	
			request.setAttribute("prList", productList);
			
			
			request.getRequestDispatcher("admin/QLSP.jsp").forward(request, response);
		}else {
			  response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		        response.setContentType("text/plain");
		        response.getWriter().write("Page Not Found");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO mydao = new DAO();

		String keyword = request.getParameter("keyword");
		List<Product> prList =mydao.SearchProductByProName(keyword);
		request.setAttribute("prList", prList);
		request.getRequestDispatcher("admin/QLSP.jsp").forward(request, response);


	}

}
