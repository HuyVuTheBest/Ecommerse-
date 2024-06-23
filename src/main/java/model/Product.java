package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbcontext.DbConnect;

public class Product {

	private int ProductID,CategoryID;
	private Double	Unit_Price;
	private String ProName,Description,UnitInStock,CreatedDate,Thumbnail,CateName;
	
	
	
	public Product(int productID, int categoryID, String proName, String description, String unitInStock,
			String createdDate, String thumbnail,
			Double unit_Price) {
		super();
		ProductID = productID;
		CategoryID = categoryID;
		ProName = proName;
		Description = description;
		UnitInStock = unitInStock;
		CreatedDate = createdDate;
		Thumbnail = thumbnail;
		Unit_Price = unit_Price;
	}
	public Product( int categoryID, String proName, String description, String unitInStock,
			String createdDate, String thumbnail,
			Double unit_Price) {
		super();
		CategoryID = categoryID;
		ProName = proName;
		Description = description;
		UnitInStock = unitInStock;
		CreatedDate = createdDate;
		Thumbnail = thumbnail;
		Unit_Price = unit_Price;
	}

	
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	public int getCategoryID() {
		return CategoryID;
	}
	public void setCategoryID(int categoryID) {
		CategoryID = categoryID;
	}
	public String getProName() {
		return ProName;
	}
	public void setProName(String proName) {
		ProName = proName;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getUnitInStock() {
		return UnitInStock;
	}
	public void setUnitInStock(String unitInStock) {
		UnitInStock = unitInStock;
	}
	public String getCreatedDate() {
		return CreatedDate;
	}
	public void setCreatedDate(String createdDate) {
		CreatedDate = createdDate;
	}
	public String getThumbnail() {
		return Thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		Thumbnail = thumbnail;
	}
	
	public Double getUnit_Price() {
		return Unit_Price;
	}
	
	
	public void setUnit_Price(Double unit_Price) {
		Unit_Price = unit_Price;
	}
	
	
	public String getCateName() {	
		 String cateName = null;
		    String qry = "SELECT c.CategoryName FROM tbl_Product p JOIN tbl_Category c ON p.CategoryID = c.CategoryID WHERE p.ProductID = ?";
		    
		    try (Connection con = new DbConnect().GetConnect();
		         PreparedStatement ps = con.prepareStatement(qry)) {
		        ps.setInt(1, ProductID);
		        try (ResultSet rs = ps.executeQuery()) {
		            if (rs.next()) {
		                cateName = rs.getString("CategoryName");
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    
		    return cateName;
	}

	
	
	
	public void setCateName(String cateName) {
		CateName = cateName;
	}

	
	
	public List<String> getSizeRange() {
		 List<String> size = new ArrayList<>();
		    String qry = "SELECT s.Size FROM tbl_Product p " +
		                 "JOIN tbl_Size s ON s.ProductID = p.ProductID " +
		                 "WHERE p.ProductID = ?";
		    
		    try (Connection con = new DbConnect().GetConnect();
		         PreparedStatement ps = con.prepareStatement(qry)) {
		        
		        ps.setInt(1, ProductID);
		        
		        try (ResultSet rs = ps.executeQuery()) {
		            while (rs.next()) {
		                size.add(rs.getString("Size"));
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return size;
	}
	
	
	public void setSize(List<String> newSize) {
	    clearSizeRange();
	    
	    String qry = "INSERT INTO tbl_Size (ProductID, Size) VALUES (?, ?)";
        try (Connection con = new DbConnect().GetConnect()) {
            for (String size : newSize) {
                try (PreparedStatement ps = con.prepareStatement(qry)) {
                    ps.setInt(1, ProductID);
                    ps.setString(2, size);
                    ps.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}

	
	
	private void clearSizeRange() {
	    String qry = "DELETE FROM tbl_Size WHERE ProductID = ?";
	    try (Connection con = new DbConnect().GetConnect();
	         PreparedStatement ps = con.prepareStatement(qry)) {
	        ps.setInt(1, ProductID);
	        ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	


	@Override
	public String toString() {
		return "Product [ProductID=" + ProductID + ", CategoryID=" + CategoryID +", CategoryName=" + CateName + ", ProName=" + ProName
				+ ", Description=" + Description + ", UnitInStock=" + UnitInStock + ", CreatedDate=" + CreatedDate
				+ ", Thumbnail=" + Thumbnail 			
				+ ", Unit_Price=" + Unit_Price + "]";
	}
	
	
}

