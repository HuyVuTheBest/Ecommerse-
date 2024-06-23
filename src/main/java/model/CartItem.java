package model;

public class CartItem {

	@Override
	public String toString() {
		return "CartItem [CartID=" + CartID + ", product=" + product + ", quantity=" + quantity+ ", size=" + getItemSize()+ ", price=" + getItemPrice()+ "]";
	}

	private int CartID;
	private Product product;
    private int quantity;
    private String itemSize;

    public CartItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

  
    
    public String getItemSize() {
		return itemSize;
	}



	public void setItemSize(String itemSize) {
		this.itemSize = itemSize;
	}



	public int getCartID() {
		return CartID;
	}
	public void setCartID(int cartID) {
		CartID = cartID;
	}

	public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getItemPrice() {
        return product.getUnit_Price() ;
    }


}
