package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

import java.io.IOException;
import java.util.List;

import dao.DAO;



@WebServlet("/searchProduct")
public class SearchProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO dao = new DAO();
		String keyword = request.getParameter("keyword");
		List<Product> prList =dao.SearchProductByProName(keyword);
		request.setAttribute("prList", prList);
		
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
		
		
		
		
	}

}
