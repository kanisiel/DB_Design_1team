package kr.co.pms.model;

public class Department implements CEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String didx;
	private String nameEn;
	private String nameOther;
	
	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getDidx() {
		return didx;
	}

	public void setDidx(String didx) {
		this.didx = didx;
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
	
	

}
