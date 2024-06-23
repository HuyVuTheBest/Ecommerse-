package model;

public class User {
	private int UserID;
	private String Fullname ,Username ,Password,Email,Number,CreatedDate,Role,Address;
	private int IsLock;
	
	public User(int userID, String fullname, String username, String password, String email,String number,String createddate ,String role,String address) {
		super();
		UserID = userID;
		Fullname = fullname;
		Username = username;
		Password = password;
		Number = number;
		Email = email;
		CreatedDate = createddate;
		Role = role;
		Address= address;
	}
	public User(int userID, String fullname, String username, String password, String email,String number,String createddate ,String role,String address,int lock) {
		super();
		UserID = userID;
		Fullname = fullname;
		Username = username;
		Password = password;
		Number = number;
		Email = email;
		CreatedDate = createddate;
		Role = role;
		Address= address;
		IsLock = lock;
	}
	
	public User(String fullname, String username, String password, String email,String number,String role) {
		super();
		Fullname = fullname;
		Username = username;
		Password = password;
		Number = number;
		Email = email;
		Role = role;
	}
	
	


	public User(int userID, String name, String number, String email, String address) {
		super();
		UserID = userID;
		Fullname = name;
		Number = number;
		Email = email;
		Address= address;
	}

	public String getAddress() {
		return Address;
	}

	public int isIsLock() {
		return IsLock;
	}

	public void setIsLock(int isLock) {
		IsLock = isLock;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getCreatedDate() {
		return CreatedDate;
	}


	public void setCreatedDate(String createdDate) {
		CreatedDate = createdDate;
	}

	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}
	public String getFullname() {
		return Fullname;
	}
	public void setFullname(String fullname) {
		Fullname = fullname;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getNumber() {
		return Number;
	}
	public void setNumber(String number) {
		Number = number;
	}
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		Role = role;
	}

	@Override
	public String toString() {
		return "User [UserID=" + UserID + ", Fullname=" + Fullname + ", Username=" + Username + ", Password=" + Password
				+ ", Email=" + Email + ", Number=" + Number + ", CreatedDate=" + CreatedDate + ", Role=" + Role
				+ ", Address=" + Address + ", IsLock=" + IsLock + "]";
	}
	
	
	
}
