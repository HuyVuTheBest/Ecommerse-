package model;

public class Reviews {
	private int ReviewID,UserID,ProductID;
	private double Rating;
	private String Comment,Username;
	public int getReviewID() {
		return ReviewID;
	}
	public void setReviewID(int reviewID) {
		ReviewID = reviewID;
	}
	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	public double getRating() {
		return Rating;
	}
	public void setRating(double rating) {
		Rating = rating;
	}
	public String getComment() {
		return Comment;
	}
	public void setComment(String comment) {
		Comment = comment;
	}
	
	
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public Reviews(int reviewID, int userID, int productID, double rating, String comment) {
		super();
		ReviewID = reviewID;
		UserID = userID;
		ProductID = productID;
		Rating = rating;
		Comment = comment;
	}
	public Reviews(String name,String comment) {
		super();
		Username = name;
		Comment = comment;
	}
	
	
	@Override
	public String toString() {
		return "Reviews [ReviewID=" + ReviewID + ", UserID=" + UserID+", UserName=" + Username + ", ProductID=" + ProductID + ", Rating="
				+ Rating + ", Comment=" + Comment + "]";
	}

	
	

}
