package kr.co.pms.model;

public class Evaluation implements CEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String pid;
	private String pName;
	private int uidx;
	private String uName;
	private String type1;
	private String type2;
	private int valuer;
	private String description;
	private float rating;
	private String reg_Date;
	private String up_Date;
	private String errorCode;
	private String subscribe_kor;
	
	
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public String getType1() {
		return type1;
	}
	public void setType1(String type1) {
		this.type1 = type1;
	}
	public String getType2() {
		return type2;
	}
	public void setType2(String type2) {
		this.type2 = type2;
	}
	public int getValuer() {
		return valuer;
	}
	public void setValuer(int valuer) {
		this.valuer = valuer;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
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
	public Evaluation(){
		super();
	}
	public Evaluation(String pid, int uidx, String type1, String type2) {
		super();
		this.pid = pid;
		this.uidx = uidx;
		this.type1 = type1;
		this.type2 = type2;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	
}
