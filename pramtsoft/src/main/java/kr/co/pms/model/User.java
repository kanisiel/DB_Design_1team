package kr.co.pms.model;

public class User implements CEntity {

	private static final long serialVersionUID = 1L;
	private String userID;
	private String userPassword;
	private String userName;
	
	public String getUserId() {
		return userID;
	}
	public void setUserId(String userId) {
		this.userID = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String user_Name) {
		this.userName = user_Name;
	}
	
}
