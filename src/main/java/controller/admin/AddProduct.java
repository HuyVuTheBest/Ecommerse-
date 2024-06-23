package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Category;
import model.Product;
import model.User;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import dao.DAO;

@WebServlet(urlPatterns="/ProductManagerAdd")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	    maxFileSize = 1024 * 1024 * 10,      // 10MB
	    maxRequestSize = 1024 * 1024 * 50    // 50MB
	)
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);
			User user = (User)session.getAttribute("account");
			if(user.getRole()!="Customer") {
				 request.getRequestDispatcher("admin/AddProduct.jsp").forward(request, response);

			}else {
				  response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			        response.setContentType("text/plain");
			        response.getWriter().write("Page Not Found");
			}

	}
		
		


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("account");
		if(user.getRole()!="Customer") {
			 request.getRequestDispatcher("admin/AddProduct.jsp").forward(request, response);

		}else {
			  response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		        response.setContentType("text/plain");
		        response.getWriter().write("Page Not Found");
		}
		
		
		 DAO dao = new DAO();
	        LocalDateTime currentDateTime = LocalDateTime.now();

	        String proName = request.getParameter("ProName");
	        String description = request.getParameter("ProDes");
	        String unitInStock = request.getParameter("ProQuan");
	        String proprice = request.getParameter("ProPrice");
	        String createdDate = currentDateTime.toString();
	        double unitPrice = 0.0;

	        System.out.println("ProName: " + proName);
	        System.out.println("ProDes: " + description);
	        System.out.println("ProQuan: " + unitInStock);
	        System.out.println("ProPrice: " + proprice);

	       
	        
	        try {
	        	Integer.parseInt(unitInStock);
	        } catch (NumberFormatException e) {
	            System.out.println("Failed to parse ProPrice: " + proprice);
	            e.printStackTrace();
	            response.sendRedirect("ProductManagerAdd?status=failed&error=invalid-StockNumber");
	            return;
	        }
	        
	        if (proprice == null || proprice.isEmpty()) {
	            System.out.println("ProPrice is null or empty");
	            response.sendRedirect("ProductManagerAdd?status=failed&error=invalid-price");
	            return;
	        }

	        
	        try {
	            unitPrice = Double.parseDouble(proprice);
	        } catch (NumberFormatException e) {
	            System.out.println("Failed to parse ProPrice: " + proprice);
	            e.printStackTrace();
	            response.sendRedirect("ProductManagerAdd?status=failed&error=invalid-price");
	            return;
	        }

	        Part filePart = request.getPart("file");
	        if (filePart != null) {
	            String fileName = getSubmittedFileName(filePart);
	            if (fileName == null || fileName.isEmpty()) {
	                response.sendRedirect("ProductManagerAdd?status=failed&error=no-file-uploaded");
	                return;
	            }

	            String uploadDir = getServletContext().getRealPath("/ProductImg/");
	            File uploadDirFile = new File(uploadDir);
	            if (!uploadDirFile.exists()) {
	                uploadDirFile.mkdirs();
	            }

	            String filePath = uploadDir + File.separator + fileName;
	            filePart.write(filePath);

	            
	            
	            String thumbnail = "ProductImg/" + fileName;
	            System.out.println("Upload Directory: " + uploadDir);
	            System.out.println("File Path: " + filePath);

	            Product newProduct = new Product(0, proName, description, unitInStock, createdDate, thumbnail, unitPrice);
	            String[] sizesArray = request.getParameterValues("ProSize");
	            List<String> sizes = null;
	            if (sizesArray != null && sizesArray.length > 0) {
	                sizes = Arrays.asList(sizesArray);
	            }
	            newProduct.setSize(sizes);

	            if (dao.AddProduct(newProduct)) {
	                response.sendRedirect("ProductManagerAdd?pid=" + proName + "&status=success");
	            } else {
	                response.sendRedirect("ProductManagerAdd?pid=" + proName + "&status=failed");
	            }
	        } else {
	            response.sendRedirect("ProductManagerAdd?pid=" + proName + "&status=failed&error=no-file-uploaded");
	        }
	    }

	    private String getSubmittedFileName(Part part) {
	        String contentDisposition = part.getHeader("content-disposition");
	        if (contentDisposition == null) {
	            return null;
	        }
	        for (String cd : contentDisposition.split(";")) {
	            if (cd.trim().startsWith("filename")) {
	                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
	                return fileName.isEmpty() ? null : fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
	            }
	        }
	        return null;
	    }
	    
    

}
