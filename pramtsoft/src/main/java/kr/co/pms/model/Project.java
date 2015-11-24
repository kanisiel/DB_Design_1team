package kr.co.pms.model;

public class Project implements CEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String pid;
	private String name;
	private String startDate;
	private String endDate;
	private String orderer;
	private int manager;
	private String status;
	private String requireMan;
	private String reg_Date;
	private String up_Date;
	
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Project(String name, String startDate, String endDate,
			String orderer, String requireMan) {
		super();
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
		this.orderer = orderer;
		this.requireMan = requireMan;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getOrderer() {
		return orderer;
	}

	public void setOrderer(String orderer) {
		this.orderer = orderer;
	}

	public int getManager() {
		return manager;
	}

	public void setManager(int manager) {
		this.manager = manager;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRequireMan() {
		return requireMan;
	}

	public void setRequireMan(String requireMan) {
		this.requireMan = requireMan;
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
