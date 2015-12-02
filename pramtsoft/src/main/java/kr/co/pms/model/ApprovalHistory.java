package kr.co.pms.model;

public class ApprovalHistory implements CEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String did;
	private String status;
	private String meaningKor;
	private String reply;
	private String reg_Date;
	private String up_Date;
	private String errorCode;
	private String subscribe_kor;
	
	public ApprovalHistory() {
		super();
	}

	public ApprovalHistory(String did, String status, String reply) {
		super();
		this.did = did;
		this.status = status;
		this.reply = reply;
	}



	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
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

	public String getMeaningKor() {
		return meaningKor;
	}

	public void setMeaningKor(String meaningKor) {
		this.meaningKor = meaningKor;
	}

}
