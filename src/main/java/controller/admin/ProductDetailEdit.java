package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Product;
import model.User;

import java.io.File;
import java.io.IOException;
import java.nio.file.AccessDeniedException;
import java.util.Arrays;
import java.util.List;



import dao.DAO;

@MultipartConfig
@WebServlet(urlPatterns="/ProductManagerEdit")
public class ProductDetailEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAO dao = new DAO();

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("account");
		if(user.getRole()!="Customer") {
			 String id = request.getParameter("pid");
			 Product pr = dao.getProductById(Integer.parseInt(id));
			 request.setAttribute("product", pr);
			 
			 request.getRequestDispatcher("admin/ProductEdit.jsp").forward(request, response);
		}else {
			  response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		        response.setContentType("text/plain");
		        response.getWriter().write("Page Not Found");
		}
		
		
		 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
		 	int productId = Integer.parseInt(request.getParameter("productId"));
	        int categoryId = Integer.parseInt(request.getParameter("ProCategory"));
	        String proName = request.getParameter("ProName");
	        String description = request.getParameter("ProDes");
	        String unitInStock = request.getParameter("ProQuan");
	        String createdDate = request.getParameter("createdDate");
	        double unitPrice = Double.parseDouble(request.getParameter("ProPrice"));
	        
	        String existingThumbnail = ""; 
	        Product existingProduct = dao.getProductById(productId); 

	        if (existingProduct != null) {
	            existingThumbnail = existingProduct.getThumbnail(); 
	        }
	        
	        Part filePart = request.getPart("file");
	        String fileName = null;
	        String thumbnail = null;

	        
	        
	        if (filePart != null && filePart.getSize() > 0) {
	            fileName = getSubmittedFileName(filePart);
	            String uploadDir = getServletContext().getRealPath("/ProductImg/");
	            String filePath = uploadDir + File.separator + fileName;

	            try {
	                filePart.write(filePath);
	                thumbnail = "ProductImg/" + fileName;

	                System.out.println("Upload Directory: " + uploadDir);
	                System.out.println("File Path: " + filePath);
	            } catch (AccessDeniedException e) {
	                e.printStackTrace();
	                response.sendRedirect("ProductManagerEdit?pid=" + productId + "&status=failed&error=access-denied");
	                return;
	            } catch (IOException e) {
	                e.printStackTrace();
	                response.sendRedirect("ProductManagerEdit?pid=" + productId + "&status=failed&error=io-exception");
	                return;
	            }
	        }

	        Product updatedPr = new Product(productId, categoryId, proName, description, unitInStock, createdDate, thumbnail != null ? thumbnail : existingThumbnail, unitPrice);
	        String[] sizesArray = request.getParameterValues("ProSize");
	        List<String> sizes = null;
	        if (sizesArray != null && sizesArray.length > 0) {
	            sizes = Arrays.asList(sizesArray);
	        }
	        updatedPr.setSize(sizes);

	        if (dao.updateProduct(updatedPr)) {
	            response.sendRedirect("ProductManagerEdit?pid=" + productId + "&status=success");
	        } else {
	            response.sendRedirect("ProductManagerEdit?pid=" + productId + "&status=failed");
	        }
	    }

	    private String getSubmittedFileName(Part filePart) {
	        String header = filePart.getHeader("content-disposition");
	        for (String part : header.split(";")) {
	            if (part.trim().startsWith("filename")) {
	                return part.substring(part.indexOf('=') + 1).trim().replace("\"", "");
	            }
	        }
	        return null;
	    }

}
