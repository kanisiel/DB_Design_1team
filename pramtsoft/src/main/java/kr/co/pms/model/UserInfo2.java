package kr.co.pms.model;



public class UserInfo2 implements Info {
	
	private String errorCode;
	private String subscribe_kor;
	private int uidx;
	private String id;
	private String password;
	private String name;
	private String levels;
	private String birth_Date;
	private int serial_Num;
	private String schooling;
	private String entry_Date;
	private String reg_Date;
	private String up_Date;
	
	public UserInfo2(){}
	
	public UserInfo2(String userId, String userPassword, String userName,
			String levels, String birthDate, int serialNum, String schooling,
			String entryDate) {
		super();
		this.id = userId;
		this.password = userPassword;
		this.name = userName;
		this.levels = levels;
		this.birth_Date = birthDate;
		this.serial_Num = serialNum;
		this.schooling = schooling;
		this.entry_Date = entryDate;
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
		return id;
	}
	public void setUserId(String userId) {
		this.id = userId;
	}
	public String getUserPassword() {
		return password;
	}
	public void setUserPassword(String userPassword) {
		this.password = userPassword;
	}
	public String getUserName() {
		return name;
	}
	public void setUserName(String userName) {
		this.name = userName;
	}
	public String getLevels() {
		return levels;
	}
	public void setLevels(String levels) {
		this.levels = levels;
	}
	public String getBirthDate() {
		return birth_Date;
	}
	public void setBirthDate(String birthDate) {
		this.birth_Date = birthDate;
	}
	public int getSerialNum() {
		return serial_Num;
	}
	public void setSerialNum(int serialNum) {
		this.serial_Num = serialNum;
	}
	public String getSchooling() {
		return schooling;
	}
	public void setSchooling(String schooling) {
		this.schooling = schooling;
	}
	public String getEntryDate() {
		return entry_Date;
	}
	public void setEntryDate(String entryDate) {
		this.entry_Date = entryDate;
	}

	public String getReg_Date() {
		return reg_Date;
	}

	public void setReg_Date(String reg_Date) {
		this.reg_Date = reg_Date;
	}

	public String getUp_Date() {
		return up_Date;
	}

	public void setUp_Date(String up_Date) {
		this.up_Date = up_Date;
	}
		
	
}
