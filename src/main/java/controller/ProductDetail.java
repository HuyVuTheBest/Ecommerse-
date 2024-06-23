package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;
import model.Reviews;
import model.User;

import java.io.IOException;
import java.util.List;

import dao.DAO;

@WebServlet(urlPatterns= {"/Product"})
public class ProductDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strID = request.getParameter("id");
		DAO dao = new DAO();
		Product myProduct = dao.getProductById(Integer.parseInt(strID));
		List<Reviews> rvList = dao.getAllComments(Integer.parseInt(strID));
		String sizesParam = myProduct.getSizeRange().toString().replace("[", "").replace("]", "");
		String[] sizesArray = null;

		if (sizesParam != null && !sizesParam.isEmpty()) {
		    sizesArray = sizesParam.split(",");
		}

		request.setAttribute("sizesArray", sizesArray);
		request.setAttribute("Comments", rvList);

		request.setAttribute("product", myProduct);
		
		request.getRequestDispatcher("ctsp.jsp").forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String productId = request.getParameter("productId");
		    String comment = request.getParameter("comment");
		    DAO dao = new DAO();
		    HttpSession session = request.getSession(false);
		    User user = (User) session.getAttribute("account");
		    if(user!=null) {
		    	boolean a = dao.insertComment(user.getUserID(),Integer.parseInt(productId),comment);
			    if(a) {
				    response.sendRedirect("Product?id=" + productId+"&success");
			    }else {
				    response.sendRedirect("Product?id=" + productId+"&failed");

			    }
		    }else {
			    response.sendRedirect("Product?id=" + productId+ "&loginRequired");

		    }
		    
	}

}
