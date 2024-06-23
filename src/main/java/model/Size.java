package model;



public class Size {
	private int ProductID;
	private String SizeName;
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	
	
	
	@Override
	public String toString() {
		return "Size [ProductID=" + ProductID + ", SizeName=" + SizeName + "]";
	}
}	
