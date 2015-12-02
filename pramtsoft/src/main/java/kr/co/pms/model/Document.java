package kr.co.pms.model;

public class Document implements CEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String did;
	private String pid;
	private Project project;
	private int drafter;
	private String drafterName;
	private int superior;
	private String superiorName;
	private String limits;
	private String description;
	private String reply;
	private String status;
	private String meaningKor;
	private String reg_Date;
	private String up_Date;
	private String errorCode;
	private String subscribe_kor;
	
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

	public Document(int drafter, int superior, String limits) {
		super();
		this.drafter = drafter;
		this.superior = superior;
		this.limits = limits;
	}

	public Document() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public int getDrafter() {
		return drafter;
	}

	public void setDrafter(int drafter) {
		this.drafter = drafter;
	}

	public int getSuperior() {
		return superior;
	}

	public void setSuperior(int superior) {
		this.superior = superior;
	}

	public String getLimits() {
		return limits;
	}

	public void setLimits(String limits) {
		this.limits = limits;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public String getDrafterName() {
		return drafterName;
	}

	public void setDrafterName(String drafterName) {
		this.drafterName = drafterName;
	}

	public String getSuperiorName() {
		return superiorName;
	}

	public void setSuperiorName(String superiorName) {
		this.superiorName = superiorName;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
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

	public String getMeaningKor() {
		return meaningKor;
	}

	public void setMeaningKor(String meaningKor) {
		this.meaningKor = meaningKor;
	}
	
	

}
