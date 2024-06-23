package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;

import java.io.IOException;
import java.util.List;

import dao.DAO;


@WebServlet(urlPatterns= {"/home"})
public class DisplayData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO mydao = new DAO();
    	HttpSession session = request.getSession(true);
		
		List<Product> productList;		
		int page = 1; 
		int productsPerPage = 8; 
		try {
		    String pageParam = request.getParameter("page");
		    if (pageParam != null) {
		        page = Integer.parseInt(pageParam);
		    }
		} catch (NumberFormatException e) {
		    page = 1;
		}
		
		String Cateid =  request.getParameter("categoryID");
		if(Cateid ==null) {
			Cateid ="";
		}
		
		session.setAttribute("CategoryID", Cateid);
		if(Cateid==null ||Cateid.isBlank()||Cateid.isEmpty()) {
			 productList = mydao.getProducts(null,page,productsPerPage);
			 
		}else {
			productList = mydao.getProducts(Cateid,page,productsPerPage);
		}
		request.setAttribute("prList", productList);
		
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
