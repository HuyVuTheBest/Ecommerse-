package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dbcontext.DbConnect;
import model.Product;
import model.Reviews;
import model.User;

import model.Category;
import model.Order;
import model.OrderDetails;

public class DAO {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/* START OF USER */
	public Boolean RemoveUserById(int id) {
	    String qry = "DELETE FROM tbl_User WHERE UserID = ?";
	    try {
	        con = new DbConnect().GetConnect();
	        ps = con.prepareStatement(qry);
	        ps.setInt(1, id);
	        int rowsAffected = ps.executeUpdate();
	        return rowsAffected > 0; 
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}
	
	public boolean ChangePW(String pw,String un,String email) {
		  String qry = "UPDATE tbl_User\r\n"
		  		+ "SET Password = ?"
		  		+ "WHERE Username = ?"
		  		+ "And Email = ?";
	    try (Connection con = new DbConnect().GetConnect();
	         PreparedStatement ps = con.prepareStatement(qry)) {
	        ps.setString(1, pw);
	        ps.setString(2, un);
	        ps.setString(3, email);
	        int c = ps.executeUpdate();
	        if(c>0) {
		        return true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	
	public User Login(String un, String pw) {
		User user = null;
		String qry = "Select * from tbl_User\r\n" + "WHERE Username COLLATE SQL_Latin1_General_CP1_CS_AS = ?\r\n"
				+ "And Password COLLATE SQL_Latin1_General_CP1_CS_AS = ?";
		try {
			con = new DbConnect().GetConnect();
			ps = con.prepareStatement(qry);
			ps.setString(1, un);
			ps.setString(2, pw);
			rs = ps.executeQuery();

			if (rs.next()) {
				user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8),rs.getString(9),rs.getInt(10));
			}

		} catch (Exception e) {
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return user;
	}
	
	public User Register(String fn , String un , String pw,String email) {
		User user = null;
		String qry = "insert into tbl_User values(?,?,?,?,?,GETDATE(),'Customer',?,?)";
		try {
			con = new DbConnect().GetConnect();
			ps = con.prepareStatement(qry);
			ps.setString(1, fn);
			ps.setString(2, un);
			ps.setString(3, pw);
			ps.setString(4, email);
			ps.setString(5, null);
			ps.setString(6, null);
			ps.setInt(7, 0);


			int rowsAffected = ps.executeUpdate();
		        
		     if (rowsAffected > 0) {
		    	 
		            user = new User(fn, un, pw, email,null, "Customer");
		     }

		} catch (Exception e) {
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return user;
	}
	
	public boolean UpdateUser(User user) {
		String qry = "UPDATE tbl_User\r\n"
				+ "SET FullName = ?,\r\n"
				+ "    Address= ?,\r\n"
				+ "    PhoneNumber = ?,\r\n"
				+ "     Email  = ?\r\n"
				+ "WHERE UserID = ?;";
		boolean updated = false;
        try {
        	con = new DbConnect().GetConnect();
            ps = con.prepareStatement(qry);
            ps.setString(1, user.getFullname());
            ps.setString(2,  user.getAddress());
            ps.setString(3, user.getNumber());
            ps.setString(4, user.getEmail());
            ps.setInt(5, user.getUserID());     
            int affectedRows = ps.executeUpdate();
	        if (affectedRows > 0) {
	            return true;
	        } else {
	            return false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
		return updated;
	}
	
	
	public boolean LockUser(int id) {
		String qry = "UPDATE tbl_User\r\n"
				+ "SET IsLock = 1\r\n"
				+ "WHERE UserID = ?;";
		boolean updated = false;
        try {
        	con = new DbConnect().GetConnect();
            ps = con.prepareStatement(qry);
            ps.setInt(1, id);          
            int affectedRows = ps.executeUpdate();
	        if (affectedRows > 0) {
	            return true;
	        } else {
	            return false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
		return updated;
	}
	public boolean UnLockUser(int id) {
		String qry = "UPDATE tbl_User\r\n"
				+ "SET IsLock = 0\r\n"
				+ "WHERE UserID = ?;";
		boolean updated = false;
        try {
        	con = new DbConnect().GetConnect();
            ps = con.prepareStatement(qry);
            ps.setInt(1, id);          
            int affectedRows = ps.executeUpdate();
	        if (affectedRows > 0) {
	            return true;
	        } else {
	            return false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
		return updated;
	}
	
	
	public User getUserById(int id) {
		User user = null;
		String qry = "select * from tbl_User where UserID = ?";
		try {
			con = new DbConnect().GetConnect();
			ps = con.prepareStatement(qry);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8),rs.getString(9));
			}

		} catch (Exception e) {
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return user;
	}
	
	public List<User> getAllUser(){
		
		List<User> userlist = new ArrayList<>();
		String qry = "select * from tbl_User";
		try {			
				con = new DbConnect().GetConnect();
				ps = con.prepareStatement(qry);
				rs = ps.executeQuery();

				while (rs.next()) {
					userlist.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
							rs.getString(6), rs.getString(7), rs.getString(8),rs.getString(9)));
				}
		} catch (Exception e) {
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return userlist;
	}
	
	public boolean UpdateUserRole(int uid,String role) {
		String qry = "UPDATE tbl_User\r\n"
				+ "SET Role = ?\r\n"
				+ "WHERE UserID = ?";
		boolean updated = false;
        try {
        	con = new DbConnect().GetConnect();
            ps = con.prepareStatement(qry);
            ps.setString(1,  role);  
            ps.setInt(2, uid);  

            int affectedRows = ps.executeUpdate();
	        if (affectedRows > 0) {
	            return true;
	        } else {
	            return false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
		return updated;
	}
	
	
	

	/* END OF USER */

	/* START OF PRODUCT */
	
	public int getTotalProductByCateID(String id) {
		int total = 0;
		String qry = "select Count(*) from tbl_Product Where CategoryID=?";
		try {
			con = new DbConnect().GetConnect();
			ps = con.prepareStatement(qry);
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				total = rs.getInt(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return total;
	}

	public int getTotalProduct() {
		int total = 0;
		String qry = "select Count(*) from tbl_Product";
		try {
			con = new DbConnect().GetConnect();
			ps = con.prepareStatement(qry);
			rs = ps.executeQuery();

			if (rs.next()) {
				total = rs.getInt(1);
			}

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return total;
	}


	public List<Product> getAllProduct() {
		List<Product> prlist = new ArrayList<Product>();
		String qry = "select * from tbl_Product";
		try {			
				con = new DbConnect().GetConnect();
				ps = con.prepareStatement(qry);
				rs = ps.executeQuery();

				while (rs.next()) {
					prlist.add(new Product(rs.getInt("ProductID"), rs.getInt("CategoryID"), rs.getString("ProName"),
							rs.getString("Description"), rs.getString("UnitInStock"), rs.getString("CreatedDate"),
							rs.getString("Thumbnail"),
							rs.getDouble("Unit_Price")));

				}
		} catch (Exception e) {
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return prlist;
	}

	    
	public List<Product> getProducts(String cateid, int page, int productsPerPage) {
	    List<Product> prlist = new ArrayList<>();
	    String qry;

	    if (cateid == null) {
	        qry = "SELECT * FROM tbl_Product ORDER BY ProductID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	    } else {
	        qry = "SELECT * FROM tbl_Product WHERE CategoryID = ? ORDER BY ProductID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
	    }

	    int offset = (page - 1) * productsPerPage;

	    try {            
	        con = new DbConnect().GetConnect();
	        ps = con.prepareStatement(qry);
	        if (cateid == null) {
	            ps.setInt(1, offset);
	            ps.setInt(2, productsPerPage);
	        } else {
	            ps.setString(1, cateid);
	            ps.setInt(2, offset);
	            ps.setInt(3, productsPerPage);
	        }
	        
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            prlist.add(new Product(
	                rs.getInt("ProductID"),
	                rs.getInt("CategoryID"),
	                rs.getString("ProName"),
	                rs.getString("Description"),
	                rs.getString("UnitInStock"),
	                rs.getString("CreatedDate"),
	                rs.getString("Thumbnail"),
	                rs.getDouble("Unit_Price")
	            ));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return prlist;
	}
	
	public List<Product> getProductInrangeAjax(int page, int productsPerPage) {
        List<Product> prlist = new ArrayList<>();
        String qry = "SELECT * FROM tbl_Product ORDER BY ProductID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        int offset = (page - 1) * productsPerPage;

        try {            
            con = new DbConnect().GetConnect();
            ps = con.prepareStatement(qry);
            ps.setInt(1, offset);
            ps.setInt(2, productsPerPage);
            rs = ps.executeQuery();

            while (rs.next()) {
                prlist.add(new Product(
                    rs.getInt("ProductID"),
                    rs.getInt("CategoryID"),
                    rs.getString("ProName"),
                    rs.getString("Description"),
                    rs.getString("UnitInStock"),
                    rs.getString("CreatedDate"),
                    rs.getString("Thumbnail"),
                    rs.getDouble("Unit_Price")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return prlist;
    }

	
	
	
	public Product getProductById(int id) {
		Product product = null;
		String qry = "select * from tbl_Product Where ProductId = ?";
		try {
			con = new DbConnect().GetConnect();
			ps = con.prepareStatement(qry);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				product = new Product(rs.getInt("ProductID"), rs.getInt("CategoryID"), rs.getString("ProName"),
						rs.getString("Description"), rs.getString("UnitInStock"), rs.getString("CreatedDate"),
						rs.getString("Thumbnail"),
						rs.getDouble("Unit_Price"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return product;
	}
	
	
	public Boolean RemoveProductById(int id) {
	    String qry = "ALTER TABLE dbo.tbl_OrderDetails NOCHECK CONSTRAINT FK_OrderDetails_Product; "
	            + "ALTER TABLE dbo.tbl_Reviews NOCHECK CONSTRAINT FK_tbl_Reviews_tbl_Product; "
	            + "DELETE FROM tbl_Size WHERE ProductID = ?; "
	            + "DELETE FROM tbl_Product WHERE ProductID = ?; "
	            + "ALTER TABLE dbo.tbl_OrderDetails CHECK CONSTRAINT FK_OrderDetails_Product; "
	            + "ALTER TABLE dbo.tbl_Reviews CHECK CONSTRAINT FK_tbl_Reviews_tbl_Product;";
	    try {
	        con = new DbConnect().GetConnect();
	        ps = con.prepareStatement(qry);
	        ps.setInt(1, id);
	        ps.setInt(2, id);

	        int rowsAffected = ps.executeUpdate();
	        return rowsAffected > 0; 
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}
	
	 public Boolean AddProduct(Product pr) {
	        String qry = "INSERT INTO tbl_Product ( CategoryID, ProName, Description, UnitInStock, CreatedDate, Thumbnail, Unit_Price) VALUES (?,?,?,?,?,?,? )";
	        try {
	            con = new DbConnect().GetConnect();
	            ps = con.prepareStatement(qry);
	            ps.setInt(1, pr.getCategoryID());
	            ps.setString(2, pr.getProName());
	            ps.setString(3, pr.getDescription());
	            ps.setString(4, pr.getUnitInStock());
	            ps.setString(5, pr.getCreatedDate());
	            ps.setString(6, pr.getThumbnail());
	            ps.setDouble(7, pr.getUnit_Price());
	            int rowsAffected = ps.executeUpdate();
	            return rowsAffected > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        } finally {
	            try {
	                if (ps != null) ps.close();
	                if (con != null) con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	       }
	
	
	
	public List<Product> getProductInRange(int start, int end) {
        List<Product> prlist = new ArrayList<>();
        String qry = "SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY ProductID) AS rnum FROM tbl_Product) AS t WHERE rnum BETWEEN ? AND ?";

        try {
            con = new DbConnect().GetConnect();
            ps = con.prepareStatement(qry);
            ps.setInt(1, start);
            ps.setInt(2, end);
            rs = ps.executeQuery();
            while (rs.next()) {
                prlist.add(new Product(
                    rs.getInt("ProductID"),
                    rs.getInt("CategoryID"),
                    rs.getString("ProName"),
                    rs.getString("Description"),
                    rs.getString("UnitInStock"),
                    rs.getString("CreatedDate"),
                    rs.getString("Thumbnail"),
                    rs.getDouble("Unit_Price")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return prlist;
    }
	
	
	
	public boolean updateProduct(Product product) {
	    String qry = "UPDATE tbl_Product SET CategoryID = ?, ProName = ?, Description = ?, UnitInStock = ?, CreatedDate = ?, Thumbnail = ?, Unit_Price = ? WHERE ProductID = ?";
	    boolean updated = false;
	    
	    
	    
	    try {
	        con = new DbConnect().GetConnect();
	        ps = con.prepareStatement(qry);
	        ps.setInt(1, product.getCategoryID());
	        ps.setString(2, product.getProName());
	        ps.setString(3, product.getDescription());
	        ps.setString(4, product.getUnitInStock());
	        ps.setString(5, product.getCreatedDate());
	        ps.setString(6, product.getThumbnail());
	        ps.setDouble(7, product.getUnit_Price());    	        
	        ps.setInt(8, product.getProductID());
	        
	        int affectedRows = ps.executeUpdate();
	        if (affectedRows > 0) {
	            product.setSize(product.getSizeRange());
	            return true;
	        } else {
	            return false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return updated;
	}
	
	
	/* END OF PRODUCT */

	
	
	
	
	/* START OF CATEGORY */
	public List<Category> getAllCategories() {
		List<Category> catalist = new ArrayList<Category>();
		String qry = "select * from tbl_Category";
		try {
			con = new DbConnect().GetConnect();
			ps = con.prepareStatement(qry);
			rs = ps.executeQuery();

			while (rs.next()) {

				catalist.add(new Category(rs.getInt(1), rs.getInt(2), rs.getString(3)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return catalist;
	}

	public List<Category> getCategoriesByID(int ID) {
		List<Category> catalist = new ArrayList<>();
		String qry = "SELECT * FROM tbl_Category WHERE ParentCatrgoryID = ?";

		try {
			con = new DbConnect().GetConnect();
			ps = con.prepareStatement(qry);
			ps.setInt(1, ID);
			rs = ps.executeQuery();

			while (rs.next()) {
				catalist.add(new Category(rs.getInt(1), rs.getInt(2), rs.getString(3)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return catalist;
	}

	/* END OF CATEGORY */

	/* SEARCH */
	
	public List<Product> SearchProductByProName(String ip) {
		List<Product> prlist = new ArrayList<>();
	    String qry = "SELECT * FROM tbl_Product WHERE ProName LIKE ? ORDER BY ProductID OFFSET 0 ROWS FETCH NEXT 8 ROWS ONLY";

	    try {
	        con = new DbConnect().GetConnect();
	        ps = con.prepareStatement(qry);
	        ps.setString(1, "%" + ip + "%"); 
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            prlist.add(new Product(rs.getInt("ProductID"), rs.getInt("CategoryID"), rs.getString("ProName"),
	                    rs.getString("Description"), rs.getString("UnitInStock"), rs.getString("CreatedDate"),
	                    rs.getString("Thumbnail"), rs.getDouble("Unit_Price")));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Handle the exception properly
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return prlist;
	}
	
	
	/* OTHER FUNCTIONS */
	public boolean checkEmailExist(String email) {
		String qry = "select count(*) from tbl_User where Email = ?";
		try {
			con = new DbConnect().GetConnect();
			ps = con.prepareStatement(qry);
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				return true;

			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		return false;
	}
	
	
	
	/* ORDER */
	public int insertOrder(Order order) {
		 String qry = "INSERT INTO tbl_Orders(UserID, OrderDate, StatusID, ReceiveAddress, TotalPrice, TotalQuantity, PaymentType, ReceiveName, ReceivePhone) " +
                 "VALUES (?, GETDATE(), ?, ?, ?, ?, ?, ?, ?)";

    try {
        con = new DbConnect().GetConnect();
        ps = con.prepareStatement(qry, PreparedStatement.RETURN_GENERATED_KEYS);

        ps.setInt(1, order.getUserID());
        ps.setInt(2, order.getStatusID());
        ps.setString(3, order.getReceiveAddress());
        ps.setDouble(4, order.getTotalPrice());
        ps.setInt(5, order.getTotalQuantity());
        ps.setString(6, order.getPaymentType());
        ps.setString(7, order.getReceiveName());
        ps.setString(8, order.getReceivePhone());

        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); 
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return -1;
}
		
	
	public List<Date> getOrderDates() {
	    List<Date> orderDates = new ArrayList<>();
	    String qry = "SELECT OrderDate FROM tbl_Orders";

	    try {
	        con = new DbConnect().GetConnect();
	        ps = con.prepareStatement(qry);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            orderDates.add(rs.getDate("OrderDate"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return orderDates;
	}
	
	
	public List<Integer> getAllOrderInt(){
		List<Integer> odList = new ArrayList<>();
		
	    String qry = "SELECT OrderID FROM tbl_Orders ";

	    try {
	        con = new DbConnect().GetConnect();
	        ps = con.prepareStatement(qry);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	        	odList.add(rs.getInt("OrderID"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); 
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return odList;
	}
	
	public List<Double> getOrderEarnStatistic(){
		List<Double> odList = new ArrayList<>();
		
	    String qry = "select TotalPrice from tbl_Orders";

	    try {
	        con = new DbConnect().GetConnect();
	        ps = con.prepareStatement(qry);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	        	odList.add(rs.getDouble("TotalPrice"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); 
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return odList;
	}
	
	public List<Order> getUserOrder(int uid){
		List<Order> odList = new ArrayList<>();
		
	    String qry = "SELECT * FROM tbl_Orders WHERE UserID = ?";

	    try {
	        con = new DbConnect().GetConnect();
	        ps = con.prepareStatement(qry);
	        ps.setInt(1, uid); 
	        rs = ps.executeQuery();

	        while (rs.next()) {
	        	odList.add(new Order(
	        					rs.getInt("OrderID"),
	        					rs.getInt("UserID"),
	        					rs.getString("PaymentType"),
	        					rs.getString("OrderDate"),
	        					rs.getInt("StatusID"),
	        					rs.getString("ReceiveAddress"),
	        					rs.getString("ReceivePhone"),
	        					rs.getString("ReceiveName"),
	        					rs.getDouble("TotalPrice"),
	        					rs.getInt("TotalQuantity")					
	        			));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); 
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return odList;
		
	}
	
	public Order getOrderByOID(int oid){
		Order order = null;
	    String qry = "SELECT * FROM tbl_Orders WHERE OrderID = ?";

	    try {
	        con = new DbConnect().GetConnect();
	        ps = con.prepareStatement(qry);
	        ps.setInt(1, oid); 
	        rs = ps.executeQuery();

	        while (rs.next()) {
	        	order =new Order(
	        					rs.getInt("OrderID"),
	        					rs.getInt("UserID"),
	        					rs.getString("PaymentType"),
	        					rs.getString("OrderDate"),
	        					rs.getInt("StatusID"),
	        					rs.getString("ReceiveAddress"),
	        					rs.getString("ReceivePhone"),
	        					rs.getString("ReceiveName"),
	        					rs.getDouble("TotalPrice"),
	        					rs.getInt("TotalQuantity")					
	        			);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); 
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return order;
	}
	
	public boolean CancelOrder(Order order) {		
		String qry = "UPDATE tbl_Orders\r\n"
				+ "Set	StatusID = 2"
				+ "WHERE OrderID = ?";
		boolean updated = false;
        try {
        	con = new DbConnect().GetConnect();
            ps = con.prepareStatement(qry);
            ps.setInt(1,  order.getOrderID());  
            int affectedRows = ps.executeUpdate();
	        if (affectedRows > 0) {
	            return true;
	        } else {
	            return false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
		return updated;
	
	}
	
	
	public boolean UpdateOrderStatus(int oid, int st) {		
		String qry = "UPDATE tbl_Orders\r\n"
				+ "Set	StatusID = ?"
				+ "WHERE OrderID = ?";
		boolean updated = false;
        try {
        	con = new DbConnect().GetConnect();
            ps = con.prepareStatement(qry);
            ps.setInt(1,  st);  
            ps.setInt(2,  oid);  
            int affectedRows = ps.executeUpdate();
	        if (affectedRows > 0) {
	            return true;
	        } else {
	            return false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
		return updated;
	
	}
	
	
	public boolean deleteOrderByID(int oid) {
		String qry="DELETE FROM tbl_OrderDetails\r\n"
				+ "WHERE OrderID IN (\r\n"
				+ "    SELECT o.OrderID\r\n"
				+ "    FROM tbl_Orders o\r\n"
				+ "    WHERE o.OrderID = ?\r\n"
				+ ");\r\n"
				+ "DELETE FROM tbl_Orders\r\n"
				+ "WHERE OrderID = ?";		
		boolean updated = false;
        try {
        	con = new DbConnect().GetConnect();
            ps = con.prepareStatement(qry);
            ps.setInt(1,  oid);  
            ps.setInt(2,  oid);  

            int affectedRows = ps.executeUpdate();
	        if (affectedRows > 0) {
	            return true;
	        } else {
	            return false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
		return updated;
	}
	
	public List<Order> getAllOrder(){
		
		List<Order> odList = new ArrayList<>();
		 String qry = "SELECT * FROM tbl_Orders";
		    try {
		        con = new DbConnect().GetConnect();
		        ps = con.prepareStatement(qry);
		        rs = ps.executeQuery();

		        while (rs.next()) {
		        	odList.add(new Order(
        					rs.getInt("OrderID"),
        					rs.getInt("UserID"),
        					rs.getString("PaymentType"),
        					rs.getString("OrderDate"),
        					rs.getInt("StatusID"),
        					rs.getString("ReceiveAddress"),
        					rs.getString("ReceivePhone"),
        					rs.getString("ReceiveName"),
        					rs.getDouble("TotalPrice"),
        					rs.getInt("TotalQuantity")					
        			)); 
		        }
		    } catch (SQLException e) {
		        e.printStackTrace(); 
		    } finally {
		        try {
		            if (rs != null) rs.close();
		            if (ps != null) ps.close();
		            if (con != null) con.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		 return odList;
	}
	
	
	
	
	
	
	/* ORDER DETAILS */
	public void insertOrderDetail(OrderDetails orderDetail) {
        String query = "INSERT INTO tbl_OrderDetails (OrderID, ProductID,UnitQuantity,UnitPrice,Size) VALUES (?, ?,?,?,?)";
        try {
            con = new DbConnect().GetConnect();
            ps = con.prepareStatement(query);
            ps.setInt(1, orderDetail.getOrderID());
            ps.setInt(2, orderDetail.getProduct().getProductID());
            ps.setInt(3, orderDetail.getUnitQuantiTy());
            ps.setDouble(4, orderDetail.getUnitPrice());
            ps.setString(5, orderDetail.getSize());

            ps.executeUpdate(); 
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
	
	public OrderDetails getOrderDetailByOrderID(Order order) {
        String query = "SELECT * FROM tbl_OrderDetails WHERE OrderID = ?";
        OrderDetails orderDetails = null;

        try {
            con = new DbConnect().GetConnect();
            ps = con.prepareStatement(query);
            ps.setInt(1, order.getOrderID());
            rs = ps.executeQuery();

            if (rs.next()) {
                int orderDetailsID = rs.getInt("OrderDetailsID");
                int orderID = rs.getInt("OrderID");
                int productID = rs.getInt("ProductID");
                Product product = getProductById(productID);
                orderDetails = new OrderDetails(orderDetailsID, orderID, product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return orderDetails;
    }
	
	
	
	
	public List<OrderDetails> getOrderDetailListByOrderID(int id) {
	    String query = "SELECT * FROM tbl_OrderDetails WHERE OrderID = ?";
	    List<OrderDetails> orderDetailsList = new ArrayList<>();

	    try {
	        con = new DbConnect().GetConnect();
	        ps = con.prepareStatement(query);
	        ps.setInt(1, id);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            int orderDetailsID = rs.getInt("OrderDetailsID");
	            int productID = rs.getInt("ProductID");
	            int quantity = rs.getInt("UnitQuantity");
	            double price = rs.getDouble("UnitPrice");
	            OrderDetails orderDetails = new OrderDetails(orderDetailsID, id, productID,quantity,price);
	            orderDetailsList.add(orderDetails);
	        }
	    } catch (SQLException e) {
	        System.err.println("SQL Exception: " + e.getMessage());
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            System.err.println("Error closing resources: " + e.getMessage());
	            e.printStackTrace();
	        }
	    }
	    return orderDetailsList;
	}
	

	
	
	
	
	
	
	public List<Map<String, Object>> getOrderDetailsForOrder(int orderID) {
	    String query = "select o.OrderDetailsID,o.OrderID,p.ProName,p.Thumbnail,p.Unit_Price,p.CreatedDate,o.UnitQuantiTy,o.Size from tbl_Product p\r\n"
	    		+ "join tbl_OrderDetails o on p.ProductID = o.ProductID\r\n"
	    		+ "where OrderID =?";
	    List<Map<String, Object>> orderDetailsList = new ArrayList<>();

	    try {
	        con = new DbConnect().GetConnect();
	        ps = con.prepareStatement(query);
	        ps.setInt(1, orderID);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            Map<String, Object> orderDetails = new HashMap<>();
	            orderDetails.put("OrderDetailsID", rs.getInt("OrderDetailsID"));
	            orderDetails.put("OrderID", rs.getInt("OrderID"));
	            orderDetails.put("ProductName", rs.getString("ProName"));
	            orderDetails.put("Thumbnail", rs.getString("Thumbnail"));
	            orderDetails.put("UnitPrice", rs.getDouble("Unit_Price"));
	            orderDetails.put("CreatedDate", rs.getString("CreatedDate"));
	            orderDetails.put("UnitQuantity", rs.getInt("UnitQuantiTy"));
	            orderDetails.put("size", rs.getString("Size"));

	            orderDetailsList.add(orderDetails);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return orderDetailsList;
	}
	
	
	
	
	
	
	
	
	
	
	
	/* STATISTICFUNCTION */
	public List<Map<String,Object>> getOrderCategoryStatistic(){
		
		String qry ="SELECT c.CategoryID, c.CategoryName, COUNT(*) as count\r\n"
				+ "FROM tbl_Orders o \r\n"
				+ "JOIN tbl_OrderDetails od ON o.OrderID = od.OrderID\r\n"
				+ "JOIN tbl_Product p ON od.ProductID = p.ProductID\r\n"
				+ "JOIN tbl_Category c ON p.CategoryID = c.CategoryID\r\n"
				+ "GROUP BY c.CategoryID, c.CategoryName";
		 List<Map<String, Object>> orderDetailsList = new ArrayList<>();

		    try {
		        con = new DbConnect().GetConnect();
		        ps = con.prepareStatement(qry);
		        rs = ps.executeQuery();

		        while (rs.next()) {
		            Map<String, Object> orderStatistic = new HashMap<>();
		            orderStatistic.put("Categoryname", rs.getString("CategoryName"));
		            orderStatistic.put("Count",  rs.getInt("count"));
		            orderDetailsList.add(orderStatistic);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        try {
		            if (rs != null) rs.close();
		            if (ps != null) ps.close();
		            if (con != null) con.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }

		    return orderDetailsList;
		
	}
	
	
	/* REVIEWS */
	 public List<Reviews> getAllComments(int pid) {
	        List<Reviews> cmtList = new ArrayList<>();
	        String qry = "select r.ProductID, u.Username,r.Comment from tbl_Reviews r\r\n"
	        		+ "join tbl_Product p\r\n"
	        		+ "on p.ProductID = r.ProductID\r\n"
	        		+ "join tbl_User u on r.UserID = u.UserID\r\n"
	        		+ "where r.ProductID = ?";

	        try {
	            con = new DbConnect().GetConnect();
	            ps = con.prepareStatement(qry);
	            ps.setInt(1, pid);
	            rs = ps.executeQuery();

	            while (rs.next()) {
	                String username = rs.getString("Username");
	                String comment = rs.getString("Comment");
	                Reviews rv = new Reviews(username, comment);
	                cmtList.add(rv);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (ps != null) ps.close();
	                if (con != null) con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return cmtList;
	    }
	 public boolean insertComment(int uid, int pid, String cmt) {
		    String query = "INSERT INTO tbl_Reviews (UserID, ProductID, Rating, Comment) VALUES (?, ?, NULL, ?)";
		    try {
		        con = new DbConnect().GetConnect();
		        ps = con.prepareStatement(query);
		        ps.setInt(1, uid);
		        ps.setInt(2, pid);
		        ps.setString(3, cmt);
		        
		        int rowsAffected = ps.executeUpdate(); 

		        if (rowsAffected > 0) {
		            return true;
		        } else {
		            return false;
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		        return false;
		    } finally {
		        try {
		            if (ps != null) ps.close();
		            if (con != null) con.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		}
	/* THIS SECTIONS IS FOR DATA TESTING */
	public static void main(String[] args) throws SQLException {
		DAO dao = new DAO();

        

	
		System.out.println(dao.getUserById(1));


	}

}
