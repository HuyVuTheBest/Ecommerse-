package model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Cart {
	
		private List<CartItem> CartItemList;
		
	 	
	    public Cart() {
	        this.CartItemList = new ArrayList<>();
	    }
	   
		public void addItem(CartItem item) {
	        CartItemList.add(item);
	    }
		
		public void removeItem(String productId) {
	        Iterator<CartItem> iterator = CartItemList.iterator();
	        while (iterator.hasNext()) {
	            CartItem item = iterator.next();
	            int itemID = item.getProduct().getProductID();
	            if (Integer.toString(itemID).equals(productId)) {
	                iterator.remove();
	                break; 
	            }
	        }
	    }
		

	    public List<CartItem> getCartItemList() {
	        return CartItemList;
	    }

	    public void setCartItemList(List<CartItem> CartItemList) {
	        this.CartItemList = CartItemList;
	    }

	    public int getTotalQuantity() {
	        int totalQuantity = 0;
	        for (CartItem item : CartItemList) {
	            totalQuantity += item.getQuantity();
	        }
	        return totalQuantity;
	    }

	    public double getTotalCartPrice() {
	        double totalPrice = 0;
	        for (CartItem item : CartItemList) {
	            totalPrice += item.getQuantity() * item.getItemPrice();
	        }
	        return totalPrice;
	    }
	    
	    @Override
		public String toString() {
			return "Cart [CartItemList=" + CartItemList + "]";
		}
	    
		public CartItem getCartItemByProductId(String productID) {
			for (CartItem item : CartItemList ) {
	            if (Integer.toString(item.getProduct().getProductID()).equals(productID)) {
	                return item;
	            } 		
			}
			return null;
		}
		
		public void increaseQuantity(int productId) {
	        for (CartItem item : CartItemList) {
	            if (item.getProduct().getProductID() == productId) {
	                item.setQuantity(item.getQuantity() + 1);
	                return;
	            }
	        }
	    }

	    public void decreaseQuantity(int productId) {
	        for (CartItem item : CartItemList) {
	            if (item.getProduct().getProductID() == productId && item.getQuantity() > 1) {
	                item.setQuantity(item.getQuantity() - 1);
	                return;
	            }
	        }
	    }
	    
	 
}
