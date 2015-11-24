package kr.co.pms.model;

public class Document implements CEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String did;
	private String pid;
	private int drafter;
	private int superior;
	private String limits;
	private String description;
	private String reg_Date;
	private String up_Date;
	
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
	
	

}
