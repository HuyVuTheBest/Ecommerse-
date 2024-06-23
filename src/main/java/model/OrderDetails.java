package model;

public class OrderDetails {
	private int OrderDetailsID,OrderID,ProductID,UnitQuantiTy;
	private Double UnitPrice;
	private String Note,Size;
	private Product Product;



	public OrderDetails(int orderDetailsID, int orderID, model.Product product) {
		super();
		OrderDetailsID = orderDetailsID;
		OrderID = orderID;
		Product = product;
	}

	public OrderDetails(int orderDetailsID, int orderID, int productID,int quantity, double price) {
		super();
		OrderDetailsID = orderDetailsID;
		OrderID = orderID;
		ProductID = productID;
	}
	
	public OrderDetails(int orderID,model.Product product,int quantity, double price,String size) {
		super();
		UnitQuantiTy = quantity;
		UnitPrice = price;
		Product = product;
		OrderID = orderID;
		Size=size;
	}
	

	
	public String getSize() {
		return Size;
	}

	public void setSize(String size) {
		Size = size;
	}

	public Product getProduct() {
		return Product;
	}
	public void setProduct(Product product) {
		Product = product;
	}
	public int getOrderDetailsID() {
		return OrderDetailsID;
	}
	public void setOrderDetailsID(int orderDetailsID) {
		OrderDetailsID = orderDetailsID;
	}
	public int getOrderID() {
		return OrderID;
	}
	public void setOrderID(int orderID) {
		OrderID = orderID;
	}

	public String getNote() {
		return Note;
	}
	public void setNote(String note) {
		Note = note;
	}

	
	
	
	
	public int getUnitQuantiTy() {
		return UnitQuantiTy;
	}
	public void setUnitQuantiTy(int unitQuantiTy) {
		UnitQuantiTy = unitQuantiTy;
	}
	public Double getUnitPrice() {
		return UnitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		UnitPrice = unitPrice;
	}
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}

	@Override
	public String toString() {
		return "OrderDetails [OrderDetailsID=" + OrderDetailsID + ", OrderID=" + OrderID + ", ProductID=" + ProductID
				+ ", UnitQuantiTy=" + UnitQuantiTy + ", UnitPrice=" + UnitPrice + ", Product=" + Product + "]";
	}
	
	
	
}
