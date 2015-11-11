package kr.co.pms.model;

import org.springframework.stereotype.Repository;

@Repository
public class LoginInfo implements Info {
	
	private String userID;
	private String userPassword;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
		
}
