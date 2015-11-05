package kr.ac.mju.model;

public class User implements CEntity {

	private static final long serialVersionUID = 1L;
	private String UID;
	private String userId;
	private String userPassword;
	private String user_Name;
	private int user_Type;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUID() {
		return UID;
	}
	public void setUID(String UID) {
		this.UID = UID;
	}
	public String getUser_Name() {
		return user_Name;
	}
	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}
	public int getUser_Type() {
		return user_Type;
	}
	public void setUser_Type(int user_Type) {
		this.user_Type = user_Type;
	}
	
}
