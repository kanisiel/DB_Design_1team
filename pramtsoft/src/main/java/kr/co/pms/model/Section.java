package kr.co.pms.model;

public class Section implements CEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String sidx;
	private String nameEn;
	private String nameOther;
	private String department;
	
	public Section() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public String getNameEn() {
		return nameEn;
	}

	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}

	public String getNameOther() {
		return nameOther;
	}

	public void setNameOther(String nameOther) {
		this.nameOther = nameOther;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	
	
}
