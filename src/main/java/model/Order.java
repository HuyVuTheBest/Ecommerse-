package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import dbcontext.DbConnect;

public class Order {

	private int OrderID,UserID,StatusID,TotalQuantity;
	private String OrderDate,ReceiveAddress,ReceivePhone,ReceiveName,PaymentMethod,Size;
	private Double TotalPrice;
    private List<OrderDetails> orderDetailsList;

	
	
	
    public Order(int orderID,int userID,String paymentMedthod, String orderDate, int status, String receiveAddress,
			String receivePhone,String receiveName, double totalPrice,int totalquantity) {
		super();
		OrderID=orderID;
		UserID = userID;
		OrderDate = orderDate;
		StatusID = status;
		PaymentMethod = paymentMedthod;
		ReceiveAddress = receiveAddress;
		ReceivePhone = receivePhone;
		ReceiveName = receiveName;
		TotalQuantity=totalquantity;
		TotalPrice = totalPrice;
		
	}
	
	
	public Order(int userID, List<OrderDetails> orderDetailsList,String paymentMedthod, String orderDate, int status, String receiveAddress,
			String receivePhone,String receiveName, double totalPrice,int totalquantity) {
		super();
		UserID = userID;
		OrderDate = orderDate;
		StatusID = status;
		PaymentMethod = paymentMedthod;
		ReceiveAddress = receiveAddress;
		ReceivePhone = receivePhone;
		ReceiveName = receiveName;
		TotalQuantity=totalquantity;
		TotalPrice = totalPrice;
		this.orderDetailsList = orderDetailsList;
		
	}



	public String getPaymentMethod() {
		return PaymentMethod;
	}


	public void setPaymentMethod(String paymentMethod) {
		PaymentMethod = paymentMethod;
	}


	public String getSize() {
		return Size;
	}


	public void setSize(String size) {
		Size = size;
	}


	public Double getTotalPrice() {
		return TotalPrice;
	}


	public void setTotalPrice(Double totalPrice) {
		TotalPrice = totalPrice;
	}

	public int getOrderID() {
		return OrderID;
	}
	public void setOrderID(int orderID) {
		OrderID = orderID;
	}
	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}

	public String getPaymentType() {
		return PaymentMethod;
	}
	public void setPaymentType(String paymentMethod) {
		PaymentMethod = paymentMethod;
	}
	public int getStatusID() {
		return StatusID;
	}
	public void setStatusID(int statusID) {
		StatusID = statusID;
	}
	public int getTotalQuantity() {
		return TotalQuantity;
	}
	public void setTotalQuantity(int totalQuantity) {
		TotalQuantity = totalQuantity;
	}
	public String getOrderDate() {
		return OrderDate;
	}
	public void setOrderDate(String orderDate) {
		OrderDate = orderDate;
	}
	public String getReceiveAddress() {
		return ReceiveAddress;
	}
	public void setReceiveAddress(String receiveAddress) {
		ReceiveAddress = receiveAddress;
	}
	public String getReceivePhone() {
		return ReceivePhone;
	}
	public void setReceivePhone(String receivePhone) {
		ReceivePhone = receivePhone;
	}
	public String getReceiveName() {
		return ReceiveName;
	}
	public void setReceiveName(String receiveName) {
		ReceiveName = receiveName;
	}
	
	
	public List<OrderDetails> getOrderDetailsList() {
		String qry="select * from tbl_OrderDetails where OrderID = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
	        con = new DbConnect().GetConnect();
	        ps = con.prepareStatement(qry);
	        ps.setInt(1, getOrderID()); 
	        rs = ps.executeQuery();

	        if (rs.next()) {
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
	public void setOrderDetailsList(List<OrderDetails> orderDetailsList) {
		this.orderDetailsList = orderDetailsList;
	}
	
	

	
	 
	
	public String getStatus() {
		String qry ="select s.StatusName from tbl_Orders o\r\n"
				+ "join tbl_Status s\r\n"
				+ "on o.StatusID = s.StatusID\r\n"
				+ "where o.UserID = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String result="";
		try {
	        con = new DbConnect().GetConnect();
	        ps = con.prepareStatement(qry);
	        ps.setInt(1, getUserID()); 
	        rs = ps.executeQuery();

	        if (rs.next()) {
	        	result = rs.getString("StatusName").toString();
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
		return result;
	}


	@Override
	public String toString() {
		return "Order [OrderID=" + OrderID + ", UserID=" + UserID + ", StatusID=" + StatusID + ", TotalQuantity="
				+ TotalQuantity + ", OrderDate=" + OrderDate + ", ReceiveAddress=" + ReceiveAddress + ", ReceivePhone="
				+ ReceivePhone + ", ReceiveName=" + ReceiveName + ", PaymentMethod=" + PaymentMethod + ", Size=" + Size
				+ ", TotalPrice=" + TotalPrice + ", orderDetailsList=" + orderDetailsList + "]";
	}
	
	
	
}
