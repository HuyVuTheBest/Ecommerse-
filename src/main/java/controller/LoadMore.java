package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import dao.DAO;

@WebServlet(urlPatterns= {"/LoadMoreAjax"})
public class LoadMore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 1; 
		int productsPerPage = 8; 
		HttpSession session = request.getSession(false);

		try {
		    String pageParam = request.getParameter("page");
		    if (pageParam != null) {
		        page = Integer.parseInt(pageParam);
		    }
		} catch (NumberFormatException e) {
		    page = 1;
		}
		DAO productDAO = new DAO();
		List<Product> productList ;
		String Cateid =  (String) session.getAttribute("CategoryID");

		if(Cateid==null ||Cateid.isBlank()||Cateid.isEmpty() ) {
			 productList = productDAO.getProducts(null,page,productsPerPage);
			 System.out.println("cate null" +productList);
		}else {
			productList = productDAO.getProducts(Cateid,page,productsPerPage);
			 System.out.println("NOT null" +productList);

		}
		
        PrintWriter out = response.getWriter();

		 if (productList.size() > 0) {
	            for (Product i : productList) {
	                out.print(
	                    "<div class=\"col-xl-3 col-lg-6 col-sm-6\">\r\n" +
	                    "    <div class=\"card\">\r\n" +
	                    "        <div class=\"card-body\">\r\n" +
	                    "            <div class=\"new-arrival-product\">\r\n" +
	                    "                <div class=\"new-arrivals-img-contnent\">\r\n" +
	                    "                    <a href=\"Product?id=" + i.getProductID() + "\"> <img\r\n" +
	                    "                        class=\"img-fluid\" src=\"" + i.getThumbnail() + "\" alt=\"\"\r\n" +
	                    "                        style=\"min-height: 250px; max-height: auto; height: auto; width: 100%;\"></a>\r\n" +
	                    "                </div>\r\n" +
	                    "                <div class=\"new-arrival-content text-center mt-3\">\r\n" +
	                    "                    <h4>" + i.getProName() + "</h4>\r\n" +
	                    "                    <span class=\"price\">" + i.getUnit_Price() + " VND</span>\r\n" +
	                    "                </div>\r\n" +
	                    "            </div>\r\n" +
	                    "        </div>\r\n" +
	                    "    </div>\r\n" +
	                    "</div>"
	                );
	            }
	        } else {
	            out.print("<script>$('#loadMore').hide();</script>");
	        }
		

		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
