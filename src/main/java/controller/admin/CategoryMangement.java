package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.User;

import java.io.IOException;
import java.util.List;

import dao.DAO;

@WebServlet(urlPatterns="/CategoryManager")
public class CategoryMangement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		 HttpSession session = request.getSession(false);
			User user = (User)session.getAttribute("account");
			if(user.getRole()!="Customer") {
				DAO dao = new DAO();
				List<Category>cateList = dao.getAllCategories();
				
				request.setAttribute("CategoryList", cateList);
				request.getRequestDispatcher("admin/QLDM.jsp").forward(request, response);
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
