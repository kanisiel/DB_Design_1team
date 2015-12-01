package kr.co.pms.model;

public class ProjectHistory implements CEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int uidx;
	private String uname;
	private String pid;
	private String pname;
	private String position;
	private String positionName;
	private String in_Date;
	private String out_Date;
	private String reg_Date;
	private String up_Date;
	private String errorCode;
	private String subscribe_kor;
	
	
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public String getIn_Date() {
		return in_Date;
	}
	public void setIn_Date(String in_Date) {
		this.in_Date = in_Date;
	}
	public String getOut_Date() {
		return out_Date;
	}
	public void setOut_Date(String out_Date) {
		this.out_Date = out_Date;
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
	
	
	public ProjectHistory() {
		super();
		// TODO Auto-generated constructor stub
	}

}
