package kr.co.pms.model;

public class UserInfo implements Info {

	//private static final long serialVersionUID = 1L;
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
	private String department;
	private String section;
	
	public UserInfo(){}
	
	public UserInfo(String userId, String userPassword, String userName,
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
	
	public UserInfo(int uidx, String id, String password, String name,
			String levels, String birth_Date, int serial_Num, String schooling,
			String entry_Date, String reg_Date, String up_Date) {
		super();
		this.uidx = uidx;
		this.id = id;
		this.password = password;
		this.name = name;
		this.levels = levels;
		this.birth_Date = birth_Date;
		this.serial_Num = serial_Num;
		this.schooling = schooling;
		this.entry_Date = entry_Date;
		this.reg_Date = reg_Date;
		this.up_Date = up_Date;
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
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getBirth_Date() {
		return birth_Date;
	}

	public void setBirth_Date(String birth_Date) {
		this.birth_Date = birth_Date;
	}

	public String getEntry_Date() {
		return entry_Date;
	}

	public void setEntry_Date(String entry_Date) {
		this.entry_Date = entry_Date;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}
	
	
}
