package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import util.Encrypt;

import java.io.IOException;

import dao.DAO;


@WebServlet(urlPatterns="/Register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email,username,password,pwRe,fullname;
		DAO dao = new DAO();
		
		username = request.getParameter("UserName");
		password = request.getParameter("PassWord");
		email = request.getParameter("Email");
		pwRe = request.getParameter("PassWordReType");
		
		fullname = request.getParameter("FullName");
		
		String encryptpassword = Encrypt.encryptSHA1(password);
		
		if(password.equals(pwRe) ) {
			
			User usercheck = dao.Login(username, encryptpassword);
			
			if(usercheck !=null) {
				
				request.setAttribute("UserExist", "Tên tài khoản đã được sử dụng!");
				request.getRequestDispatcher("Register.jsp").forward(request, response);
			}else {
				
				User user =  dao.Register(fullname,username, encryptpassword,email);	
				if(user != null) {
					request.setAttribute("Success", "Chúc mừng bạn đã tạo thành công !!");
					
				}else {
					
					request.setAttribute("Error", "Có vấn đề khi tạo tài khoản");
				}	 
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
			

		}
		
		
		

		
	}

}
