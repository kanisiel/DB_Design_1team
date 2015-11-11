package kr.co.pms.model;

import java.sql.Timestamp;
import java.util.Date;


public class UserInfo2 implements Info {
	
	private String errorCode;
	private String subscribe_kor;
	private int uidx;
	private String userId;
	private String userPassword;
	private String userName;
	private String levels;
	private String birthDate;
	private int serialNum;
	private String schooling;
	private String entryDate;
	
	public UserInfo2(){}
	
	public UserInfo2(String userId, String userPassword, String userName,
			String levels, String birthDate, int serialNum, String schooling,
			String entryDate) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.levels = levels;
		this.birthDate = birthDate;
		this.serialNum = serialNum;
		this.schooling = schooling;
		this.entryDate = entryDate;
	}
	
	public String getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	public String getSubscribe_kor() {
		return subscribe_kor;
	}
	public void setSubscribe_kor(String subscribe_kor) {
		this.subscribe_kor = subscribe_kor;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLevels() {
		return levels;
	}
	public void setLevels(String levels) {
		this.levels = levels;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public int getSerialNum() {
		return serialNum;
	}
	public void setSerialNum(int serialNum) {
		this.serialNum = serialNum;
	}
	public String getSchooling() {
		return schooling;
	}
	public void setSchooling(String schooling) {
		this.schooling = schooling;
	}
	public String getEntryDate() {
		return entryDate;
	}
	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}
		
	
}
