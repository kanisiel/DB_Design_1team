package kr.co.pms.model;

public class Company implements CEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String cIdx;
	private String nameEn;
	private String nameOther;
	
	public String getcIdx() {
		return cIdx;
	}
	public void setcIdx(String cIdx) {
		this.cIdx = cIdx;
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
	public Company() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Company(String cIdx, String nameEn, String nameOther) {
		super();
		this.cIdx = cIdx;
		this.nameEn = nameEn;
		this.nameOther = nameOther;
	}
	
}
