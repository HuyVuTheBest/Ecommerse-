package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;
import java.util.List;

import dao.DAO;

@WebServlet(urlPatterns="/UserManager")
public class UserManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAO dao = new DAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("account");
		if(user.getRole()!="Customer") {
			
			List<User>userList = dao.getAllUser();
			request.setAttribute("UserList", userList);
			request.getRequestDispatcher("admin/QLTK.jsp").forward(request, response);
		}else {
			  response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		        response.setContentType("text/plain");
		        response.getWriter().write("Page Not Found");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		 String selectedRole = request.getParameter("role");
		 
		 String isChecked = request.getParameter("isChecked");
		 System.out.println(isChecked);
		 System.out.println(uid);

	        if (isChecked != null) {
	            boolean checked = Boolean.parseBoolean(isChecked);
	            if (checked) {
	            	dao.LockUser(Integer.parseInt(uid));
	            } else {
	            	dao.UnLockUser(Integer.parseInt(uid));

	            }
	        }
		 
		 
		 if(selectedRole!=null) {
			 if(dao.UpdateUserRole(Integer.parseInt(uid), selectedRole)){
				 response.sendRedirect("UserManager");
			 }
		 }
		 
		 
		 
		
	}

}
