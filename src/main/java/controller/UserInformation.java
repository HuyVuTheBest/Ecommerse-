package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

import dao.DAO;


public class UserInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAO dao = new DAO();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User acc = (User) session.getAttribute("account");

        if (acc != null) {
            User user = dao.getUserById(acc.getUserID());
            request.setAttribute("UserPR", user);
        }
        
      

        request.getRequestDispatcher("UserInfor.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("FullName");
        String phone = request.getParameter("Phone");
        String email = request.getParameter("Email");
        String address = request.getParameter("Address");
        
        HttpSession session = request.getSession(false);

        if (session != null) {
            User acc = (User) session.getAttribute("account");
            
            
            
            if (acc != null) {
                User updatedUser = new User(acc.getUserID(), name,acc.getUsername(),acc.getPassword(),email, phone,acc.getCreatedDate(),acc.getRole(), address);

                if (dao.UpdateUser(updatedUser)) {
                     session.setAttribute("account", updatedUser);

                    request.setAttribute("success", "Cập nhật thông tin thành công!");
                    
                } else {
                	 request.setAttribute("failed", "Cập nhật thông tin thất bại!");
                }
                
                response.sendRedirect("UserInformation");
                return;
            }
        }
        response.sendRedirect("Login.jsp");
    }
	
}
