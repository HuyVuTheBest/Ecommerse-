package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.Encrypt;

import java.io.IOException;

import dao.DAO;


public class ChangePassWordAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String newPassword = request.getParameter("newPassword");
		 	String email = request.getParameter("email");
		 	String usname = request.getParameter("username");
		 		
	        System.out.println(newPassword);

		 	
			String encryptpassword = Encrypt.encryptSHA1(newPassword);

	        DAO dao = new DAO();
	        boolean success = dao.ChangePW(encryptpassword,usname ,email);
	        
	        System.out.println(success);

	        System.out.println(encryptpassword);
	        System.out.println(email);
	        System.out.println(usname);

	      
	}

}
