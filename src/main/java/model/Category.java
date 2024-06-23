package model;

public class Category {
	private int CategoryID,ParentCatID;
	private String catName;
	
	
	
	public Category(int categoryID, int parentCatID, String catName) {
		super();
		CategoryID = categoryID;
		ParentCatID = parentCatID;
		this.catName = catName;
	}
	
	public int getCategoryID() {
		return CategoryID;
	}
	public void setCategoryID(int categoryID) {
		CategoryID = categoryID;
	}
	public int getParentCatID() {
		return ParentCatID;
	}
	public void setParentCatID(int parentCatID) {
		ParentCatID = parentCatID;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	

	@Override
	public String toString() {
		return "Category [CategoryID=" + CategoryID + ", ParentCatID=" + ParentCatID + ", catName=" + catName + "]";
	}
}
